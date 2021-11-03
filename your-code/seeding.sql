USE mydb;
INSERT INTO cars VALUES
	(0,'3K096I98581DHSNUP',	'Volkswagen','Tiguan',2019,'Blue'),
	(1,'ZM8G7BEUQZ97IH46V',	'Peugeot','Rifter',2019,'Red' ),
	(2,'RKXVNNIHLVVZOUB4M',	'Ford',	'Fusion',2018,'White'),
	(3,'HKNDGS7CU31E9Z7JW',	'Toyota','RAV4',2018,'Silver'),
	(4,'DAM41UDN3CHU2WVF6',	'Volvo','V60',	2019,'Gray'),
	(5,'DAM41UDN3CHU2WVF6','Volvo',"V60 Cross Country",2019,'Gray');
    
INSERT INTO customers VALUES
	(10001 , 'Pablo Picasso'      , '0034 636 17 63 82'  , '-' , 'Paseo de la Chopera, 14' , 'Madrid' , 'Madrid'        , 'Spain'         , '8045'  ),
	(20001 , 'Abraham Lincoln'    , '001 305 907 7086'   , '-' , '120 SW 8th St'           , 'Miami'  , 'Florida'       , 'United States' , '3130'  ),
	(30001 , 'Napoléon Bonaparte' , '0033 1 79 75 40 00' , '-' , '40 Rue du Colisée'       , 'Paris'  , 'Île-de-France' , 'France'        , '75008' );

INSERT INTO salespersons VALUES
	(00001,'Petey Cruiser','Madrid'),
	(00002,'Anna Sthesia','Barcelona'),
	(00003,'Paul Molive','Berlin'),
	(00004,'Gail Forcewind','París'),
	(00005,'Paige Turner','Mimia'),
	(00006,'Bob Frapples','Mexico City'),
	(00007,'Walter Melon','Amsterdam'),
	(00008,'Shonda Leer','Sao Paulo');
    
INSERT INTO invoices VALUES
	(852399038,'22-08-2018',0,20001,00004),
	(731166526,'31-12-2018',3,10001,00006),
	(271135104,'22-01-2019',2,30001,00008);