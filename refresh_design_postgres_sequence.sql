-- REFERENCE
-- https://code.tutsplus.com/articles/sql-for-beginners-part-3-database-relationships--net-8561
-- https://www.tutorialspoint.com/postgresql/postgresql_using_autoincrement.htm


-- CREATE SEQUENCE IN PGADMIN is creating only design, BUT NOT TABLE

CREATE TABLE customers (
    CUSTOMER_ID SERIAL PRIMARY KEY,
    CUSTOMER_NAME VARCHAR(80)
)
-- ONE TO MANY (customers(one) and orders(many))

CREATE TABLE orders (
    ORDER_ID SERIAL PRIMARY KEY NOT NULL,
    CUSTOMER_ID INT,
    AMOUNT DOUBLE PRECISION,
    FOREIGN KEY (CUSTOMER_ID) REFERENCES customers(CUSTOMER_ID)
)

-- add new colum to specific table
ALTER TABLE orders ADD COLUMN date_order DATE NOT NULL;

-- GET TIME NOW DATE
SELECT CURRENT_TIME;
SELECT CURRENT_DATE;
SELECT CURRENT_TIMESTAMP;

-- insert in pgadmin query
INSERT INTO customers(CUSTOMER_NAME) values 
('ron'), ('jean');

INSERT INTO orders(CUSTOMER_ID, AMOUNT, date_order) values
(2, 5, CURRENT_DATE),
(1, 2, CURRENT_DATE);


-- RAISE EXCEPTION
do 
$$
begin
	INSERT INTO orders(CUSTOMER_ID, AMOUNT, date_order) values (4, 5, CURRENT_DATE);
	
	exception
		when no_data_found then
			raise exception 'stop transaction';
end;
$$
language plpgsql;

ERROR:  insert or update on table "orders" violates foreign key constraint "orders_customer_id_fkey"
DETAIL:  Key (customer_id)=(4) is not present in table "customers".
CONTEXT:  SQL statement "INSERT INTO orders(CUSTOMER_ID, AMOUNT, date_order) values (4, 5, CURRENT_DATE)"
PL/pgSQL function inline_code_block line 3 at SQL statement
SQL state: 23503
