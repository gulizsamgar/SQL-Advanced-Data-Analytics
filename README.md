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


<img width="1312" height="874" alt="image" src="https://github.com/user-attachments/assets/63a62274-b00b-4e36-94f9-a53826488cbb" />

---

## 🛠 Teknolojiler

- [**SQL Server**](https://www.microsoft.com/en-us/sql-server/sql-server-downloads): Veritabanı yönetimi için hızlı ve güçlü bir RDBMS.  
- [**SQL Server Management Studio (SSMS)**](https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms): Veritabanlarını yönetmek için GUI (Grafiksel Kullanıcı Arayüzü). tabanlı araç.  
- [**GitHub**](https://github.com): Kodun sürüm takibi ve işbirliği için kullanılan platform.

---

## 💡 Kullanılan SQL Teknikleri

Projede aşağıdaki SQL teknikleri aktif olarak kullanılmıştır:

- **Date Functions:** YEAR(), MONTH(), DATEPART(), DATETRUNC(), FORMAT() ile dönemsel gruplama ve zaman serisi analizi
- **JOIN Türleri:** LEFT JOIN ile fact ve dimension tablolarının ilişkilendirilmesi
- **Aggregation Functions:** SUM(), COUNT(), AVG() ile temel metriklerin hesaplanması
- **Grouping:** GROUP BY ile yıl, ay, kategori, müşteri, ürün bazlı özetleme
- **Ordering:** ORDER BY ile dönemsel veya performans bazlı sıralama
- **Koşullu Mantık:** CASE ile müşteri ve ürün segmentasyonları (VIP, Regular, New vb.)
- **Window Functions:** SUM() OVER(), AVG() OVER(), LAG() ile kümülatif hesaplama, hareketli ortalama ve dönem karşılaştırmaları
- **Part-to-Whole Hesaplama:** SUM(...) OVER() ile kategori/segment katkı yüzdelerinin çıkarılması
- **KPI Hesaplamaları:** Recency, AOV (Average Order Value), ortalama aylık harcama/gelir metriklerinin SQL içinde türetilmesi

---

## 📌 Aşağıda belirtilen analiz için Üst Yönetim için Temel Bulgular ve Öneriler






---

## 📜 SQL Sorguları









