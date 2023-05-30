create database e_comWebDB;
use e_comWebDB;

CREATE TABLE IF NOT EXISTS `category` (
  `cat_id` int(5) NOT NULL DEFAULT '0',
  `cat_name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cat_id`)
);

insert into category (cat_id,cat_name) VALUES
(1, 'BOOKS'),
(2, 'GAMES'),
(3, 'GROCERIES'),
(4, 'ELECTRONIC'),
(5, 'CLOTHES');

CREATE TABLE IF NOT EXISTS `customer` (
  `cus_id` int(5) NOT NULL DEFAULT '0',
  `cus_name` varchar(20) DEFAULT NULL,
  `cus_phone` varchar(20) DEFAULT NULL,
  `cus_city` varchar(20) DEFAULT NULL,
  `cus_gender` char(1) DEFAULT NULL,
  PRIMARY KEY (`cus_id`)
); 

INSERT INTO `customer` (`cus_id`, `cus_name`, `cus_phone`, `cus_city`, `cus_gender`) VALUES
(1, 'AAKASH', '9999999999', 'DELHI', 'M'),
(2, 'AMAN', '9785463215', 'NOIDA', 'M'),
(3, 'NEHA', '9999999999', 'MUMBAI', 'F'),
(4, 'MEGHA', '9994562399', 'KOLKATA', 'F'),
(5, 'PULKIT', '7895999999', 'LUCKNOW', 'M'),
(6, 'VIRAT', '9890989065', 'DELHI', 'M'),
(7, 'ROHIT', '8888111222', 'MUMBIA', 'M');

CREATE TABLE IF NOT EXISTS `orders` (
  `ord_id` int(5) NOT NULL DEFAULT '0',
  `ord_amount` int not null,
  `ord_date` date DEFAULT NULL,
  `cus_id` int(5) DEFAULT NULL,
  `pricing_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`ord_id`),
  KEY `cus_id` (`cus_id`),
  KEY `pricing_id` (`pricing_id`)
);

	INSERT INTO `orders` (`ord_id`, `ord_amount` ,`ord_date`, `cus_id`, `pricing_id`) VALUES
(101,1500 ,'2021-10-06', 2, 1),
(102,1000 ,'2021-10-12', 3, 5),
(103,30000 ,'2021-09-16', 5, 2),
(104,1500 ,'2021-10-05', 1, 1),
(105,3000 ,'2021-08-16', 4, 3),
(106,1450 ,'2021-08-18', 1, 9),
(107,789 ,'2021-09-01', 3, 7),
(108,780 ,'2021-09-07', 5, 6),
(109,3000 ,'2021-09-10', 5, 3),
(110,2500 ,'2021-09-10', 2, 4),
(111,1000 ,'2021-09-15', 4, 5),
(112,789 ,'2021-09-16', 4, 7),
(113,31000 ,'2021-09-16', 1, 8),
(114,1000 ,'2021-09-16', 3, 5),
(115,3000 ,'2021-09-16', 5, 3),
(116, 99,'2021-09-17', 2, 14);

CREATE TABLE IF NOT EXISTS `product` (
  `pro_id` int(5) NOT NULL DEFAULT '0',
  `pro_name` varchar(20) DEFAULT NULL,
  `pro_desc` varchar(60) DEFAULT NULL,
  `cat_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`pro_id`),
  KEY `cat_id` (`cat_id`)
);

INSERT INTO `product` (`pro_id`, `pro_name`, `pro_desc`, `cat_id`) VALUES
(1, 'GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', 2),
(2, 'TSHIRT', 'SIZE-L with Black, Blue and White variations', 5),
(3, 'ROG LAPTOP', 'Windows 10 with 15inch screen, i7 processor, 1TB SSD', 4),
(4, 'OATS', 'Highly Nutritious from Nestle', 3),
(5, 'HARRY POTTER', 'Best Collection of all time by J.K Rowling', 1),
(6, 'MILK', '1L Toned MIlk', 3),
(7, 'Boat EarPhones', '1.5Meter long Dolby Atmos', 4),
(8, 'Jeans', 'Stretchable Denim Jeans with various sizes and color', 5),
(9, 'Project IGI', 'compatible with windows 7 and above', 2),
(10, 'Hoodie', 'Black GUCCI for 13 yrs and above', 5),
(11, 'Rich Dad Poor Dad', 'Written by RObert Kiyosaki', 1),
(12, 'Train Your Brain', 'By Shireen Stephen', 1);


CREATE TABLE IF NOT EXISTS `rating` (
  `rat_id` int(5) NOT NULL DEFAULT '0',
  `ord_id` int(5) DEFAULT NULL,
  `stars` int(5) DEFAULT NULL,
  PRIMARY KEY (`rat_id`),
  KEY `ord_id` (`ord_id`)
);

INSERT INTO `rating` (`rat_id`, `ord_id`, `stars`) VALUES
(1, 101, 4),
(2, 102, 3),
(3, 103, 1),
(4, 104, 2),
(5, 105, 4),
(6, 106, 3),
(7, 107, 4),
(8, 108, 4),
(9, 109, 3),
(10, 110, 5),
(11, 111, 3),
(12, 112, 4),
(13, 113, 2),
(14, 114, 1),
(15, 115, 1),
(16, 116, 0);

CREATE TABLE IF NOT EXISTS `supplier` (
  `supp_id` int(5) NOT NULL DEFAULT '0',
  `supp_name` varchar(20) DEFAULT NULL,
  `supp_city` varchar(20) DEFAULT NULL,
  `supp_phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`supp_id`)
);

INSERT INTO `supplier` (`supp_id`, `supp_name`, `supp_city`, `supp_phone`) VALUES
(1, 'Rajesh Retails', 'Delhi', '1234567890'),
(2, 'Appario Ltd.', 'Mumbai', '2589631470'),
(3, 'Knome products', 'Banglore', '9785462315'),
(4, 'Bansal Retails', 'Kochi', '8975463285'),
(5, 'Mittal Ltd.', 'Lucknow', '7898456532');

CREATE TABLE IF NOT EXISTS `supplier_pricing` (
  `pricing_id` int(5) NOT NULL DEFAULT '0',
  `pro_id` int(5) DEFAULT NULL,
  `supp_id` int(5) DEFAULT NULL,
  `supp_price` int(5) DEFAULT NULL,
  PRIMARY KEY (`pricing_id`),
  KEY `pro_id` (`pro_id`),
  KEY `supp_id` (`supp_id`)
);

INSERT INTO `supplier_pricing` (`pricing_id`, `pro_id`, `supp_id`, `supp_price`) VALUES
(1, 1, 2, 1500),
(2, 3, 5, 30000),
(3, 5, 1, 3000),
(4, 2, 3, 2500),
(5, 4, 1, 1000),
(6, 12, 2, 780),
(7, 12, 4, 789),
(8, 3, 1, 31000),
(9, 1, 5, 1450),
(10, 4, 2, 999),
(11, 7, 3, 549),
(12, 7, 4, 529),
(13, 6, 2, 105),
(14, 6, 1, 99),
(15, 2, 5, 2999),
(16, 5, 2, 2999);



**Display the total number of customers based on gender who have placed individual orders of worth at least Rs.3000.
select count(cus_id) as NumbersOfCustomers from customer join orders using(cus_id) where ord_amount >=3000 group by (cus_gender);

**Display all the orders along with product name ordered by a customer having Customer_Id=2
select ord_id,ord_amount,ord_date, pro_name from orders join supplier_pricing using(pricing_id) join product using (pro_id) where cus_id=2;

**Display the Supplier details who can supply more than one product.
select supp_id,supp_name ,supp_city,supp_phone from supplier join supplier_pricing using(supp_id) join product using(pro_id) group by supp_id having count(supp_id)>1;

**Find the least expensive product from each category and print the table with category id, name, product name and price of the product
select cat_id,cat_name,pro_name,supp_price from category join product using(cat_id) join supplier_pricing using(pro_id) where 
supp_price = (select min(supp_price) from supplier_pricing );

**Display the Id and Name of the Product ordered after “2021-10-05”.
select pro_id,pro_name from product join supplier_pricing using(pro_id) join orders using (pricing_id) where ord_date > '2021-10-05';

Display customer name and gender whose names start or end with character 'A'.
select cus_name,cus_gender from customer where cus_name like '%A' or cus_name like'A%';

**Create a stored procedure to display supplier id, name, Rating(Average rating of all the products sold by every customer) and
Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average
Service” else print “Poor Service”. Note that there should be one rating per supplier.
DELIMITER //
CREATE PROCEDURE SERVICETYPE() 
BEGIN
	SELECT 
		SUPPLIER.SUPP_ID,
		SUPPLIER.SUPP_NAME,
		AVG(RATING.RAT_RATSTARS) AS RATING,
		CASE
			WHEN AVG(RATING.RAT_RATSTARS) >= 5 THEN 'Excellent Service'
			WHEN AVG(RATING.RAT_RATSTARS) >= 4 THEN 'Good Service'
			WHEN AVG(RATING.RAT_RATSTARS) >= 2 THEN 'Average Service'
			WHEN AVG(RATING.RAT_RATSTARS) < 2 THEN 'Poor Service'
		END AS TYPEOFSERVICE
	FROM 
		SUPPLIER
		JOIN SUPPLIER_PRICING ON SUPPLIER.SUPP_ID = SUPPLIER_PRICING.SUPP_ID
		JOIN ORDERS ON SUPPLIER_PRICING.PRICING_ID = ORDERS.PRICING_ID
		JOIN RATING ON ORDERS.ORD_ID = RATING.ORD_ID
	GROUP BY SUPPLIER.SUPP_ID
	ORDER BY SUPPLIER.SUPP_ID;