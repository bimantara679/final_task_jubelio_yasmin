-- Membuat tabel promo_code
CREATE TABLE promo_code (
    promo_id INT PRIMARY KEY,
    promo_name VARCHAR(20),
    price_deduction DECIMAL(10,2),
    Description VARCHAR(50),
    Duration INT
);

-- Mengisi tabel promo_code dengan data yang Anda berikan
INSERT INTO promo_code (promo_id, promo_name, price_deduction, Description, Duration)
VALUES 
(1, 'AWAL_GAJIAN', 15000, 'Setiap Bulan Khusus Tanggal 1', 1),
(2, 'GRATIS_ONGKIR', 5000, 'Berlaku Tahun 2022', 365),
(3, '10_10', 7500, 'Berlaku Tanggal 10 Bulan 10', 1),
(4, 'HARBOLNAS', 30000, 'Setiap Tanggal 12 Bulan December', 1),
(5, 'END_YEAR', 15000, 'Setiap Tanggal Selama Bulan December', 30),
(6, 'BERKAH_RAMADHAN', 15000, 'Berlaku Tanggal 2 April - 1 Mei', 30),
(7, 'HARI_RAYA', 20000, '1 Mei', 1),
(8, 'TUJUHBELASAN', 10000, 'Berlaku Tanggal 17 Agustus', 1),
(9, 'VALENTINE_DAY', 10000, 'Berlaku 14 Februari', 1),
(10, 'EASTER_EGG', 7500, 'Berlaku 17 April', 1),
(11, 'CHRISTMAS', 15000, 'Berlaku Tanggal 25 December - 31 December', 8);








-- Membuat tabel Q3_Q4_Review
CREATE TABLE Q3_Q4_Review (
    purchase_date DATE,
    total_price DECIMAL(10,2),
    promo_code VARCHAR(20),
    price_after_promo DECIMAL(10,2)
);

-- Mengisi tabel Q3_Q4_Review dengan data dari tabel lain
INSERT INTO Q3_Q4_Review
SELECT s.purchase_date, s.quantity * m.price AS total_price, p.promo_name AS promo_code, s.quantity * m.price - p.price_deduction AS price_after_promo
FROM sales_table s
JOIN marketplace_table m ON s.item_id = m.item_id
JOIN promo_code p ON s.promo_id = p.promo_id
WHERE s.purchase_date BETWEEN '2022-07-01' AND '2022-12-31';
