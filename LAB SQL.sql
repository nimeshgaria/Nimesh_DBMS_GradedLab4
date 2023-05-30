Create database ecommerce;
use ecommerce;


Create table supplier( SUPP_ID int unsigned primary key auto_increment, SUPP_NAME varchar(50) NOT NULL, SUPP_CITY varchar(50) NOT NULL, SUPP_PHONE varchar(50) NOT NULL );
describe supplier;

 Create table customer( CUS_ID int unsigned primary key auto_increment, CUS_NAME varchar(20) NOT NULL, CUS_PHONE varchar(10) NOT NULL, CUS_CITY varchar(10) NOT NULL, CUS_GENDER enum('M','F') NOT NULL );
 describe customer;
 
 Create table category(cat_id int unsigned primary key auto_increment, cat_name varchar(20) NOT NULL );
 Describe category;
 
 Create table product( PROD_ID int unsigned primary key auto_increment, pro_name varchar(20) NOT NULL, pro_desc varchar(60) NOT NULL, cat_id int unsigned, foreign key( cat_id)references category(cat_id));
 ALTER TABLE product MODIFY  pro_desc varchar(60) not null;
 describe product;
 
 Create table supplier_pricing( pricing_id int unsigned primary key AUTO_INCREMENT, PRO_ID int unsigned, foreign key(PRO_ID) references product(PROD_ID), SUPP_ID int unsigned,foreign key(SUPP_ID) references supplier(SUPP_ID), SUPP_PRICE int default 0);
 describe supplier_pricing;
 
 Create table orders_table( order_id int unsigned primary key auto_increment,
amount int unsigned not null,
order_date date not null,
cus_id int unsigned,foreign key(cus_id) references customer(cus_id),
pricing_id int unsigned, foreign key(pricing_id) references supplier_pricing(pricing_id));
describe orders_table;

create table rating(rat_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
ORD_ID INT unsigned, FOREIGN KEY(ORD_ID) REFERENCES orders_table(order_id),
RAT_RATSTARTS INT NOT NULL);
describe rating;


INSERT INTO SUPPLIER(SUPP_ID , SUPP_NAME , SUPP_CITY, SUPP_PHONE) VALUES("1","Rajesh Retails","Delhi",'1234567890');
INSERT INTO SUPPLIER(SUPP_ID , SUPP_NAME , SUPP_CITY, SUPP_PHONE) VALUES(2,"Appario Ltd.","Mumbai",'2589631470');
INSERT INTO SUPPLIER(SUPP_ID , SUPP_NAME , SUPP_CITY, SUPP_PHONE)  VALUES(3,"Knome products","Banglore",'9785462315');
INSERT INTO SUPPLIER (SUPP_ID , SUPP_NAME , SUPP_CITY, SUPP_PHONE)VALUES(4,"Bansal Retails","Kochi",'8975463285');
INSERT INTO SUPPLIER (SUPP_ID , SUPP_NAME , SUPP_CITY, SUPP_PHONE) VALUES(5,"Mittal Ltd.","Lucknow",'7898456532');

INSERT INTO CUSTOMER VALUES(1,"AAKASH",'9999999999',"DELHI",'M');
INSERT INTO CUSTOMER VALUES(2,"AMAN",'9785463215',"NOIDA",'M');
INSERT INTO CUSTOMER VALUES(3,"NEHA",'9999999999',"MUMBAI",'F');
INSERT INTO CUSTOMER VALUES(4,"MEGHA",'9994562399',"KOLKATA",'F');
INSERT INTO CUSTOMER VALUES(5,"PULKIT",'7895999999',"LUCKNOW",'M');

INSERT INTO CATEGORY VALUES( 1,"BOOKS");
INSERT INTO CATEGORY VALUES(2,"GAMES");
INSERT INTO CATEGORY VALUES(3,"GROCERIES");
INSERT INTO CATEGORY VALUES (4,"ELECTRONICS");
INSERT INTO CATEGORY VALUES(5,"CLOTHES");

INSERT INTO PRODUCT VALUES(1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2);
INSERT INTO PRODUCT VALUES(2,"TSHIRT","SIZE-L with Black, Blue and White variations",5);
INSERT INTO PRODUCT VALUES(3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4);
INSERT INTO PRODUCT VALUES(4,"OATS","Highly Nutritious from Nestle",3);
INSERT INTO PRODUCT VALUES(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
INSERT INTO PRODUCT VALUES(6,"MILK","1L Toned MIlk",3);
INSERT INTO PRODUCT VALUES(7,"Boat EarPhones","1.5Meter long Dolby Atmos",4);
INSERT INTO PRODUCT VALUES(8,"Jeans","Stretchable Denim Jeans with various sizes and color",5);
INSERT INTO PRODUCT VALUES(9,"Project IGI","compatible with windows 7 and above",2);
INSERT INTO PRODUCT VALUES(10,"Hoodie","Black GUCCI for 13 yrs and above",5);
INSERT INTO PRODUCT VALUES(11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
INSERT INTO PRODUCT VALUES(12,"Train Your Brain","By Shireen Stephen",1);



INSERT INTO SUPPLIER_PRICING VALUES(1,1,2,1500);
INSERT INTO SUPPLIER_PRICING VALUES(2,3,5,30000);
INSERT INTO SUPPLIER_PRICING VALUES(3,5,1,3000);
INSERT INTO SUPPLIER_PRICING VALUES(4,2,3,2500);
INSERT INTO SUPPLIER_PRICING VALUES(5,4,1,1000);
INSERT INTO SUPPLIER_PRICING VALUES(6,12,2,780);
INSERT INTO SUPPLIER_PRICING VALUES(7,12,4,789);
INSERT INTO SUPPLIER_PRICING VALUES(8,3,1,31000);
INSERT INTO SUPPLIER_PRICING VALUES(9,1,5,1450);
INSERT INTO SUPPLIER_PRICING VALUES(10,4,2,999);
INSERT INTO SUPPLIER_PRICING VALUES(11,7,3,549);
INSERT INTO SUPPLIER_PRICING VALUES(12,7,4,529);
INSERT INTO SUPPLIER_PRICING VALUES(13,6,2,105);
INSERT INTO SUPPLIER_PRICING VALUES(14,6,1,99);
INSERT INTO SUPPLIER_PRICING VALUES(15,2,5,2999);
INSERT INTO SUPPLIER_PRICING VALUES(16,5,2,2999);

INSERT INTO orders_table VALUES (101,1500,"2021-10-06",2,1);
INSERT INTO orders_table VALUES(102,1000,"2021-10-12",3,5);
INSERT INTO orders_table VALUES(103,30000,"2021-09-16",5,2);
INSERT INTO orders_table VALUES(104,1500,"2021-10-05",1,1);
INSERT INTO orders_table VALUES(105,3000,"2021-08-16",4,3);
INSERT INTO orders_table VALUES(106,1450,"2021-08-18",1,9);
INSERT INTO orders_table VALUES(107,789,"2021-09-01",3,7);
INSERT INTO orders_table VALUES(108,780,"2021-09-07",5,6);
INSERT INTO orders_table VALUES(109,3000,"2021-09-10",5,3);
INSERT INTO orders_table VALUES(110,2500,"2021-09-10",2,4);
INSERT INTO orders_table VALUES(111,1000,"2021-09-15",4,5);
INSERT INTO orders_table VALUES(112,789,"2021-09-16",4,7);
INSERT INTO orders_table VALUES(113,31000,"2021-09-16",1,8);
INSERT INTO orders_table VALUES(114,1000,"2021-09-16",3,5);
INSERT INTO orders_table VALUES(115,3000,"2021-09-16",5,3);
INSERT INTO orders_table VALUES(116,99,"2021-09-17",2,14);

INSERT INTO RATING VALUES(1,101,4);
INSERT INTO RATING VALUES(2,102,3);
INSERT INTO RATING VALUES(3,103,1);
INSERT INTO RATING VALUES(4,104,2);
INSERT INTO RATING VALUES(5,105,4);
INSERT INTO RATING VALUES(6,106,3);
INSERT INTO RATING VALUES(7,107,4);
INSERT INTO RATING VALUES(8,108,4);
INSERT INTO RATING VALUES(9,109,3);
INSERT INTO RATING VALUES(10,110,5);
INSERT INTO RATING VALUES(11,111,3);
INSERT INTO RATING VALUES(12,112,4);
INSERT INTO RATING VALUES(13,113,2);
INSERT INTO RATING VALUES(14,114,1);
INSERT INTO RATING VALUES(15,115,1);
INSERT INTO RATING VALUES(16,116,0);


/*	Display the total number of customers based on gender who have placed individual orders of worth at least Rs.3000
*/

SELECT cus_gender, COUNT(DISTINCT customer.cus_id) as TotalCustomers
FROM customer
JOIN orders ON customer.cus_id = orders.cus_id
WHERE orders.amount>= 3000
GROUP BY cus_gender; 

/*
Display all the orders along with product name ordered by a customer having Customer_Id=2
not ok 
 */
select cus_name, cus_city, o.AMOUNT, o.pricing_id, s.PROD_ID, p.PRO_NAME, p.PRO_DESC
   from customer inner join orders as o 
     on customer.cus_id=o.CUS_ID 
     inner join supplier_pricing as s
       on o.PRICING_ID = s.PRICING_ID
     inner join product as p
       on s.PROD_ID=p.PROD_ID
     and customer.cus_id=2;

/* Display the Supplier details of who is supplying more than one product
Working
*/
select s.supp_name, count(p.PRO_NAME) as num_of_products from supplier as s inner join supplier_pricing as sp on s.SUPP_ID=sp.SUPP_ID
        inner join product as p on sp.PRO_ID=p.PROD_ID
        group by s.SUPP_NAME
        having num_of_products > 1;
        
        /* Display the Id and Name of the Product ordered after “2021-10-05”.
        working
        */

select c.cus_name, o.amount, o.order_date, p.pro_name, p.PRO_DESC  from orders as o inner join supplier_pricing as sp 
         on o.PRICING_ID=sp.PRICING_ID
     inner join product as p on sp.pro_id=p.PROD_ID   
     inner join customer as c
       on o.CUS_ID=c.cus_id
    where o.ORDER_DATE > "2021-09-01"  

/* 9)	Display customer name and gender whose names start or end with character 'A'.
OK */
SELECT customer.cus_name,customer.cus_gender from customer where customer.cus_name like 'A%' or customer.cus_name like '%A'   




