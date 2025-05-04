create database SI_Manajemen_Keuangan_Pribadi;
use  SI_Manajemen_Keuangan_Pribadi;

-- Tabel 1: Users
CREATE TABLE Users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL
);

-- Tabel 2: Accounts
CREATE TABLE Accounts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    nama_akun VARCHAR(100),
    saldo_awal DECIMAL(12, 2),
    jenis_akun VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

-- Tabel 3: Categories
CREATE TABLE Categories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    nama_kategori VARCHAR(100),
    tipe ENUM('income', 'expense'),
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

-- Tabel 4: Transactions
CREATE TABLE Transactions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    account_id INT NOT NULL,
    kategori_id INT NOT NULL,
    jumlah DECIMAL(12, 2) NOT NULL,
    tipe ENUM('income', 'expense'),
    tanggal DATE,
    catatan TEXT,
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (account_id) REFERENCES Accounts(id),
    FOREIGN KEY (kategori_id) REFERENCES Categories(id)
);

-- Tabel 5: Budgets (Opsional)
CREATE TABLE Budgets (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    kategori_id INT NOT NULL,
    jumlah_anggaran DECIMAL(12, 2),
    bulan INT,
    tahun INT,
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (kategori_id) REFERENCES Categories(id)
);

-- INSERT Sample Data

-- Users
INSERT INTO Users (nama, email, password) VALUES 
('Andi Wijaya', 'andi@example.com', 'andi123'),
('Siti Nurhaliza', 'siti@example.com', 'siti123'),
('Budi Santoso', 'budi@example.com', 'budi123'),
('Rina Amelia', 'rina@example.com', 'rina123'),
('Agus Pratama', 'agus@example.com', 'agus123'),
('Maya Sari', 'maya@example.com', 'maya123'),
('Dewi Anggraini', 'dewi@example.com', 'dewi123'),
('Rizky Ramadhan', 'rizky@example.com', 'rizky123'),
('Intan Permata', 'intan@example.com', 'intan123'),
('Yoga Saputra', 'yoga@example.com', 'yoga123');

-- Accounts
INSERT INTO Accounts (user_id, nama_akun, saldo_awal, jenis_akun) VALUES 
(1, 'Dompet', 500000, 'Cash'),
(1, 'Rekening BCA', 2500000, 'Bank'),
(2, 'Dompet', 300000, 'Cash'),
(3, 'Dompet', 400000, 'Cash'),
(3, 'Rekening Mandiri', 1500000, 'Bank'),
(4, 'Dompet', 200000, 'Cash'),
(4, 'Rekening BNI', 3000000, 'Bank'),
(5, 'Dompet', 350000, 'Cash'),
(5, 'Rekening BRI', 1800000, 'Bank'),
(6, 'Dompet', 250000, 'Cash'),
(6, 'Rekening CIMB', 2200000, 'Bank'),
(7, 'Dompet', 300000, 'Cash'),
(7, 'Rekening Danamon', 2500000, 'Bank'),
(8, 'Dompet', 450000, 'Cash'),
(8, 'Rekening BSI', 2000000, 'Bank'),
(9, 'Dompet', 500000, 'Cash'),
(9, 'Rekening Permata', 2300000, 'Bank'),
(10, 'Dompet', 400000, 'Cash'),
(10, 'Rekening Panin', 2800000, 'Bank');

-- Categories
INSERT INTO Categories (user_id, nama_kategori, tipe) VALUES 
(1, 'Gaji', 'income'),
(1, 'Makanan', 'expense'),
(1, 'Transportasi', 'expense'),
(2, 'Gaji', 'income'),
(2, 'Belanja', 'expense'),
(3, 'Gaji', 'income'),
(3, 'Hiburan', 'expense'),
(3, 'Makan di Luar', 'expense'),
(4, 'Gaji', 'income'),
(4, 'Tagihan', 'expense'),
(4, 'Transportasi', 'expense'),
(5, 'Gaji', 'income'),
(5, 'Kesehatan', 'expense'),
(5, 'Pendidikan', 'expense'),
(6, 'Gaji', 'income'),
(6, 'Hiburan', 'expense'),
(6, 'Transportasi', 'expense'),
(7, 'Gaji', 'income'),
(7, 'Hiburan', 'expense'),
(7, 'Transportasi', 'expense'),
(8, 'Gaji', 'income'),
(8, 'Belanja', 'expense'),
(8, 'Makanan', 'expense'),
(9, 'Gaji', 'income'),
(9, 'Investasi', 'expense'),
(9, 'Kesehatan', 'expense'),
(10, 'Gaji', 'income'),
(10, 'Tagihan', 'expense'),
(10, 'Pendidikan', 'expense');

-- Transactions
INSERT INTO Transactions (user_id, account_id, kategori_id, jumlah, tipe, tanggal, catatan) VALUES 
(1, 2, 1, 3000000, 'income', '2025-05-01', 'Gaji Bulan Mei'),
(1, 1, 2, 75000, 'expense', '2025-05-02', 'Makan siang'),
(1, 1, 3, 25000, 'expense', '2025-05-02', 'Naik ojek'),
(2, 3, 4, 2500000, 'income', '2025-05-01', 'Gaji Mei'),
(2, 3, 5, 150000, 'expense', '2025-05-02', 'Belanja bulanan'),
(3, 5, 6, 4000000, 'income', '2025-05-01', 'Gaji Mei'),
(3, 5, 7, 100000, 'expense', '2025-05-03', 'Nonton bioskop'),
(3, 4, 8, 50000, 'expense', '2025-05-04', 'Makan malam di luar'),
(4, 7, 9, 4500000, 'income', '2025-05-01', 'Gaji Mei'),
(4, 7, 10, 500000, 'expense', '2025-05-03', 'Bayar listrik'),
(4, 6, 11, 30000, 'expense', '2025-05-04', 'Naik bus kota'),
(5, 9, 12, 4200000, 'income', '2025-05-01', 'Gaji Mei'),
(5, 9, 13, 200000, 'expense', '2025-05-03', 'Beli obat'),
(5, 8, 14, 500000, 'expense', '2025-05-05', 'Buku kuliah'),
(6, 11, 15, 4800000, 'income', '2025-05-01', 'Gaji Mei'),
(6, 11, 16, 150000, 'expense', '2025-05-04', 'Karaoke'),
(6, 10, 17, 40000, 'expense', '2025-05-05', 'Naik kereta'),
(7, 13, 18, 3900000, 'income', '2025-05-01', 'Gaji Mei'),
(7, 12, 19, 120000, 'expense', '2025-05-03', 'Nonton konser'),
(7, 12, 20, 30000, 'expense', '2025-05-04', 'Naik angkot'),
(8, 15, 21, 4100000, 'income', '2025-05-01', 'Gaji Mei'),
(8, 14, 22, 250000, 'expense', '2025-05-03', 'Belanja pakaian'),
(8, 14, 23, 100000, 'expense', '2025-05-04', 'Makan malam'),
(9, 17, 24, 4700000, 'income', '2025-05-01', 'Gaji Mei'),
(9, 16, 25, 700000, 'expense', '2025-05-03', 'Beli reksadana'),
(9, 16, 26, 150000, 'expense', '2025-05-04', 'Beli vitamin'),
(10, 19, 27, 5000000, 'income', '2025-05-01', 'Gaji Mei'),
(10, 18, 28, 600000, 'expense', '2025-05-03', 'Bayar air'),
(10, 18, 29, 800000, 'expense', '2025-05-04', 'Bimbingan belajar');

-- Budgets
INSERT INTO Budgets (user_id, kategori_id, jumlah_anggaran, bulan, tahun) VALUES 
(1, 2, 500000, 5, 2025),
(1, 3, 200000, 5, 2025),
(2, 5, 700000, 5, 2025),
(3, 7, 300000, 5, 2025),
(3, 8, 250000, 5, 2025),
(4, 10, 800000, 5, 2025),
(4, 11, 150000, 5, 2025),
(5, 13, 300000, 5, 2025),
(5, 14, 600000, 5, 2025),
(6, 16, 500000, 5, 2025),
(6, 17, 200000, 5, 2025),
(7, 19, 400000, 5, 2025),
(7, 20, 200000, 5, 2025),
(8, 22, 500000, 5, 2025),
(8, 23, 300000, 5, 2025),
(9, 25, 1000000, 5, 2025),
(9, 26, 400000, 5, 2025),
(10, 28, 700000, 5, 2025),
(10, 29, 900000, 5, 2025);

-- JOIN, ALIAS dan OPERATOR
SELECT u.nama AS NamaPengguna, a.nama_akun AS Akun, t.jumlah AS JumlahTransaksi, t.tipe
FROM Transactions t
JOIN Users u ON t.user_id = u.id
JOIN Accounts a ON t.account_id = a.id
WHERE t.jumlah > 1000000;

-- FUNCTION, GROUPING dan SORTING
SELECT u.nama AS NamaPengguna, SUM(t.jumlah) AS totalpemasukan
FROM Transactions t
JOIN Users u ON t.user_id = u.id
WHERE t.tipe = 'income'
GROUP BY u.nama
ORDER BY totalpemasukan DESC;

-- FUNCTION, GROUPING dan SORTING
SELECT u.nama AS NamaPengguna, SUM(t.jumlah) AS TotalPengeluaran
FROM Transactions t
JOIN Users u ON t.user_id = u.id
WHERE t.tipe = 'expense '
GROUP BY u.nama
ORDER BY TotalPengeluaran DESC;

-- VIEW
CREATE VIEW ViewRingkasanTransaksi AS
SELECT u.nama, a.nama_akun, c.nama_kategori, t.jumlah, t.tipe, t.tanggal
FROM Transactions t
JOIN Users u ON t.user_id = u.id
JOIN Accounts a ON t.account_id = a.id
JOIN Categories c ON t.kategori_id = c.id;

-- Menampilkan Data dari View
SELECT * FROM ViewRingkasanTransaksi;
	

	-- STORED PROCEDURE
DELIMITER //

CREATE PROCEDURE TambahTransaksi (
    IN p_user_id INT,
    IN p_account_id INT,
    IN p_kategori_id INT,
    IN p_jumlah DECIMAL(12,2),
    IN p_tipe ENUM('income', 'expense'),
    IN p_tanggal DATE,
    IN p_catatan TEXT
)
BEGIN
    INSERT INTO Transactions (user_id, account_id, kategori_id, jumlah, tipe, tanggal, catatan)
    VALUES (p_user_id, p_account_id, p_kategori_id, p_jumlah, p_tipe, p_tanggal, p_catatan);
END //

DELIMITER ;

    -- menggunakan printah call
    CALL TambahTransaksi(1, 2, 1, 150000, 'income', '2025-05-10', 'Beli pulsa');

-- meampilkan table trnasaksi
SELECT * FROM Transactions
WHERE user_id = 1 AND account_id = 2
ORDER BY tanggal DESC LIMIT 1;



    
    -- NESTED QUERY
SELECT nama, email FROM Users
WHERE id IN (
    SELECT DISTINCT user_id FROM Transactions WHERE jumlah > 100000
);


-- TRIGGER
DELIMITER //
CREATE TRIGGER UpdateSaldoAkun
AFTER INSERT ON Transactions
FOR EACH ROW
BEGIN
    IF NEW.tipe = 'income' THEN
        UPDATE Accounts SET saldo_awal = saldo_awal + NEW.jumlah WHERE id = NEW.account_id;
    ELSE
        UPDATE Accounts SET saldo_awal = saldo_awal - NEW.jumlah WHERE id = NEW.account_id;
    END IF;
END //
DELIMITER ;
-- menampilkan status triger
SHOW TRIGGERS;


-- DCL (Data Control Language)
-- create akun
CREATE USER 'oprator'@'localhost' IDENTIFIED BY '1234'; -- akun oprator
CREATE USER 'tukang_kepo'@'localhost' IDENTIFIED BY '1234'; -- akun pengunjung
-- Beri akses hanya baca ke user operator
GRANT ALL PRIVILEGES ON  SI_Manajemen_Keuangan_Pribadi.* TO 'oprator'@'localhost';
-- Beri akses hanya baca ke user pengunjung
GRANT SELECT ON nama_database.* TO 'tukang_kepo'@'localhost';
-- Cabut hak akses user tersebut
REVOKE SELECT ON SI_Manajemen_Keuangan_Pribadi.* FROM 'oprator'@'localhost';
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'tukang_kepo'@'localhost';

-- menampilkan kemampuan 
SHOW GRANTS FOR 'oprator'@'localhost';
SHOW GRANTS FOR 'tukang_kepo'@'localhost';





