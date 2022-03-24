CREATE TABLE detil_pesan (
    id_pesan INT NOT NULL,
    id_produk VARCHAR(5) NOT NULL,  
    jumlah INT NOT NULL default 0,
    harga DECIMAL NOT NULL default 0,
    PRIMARY KEY (id_pesan, id_produk),
    FOREIGN KEY (id_produk) REFERENCES produk (id_produk),
    FOREIGN KEY(id_pesan) REFERENCES pesan (id_pesan)
);

CREATE TABLE pesan (
    id_pesan SERIAL NOT NULL,
    id_pelanggan VARCHAR(5) NOT NULL,
    tgl_pesan date NOT NULL,
    PRIMARY KEY (id_pesan),
    KEY id_pelanggan (id_pelanggan),
    CONSTRAINT pesan_ibfk_1 FOREIGN KEY (id_pelanggan) REFERENCES pelanggan (id_pelanggan)
);

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