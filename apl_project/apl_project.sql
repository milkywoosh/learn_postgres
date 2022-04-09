MEGA BANK - CGK000504
MAYBANK - CGK010117
BRI - CGK028887
OVO - CGK053640

CREATE TABLE clients (
	id SERIAL,
	account VARCHAR(15),
	name VARCHAR(30)
)

INSERT INTO clients (name, account)
VALUES('MEGA BANK', 'CGK000504'),
('MAYBANK', 'CGK010117'),
('BRI', 'CGK028887'),
('OVO', 'CGK053640')

-- CREATE TABLE
CREATE TABLE mega
(
	id SERIAL,
    awb VARCHAR(30) NOT NULL UNIQUE,
 	pelanggan VARCHAR (100) ,
 	penerima VARCHAR(100) ,
 	Tlp1 VARCHAR(20) ,
 	no_referensi text ,
 	tanggal date ,
 	tlc_tujuan VARCHAR(3) ,
 	tujuan VARCHAR(90) ,
 	ktp VARCHAR(2) DEFAULT 'X',
 	kirim_ke_client date,
 	status_pod VARCHAR(12) ,
 	kasus text DEFAULT 'X',
 	keterangan text DEFAULT 'X',
 	tanggal_terima date ,
	wilayah VARCHAR(20) ,
 	PRIMARY KEY(id)
);

-- INSERT DATA
INSERT INTO mega_cgk000504(awb,pelanggan,penerima,tlp1,no_referensi,tanggal,tlc_tujuan,tujuan,ktp,kirim_ke_client,status_pod,kasus,keterangan,tanggal_terima,wilayah)
			VALUES('CGK8074221400811','CGK000504 - BANK MEGA KARTU KREDIT','HENDRA SETIA BUDI', '014763525', '47635258193112', '2022-01-03', 'TKG', 'BANDAR LAMPUNG', 'X', '2022-01-10','DELIVERED','X','X','2022-03-11','SUMATERA');

-- COPY DATA
COPY (SELECT *, (CURRENT_DATE - tanggal_terima) AS SLA FROM mega_cgk000504) TO '/Users/macbook/learn_postgres/apl_project/mega_apl.csv' 
DELIMITER ';' CSV HEADER;


PREPARE DATA EXCEL --> SAVE AS CSV, DONT OPEN AGAIN FROM EXCEL
JUST FROM TEXT EDITOR
-- IMPORT DATA FROM CSV TO POSTGERS
COPY mega(awb,pelanggan,penerima,tlp1,no_referensi,tanggal,tlc_tujuan,tujuan,ktp,kirim_ke_client,status_pod,kasus,keterangan,tanggal_terima,wilayah) 
FROM '/Users/macbook/learn_postgres/apl_project/bulkmega.csv' DELIMITER ';' csv HEADER;



-- QUERY MULTIPLE ID
SELECT * FROM mega_cgk000504
WHERE awb in (
'CGK8074221400811',
	'CGK8074221400839',
	'CGK8074408500579'
);

UPDATE mega_cgk000504
SET tanggal_terima = '2019-01-01'
WHERE awb in (
'CGK8074221400811',
	'CGK8074221400839',
	'CGK8074408500579'
);

EDIT LANGSUNG DARI CELL POSTGRES CLICK 2X --> SAVE F6;

-- INSERT VALUES AND DO NOTHING/CONTINUE when FIND DUPLICATE VALUE
INSERT INTO countries (country) VALUES ('France'),('Japan') ON CONFLICT (country) DO NOTHING;

INSERT INTO mega (awb)
VALUES ('CGK8078259901039'),
('CGK8078259901584'),
('CGK8078259901591'),
('CGK8078259901600'),
('CGK8078259901611'),
('CGK8078259901624'),
('CGK8078259901639'),
('CGK8078259901646'),
('CGK8078259901655'),
('CGK8078259901666'),
('CGK8078259901679'),
('CGK8078259901684'),
('CGK8078259901691'),
('CGK8078259901700'),
('CGK8078259901711')
ON CONFLICT (awb) DO NOTHING;



-- MERGING DATA TO PG FROM CSV FILE: REF: https://stackoverflow.com/questions/8910494/how-to-update-selected-rows-with-values-from-a-csv-file-in-postgres
CREATE TEMP TABLE tmp_x (awb VARCHAR(20), penerima VARCHAR(100));
SELECT * from tmp_x;
COPY tmp_x(awb, penerima) FROM '/Users/macbook/learn_postgres/apl_project/forupdate_mega.csv' DELIMITER ';' CSV HEADER;

-- UPDATE DATA FROM DATA excel/csv
UPDATE mega
SET penerima = tmp_x.penerima
FROM tmp_x
WHERE mega.awb = tmp_x.awb;