CREATE TABLE t_ext_stores(
	name		VARCHAR2(100),
	refer		CHAR(6),
	building	VARCHAR2(100),
	address		VARCHAR2(250),
	zip_code	CHAR(8),
	city		VARCHAR2(100),
	district	VARCHAR2(100),
	phone_nrs	VARCHAR2(50),
	fax_nr		VARCHAR2(50),
	closure_date	DATE
)
ORGANIZATION EXTERNAL
(
	TYPE oracle_loader
	DEFAULT DIRECTORY src_files
	ACCESS PARAMETERS
	(
		RECORDS DELIMITED BY newline
		BADFILE 'stores.bad'
		DISCARDFILE 'stores.dis'
		LOGFILE 'stores.log'
		SKIP 6
		FIELDS TERMINATED BY ";" OPTIONALLY ENCLOSED BY '"' 
		MISSING FIELD VALUES ARE NULL 

		(
			refer		CHAR(6),
			phone_nrs	CHAR(50),
			fax_nr		CHAR(50),
			name		CHAR(100),
			address		CHAR(250),
			zip_code	CHAR(8),
			city		CHAR(100),
			nr_of_employees	CHAR,
			building	CHAR(250),
			hours		CHAR,
			district	CHAR(100),
			opening_date	DATE 'dd-mm-yyyy',
			closure_date	DATE 'dd-mm-yyyy'
		)
	)
	LOCATION ('stores.csv')
)
REJECT LIMIT UNLIMITED;


CREATE TABLE t_ext_area_cientifica(
	name		VARCHAR2(50),
	sigla		VARCHAR2(10)
)
ORGANIZATION EXTERNAL
(
	TYPE oracle_loader
	DEFAULT DIRECTORY src_files
	ACCESS PARAMETERS
	(
		RECORDS DELIMITED BY newline
		BADFILE 'area_cientifica_proj63.bad'
		DISCARDFILE 'area_cientifica_proj63.dis'
		LOGFILE 'area_cientifica_proj63.log'
		SKIP 1
		FIELDS TERMINATED BY ";" OPTIONALLY ENCLOSED BY '"' 
		MISSING FIELD VALUES ARE NULL
		REJECT ROWS WITH ALL NULL FIELDS
		(
			name		CHAR(50),
			sigla		CHAR(10)
		)
	)
	LOCATION ('Areas_Cientificas.csv')
)
REJECT LIMIT UNLIMITED;


CREATE TABLE t_ext_departamentos(
	name		VARCHAR2(50),
	sigla		VARCHAR2(10)
)
ORGANIZATION EXTERNAL
(
	TYPE oracle_loader
	DEFAULT DIRECTORY src_files
	ACCESS PARAMETERS
	(
		RECORDS DELIMITED BY newline
		BADFILE 'departamentos_proj63.bad'
		DISCARDFILE 'departamentos_proj63.dis'
		LOGFILE 'departamentos_proj63.log'
		SKIP 1
		FIELDS TERMINATED BY ";" OPTIONALLY ENCLOSED BY '"' MISSING FIELD VALUES ARE NULL
		(
			name		CHAR(50),
			sigla		CHAR(10)
		)
	)
	LOCATION ('Departamentos.csv')
)
REJECT LIMIT UNLIMITED;

CREATE TABLE t_ext_curso_ei(
	uc			VARCHAR2(100),
	area_cientifica		VARCHAR2(10),
	departamento		VARCHAR2(10)
)
ORGANIZATION EXTERNAL
(
	TYPE oracle_loader
	DEFAULT DIRECTORY src_files
	ACCESS PARAMETERS
	(
		RECORDS DELIMITED BY newline
		BADFILE 'curso_ei_proj63.bad'
		DISCARDFILE 'curso_ei_proj63.dis'
		LOGFILE 'curso_ei_proj63.log'
		SKIP 3
		FIELDS TERMINATED BY ";" OPTIONALLY ENCLOSED BY '"' 
		REJECT ROWS WITH ALL NULL FIELDS
		(
			uc			CHAR(100),
			area_cientifica		CHAR(10),
			departamento		CHAR(10)
		)
	)
	LOCATION ('Curso_EI.csv')
)
REJECT LIMIT UNLIMITED;