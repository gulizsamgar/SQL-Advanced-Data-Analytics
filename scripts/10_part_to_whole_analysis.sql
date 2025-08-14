/*
===============================================================================
Part-to-Whole Analysis (Parçadan Bütüne Analiz)
===============================================================================
Amaç:
- Boyutlar veya zaman dilimleri arasında performansı veya metrikleri karşılaştırmak.
- Kategoriler arasındaki farklılıkları değerlendirmek.
- A/B testi veya bölgesel karşılaştırmalar için kullanışlıdır.

Kullanılan SQL Fonksiyonları:
    - SUM(), AVG(): Karşılaştırma için değerleri toplar.
    - Window Functions: Toplam hesaplamaları için SUM() OVER().
===============================================================================
*/

-- Hangi kategoriler toplam satışlara en çok katkı sağlıyor?
WITH category_sales AS (
    SELECT
        p.category,
        SUM(f.sales_amount) AS total_sales
    FROM gold.fact_sales f
    LEFT JOIN gold.dim_products p
        ON p.product_key = f.product_key
    GROUP BY p.category
)
SELECT
    category,
    total_sales,
    SUM(total_sales) OVER () AS overall_sales,
    ROUND((CAST(total_sales AS FLOAT) / SUM(total_sales) OVER ()) * 100, 2) AS percentage_of_total
FROM category_sales
ORDER BY total_sales DESC;


