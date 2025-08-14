# 📈 SQL ile Gelişmiş Veri Analitiği

## 🚀 Projeye Genel Bakış

**Komut Dosyaları:** 
[`change_over_time_analysis`](scripts/01_change_over_time_analysis.sql)
[`cumulative_analysis`](scripts/02_cumulative_analysis.sql)
[`performance_analysis`](scripts/03_performance_analysis.sql)
[`part_to_whole_analysis`](scripts/04_part_to_whole_analysis.sql)
[`data_segmentation_analysis`](scripts/05_data_segmentation_analysis.sql)
[`report_customers`](scripts/06_report_customers.sql)
[`report_products`](scripts/07_report_products.sql)


**Açıklama:** Bu proje, SQL kullanarak satış, müşteri ve ürün verileri üzerinde kapsamlı zaman serisi, performans ve segmentasyon analizleri yapılmasını kapsamaktadır.
Analiz sürecinde dönemsel trendler, kümülatif metrikler, yıllık/aylık karşılaştırmalar, kategori katkı analizleri ve müşteri–ürün bazlı KPI raporlamaları gerçekleştirilmiştir.
Elde edilen bulgular, satış performansını artırmak, müşteri segmentlerini hedeflemek ve ürün stratejilerini optimize etmek için yönetime veri odaklı içgörüler sunmuştur.

---

## 📂 Veri Seti Bilgisi

Projede üç veri seti kullanıldı:  

- [**fact_sales.csv**](datasets/csv-files/gold.fact_sales.csv): Sipariş bazında satış detaylarını içerir (tarih, müşteri, ürün, miktar, tutar).  
- [**dim_customers.csv**](datasets/csv-files/gold.dim_customers.csv): Müşteri bazlı özet bilgileri ve segmentlerini içerir.  
- [**dim_products.csv**](datasets/csv-files/gold.dim_products.csv): Ürünlerin ad, kategori, alt kategori, maliyet gibi tanımlayıcı bilgilerini içerir.


---

## 📋 İçerik

**Analiz Bölümleri**

1. Zaman İçinde Değişim Analizi (Change Over Time Analysis)
2. Kümülatif Analiz (Cumulative Analysis)
3. Performans Analizi (Year-over-Year, Month-over-Month)
4. Parçadan Bütüne Analiz (Part-to-Whole Analysis)
5. Veri Segmentasyon Analizi (Data Segmentation Analysis)

**Raporlama Bölümleri**

6. Müşteri Raporu (Customer Report)
7. Ürün Raporu (Product Report)

<p></p>
<img width="1312" height="874" alt="image" src="https://github.com/user-attachments/assets/63a62274-b00b-4e36-94f9-a53826488cbb" />
<p></p>

---

## 🛠 Teknolojiler

- [**SQL Server**](https://www.microsoft.com/en-us/sql-server/sql-server-downloads): Veritabanı yönetimi için hızlı ve güçlü bir RDBMS.  
- [**SQL Server Management Studio (SSMS)**](https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms): Veritabanlarını yönetmek için GUI (Grafiksel Kullanıcı Arayüzü). tabanlı araç.  
- [**GitHub**](https://github.com): Kodun sürüm takibi ve işbirliği için kullanılan platform.

---

## 💡 Kullanılan SQL Teknikleri

Projede aşağıdaki SQL teknikleri aktif olarak kullanılmıştır:

- **Date Functions**: `YEAR()`, `MONTH()`, `DATEPART()`, `DATETRUNC()`, `FORMAT()` ile dönemsel gruplama ve zaman serisi analizi
- **JOIN Türleri**: `LEFT JOIN` ile fact ve dimension tablolarının ilişkilendirilmesi
- **Aggregation Functions:** `SUM()`, `COUNT()`, `AVG()` ile temel metriklerin hesaplanması
- **Grouping**: `GROUP BY` ile yıl, ay, kategori, müşteri, ürün bazlı özetleme
- **Ordering**: `ORDER BY` ile dönemsel veya performans bazlı sıralama
- **Koşullu Mantık**: `CASE` ile müşteri ve ürün segmentasyonları (VIP, Regular, New vb.)
- **Window Functions**: `SUM() OVER()`, `AVG() OVER()`, `LAG()` ile kümülatif hesaplama, hareketli ortalama ve dönem karşılaştırmaları
- **Part-to-Whole Hesaplama**: `SUM(...) OVER()` ile kategori/segment katkı yüzdelerinin çıkarılması
- **KPI Hesaplamaları**: Recency, AOV (Average Order Value), ortalama aylık harcama/gelir metriklerinin SQL içinde türetilmesi

---

## 📌 Aşağıda belirtilen analiz hakkında Üst Yönetim için Temel Bulgular ve Öneriler

### 1. Satış Performansı ve Trendler

**Temel Bulgular:**
- 2010–2013 arasında güçlü bir büyüme eğilimi varken 2014’te hem satış hem müşteri sayısında keskin düşüş yaşanmış.
- Kümülatif analizde büyüme ivmesi 2014’te belirgin şekilde zayıflamış.
- Ortalama satış fiyatı yıllar içinde düşüş göstermiş (2011’de 3.146 → 2014’te 1.668).

**✅Öneriler:**
- 2014’teki düşüşün nedenleri (rekabet, pazar koşulları, ürün stratejisi) detaylı analiz edilmeli.
- Fiyatlandırma politikası gözden geçirilmeli; gerekirse değer odaklı fiyat artışı uygulanmalı.
- Büyümenin yüksek olduğu yıllardaki kampanya ve satış stratejileri yeniden devreye alınmalı.

### 2. Ürün Performansı ve Portföy Yönetimi

**Temel Bulgular:**
- Satışların %96’sı bisiklet kategorisinden geliyor; aksesuar ve giyim kategorilerinin payı oldukça düşük.
- Bazı ürünler yıllar içinde ortalamanın üzerinde performans gösterirken (Above Avg), bazıları sürekli ortalamanın altında kalmış (Below Avg).
- “High-Performer” ürünler toplam gelirde kritik paya sahip; “Low-Performer” ürünlerin satış katkısı çok düşük.

**✅Öneriler:**
- Tek kategoriye (bisiklet) bağımlılığı azaltmak için aksesuar ve giyim satışlarını artırıcı pazarlama çalışmaları yapılmalı.
- Sürekli düşük performans gösteren ürünlerde stok azaltma, fiyat indirimi veya ürün portföyünden çıkarma değerlendirilmelidir.
- Yüksek performanslı ürünlerin stok ve tedarik sürekliliği güvence altına alınmalı.

### 3. Müşteri Segmentasyonu ve Sadakat

**Temel Bulgular:**
- Müşterilerin %81’i “New” segmentinde; VIP müşteri oranı sadece %9 civarında.
- VIP müşteriler yüksek harcama kapasitesine sahip ve uzun vadeli gelir potansiyeli taşıyor.
- 30–50 yaş grubu müşteri kitlesi baskın durumda.

**✅Öneriler:**
- Yeni müşterilerin “Regular” veya “VIP” segmente geçişini hızlandırmak için sadakat programları uygulanmalı.
- VIP müşterilere özel kampanyalar, avantajlı fiyatlar ve kişiselleştirilmiş hizmetler sunulmalı.
- 30–50 yaş grubuna yönelik hedefli pazarlama stratejileri geliştirilmelidir.

### 4. Fiyatlandırma ve Karlılık

**Temel Bulgular:**
- Ortalama satış fiyatındaki düşüş kâr marjını olumsuz etkileyebilir.
- Bazı ürünlerde fiyat dalgalanmaları ve düşük fiyatla satış söz konusu.

**✅Öneriler:**
- Karlılık analizi yapılarak düşük fiyatlı ürünlerde fiyat optimizasyonu yapılmalı.
- Yüksek talep gören ürünlerde kâr marjını artıracak fiyat güncellemeleri uygulanmalı.

---

## 📜 SQL Sorguları

## Analiz Bölümleri

## 1. Zaman İçinde Değişim Analizi (Change Over Time Analysis)

**Amaç:**
- Zaman içinde temel metriklerdeki eğilimleri, büyümeyi ve değişiklikleri izlemek.
- Zaman serisi analizi ve mevsimselliğin belirlenmesi için.
- Belirli dönemlerdeki büyümeyi veya düşüşü ölçmek.

<p></p>
  <img width="1540" height="673" alt="image" src="https://github.com/user-attachments/assets/81477464-791c-499b-ac39-3685a4bbfa77" />
<p></p>

**Zaman içinde satış performansını analiz edin**
**-Hızlı Tarih Fonksiyonları**

```sql
SELECT
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    SUM(sales_amount) AS total_sales,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY YEAR(order_date), MONTH(order_date);
```

**Çıktı:**
<p></p>
<img width="1517" height="608" alt="image" src="https://github.com/user-attachments/assets/ee3354ed-6546-4ac4-a20a-1a9b6a44a8ce" />
<p></p>	

**- DATETRUNC()**

```sql
SELECT
    DATETRUNC(month, order_date) AS order_date,
    SUM(sales_amount) AS total_sales,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(month, order_date)
ORDER BY DATETRUNC(month, order_date);
```

**Çıktı:**
<p></p>
<img width="1274" height="613" alt="image" src="https://github.com/user-attachments/assets/57199d82-9f7e-46e0-9b0a-8d58d9bb81ab" />
<p></p>

**- FORMAT()**

```sql
SELECT
    FORMAT(order_date, 'yyyy-MMM') AS order_date,
    SUM(sales_amount) AS total_sales,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY FORMAT(order_date, 'yyyy-MMM')
ORDER BY FORMAT(order_date, 'yyyy-MMM');
```

**Çıktı:**
<p></p>
<img width="1224" height="612" alt="image" src="https://github.com/user-attachments/assets/cea04d07-1150-4d32-b16b-ce7d3962df35" />
<p></p>

## 2. Kümülatif Analiz (Cumulative Analysis)

**Amaç:**
- Temel metrikler için toplamları veya hareketli ortalamaları hesaplamak.
- Performansı zaman içinde kümülatif olarak izlemek.
- Büyüme analizi veya uzun vadeli eğilimleri belirlemek için kullanışlıdır.

<p></p>
<img width="1452" height="668" alt="image" src="https://github.com/user-attachments/assets/9090d077-882c-4494-8c80-151cc41f8459" />
<p></p>

**Aylık toplam satışları ve zaman içindeki toplam satışları hesaplayın**

```sql
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
```

**Çıktı:**
<p></p>
<img width="1237" height="873" alt="image" src="https://github.com/user-attachments/assets/d3f43375-ee68-4926-a8e6-7dc419c5dd70" />
<p></p>	

**Yıllık toplam satışları ve zaman içindeki satışların toplamını, </br>
hareketli ortalama satış fiyatını hesaplayın**

```sql
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
```

**Çıktı:**
<p></p>
<img width="1892" height="434" alt="image" src="https://github.com/user-attachments/assets/67661054-e2df-41a7-bb30-2ce542b5e8c1" />
<p></p>

## 3. Performans Analizi (Year-over-Year, Month-over-Month)

**Amaç:**
- Ürünlerin, müşterilerin veya bölgelerin zaman içindeki performansını ölçmek.
- Yüksek performans gösteren kuruluşları kıyaslamak ve belirlemek.
- Yıllık trendleri ve büyümeyi izlemek.

<p></p>
<img width="1306" height="690" alt="image" src="https://github.com/user-attachments/assets/ed74b158-8389-4bc5-a375-2114b218d7ed" />
<p></p>

**Ürünlerin yıllık performansını, satışların; hem ürünün ortalama satış performansıyla </br>
hem de bir önceki yılın satışlarıyla karşılaştırarak analiz edin**

```sql
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
```

**Çıktı:**
<p></p>
<img width="2820" height="590" alt="image" src="https://github.com/user-attachments/assets/c8281fcf-01c5-47e8-8ecc-da7a5001763a" />
<p></p>

## 4. Parçadan Bütüne Analiz (Part-to-Whole Analysis)

**Amaç:**
- Boyutlar veya zaman dilimleri arasında performansı veya metrikleri karşılaştırmak.
- Kategoriler arasındaki farklılıkları değerlendirmek.
- A/B testi veya bölgesel karşılaştırmalar için kullanışlıdır.

<p></p>
<img width="1370" height="659" alt="image" src="https://github.com/user-attachments/assets/ac2fdd58-2470-4514-bbb1-eae95ac3835c" />
<p></p>

**Hangi kategoriler toplam satışlara en çok katkı sağlıyor?**

```sql
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
```

**Çıktı:**
<p></p>
<img width="1978" height="360" alt="image" src="https://github.com/user-attachments/assets/f5d18ca7-35f1-4101-ac8f-9dd2ef90d653" />
<p></p>

## 5. Veri Segmentasyon Analizi (Data Segmentation Analysis)

**Amaç:**
- Hedeflenen içgörüler için verileri anlamlı kategorilere ayırmak.
- Müşteri segmentasyonu, ürün kategorizasyonu veya bölgesel analiz için.

<p></p>
<img width="1391" height="683" alt="image" src="https://github.com/user-attachments/assets/7f0968d1-3450-4e85-820f-bf15e73fe789" />
<p></p>

**Ürünleri maliyet aralıklarına göre segmentlere ayırın ve her segmente kaç ürünün düştüğünü sayın**

```sql
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
```

**Çıktı:**
<p></p>
<img width="933" height="391" alt="image" src="https://github.com/user-attachments/assets/6893b905-27ae-4074-8f76-c36953853570" />
<p></p>

**Müşterileri harcama davranışlarına göre üç segmente ayırın:</br>**
- VIP: En az 12 aylık geçmişi olan ve 5.000 €'dan fazla harcama yapan müşteriler.</br>
- Regular: En az 12 aylık geçmişi olan ancak 5.000 € veya daha az harcama yapan müşteriler.</br>
- New: Yaşam süreleri 12 aydan az olan müşteriler.</br>
**Ve her gruba göre toplam müşteri sayısını bulun.**

```sql
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
```

**Çıktı:**
</p>
<img width="1287" height="331" alt="image" src="https://github.com/user-attachments/assets/d81a2466-217c-4492-ab95-99f2c472c933" />
</p>

## Raporlama Bölümleri

<p>
<img width="1975" height="1598" alt="image" src="https://github.com/user-attachments/assets/5577518e-1a06-47a2-b123-e1d5875be7d4" />
</p>

## 6. Müşteri Raporu (Customer Report)

**Amaç:**
- Bu rapor, temel müşteri metriklerini ve davranışlarını bir araya getirir.

```sql
-- =============================================================================
-- Rapor Oluştur: gold.report_customers
-- =============================================================================
IF OBJECT_ID('gold.report_customers', 'V') IS NOT NULL
    DROP VIEW gold.report_customers;
GO

CREATE VIEW gold.report_customers AS

WITH base_query AS(
/*---------------------------------------------------------------------------
1) Base Query: Tablolardan temel sütunları alır
---------------------------------------------------------------------------*/
SELECT
f.order_number,
f.product_key,
f.order_date,
f.sales_amount,
f.quantity,
c.customer_key,
c.customer_number,
CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
DATEDIFF(year, c.birthdate, GETDATE()) age
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON c.customer_key = f.customer_key
WHERE order_date IS NOT NULL)

, customer_aggregation AS (
/*---------------------------------------------------------------------------
2) Customer Aggregations: Müşteri düzeyindeki temel ölçümleri özetler
---------------------------------------------------------------------------*/
SELECT 
	customer_key,
	customer_number,
	customer_name,
	age,
	COUNT(DISTINCT order_number) AS total_orders,
	SUM(sales_amount) AS total_sales,
	SUM(quantity) AS total_quantity,
	COUNT(DISTINCT product_key) AS total_products,
	MAX(order_date) AS last_order_date,
	DATEDIFF(month, MIN(order_date), MAX(order_date)) AS lifespan
FROM base_query
GROUP BY 
	customer_key,
	customer_number,
	customer_name,
	age
)
SELECT
customer_key,
customer_number,
customer_name,
age,
CASE 
	 WHEN age < 20 THEN 'Under 20'
	 WHEN age between 20 and 29 THEN '20-29'
	 WHEN age between 30 and 39 THEN '30-39'
	 WHEN age between 40 and 49 THEN '40-49'
	 ELSE '50 and above'
END AS age_group,
CASE 
    WHEN lifespan >= 12 AND total_sales > 5000 THEN 'VIP'
    WHEN lifespan >= 12 AND total_sales <= 5000 THEN 'Regular'
    ELSE 'New'
END AS customer_segment,
last_order_date,
DATEDIFF(month, last_order_date, GETDATE()) AS recency,
total_orders,
total_sales,
total_quantity,
total_products
lifespan,
-- Ortalama sipariş değerini (AOV) hesapla
CASE WHEN total_sales = 0 THEN 0
	 ELSE total_sales / total_orders
END AS avg_order_value,
-- Ortalama aylık harcamayı hesaplayın
CASE WHEN lifespan = 0 THEN total_sales
     ELSE total_sales / lifespan
END AS avg_monthly_spend

FROM customer_aggregation
```
**Çıktı:**
<p></p>
<img width="2879" height="509" alt="image" src="https://github.com/user-attachments/assets/9703d925-9a90-441c-bc0b-c86393a546ff" />
<p></p>


## 7. Ürün Raporu (Product Report)

**Amaç:**
- Bu rapor, temel ürün metriklerini ve davranışlarını bir araya getirir.


```sql
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
```
**Çıktı:**

<p></p>
<img width="2878" height="819" alt="image" src="https://github.com/user-attachments/assets/72e59ff4-9e0e-427e-b402-392013ebc67a" />
<p></p>























