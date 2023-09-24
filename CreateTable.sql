CREATE TABLE Person
(
	ID_Per INT NOT NULL IDENTITY(1,1),
	FirstName_Per VARCHAR(20) NOT NULL,
	LastName_Per VARCHAR(20) NOT NULL,
	City_Per VARCHAR(20) NOT NULL,
	Phone_Per CHAR(10) NOT NULL,
	Gender_Per VARCHAR(1),
	CONSTRAINT Person_ID_PerPK PRIMARY KEY (ID_Per),
	CONSTRAINT Person_ID_PerUNIQUE UNIQUE (ID_Per),
	CONSTRAINT check_Gender_Per CHECK (Gender_Per IN ('M', 'F')),
	CONSTRAINT check_Phone_Per CHECK (Phone_Per NOT LIKE '%[^0-9]%'),
	CONSTRAINT check_Char_FirstName_Per CHECK (FirstName_Per LIKE '%[^0-9]%'),
	CONSTRAINT check_Char_LastName_Per CHECK (LastName_Per  LIKE '%[^0-9]%'),
	CONSTRAINT check_Char_City_Per CHECK (City_Per LIKE '%[^0-9]%')
);

INSERT INTO Person (FirstName_Per,LastName_Per, City_Per, Phone_Per, Gender_Per) VALUES 
('Petr', 'Stariy', 'Minsk', '2551515962','M'),
('Adam', 'Ruhav', 'Atlanta', '7777777777','M'),
('Ruby', 'Da Cherry', 'New Orleans', '0596666666','M'),
('Budd', 'Dwyer', 'New Orleans', '0590066600','M'),
('Bones', 'Sesh', 'Michigan', '8901515969','M'),
('Tom', 'Rick', 'Chicago','8959592345','M'),

('Roman', 'Sonnuy', 'Ufa', '5517319800','M'),
('Vitaliy', 'Zaharov', 'Ufa', '6161616161','M'),
('Victor', 'Tsoi', 'Saint Petersburg', '8005553535','M'),
('Yung', 'Linus', 'Minsk', '0259903576','M'),
('Anna', 'Luna', 'Moscow', '8801700050','F'),
('Alexandra', 'Runina', 'Moscow','8568875564','F'),
('Jeem', 'Bosketc', 'Saint-Petersburg','8800555236','M');

CREATE TABLE Lots
(
	ID_Lot INT NOT NULL IDENTITY(1,1),
	Name_Lot VARCHAR(50) NOT NULL,
	Discription_Lot VARCHAR(250) NOT NULL,
	Available_Date DATE NOT NULL, 
	Sale_Sold VARCHAR(4) DEFAULT 'Sale',
	ID_PerSel INT NOT NULL /*FOREIGN KEY REFERENCES Person (ID_Per)*/,
	CONSTRAINT Lots_ID_LotUNIQUE UNIQUE (ID_Lot),
	CONSTRAINT Lots_ID_LotPK PRIMARY KEY (ID_Lot),
	CONSTRAINT Lots_ID_PerSelFK FOREIGN KEY (ID_PerSel) REFERENCES Person(ID_Per) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT check_Sale_Sold CHECK (Sale_Sold IN ('Sale', 'Sold')),
	/*CONSTRAINT check_Name_Lot CHECK (Name_Lot NOT LIKE '%[^0-9]%'),*/
	CONSTRAINT check_Date_Available_Date CHECK (Available_Date >= '01.01.2005' AND Available_Date <= '09.12.2021')
);

INSERT INTO Lots(Name_Lot,Discription_Lot,Available_Date,Sale_Sold,ID_PerSel) VALUES 
('Gold ring with amethyst', 'gold 56 standart, amethyst ~ 11.12 ct weight - 8.5 grams, size - 19.2','05.07.2009', 'Sold','4'),
('Meissen Porcelain Dish, 18th century', 'Meissen, Germany, 1740 - 1780s, porcelain, painting. Size - 23 x 25 cm', '17.03.2012', 'Sold', '2'),
('Porcelain figurine Germany "Horse"', 'Germany, Hutchenreuther, 1910s - 1915s, by P. Scheurich, porcelain, molding, glaze. Height - 40 cm', '15.10.2015', DEFAULT, '1'),
('Candy bowl Support the collective farm', 'USSR, Dulevo, 1930s, porcelain, overglaze painting, airbrush stencil. Height - 11 cm', '20.12.2012', 'Sold', '3'),
('Table mirror - psishe Russia', 'Russia, mid-19th century, mahogany, carving. Height - 58 cm, length - 68.5 cm, width - 29 cm', '30.12.2008', DEFAULT, '5' ),
('Round table Western Europe', 'Western Europe, late 19th century, wood. Height - 66 cm, diameter - 96 cm', '01.05.2005', 'Sold', '6'),
('Showcase Western Europe', 'Western Europe, late 19th century, wood, bronze, marble, wood painting. Height - 158 cm, width - 108 cm, depth - 29 cm', '12.08.2009', 'Sold' , '3'),
('Painting "Swans on a pond"', 'author: unknown artist, Western Europe, mid XX century, oil on canvas. Size - 51 x 39 cm', '17.09.2019', 'Sold', '3'),
('Painting "On Lake Starnbern"', 'author: Hans Stadelhofer, Western Europe, 1876, oil, cardboard, signed. Size - 28 x 33 cm', '13.02.2008', 'Sold', '1') ,
('Painting "The Venetian Canal"', 'author: Ludwig Diehl (February 2, 1848, Gernsbach - October 24, 1940, Karlsruhe) - German painter, known as a landscape and seascape painter. Germany, late XIX century oil on cardboard. Size - 33 x 49 cm ','12.12.2012','Sold','6'),
('Pair of vases France 1830 - 1840s', 'France, 1830s - 1840s, two-color glass, faceting, grinding, bronze, mount. Height - 31.0 cm', '03.05.2011', DEFAULT, '2'),
('Bottle glass', 'Western Europe, mid-19th century, colorless glass, painted in gold. Height - 19.0 cm', '05.12.2015', 'Sold', '4'),
('Vase glass Bohemia', 'Bohemia, late 19th century, two-tone glass, painting with enamel paints, gilding. Height - 36.5 cm', '18.01.2008', 'Sold', '4'),
('Goblet with a medallion made of green glass',' Western Europe, early XX century, green glass with an applied medallion made of milk glass, painting, paints and gold. Height - 16.5 cm ','02.01.2018', DEFAULT,'5'),
('Painting "Rabbi"', 'Author: unknown artist. Western Europe, late XIX - early XX centuries, oil on canvas. Size - 60 �50 cm', '12.12.2012', 'Sold', '2'),
('Painting "Winter landscape with a wolf"', 'Author: unknown artist. Western Europe, late XIX - early XX centuries, hardboard, oil. Size - 20 x 28.5 cm', '08.07.2013', DEFAULT, '1'),
('Painting "Hunting Dogs"', 'Second: unknown master. Western Europe, late 19th century, oil on canvas. Size - 90 x 60 cm', '25.10.2009','Sold', '6'),
('Painting "At the House"', 'Author: Bruno Crowel (1907 - 1999). Germany, mid XX century, wood, oil. Size - 26.5 x 31 cm', '17.03.2014', DEFAULT, '3'),
('Gold ring with a diamond', 'Gold 56 standart, round diamond 58 facets ~ 2.49 ct 8/7, weight - 12.8 grams, size - 16.5', '04.01.2008', 'Sold' ,'5'),
('The Golden Chain', 'Posted by Jimbo (1993 - 2019).', '03.03.2008', 'Sold', '13');

CREATE TABLE Auctions
(
	ID_Auct INT NOT NULL IDENTITY(1,1),
	Date_Auct DATE NOT NULL,
	City_Auct VARCHAR(20) NOT NULL,
	Specifics_Auct VARCHAR(100),
	CONSTRAINT Auctions_ID_AuctUNIQUE UNIQUE (ID_Auct),
	CONSTRAINT Auctions_ID_AuctPK PRIMARY KEY (ID_Auct),
	CONSTRAINT check_Date_Auct CHECK (Date_Auct >= '01.01.2005' AND Date_Auct <= '09.12.2021')
);

INSERT INTO Auctions(Date_Auct,City_Auct,Specifics_Auct) VALUES
('01.01.2010', 'Moscow', 'Moscow antique furniture auction'),
('01.01.2013', 'Venice', 'Venetian antique painting auction'),
('01.01.2016', 'Paris', 'Parisian antique porcelain auction'),
('01.01.2018', 'Berlin', 'Berlin antique gold jewelery auction'),
('01.01.2020', 'New Orleans', 'New Orleans Antique Glass Auction'),
('01.01.2021', 'Minsk', 'Minsk active auction of paintings');

CREATE TABLE LotOnAuctions
(
	ID_Lot INT NOT NULL,
	ID_Auct INT NOT NULL,
	Lot INT NOT NULL,
	Start_Prise DECIMAL(12,2) NOT NULL,
	Last_Prise DECIMAL (12,2) DEFAULT '0.00',
	ID_PerSel INT NOT NULL,
	ID_PerCust INT,
	--CONSTRAINT LOA_ID_AuctLotPK PRIMARY KEY (ID_Auct, Lot),
	CONSTRAINT LOA_ID_PerSelFK FOREIGN KEY (ID_PerSel) REFERENCES Person(ID_Per),
	CONSTRAINT LOA_ID_PerCustFK FOREIGN KEY (ID_PerCust) REFERENCES Person(ID_Per),
	CONSTRAINT LOA_ID_ID_LotFK FOREIGN KEY (ID_Lot) REFERENCES Lots(ID_Lot),
	CONSTRAINT LOA_ID_AuctFK FOREIGN KEY (ID_Auct) REFERENCES Auctions(ID_Auct),
	CONSTRAINT LOA_AuctionLot UNIQUE (ID_Auct, Lot)
);

INSERT INTO LotOnAuctions(ID_Lot,ID_Auct,Lot,Start_Prise,Last_Prise,ID_PerSel,ID_PerCust) VALUES
(5,1,1,250000.00,DEFAULT,5,NULL),
(6,1,2,600000.00,920000.00,6,7),
(7,1,3,78000.00,150000.00,3,10),
(9,2,1,19000.00,830000.00,1,8),
(10,2,2,10000.00,9500000.00,6,11),
(17,2,3,12500.00,100000.00,6,12),
(2,3,1,50000.00,830000.00,1,8),
(3,3,2,5000.00,DEFAULT,1,NULL),
(4,3,3,25000.00,9500000.00,6,9),
(1,4,1,120000.00,470000.00,4,12),
(19,4,2,180000.00,1000000.00,5,7),
(20,4,3,26000.00,1000000.00,13,13),
(11,5,1,17000.00,DEFAULT,2,NULL),
(12,5,2,5000.00,100000.00,4,12),
(13,5,3,19800.00,54000.00,4,9),
(14,5,4,100000.00,DEFAULT,5,NULL),
(8,6,1,23000.00,85000.00,3,7),
(15,6,2,7000.00,150000.00,2,10),
(16,6,3,13000.00,DEFAULT,1,NULL),
(18,6,4,60000.00,DEFAULT,3,NULL);

