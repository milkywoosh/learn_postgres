-- CREATE TABLE
CREATE TABLE mega_cgk000504
(
	id SERIAL,
    awb VARCHAR(30) NOT NULL UNIQUE,
 	pelanggan VARCHAR (100) NOT NULL,
 	penerima VARCHAR(100) NOT NULL,
 	Tlp1 VARCHAR(20) DEFAULT NULL,
 	no_referensi text ,
 	tanggal date NOT NULL,
 	tlc_tujuan VARCHAR(3) NOT NULL,
 	tujuan VARCHAR(90) NOT NULL,
 	ktp VARCHAR(2) DEFAULT 'X',
 	kirim_ke_client date,
 	status_pod VARCHAR(12) NOT NULL,
 	kasus text DEFAULT 'X',
 	keterangan text DEFAULT 'X',
 	tanggal_terima date NOT NULL,
	wilayah VARCHAR(20) NOT NULL,
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
COPY mega_cgk000504(awb,pelanggan,penerima,tlp1,no_referensi,tanggal,tlc_tujuan,tujuan,ktp,kirim_ke_client,status_pod,kasus,keterangan,tanggal_terima,wilayah) 
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