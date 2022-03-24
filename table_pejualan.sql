
CREATE TABLE produk (
    id_produk VARCHAR(5) NOT NULL,
    nm_produk VARCHAR(30) NOT NULL,
    satuan  VARCHAR(10) NOT NULL,
    harga DECIMAL NOT NULL DEFAULT 0,
    stock INT NOT NULL default 0,
    PRIMARY KEY (id_produk)
);

CREATE TABLE pelanggan (
    id_pelanggan VARCHAR(5) NOT NULL,
    nm_pelanggan  VARCHAR(40) NOT NULL,
    alamat TEXT not null,
    telepon VARCHAR(20) not null,
    email VARCHAR(50) not null,
    PRIMARY KEY (id_pelanggan)
);

CREATE TABLE pesan (
    id_pesan SERIAL NOT NULL,
    id_pelanggan VARCHAR(5) NOT NULL,
    tgl_pesan date NOT NULL,
    PRIMARY KEY (id_pesan),
    CONSTRAINT pesan_fk 
    FOREIGN KEY (id_pelanggan) 
    REFERENCES pelanggan (id_pelanggan)
);

CREATE TABLE detil_pesan (
	id_detil_pesan INT NOT NULL,
    id_pesan INT NOT NULL,
    id_produk VARCHAR(5) NOT NULL,  
    jumlah INT NOT NULL default 0,
    harga DECIMAL NOT NULL default 0,
	PRIMARY KEY(id_detil_pesan),
    FOREIGN KEY (id_produk) REFERENCES produk (id_produk),
    FOREIGN KEY(id_pesan) REFERENCES pesan (id_pesan)
);

INSERT INTO pelanggan (id_pelanggan, nm_pelanggan, alamat, telepon, email)
VALUES 
('P001', 'beni', 'jalan mambo', 080001, 'beni@mail.com'),
('P002', 'roni', 'jalan mendil', 082222, 'roni@mail.com'),
('P003', 'yun', 'jalan mendol', 082332, 'yun@mail.com');

INSERT INTO produk (id_produk, nm_produk, satuan, harga, stock)
VALUES 
('C001', 'milkita', 'gram', 100, 50),
('C002', 'indomie', 'gram', 12, 10),
('C003', 'jeruk', 'gram', 20000, 10);

INSERT INTO pesan (id_pelanggan, tgl_pesan)
VALUES ('P001', '2022-01-03'),
('P001', '2022-02-03'),
('P003', '2022-01-04'),
('P003', '2022-01-08');

-- GROUP BY pelanggan.id_pelanggan
SELECT pelanggan.id_pelanggan, pelanggan.nm_pelanggan, count( pelanggan.nm_pelanggan)as jml
FROM pesan LEFT JOIN pelanggan
ON pelanggan.id_pelanggan = pesan.id_pelanggan
GROUP BY pelanggan.id_pelanggan;





