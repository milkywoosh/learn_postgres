
-- some tips:
    -- buat table dengan fields tanpa foreign key firstly
    -- buat table denga fields terdapat foreign key yang mereferensi ke table lain belakangan, agar foreign key sudah terbentuk

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
	id_detil_pesan SERIAL NOT NULL,
    id_pesan INT NOT NULL,
    id_produk VARCHAR(5) NOT NULL,  
    jumlah INT NOT NULL default 0,
    harga DECIMAL NOT NULL default 0,
	PRIMARY KEY(id_detil_pesan),
    FOREIGN KEY (id_produk) REFERENCES produk (id_produk),
    FOREIGN KEY(id_pesan) REFERENCES pesan (id_pesan)
);

INSERT INTO detil_pesan (id_pesan, id_produk, jumlah, harga)
VALUES 
('C001', 10, 100);


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


INSERT INTO pesan (id_pelanggan, tgl_pesan)
VALUES ('P0010', '2022-02-01');

--  JOIN TABLE 2 TABLES
SELECT pelanggan.*, pesan.*, produk.*, detil_pesan.*
FROM pelanggan p
    INNER JOIN pesan psn
        ON  p.id_pelanggan = psn.id_pelanggan


-- QUERY-> JOIN THREE TABLE
SELECT p.*, psn.*, dp.*
FROM pelanggan p
    INNER JOIN pesan psn
        ON  p.id_pelanggan = psn.id_pelanggan
    INNER JOIN detil_pesan dp
        ON dp.id_pesan = psn.id_pesan;



-- ================================================================================
INSERT INTO posts (text, updated_at, created_at)
VALUES
('tes comment 1', CURRENT_DATE, CURRENT_DATE),
('tes comment 2', CURRENT_DATE, CURRENT_DATE),
('tes comment 3', CURRENT_DATE, CURRENT_DATE);


INSERT INTO post_likes (user_id, created_at)
VALUES(2,CURRENT_DATE),
(2,CURRENT_DATE);

-- CREATE TABLE IN CMSLAB db
CREATE TABLE users (
	id SERIAL UNIQUE,
	username VARCHAR(50),
	created_user date DEFAULT CURRENT_DATE
);

CREATE TABLE posts (
	id SERIAL,
	text TEXT,
	user_id INT NOT NULL,
	updated_at TIMESTAMP DEFAULT  CURRENT_DATE,
	created_at TIMESTAMP DEFAULT  CURRENT_DATE,
	FOREIGN KEY (user_id) REFERENCES users(id),
	PRIMARY KEY (id)
);

CREATE TABLE post_likes (
    like_id SERIAL UNIQUE,
    likes BOOLEAN NOT NULL DEFAULT FALSE,
    dislikes BOOLEAN NOT NULL DEFAULT FALSE,
    empty_state BOOLEAN NOT NULL DEFAULT TRUE,
    user_id INT ,
    post_to_like INT UNIQUE,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (post_to_like) REFERENCES posts(id),
    PRIMARY KEY(like_id)
);


 INSERT INTO posts (text, user_id, updated_at, created_at)
VALUES('tes komen baru', 3, CURRENT_DATE, CURRENT_DATE),
('tes baru', 3, CURRENT_DATE, CURRENT_DATE);

-- GI
INSERT INTO post_likes(likes, user_id, post_to_like)
VALUES (TRUE, 1, 3),
(TRUE, 1, 4),
(TRUE, 1, 5);



-- CHECK ALL COMMENT OF ben dol user
SELECT * FROM posts p
INNER JOIN users u
	ON p.user_id = u.id
WHERE u.username = 'ben dol';





