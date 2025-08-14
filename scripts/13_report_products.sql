/*
===============================================================================
Product Report (Ürün Raporu)
===============================================================================
Amaç:
	- Bu rapor, temel ürün metriklerini ve davranışlarını bir araya getirir.

Önemli Noktalar:
	1. Ürün adı, kategori, alt kategori ve maliyet gibi temel alanları toplar.
	2. Yüksek Performanslı, Orta Seviye veya Düşük Performanslı ürünleri belirlemek için ürünleri gelire göre segmentlere ayırır. ( High-Performers, Mid-Range, Low-Performers)
	3. Ürün düzeyindeki metrikleri bir araya getirir:
		- toplam siparişler
		- toplam satışlar
		- toplam satılan miktar
		- toplam müşteri sayısı (benzersiz)
		- lifespan (ömür) (ay olarak)
	4. Değerli KPI'ları hesaplar:
		- recency (son satıştan bu yana geçen ay sayısı)
		- ortalama sipariş geliri (AOR)
		- ortalama aylık gelir
===============================================================================
*/

-- =============================================================================
-- Rapor Oluştur: gold.report_products
-- =============================================================================
IF OBJECT_ID('gold.report_products', 'V') IS NOT NULL
    DROP VIEW gold.report_products;
GO

CREATE VIEW gold.report_products AS

WITH base_query AS (
/*---------------------------------------------------------------------------
1) Base Query: fact_sales ve dim_products'tan temel sütunları alır
---------------------------------------------------------------------------*/
    SELECT
	    f.order_number,
        f.order_date,
		f.customer_key,
        f.sales_amount,
        f.quantity,
        p.product_key,
        p.product_name,
        p.category,
        p.subcategory,
        p.cost
    FROM gold.fact_sales f
    LEFT JOIN gold.dim_products p
        ON f.product_key = p.product_key
    WHERE order_date IS NOT NULL  -- only consider valid sales dates
),

product_aggregations AS (
/*---------------------------------------------------------------------------
2) Product Aggregations: Ürün düzeyindeki temel ölçümleri özetler
---------------------------------------------------------------------------*/
SELECT
    product_key,
    product_name,
    category,
    subcategory,
    cost,
    DATEDIFF(MONTH, MIN(order_date), MAX(order_date)) AS lifespan,
    MAX(order_date) AS last_sale_date,
    COUNT(DISTINCT order_number) AS total_orders,
	COUNT(DISTINCT customer_key) AS total_customers,
    SUM(sales_amount) AS total_sales,
    SUM(quantity) AS total_quantity,
	ROUND(AVG(CAST(sales_amount AS FLOAT) / NULLIF(quantity, 0)),1) AS avg_selling_price
FROM base_query

GROUP BY
    product_key,
    product_name,
    category,
    subcategory,
    cost
)

/*---------------------------------------------------------------------------
  3) Final Query: Tüm ürün sonuçlarını tek bir çıktıda birleştirir
---------------------------------------------------------------------------*/
SELECT 
	product_key,
	product_name,
	category,
	subcategory,
	cost,
	last_sale_date,
	DATEDIFF(MONTH, last_sale_date, GETDATE()) AS recency_in_months,
	CASE
		WHEN total_sales > 50000 THEN 'High-Performer'
		WHEN total_sales >= 10000 THEN 'Mid-Range'
		ELSE 'Low-Performer'
	END AS product_segment,
	lifespan,
	total_orders,
	total_sales,
	total_quantity,
	total_customers,
	avg_selling_price,
	-- Ortalama Sipariş Geliri (AOR)
	CASE 
		WHEN total_orders = 0 THEN 0
		ELSE total_sales / total_orders
	END AS avg_order_revenue,

	-- Ortalama Aylık Gelir
	CASE
		WHEN lifespan = 0 THEN total_sales
		ELSE total_sales / lifespan
	END AS avg_monthly_revenue


FROM product_aggregations 

