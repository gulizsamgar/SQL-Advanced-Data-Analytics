/*
===============================================================================
Performance Analysis (Year-over-Year, Month-over-Month)
===============================================================================
Amaç:
    - Ürünlerin, müşterilerin veya bölgelerin zaman içindeki performansını ölçmek.
    - Yüksek performans gösteren kuruluşları kıyaslamak ve belirlemek.
    - Yıllık trendleri ve büyümeyi izlemek.

Kullanılan SQL Fonksiyonları:
    - LAG(): Önceki satırlardaki verilere erişir.
    - AVG() OVER(): Bölümler içindeki ortalama değerleri hesaplar.
    - CASE: Trend analizi için koşullu mantığı tanımlar.
===============================================================================
*/

/* Ürünlerin yıllık performansını, satışların; hem ürünün ortalama satış performansıyla 
hem de bir önceki yılın satışlarıyla karşılaştırarak analiz edin */
WITH yearly_product_sales AS (
    SELECT
        YEAR(f.order_date) AS order_year,
        p.product_name,
        SUM(f.sales_amount) AS current_sales
    FROM gold.fact_sales f
    LEFT JOIN gold.dim_products p
        ON f.product_key = p.product_key
    WHERE f.order_date IS NOT NULL
    GROUP BY 
        YEAR(f.order_date),
        p.product_name
)
SELECT
    order_year,
    product_name,
    current_sales,
    AVG(current_sales) OVER (PARTITION BY product_name) AS avg_sales,
    current_sales - AVG(current_sales) OVER (PARTITION BY product_name) AS diff_avg,
    CASE 
        WHEN current_sales - AVG(current_sales) OVER (PARTITION BY product_name) > 0 THEN 'Above Avg'
        WHEN current_sales - AVG(current_sales) OVER (PARTITION BY product_name) < 0 THEN 'Below Avg'
        ELSE 'Avg'
    END AS avg_change,
    -- Yıldan yıla (Year-over-Year) Analiz
    LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year) AS py_sales,
    current_sales - LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year) AS diff_py,
    CASE 
        WHEN current_sales - LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year) > 0 THEN 'Increase'
        WHEN current_sales - LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year) < 0 THEN 'Decrease'
        ELSE 'No Change'
    END AS py_change
FROM yearly_product_sales
ORDER BY product_name, order_year;



