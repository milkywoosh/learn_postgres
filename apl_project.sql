
-- GOOD
CREATE TABLE app
(
	id_app SERIAL,
    awb VARCHAR(16) NOT NULL,
 	pelanggan VARCHAR (100) NOT NULL,
 	penerima VARCHAR(100) NOT NULL,
 	Tlp1 VARCHAR(20) DEFAULT NULL,
 	no_referensi VARCHAR(20) ,
 	tanggal date NOT NULL,
 	tlc_tujuan VARCHAR(3) NOT NULL,
 	tujuan VARCHAR(3) NOT NULL,
 	ktp VARCHAR(2) DEFAULT 'X',
 	kirim_ke_client VARCHAR(30) ,
 	status_pod VARCHAR(12) NOT NULL,
 	case_cek VARCHAR(20) DEFAULT 'X',
 	keterangan VARCHAR(100) DEFAULT 'X',
 	today date NOT NULL DEFAULT CURRENT_DATE,
 	tanggal_terima date NOT NULL,
 	PRIMARY KEY(id_app)
);




