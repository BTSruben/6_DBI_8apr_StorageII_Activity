CREATE DATABASE bdi_storage;

CREATE TABLE CUSTOMER (

        customer_num SERIAL not null PRIMARY KEY,
        first_name VARCHAR(40),
        last_name VARCHAR(40),
        email   VARCHAR(40),
        address VARCHAR(40),
        city VARCHAR(40),
        state VARCHAR(40),
        zipcode VARCHAR(40)
    );

CREATE TABLE SALE (

    sale_id SERIAL not null PRIMARY KEY,
    sale_date VARCHAR(20),
    amount  VARCHAR(20),
    customer_id int REFERENCES CUSTOMER(customer_num)
);



INSERT INTO CUSTOMER (first_name,last_name,email,address,city,state,zipcode) VALUES ('George','Washington','gwashington@usa.gov','3200 Mt Vernon Hwy','Mount Vernon','VA','22121');
INSERT INTO CUSTOMER (first_name,last_name,email,address,city,state,zipcode) VALUES ('John','Adams','jadams@usa.gov','1250 Hancock St','Quincy','MA','02169');
INSERT INTO CUSTOMER (first_name,last_name,email,address,city,state,zipcode) VALUES ('Thomas','Jefferson','tjefferson@usa.gov','931 Thomas Jefferson Pkwy','Charlottesville','VA','22902');
INSERT INTO CUSTOMER (first_name,last_name,email,address,city,state,zipcode) VALUES ('James','Madison','jmadison@usa.gov','11350 Constitution Hwy','Orange','VA','22960');
INSERT INTO CUSTOMER (first_name,last_name,email,address,city,state,zipcode) VALUES ('James','Monroe','jmonroe@usa.gov','2050 James Monroe Parkway','Charlottesville','VA','22902');

INSERT INTO SALE (sale_date,amount,customer_id) VALUES ('07/04/1776','234.56','1');
INSERT INTO SALE (sale_date,amount,customer_id) VALUES ('03/14/1760','78.50','3');
INSERT INTO SALE (sale_date,amount,customer_id) VALUES ('05/23/1784','124.00','2');
INSERT INTO SALE (sale_date,amount,customer_id) VALUES ('09/03/1790','65.50','3');
INSERT INTO SALE (sale_date,amount,customer_id) VALUES ('07/21/1795','25.50',null);
INSERT INTO SALE (sale_date,amount,customer_id) VALUES ('11/27/1787','14.40',null);

''' left join shows all info from first table with any matching from the second one'''


select first_name, last_name, sale_date, amount from customer c left join sale s on c.customer_num = s.customer_id;

 first_name | last_name  | sale_date  | amount
------------+------------+------------+--------
 George     | Washington | 07/04/1776 | 234.56
 Thomas     | Jefferson  | 03/14/1760 | 78.50
 John       | Adams      | 05/23/1784 | 124.00
 Thomas     | Jefferson  | 09/03/1790 | 65.50
 James      | Monroe     |            |
 James      | Madison    |            |
(6 rows)


select first_name, last_name, sale_date, amount from customer c left join sale s on c.customer_num = s.customer_id where sale_date is NULL;;
 first_name | last_name | sale_date | amount
------------+-----------+-----------+--------
 James      | Monroe    |           |
 James      | Madison   |           |


''' inner join  shows customer and his sale info returning an intersection of the two tables'''

select first_name, last_name, sale_date, amount from customer c inner join sale s on c.customer_num = s.customer_id;

 first_name | last_name  | sale_date  | amount 
------------+------------+------------+--------
 George     | Washington | 07/04/1776 | 234.56
 Thomas     | Jefferson  | 03/14/1760 | 78.50
 John       | Adams      | 05/23/1784 | 124.00
 Thomas     | Jefferson  | 09/03/1790 | 65.50
(4 rows)

''' right join shows all info form second table with any matching from the second one '''

select first_name, last_name, sale_date, amount from customer c right join sale s on c.customer_num = s.customer_id;

 first_name | last_name  | sale_date  | amount
------------+------------+------------+--------
 George     | Washington | 07/04/1776 | 234.56
 Thomas     | Jefferson  | 03/14/1760 | 78.50
 John       | Adams      | 05/23/1784 | 124.00
 Thomas     | Jefferson  | 09/03/1790 | 65.50
            |            | 07/21/1795 | 25.50
            |            | 11/27/1787 | 14.40


select first_name, last_name, sale_date, amount from customer c right join sale s on c.customer_num = s.customer_id where first_name is NULL;

 first_name | last_name | sale_date  | amount
------------+-----------+------------+--------
            |           | 07/21/1795 | 25.50
            |           | 11/27/1787 | 14.40


''' full join '''

select first_name, last_name, sale_date, amount from customer c full outer join sale s on c.customer_num = s.customer_id;

 first_name | last_name  | sale_date  | amount
------------+------------+------------+--------
 George     | Washington | 07/04/1776 | 234.56
 Thomas     | Jefferson  | 03/14/1760 | 78.50
 John       | Adams      | 05/23/1784 | 124.00
 Thomas     | Jefferson  | 09/03/1790 | 65.50
            |            | 07/21/1795 | 25.50
            |            | 11/27/1787 | 14.40
 James      | Monroe     |            |
 James      | Madison    |            |


select first_name, last_name, sale_date, amount from customer c full outer join sale s on c.customer_num = s.customer_id where c.customer_num is null or s.customer_id is null;
 first_name | last_name | sale_date  | amount 
------------+-----------+------------+--------
            |           | 07/21/1795 | 25.50
            |           | 11/27/1787 | 14.40
 James      | Monroe    |            | 
 James      | Madison   |            | 
