/*
===============================================================================
Cumulative Analysis (Kümülatif Analiz)
===============================================================================
Amaç:
- Temel metrikler için toplamları veya hareketli ortalamaları hesaplamak.
- Performansı zaman içinde kümülatif olarak izlemek.
- Büyüme analizi veya uzun vadeli eğilimleri belirlemek için kullanışlıdır.

Kullanılan SQL Fonksiyonları:
    - Window Functions: SUM() OVER(), AVG() OVER()
===============================================================================
*/

-- Aylık toplam satışları 
-- ve zaman içindeki toplam satışları hesaplayın
SELECT
	order_date,
	total_sales,
	SUM(total_sales) OVER (PARTITION BY orde_date ORDER BY order_date) AS running_total_sales
FROM
(
    SELECT 
        DATETRUNC(month, order_date) AS order_date,
        SUM(sales_amount) AS total_sales,
    FROM gold.fact_sales
    WHERE order_date IS NOT NULL
    GROUP BY DATETRUNC(month, order_date)
) t
	

-- Yıllık toplam satışları 
-- ve zaman içindeki satışların toplamını, hareketli ortalama satış fiyatını hesaplayın
SELECT
	order_date,
	total_sales,
	SUM(total_sales) OVER (ORDER BY order_date) AS running_total_sales,
	AVG(avg_price) OVER (ORDER BY order_date) AS moving_average_price
FROM
(
    SELECT 
        DATETRUNC(year, order_date) AS order_date,
        SUM(sales_amount) AS total_sales,
        AVG(price) AS avg_price
    FROM gold.fact_sales
    WHERE order_date IS NOT NULL
    GROUP BY DATETRUNC(year, order_date)
) t





