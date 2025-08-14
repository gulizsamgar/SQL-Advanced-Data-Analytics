/*
===============================================================================
Data Segmentation Analysis (Veri Segmentasyon Analizi)
===============================================================================
Amaç:
- Hedeflenen içgörüler için verileri anlamlı kategorilere ayırmak.
- Müşteri segmentasyonu, ürün kategorizasyonu veya bölgesel analiz için.

Kullanılan SQL Fonksiyonları:
    - CASE: Özel segmentasyon mantığını tanımlar.
    - GROUP BY: Verileri segmentlere ayırır.
===============================================================================
*/

/*Ürünleri maliyet aralıklarına göre segmentlere ayırın ve
her segmente kaç ürünün düştüğünü sayın*/
WITH product_segments AS (
    SELECT
        product_key,
        product_name,
        cost,
        CASE 
            WHEN cost < 100 THEN 'Below 100'
            WHEN cost BETWEEN 100 AND 500 THEN '100-500'
            WHEN cost BETWEEN 500 AND 1000 THEN '500-1000'
            ELSE 'Above 1000'
        END AS cost_range
    FROM gold.dim_products
)
SELECT 
    cost_range,
    COUNT(product_key) AS total_products
FROM product_segments
GROUP BY cost_range
ORDER BY total_products DESC;


/*Müşterileri harcama davranışlarına göre üç segmente ayırın:
- VIP: En az 12 aylık geçmişi olan ve 5.000 €'dan fazla harcama yapan müşteriler.
- Regular: En az 12 aylık geçmişi olan ancak 5.000 € veya daha az harcama yapan müşteriler.
- New: Yaşam süreleri 12 aydan az olan müşteriler.
Ve her gruba göre toplam müşteri sayısını bulun.
*/
WITH customer_spending AS (
    SELECT
        c.customer_key,
        SUM(f.sales_amount) AS total_spending,
        MIN(order_date) AS first_order,
        MAX(order_date) AS last_order,
        DATEDIFF(month, MIN(order_date), MAX(order_date)) AS lifespan
    FROM gold.fact_sales f
    LEFT JOIN gold.dim_customers c
        ON f.customer_key = c.customer_key
    GROUP BY c.customer_key
)
SELECT 
    customer_segment,
    COUNT(customer_key) AS total_customers
FROM (
    SELECT 
        customer_key,
        CASE 
            WHEN lifespan >= 12 AND total_spending > 5000 THEN 'VIP'
            WHEN lifespan >= 12 AND total_spending <= 5000 THEN 'Regular'
            ELSE 'New'
        END AS customer_segment
    FROM customer_spending
) AS segmented_customers
GROUP BY customer_segment
ORDER BY total_customers DESC;


