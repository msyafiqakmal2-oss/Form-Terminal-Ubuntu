CREATE DATABASE toko_db;
USE toko_db;

CREATE TABLE produk (
    id_produk INT AUTO_INCEREMENT PRIMARY KEY,
    nama_produk VARCHAR(100) NOT NULL,
    harga DECIMAL(10, 2) NOT NULL,
    stok INT NOT NULL
);
CREATE TABLE pelanggan (
    id_pelanggan INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    no_hp VARCHAR(15)
);
CREATE TABLE transaksi (
    id_transaksi INT AUTO_INCREMENT PRIMARY KEY,
    id_pelanggan INT,
    tanggal DATE,
    total DECIMAL(10, 2),
    FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan)
);
CREATE TABLE detail_transkasi (
    id_detail INT AUTO_INCEREMENT PRIMARY KEY,
    id_transaksi INT,
    id_produk INT,
    jumlah INT,
    subtotal DECIMAL(10, 2),
    FOREIGN KEY (id_transaksi) REFERENCES transaksi(id_transaksi),
    FOREIGN KEY (id_produk) REFERENCES produk(id_produk)
);
INSERT INTO produk (nama_produk, harga, stok) VALUES
( 'Laptop' , 8000000, 10),
( 'Smartphone' , 1500000, 50),
( 'Keyboard' , 3000000, 30);

INSERT INTO pelanggan (nama, email, no_hp) VALUES
('Budi', 'budi@gmail.com', '08123456789'),
('Siti', ' siti@gmail.com', '08198765432');

SELECT * FROM produk;
WHERE stok < 20;
SELECT transaksi.id_transaksi, pelanggan.nama, transaksi.tanggal, transaksi.total
FROM transaksi
JOIN pelanggan ON transaksi.id_pelanggan = pelanggan.id_pelanggan;

SELECT pelanggan.nama, SUM(transaksi.total) AS total_belanja
FORM transaksi
JOIN pelanggan ON transaksi.id_pelanggan = pelanggan.id_pelanggan
GROUP BY pelanggan.nama;

SELECT * FROM produk
WHERE harga = (SELECT MAX(harga) FROM produk);

