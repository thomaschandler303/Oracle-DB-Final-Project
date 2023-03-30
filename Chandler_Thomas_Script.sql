
DROP VIEW tl_basketitem_vu;
DROP VIEW tl_shpbas_vu;
DROP TABLE exp_prod;
DROP TABLE tl_product CASCADE CONSTRAINTS;
DROP TABLE tl_product_request CASCADE CONSTRAINTS;
DROP TABLE tl_customer CASCADE CONSTRAINTS;
DROP TABLE tl_productoption CASCADE CONSTRAINTS;
DROP TABLE tl_productoptiondetail CASCADE CONSTRAINTS;
DROP TABLE tl_tax CASCADE CONSTRAINTS;
DROP TABLE tl_basket CASCADE CONSTRAINTS;
DROP TABLE tl_basketitem CASCADE CONSTRAINTS;
DROP SEQUENCE tl_customer_seq;
DROP SEQUENCE tl_idBasketitem_seq;
DROP SEQUENCE tl_prodid_seq;
DROP SEQUENCE tl_poption_seq;
DROP SEQUENCE tl_idbasket_seq;



























/* create tables with unique constraints #17 and insert data #3 */
CREATE TABLE tl_product (
	idProduct number(2) ,
	ProductName varchar2(25) ,
	Description varchar2(100) ,
	Price number(6,2),
	 CONSTRAINT prod_id_pk2 PRIMARY KEY(idProduct));

insert into tl_product(idProduct, ProductName, Description, Price) 
  values(1, 'Strawberry', 'Strawberry flavored ice cream', 5.00);

insert into tl_product(idproduct, productname, description, price)
  values(2, 'Vanilla', 'Vanilla flavored ice cream', 4.00);

insert into tl_product(idproduct, productname, description, price)
  values(3, 'Chocolate', 'Chocolate flavored ice cream', 5.00);

insert into tl_product(idproduct, productname, description, price)
  values(4, 'Butter Pecan', 'Vanilla and butter flavored ice cream with roasted pecans', 6.00);

insert into tl_product(idproduct, productname, description, price)
  values(5, 'Cookies and Cream', 'Vanilla ice cream with Oreo cookies', 6.00);

insert into tl_product(idproduct, productname, description, price)
  values(6, 'Mint Chocolate Chip', 'Mint flavored ice cream with chocolate chips', 7.00);

insert into tl_product(idproduct, productname, description, price)
  values(7, 'Cookie Dough', 'Vanilla ice cream mixed with cookie dough', 7.00);

insert into tl_product(idproduct, productname, description, price)
  values(8, 'Coffee', 'Coffee flavored ice cream', 7.00);

insert into tl_product(idproduct, productname, description, price)
  values(9, 'Rocky Road', 'Chocolate flavored ice cream with bits of almond and marshmallow', 8.00);

insert into tl_product(idproduct, productname, description, price)
  values(10, 'Neapolitan', 'Vanilla, chocolate, and strawberry flavored ice cream', 6.00);

/* use sequence for primary keys #19 */
CREATE SEQUENCE tl_prodid_seq start with 15;


CREATE TABLE tl_Product_request 
  (idRequest NUMBER(4),
   idproduct number(2),
   dtrequest DATE DEFAULT SYSDATE,
   dtrecd DATE,
   cost number(6,2),
   qty number(3),
   idvendor number(3),
     CONSTRAINT prodreq_id_pk2 PRIMARY KEY (idrequest),
     CONSTRAINT prodreq_idprod_fk2 FOREIGN KEY (idProduct)
                     REFERENCES tl_product (idproduct) );




CREATE TABLE tl_customer (
	idcustomer number(4),
	FirstName varchar2(15),
	LastName varchar2(20),
	Address varchar2(40),
	City varchar2(20),
	State char(2),
	ZipCode varchar2(15),
	Phone varchar2(10),
	Email varchar2(25),
	UserName varchar2(25),
	Password varchar2(25),
	dtEntered date DEFAULT SYSDATE,
	Country varchar2(15),
	CONSTRAINT customer_id_pk2 PRIMARY KEY(idcustomer) );
create sequence tl_customer_seq
  start with 10;


insert into tl_customer
    values (1, 'John', 'Smith', '21 Maple St.', 'Lenexa',
            'KS','64083', '8164317701', 'jsmith43@msn.com', 'jsmith43',
            'ilovecats123', '13-JAN-2012', 'USA');
insert into tl_customer
    values (2, 'Margaret', 'Johnson', '287 Rodeo Drive', 'Lawrence',
            'KS','64012', '8164216559', 'MargJ@yahoo.com', 'MaryJ68',
            'redvelvet123','03-FEB-2012', 'USA');
insert into tl_customer
    values (3, 'Kenny', 'Keller', '1 Sunnyvale Lane', 'Raytown',
            'MO','64133', '8165680902', 'ratboy@aol.net', 'thekelman55',
            'chiefsfan97', '26-JAN-2012', 'USA');
insert into tl_customer
    values (4, 'Cameron', 'Marquart', '162 Washington St.', 'Independence',
            'MO','64050', '8165556868', 'cammar77@xfinity.net', 'cammar77',
            'bluethunder21', '19-MAR-2012', 'USA');
insert into tl_customer
    values (5, 'Scott', 'Summers', '11 Bristol St.', 'Lees Summit',
            'MO','64086', '8168221010', 'scott134@umkc.edu', 'summers67',
            'cyclopsguy5', '19-FEB-2012', 'USA');
insert into tl_customer
    values (6, 'Monica', 'Vanderpool', '112 Knollbrook Lane', 'Pleasant Hill',
            'MO','64080', '8163217384', 'mvanderpoo@compuserve.net', 'mvanderpool88',
            'nemo', '09-FEB-2012', 'USA');
insert into tl_customer
    values (7, 'Pete', 'Long', '1683 Bridgeport Drive', 'Grandview',
            'KS','64030', '8163217384', 'thepete00@charter.net', 'petelong92',
            'greenmonster23', '14-FEB-2012', 'USA');


CREATE TABLE tl_productoption (
	idProductoption number(3),
	idoption number(2),
	idProduct number(2),
	CONSTRAINT prodattr_id_pk2 PRIMARY KEY (idProductoption),
        CONSTRAINT prodopt_prodid_fk2 FOREIGN KEY(idProduct) REFERENCES tl_product(idProduct) );
create sequence tl_poption_seq
  start with 30;

    
CREATE TABLE tl_ProductOptionDetail (
	idoption number(2),
	OptionName varchar2(25),
	CONSTRAINT prodoptdet_id_pk2 PRIMARY KEY (idOption));

insert into tl_ProductOptionDetail(idOption, OptionName) values(1,'6 ounce');
insert into tl_ProductOptionDetail(idOption, OptionName) values(2,'9 ounce');
insert into tl_ProductOptionDetail(idOption, OptionName) values(3,'12 ounce');
insert into tl_ProductOptionDetail(idOption, OptionName) values(4,'16 ounce');

insert into tl_ProductOption(idProductOption, idOption, idProduct) values(1, 1, 1);
insert into tl_ProductOption(idProductOption, idOption, idProduct) values(2, 2, 1);
insert into tl_ProductOption(idProductOption, idOption, idProduct) values(3, 3, 1);
insert into tl_ProductOption(idProductOption, idOption, idProduct) values(4, 4, 1);
insert into tl_ProductOption(idProductOption, idOption, idProduct) values(5, 1, 2);
insert into tl_ProductOption(idProductOption, idOption, idProduct) values(6, 2, 2);
insert into tl_ProductOption(idProductOption, idOption, idProduct) values(7, 3, 2);
insert into tl_ProductOption(idProductOption, idOption, idProduct) values(8, 4, 2);
insert into tl_ProductOption(idProductOption, idOption, idProduct) values(9, 1, 3);
insert into tl_ProductOption(idProductOption, idOption, idProduct) values(10, 2, 3);
insert into tl_ProductOption(idProductOption, idOption, idProduct) values(11, 3, 3);
insert into tl_ProductOption(idProductOption, idOption, idProduct) values(12, 4, 3);
insert into tl_ProductOption(idProductOption, idOption, idProduct) values(13, 1, 4);
insert into tl_ProductOption(idProductOption, idOption, idProduct) values(14, 2, 4);
insert into tl_ProductOption(idProductOption, idOption, idProduct) values(15, 3, 4);
insert into tl_ProductOption(idProductOption, idOption, idProduct) values(16, 4, 4);
insert into tl_ProductOption(idProductOption, idOption, idProduct) values(17, 1, 5);
insert into tl_ProductOption(idProductOption, idOption, idProduct) values(18, 2, 5);
insert into tl_ProductOption(idProductOption, idOption, idProduct) values(19, 3, 5);
insert into tl_ProductOption(idProductOption, idOption, idProduct) values(20, 4, 5);
insert into tl_ProductOption(idProductOption, idOption, idProduct) values(21, 1, 6);
insert into tl_ProductOption(idProductOption, idOption, idProduct) values(22, 2, 6);
insert into tl_ProductOption(idProductOption, idOption, idProduct) values(23, 3, 6);
insert into tl_ProductOption(idProductOption, idOption, idProduct) values(24, 4, 6);
insert into tl_ProductOption(idProductOption, idOption, idProduct) values(25, 1, 7);
insert into tl_ProductOption(idProductOption, idOption, idProduct) values(26, 2, 7);
insert into tl_ProductOption(idProductOption, idOption, idProduct) values(27, 3, 7);
insert into tl_ProductOption(idProductOption, idOption, idProduct) values(28, 4, 7);
insert into tl_ProductOption(idProductOption, idOption, idProduct) values(29, 1, 8);
insert into tl_ProductOption(idProductOption, idOption, idProduct) values(30, 2, 8);
insert into tl_ProductOption(idProductOption, idOption, idProduct) values(31, 3, 8);
insert into tl_ProductOption(idProductOption, idOption, idProduct) values(32, 4, 8);
insert into tl_ProductOption(idProductOption, idOption, idProduct) values(33, 1, 9);
insert into tl_ProductOption(idProductOption, idOption, idProduct) values(34, 2, 9);
insert into tl_ProductOption(idProductOption, idOption, idProduct) values(35, 3, 9);
insert into tl_ProductOption(idProductOption, idOption, idProduct) values(36, 4, 9);
insert into tl_ProductOption(idProductOption, idOption, idProduct) values(37, 1, 10);
insert into tl_ProductOption(idProductOption, idOption, idProduct) values(38, 2, 10);
insert into tl_ProductOption(idProductOption, idOption, idProduct) values(39, 3, 10);
insert into tl_ProductOption(idProductOption, idOption, idProduct) values(40, 4, 10);


CREATE TABLE tl_basket (
	idBasket number(5),
	Quantity number(2),
	idcustomer number(4),
	SubTotal number(7,2),
	Total number(7,2),
	Tax number(5,2),
	BillFirstName varchar2(10),
	BillLastName varchar2(20),
	BillAddress varchar2(40),
	BillCity varchar2(20),
	BillState varchar2(2),
	BillZipCode varchar2(15),
	dtOrdered date DEFAULT SYSDATE,
	BillCountry varchar2(20),
	CardNumber varchar2(20) ,
	ExpMonth char(2),
        ExpYear char(4),
	CardName varchar2(25),
        CONSTRAINT bskt_id_pk2 PRIMARY KEY(idBasket),
         CONSTRAINT bskt_idcustomer_fk2 FOREIGN KEY (idcustomer)
           REFERENCES tl_customer(idcustomer) );
           
Create sequence tl_idBasket_seq
   start with 25;

insert into tl_basket (idbasket, quantity, idcustomer, subtotal, total, tax, dtordered)
    values (3, 2, 1, 12.00, 12.96, .96, '23-OCT-2022');
insert into tl_basket (idbasket, quantity, idcustomer, subtotal, total, tax, dtordered)
    values (4, 4, 2, 26.00, 28.08, 2.08, '25-OCT-2022');
insert into tl_basket (idbasket, quantity, idcustomer, subtotal, total, tax, dtordered)
    values (5, 1, 3, 7.00, 7.49, .49, '26-OCT-2022');
insert into tl_basket (idbasket, quantity, idcustomer, subtotal, total, tax, dtordered)
    values (6, 3, 4, 18.00, 19.26, 1.26, '27-OCT-2022');
insert into tl_basket (idbasket, quantity, idcustomer, subtotal, total, tax, dtordered)
    values (7, 2, 5, 12.00, 12.84, .84, '28-OCT-2022');
insert into tl_basket (idbasket, quantity, idcustomer, subtotal, total, tax, dtordered)
    values (8, 1, 6, 5.00, 5.35, .35, '29-OCT-2022');
insert into tl_basket (idbasket, quantity, idcustomer, subtotal, total, tax, dtordered)
    values (9, 3, 7, 23.00, 24.84, 1.84, '30-OCT-2022');

CREATE TABLE tl_basketItem (
	idBasketItem number(2),
	idProduct number(2),
	Price number(6,2),
	Quantity number(2),
	idBasket number(5) ,
	CONSTRAINT bsktitem_id_pk2 PRIMARY KEY (idBasketItem),
        CONSTRAINT bsktitem_bsktid_fk2 FOREIGN KEY (idBasket) 
          REFERENCES tl_Basket(idBasket),
        CONSTRAINT bsktitem_idprod_fk2 FOREIGN KEY (idproduct) 
          REFERENCES tl_Product(idproduct) );

Create sequence tl_idBasketitem_seq
  start with 50;

insert into tl_basketitem
      values (15, 4, 6.00, 2, 3);
insert into tl_basketitem
      values (16, 4, 6.00, 2, 4);
insert into tl_basketitem
      values (17, 6, 7.00, 2, 4);
insert into tl_basketitem
      values (18, 7, 7.00, 1, 5);
insert into tl_basketitem
      values (19, 5, 6.00, 3, 6);
insert into tl_basketitem
      values (20, 4, 6.00, 2, 7);
insert into tl_basketitem
      values (21, 5, 6.00, 2, 7);
insert into tl_basketitem
      values (22, 1, 5.00, 1, 8);
insert into tl_basketitem
      values (23, 9, 8.00, 2, 9);
insert into tl_basketitem
      values (24, 8, 7.00, 1, 9);

CREATE TABLE tl_Tax (
	idState NUMBER(2),
	State char(2),
	TaxRate NUMBER(4,3),
	CONSTRAINT tax_idstate_pk2 PRIMARY KEY(idState) ); 
INSERT INTO tl_tax VALUES(1,'MO',.07);
INSERT INTO tl_tax VALUES(2,'KS',.08);

COMMIT;

/*create view #4 */
create view tl_basketitem_vu as
   select * from tl_basketitem;
   
select * from tl_basketitem_vu;

/*Use date function #7 and create second view #4 */
CREATE OR REPLACE VIEW tl_shpbas_vu as
SELECT tl.idbasket, t.idcustomer, TO_CHAR(tl.dtordered, 'Month DD, YYYY') as dtorder
    FROM tl_customer t, tl_basket tl
            WHERE t.idcustomer = tl.idcustomer;
          
select * from tl_shpbas_vu;  

/* Use number function #6 and GROUP BY and HAVING #9 and INNER JOIN #11 */
SELECT DISTINCT idProduct, sum(t.quantity)
    FROM tl_basket inner JOIN tl_basketitem t
        USING (idbasket)
            WHERE idproduct = 4
                GROUP BY idproduct
                    HAVING count(*) > 3
                        ORDER BY idproduct;
          
/* Use second number function #6 and subquery #10 */
SELECT idproduct, productname, price
    FROM tl_product
        WHERE price > (SELECT AVG(PRICE) FROM tl_PRODUCT);
        
/* create a table from another table #16 */
CREATE TABLE exp_prod
AS (SELECT *
    FROM tl_product
    WHERE price > 6.00);

/* create an index for a foreign key for the new table to avoid locks should multiple users need to update table #18 */
CREATE INDEX exp_prod_id on exp_prod (idproduct);








/* create procedure #7  and use control structure (if) #2 */
CREATE OR REPLACE PROCEDURE TAX_COST_SP
    (p_state IN tl_tax.state%TYPE,
    p_total IN NUMBER,
    p_tax OUT NUMBER)
    IS
    BEGIN
        IF p_state = 'MO' THEN p_tax := p_total * .07;
        ELSIF p_state = 'KS' THEN p_tax := p_total * .08;
        END IF;
    END;
/
/* create procedure #7 */
CREATE OR REPLACE PROCEDURE PROD_ADD_SP
    (p_prod_name IN tl_product.productname%TYPE,
    p_descrip IN tl_product.description%TYPE,
    p_price IN tl_product.price%TYPE)
    IS
    BEGIN
        INSERT INTO tl_product (idproduct, productname, description, price)
        VALUES (11, p_prod_name, p_descrip, p_price);
        COMMIT;
    END;

/

/* create user defined function #6 */
CREATE OR REPLACE FUNCTION DAY_ORD_SF
    (p_date in date)
    RETURN VARCHAR2
IS
    
    lv_day VARCHAR2(15);
BEGIN
    lv_day := TO_CHAR(p_date, 'DAY');
    RETURN lv_day;
END;
/
/* create package #8  and function #6 and exception handler #4 */
create or replace function user_login
  (usernm in varchar2,
   passwd in varchar2)
   return char
  is
   temp_user tl_customer.username%type;
   confirm char(1) := 'N';

begin 
  select username
    into temp_user
  from tl_customer
  where password = passwd;
  
  confirm := 'Y';
  return confirm;

exception  
  WHEN NO_DATA_FOUND THEN
     DBMS_OUTPUT.PUT_LINE('logon values are invalid');

end;
/
create or replace package login_pckg is
  function user_login
  (usernm in varchar2,
   passwd in varchar2)
   return char;
end;
/
create or replace package body login_pckg is

  function user_login
    (usernm in varchar2,  
     passwd in varchar2)
     return char
    is
     temp_user tl_customer.username%type;
     confirm char(1) := 'N';
    
  begin
    select username
      into temp_user
    from tl_customer
    where password = passwd;
  
    confirm := 'Y';
    return confirm;
    
  exception
  WHEN NO_DATA_FOUND THEN
     DBMS_OUTPUT.PUT_LINE('logon values are invalid');
     
  end user_login;

end;


/* Test script
declare
    lv_tax NUMBER;
begin
    tax_cost_sp('MO', 21, lv_tax);
    prod_add_sp('Orange Sherbet','Fruit flavored ice cream', 4);
    dbms_output.put_line(lv_tax);
    select * from tl_product;
end;

select idbasket, quantity, day_ord_sf(dtordered) as "day"
from tl_basket;

declare
    lv_user CHAR(1);
begin
    lv_user := user_login('jsmith43', 'ilovecats123');
    dbms_output.put_line(lv_user);
end;
*/

























