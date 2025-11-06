--membuat database
CREATE DATABASE TokoRetailDB;

--Gunakan DB TokoRetailDB
USE TokoRetailDB;

--membuat tabel KategoriProduk
CREATE TABLE KategoriProduk (
	KategoriID INT IDENTITY(1,1) PRIMARY KEY,
	NamaKategori VARCHAR(100) NOT NULL UNIQUE
);

--Membuat tabel produk
CREATE TABLE Produk (
	ProdukID INT IDENTITY(1,1) PRIMARY KEY,
	SKU VARCHAR(29) NOT NULL UNIQUE,
	NamaProduk VARCHAR(150) NOT NULL,
	Harga DECIMAL(10,2) NOT NULL,
	Stok INT NOT NULL,
	KategoriID INT NULL,


--harganya gaboleh negatif
CONSTRAINT CHK_HargaPositif CHECK (Harga >= 0),
--stoknya gaboleh negatif
CONSTRAINT CHK_StokPositif CHECK (Stok >= 0),
--relasikan dengan tabel kategoriProduk melalui KategoriId
CONSTRAINT FK_Produk_Kategori
	FOREIGN KEY (KategoriID)
	REFERENCES KategoriProduk(KategoriID)

	); 

	


	--memasukkan data kategori produk
	INSERT INTO KategoriProduk (NamaKategori)
	VALUES
	('Elektronik');

	INSERT INTO KategoriProduk (NamaKategori)
	VALUES
	('Pakaian'),
	('Buku');

	--menampilkan tabel kategoriproduk
	SELECT*
	FROM KategoriProduk

	--menampilkan hanya nama kategori
	SELECT NamaKategori
	FROM KategoriProduk

	--menambahkan data ke table produk

	INSERT INTO Produk (SKU, NamaProduk, Harga, Stok, KategoriID)
	VALUES
	('ELEC-001', 'Laptop', 15000000.00, 50, 2);

	INSERT INTO Produk (SKU, NamaProduk, Harga, Stok, KategoriID)
	VALUES
	('ELEC-002', 'Handphone', 5000000.00, 50, 1);

	--menampilkan tabel produk
	SELECT*
	FROM Produk;

	-- mengubah data stok laptop menjadi 30
	UPDATE Produk 
	SET Stok = 30
	WHERE ProdukID = 1;

	--menghapus data Handphone
	BEGIN TRANSACTION;

	DELETE FROM Produk
	WHERE ProdukID = 2;

	-- menyimpan secara permanen
	COMMIT TRANSACTION;

	INSERT INTO Produk (SKU, NamaProduk, Harga, Stok, KategoriID)
	VALUES
	('BAJU-001', 'Kaos Putih', 5000000.00, 50, 3);

	
	INSERT INTO Produk (SKU, NamaProduk, Harga, Stok, KategoriID)
	VALUES
	('BAJU-002', 'Kaos Hitam', 5000000.00, 50, 3);

	SELECT*
	FROM Produk;

	--Menghapus data kaos putih
	BEGIN TRANSACTION
	DELETE FROM Produk
	WHERE ProdukID = 4;

	-- MENGEMBALIKAN DATA YANG SUDAH DI HAPUS
	ROLLBACK TRANSACTION;

	--menyimpan data di secara permanen
	COMMIT TRANSACTION;