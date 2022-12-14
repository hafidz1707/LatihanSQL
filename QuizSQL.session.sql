CREATE TABLE [logins] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [customer_id] int NOT NULL,
  [username] varchar(32),
  [password] varchar(32)
)
CREATE TABLE [customers] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [forename] varchar(64),
  [surname] varchar(64),
  [add1] varchar(255),
  [add2] varchar(255),
  [add3] varchar(255),
  [postcode] varchar(16),
  [phone] varchar(16),
  [email] varchar(128),
  [registered] bit
)
CREATE TABLE [orders] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [customer_id] int,
  [registered] bit,
  [delivery_add_id] int,
  [payment_type] varchar(64),
  [date] date,
  [status] varchar(32),
  [session] varchar(255),
  [total] money
)
CREATE TABLE [products] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [cat_id] int,
  [name] varchar(255),
  [description] varchar(255),
  [image] varchar(255),
  [price] money
)
CREATE TABLE [categories] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [name] varchar(255),
  [description] varchar(255),
  [image] varchar(255)
)
CREATE TABLE [order_items] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [order_id] int,
  [product_id] int,
  [quantity] int
)
CREATE TABLE [delivery_addresses] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [forename] varchar(64),
  [surname] varchar(64),
  [add1] varchar(255),
  [add2] varchar(255),
  [add3] varchar(255),
  [postcode] varchar(16),
  [phone] varchar(16),
  [email] varchar(128)
)
CREATE TABLE [admins] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [username] varchar(32),
  [password] varchar(32)
)
ALTER TABLE [logins] ADD FOREIGN KEY ([customer_id]) REFERENCES [customers] ([id])
GO
ALTER TABLE [orders] ADD FOREIGN KEY ([customer_id]) REFERENCES [customers] ([id])
GO
ALTER TABLE [order_items] ADD FOREIGN KEY ([order_id]) REFERENCES [orders] ([id])
GO
ALTER TABLE [products] ADD FOREIGN KEY ([cat_id]) REFERENCES [categories] ([id])
GO
ALTER TABLE [orders] ADD FOREIGN KEY ([delivery_add_id]) REFERENCES [delivery_addresses] ([id])
GO
ALTER TABLE [order_items] ADD FOREIGN KEY ([product_id]) REFERENCES [products] ([id])
GO

INSERT INTO customers (forename, surname, postcode, phone, registered)
VALUES ('Peggie', 'Pallent', NULL, '521-107-9777', 1),
('Mathias', 'Folster', '56628', '545-991-1112', 0),
('tamarra', 'Le Merchant', '551 84', '808-786-9467', 1),
('Janetta', 'Helin', NULL, '686-355-4931', 1),
('Reinhold', 'Martjin', NULL, '795-679-7136', 0),
('Lauritz', 'Provest', NULL, '296-351-8061', 0),
('Con', 'Kupisz', NULL, '184-311-1830', 1),
('Beatrisa', 'Tomowicz', NULL, '979-772-1232', 1),
('Nathanial', 'Rupert', '3025-419', '636-290-1463', 0),
('Etta', 'Edginton', '48100', '862-845-2560', 1);

INSERT INTO categories (name, description, image)
VALUES ('vegetables', 'Fus-Ro-Dah', 'http://theelderscroll.skyrim/UnrelentingForce.jpg'),
('vegetables', 'Yol-Tor-Suul', 'http://theelderscroll.skyrim/FireBreath.jpg'),
('fruits', 'Od-Ah-Viing', 'http://theelderscroll.skyrim/CallDragonOdahviing.jpg'),
('fruits', 'Mul-Qah-Diiv', 'http://theelderscroll.skyrim/DragonAspect.jpg'),
('vegetables', 'Joor-Zah-Frul', 'http://theelderscroll.skyrim/Dragonrend.jpg'),
('vegetables', 'Fo-Krah-Diin', 'http://theelderscroll.skyrim/FrostBreath.jpg'),
('vegetables', 'Wuld-Nah-Kest', 'http://theelderscroll.skyrim/WhirlwindSprint.jpg'),
('fruits', 'Su-Grah-Dun', 'http://theelderscroll.skyrim/ElementalFuryjpg');

INSERT INTO delivery_addresses (forename, surname, add1, postcode, phone, email)
VALUES ('Harry', 'Blamires', '5 Northwestern Point', 'K67', '709-178-2038', 'hblamires0@lulu.com'),
('Adi', 'Carlon', '37136 Macpherson Street', NULL, '522-462-4973', 'acarlon1@discuz.net'),
('Barty', 'Monkley', '55 Hauk Trail', NULL, '879-792-1014', 'bmonkley2@ihg.com'),
('Salem', 'Ewert', '81078 Oakridge Circle', NULL, '223-256-8714', 'sewert3@hotsgator.com'),
('Vilhelmina', 'Bairnsfather', '72949 Eastwood Street', '2402', '632-170-9234', 'hlisamore5@prweb.com'),
('Hayylm', 'Lisamore', '388 Birchwood Place', '71122', '901-562-9922', 'hlisamore5@prweb.com'),
('Maerah', 'Gutans', '6 Tony terrace', NULL, '142-802-2019', 'mgutans6@ucoz.com'),
('Garret', 'Grayston', '64394 Clove Place', NULL, '580-799-7576', 'ggrayston7@prweb.com'),
('Roxine', 'Booler', '69 Lakewood Gardens Place', '241551', '857-659-8653', 'rbooler8@springer.com'),
('Filbert', 'Brougham', '8756 Village Green Place', '5049', '476-610-5525', 'fbrougham9@si.edu');

Insert into products (cat_id, name, description, image, price)
Values (1, 'Truffle Paste', 'Jamur enak', 'http://jamur.com/truffle.png', 8791),
(6, 'Carrots - Mini Reg Organic', 'Wortel enak', 'http://wortel.com/carrot.png', 9675),
(4, 'Sprouts Dikon', 'Kecambah enak', 'http://kecambah.com/sprouts.png', 9147),
(4, 'Mushrooms - Black, Dried', 'Jamur sedap', 'http://jamur.com/mushrooms.png', 2019),
(6, 'Coffee - Flavoured', 'Kopi enak', 'http://kopi.com/coffee.png', 5270),
(2, 'Juice - Orange', 'Jus Jeruk enak', 'http://jeruk.com/orange.png', 9780),
(1, 'Energy Drink - Franks Original', 'Extra Joss', 'http://extrajoss.com/extrajoss.png', 9676),
(3, 'Energy - Boo - Koo', 'Kuku Bima', 'http://kukubima.com/bimaclaw.png', 2916),
(4, 'Tart - Lemon', 'Lemon enak', 'http://lemon.com/lemon.png', 2099),
(5, 'Beef Tenderloin Aaa', 'Rendang enak', 'http://rendang.com/beef.png', 6888);

insert into orders (customer_id, registered, delivery_add_id, payment_type, date, status, total)
values (6, 0, 2, 'diner-club-us-ca', '5/31/2019', 'Paid', 182389),
(6, 1, 1, 'jcb', '12/24/2019', 'Canceled', 585376),
(2, 0, 4, 'mastercard', '7/4/2019', 'Canceled', 404804),
(10, 1, 5, 'jcb', '7/16/2019', 'Canceled', 428182),
(5, 1, 10, 'visa-electron', '1/13/2020', 'Canceled', 370261),
(6, 1, 3, 'americanexpress', '10/22/2019', 'Canceled', 440665),
(3, 0, 7, 'jcb', '1/30/2020', 'Canceled', 427954),
(6, 0, 8, 'mastercard', '8/30/2019', 'Canceled', 250107),
(2, 0, 4, 'jcb', '6/3/2019', 'Paid', 144049),
(5, 0, 6, 'jcb', '8/31/2019', 'Pending', 114408);

INSERT INTO order_items (order_id,product_id,quantity)
VALUES (4,8,4),
    (8,10,11),
    (8,4,11),
    (1,2,3),
    (7,9,15),
    (1,4,13),
    (10,7,6),
    (9,10,12),
    (7,6,11),
    (6,2,16);

-- Answer 1
select O.id as order_id, Concat(C.forename, ' ', C.surname) as customer_name from orders as O
inner join customers as C on O.customer_id = C.id
order by O.id

-- Answer 2
select O.status, count(O.id) as sum_of_orders from orders as O
group by O.status

-- Answer 3
-- select P.id as product_id, P.name as product_name, C.name as product_categories from products as P
-- inner join categories as C on P.cat_id = C.id
-- Answer 3 alternative
select C.name as category, string_agg(P.id, ', ') as Id, string_agg(P.name, ', ') as product_name from products as P
inner join categories as C on P.cat_id = C.id
group by C.name

-- Answer 4
select O.id as order_id, add1 as address from delivery_addresses as DA
inner join orders as O on DA.id = O.delivery_add_id

-- Answer 5
-- select O.id as order_id, P.name as product_name from orders as O 
-- inner join order_items as OI on O.id = OI.order_id
-- inner join products as P on OI.product_id = P.id
-- order by O.id
-- Answer 5 alternative
select O.id as order_id, string_agg(P.name, ', ') as product_name from orders as O 
inner join order_items as OI on O.id = OI.order_id
inner join products as P on OI.product_id = P.id
group by O.id
order by O.id