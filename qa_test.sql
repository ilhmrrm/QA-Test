-- Syntax untuk membuat database bernama qa_test
create database qa_test;

-- Syntax untuk menggunakan database qa_test
use qa_test;

-- Disini membuat tabel (Create Table) bernama customer yang mempunyai field yaitu Kdpelanggan, NmPelanggan, Jenkel, Alamat, dan Kota bertipe data VARCHAR dengan masing - masing panjang data nya terlihat dari
-- (n) Didalam tanda kurungnya. Untuk Telp bertipe data integer (bilangan bulat) dengan panjang datanya sampai 30 character. PRIMARY KEY menandakan bahwa KdPelanggan sebagai PRIMARY KEY pada tabel
-- customer
CREATE TABLE Customer (
    KdPelanggan VARCHAR(15),
    NmPelanggan VARCHAR(15),
    Jenkel VARCHAR(2),
    Alamat VARCHAR(225),
    Kota VARCHAR(225),
    TELP INT(30),
    PRIMARY KEY(KdPelanggan));

-- membuat tabel (Create Table) bernama Barang yang mempunyai field Kd,Barang, NmBarang, HgSatuan dengan tipe data VARCHAR dan JumStock dengan tipe data Integer. Memiliki Primary Key di KdBarang
CREATE TABLE Barang (
    KdBarang VARCHAR(25) PRIMARY KEY,
    NmBarang VARCHAR(225),
    HgSatuan VARCHAR(225),
    JumStock INT(150));

-- INSERT INTO berfungsi untuk menginput data pada tabel Customer dengan field yang berurutan dan VALUES (nilai) yang berada didalam () kurung.
INSERT INTO Customer (KdPelanggan, NmPelanggan, Jenkel, Alamat, Kota, TELP)
    VALUES
    ('CS001', 'Yogi', 'P', 'Mujair 12', 'Malang', '456789'),
    ('CS002', 'Dodo', 'P', 'Mawar 9', 'Jakarta', '543781'),
    ('CS003', 'Henny', 'W', 'Ceker Ayam 2', 'Surabaya', '444222'),
    ('CS004', 'Haryani', 'W', 'Bend Sutami 7', 'Malang', '537372');

-- INSERT INTO berfungsi untuk menginput data pada tabel Barang dengan field yang berurutan dan VALUES (nilai) yang berada didalam () kurung.
INSERT INTO Barang (KdBarang, NmBarang, HgSatuan, JumStock) 
    VALUES 
    ('AR001', 'Monitor Samsung 14', '1000000', 12),
    ('BR002', 'Scanner UMAX', '2000000', 4),
    ('CR001', 'Keyboard 104 keys', '200000', 20),
    ('UR001', 'Flash Disk Kingston', '250000', 9);

-- membuat tabel (Create Table) bernama Transaksi. Disini akan lebih dijelaskan mengapa menggunakan CONSTRAINT dan FOREIGN KEY
-- Agar membuat batasan pada kolom untuk menjembatani PRIMARY KEY dengan FOREIGN KEY. 
CREATE TABLE Transaksi ( 
    TglTrans DATE, 
    KdTrans VARCHAR(10) PRIMARY KEY,
    KdPelanggan VARCHAR(15),
    KdBarang VARCHAR(25), 
    JumJual INT, 
    CONSTRAINT fk_KdPelanggan FOREIGN KEY (KdPelanggan) REFERENCES Customer(KdPelanggan), 
    CONSTRAINT fk_KdBarang FOREIGN KEY (KdBarang) REFERENCES Barang(KdBarang));

-- 1 
    SELECT * FROM BARANG;

-- 2
    SELECT * FROM Barang WHERE JumStock > 5 AND HgSatuan > 20000;
    -- Menampilkan tabel barang namun dengan kondisi dimana (WHERE) field JumStock Lebih dari 5 dan (AND) field HgSatuan Lebih dari 20000.
-- 3
    SELECT c.NmPelanggan, b.NmBarang, b.HgSatuan, c.Alamat, c.Kota, c.TELP FROM Customer c JOIN Transaksi t ON c.KdPelanggan = t.KdPelanggan JOIN Barang b ON t.KdBarang = b.KdBarang;
    -- Disini c.NmPelanggan, b.NmBarang dst merupakan penggunaan alias untuk kolom tertentu dalam Query SQL. Disini saya c sebagai Customer,
    -- b untuk barang, dan t untuk Transaksi agar lebih mudah dalam pengambilannya.

