--LAB WORK 8
--Issayev Zhassulan
--1. Create a function that:
--a) Increments given values by 1 and returns it.
CREATE FUNCTION add_em(x integer) RETURNS integer AS $$
    SELECT x + 1;
$$ LANGUAGE SQL;
SELECT add_em(1) AS answer;

--b)  Returns sum of 2 numbers.
CREATE FUNCTION add_elements(x integer, y integer) RETURNS integer AS $$
    SELECT x + y;
$$ LANGUAGE SQL;
SELECT add_elements(1, 2) AS answer;

--c) Returns true or false if numbers are divisible by 2.
CREATE OR REPLACE FUNCTION divisible(
a integer)
returns bool as $$
begin
    if a%2 = 0 then return true;
    else return false;
    end if;
end;
$$ LANGUAGE plpgsql;
Select divisible(4) as four,divisible(5) as five;

--d)Checks some password for validity.
CREATE OR REPLACE FUNCTION check_pass(s text)
returns bool as $$
    begin
if s = 'Aa123456' then return true;
else return false;
        end if;
end;
    $$ LANGUAGE plpgsql;
SELECT check_pass( 'Aa123456');

--e) Returns two outputs, but has one input.
CREATE OR REPLACE FUNCTION sq_cu(in x integer,out s varchar,out c varchar)
as $$
    begin s := x * x;
    c := x * x * x;
        end;
    $$ LANGUAGE plpgsql;
SELECT sq_cu(4);


--2.Create a trigger that:
--a) Return timestamp of the occured action within the database.
CREATE TABLE employees(
   id INT GENERATED ALWAYS AS IDENTITY,
   first_name VARCHAR(40) NOT NULL,
   last_name VARCHAR(40) NOT NULL,
   PRIMARY KEY(id)
);
CREATE TABLE employee_audits (
   id INT GENERATED ALWAYS AS IDENTITY,
   employee_id INT NOT NULL,
   last_name VARCHAR(40) NOT NULL,
   changed_on TIMESTAMP(6) NOT NULL
);
CREATE OR REPLACE FUNCTION log_last_name_changes()
  RETURNS TRIGGER
  LANGUAGE PLPGSQL
  AS
$$
BEGIN
	IF NEW.last_name <> OLD.last_name THEN
		 INSERT INTO employee_audits(employee_id,last_name,changed_on)
		 VALUES(OLD.id,OLD.last_name,now());
	END IF;

	RETURN NEW;
END;
$$;
CREATE TRIGGER last_name_changes
  BEFORE UPDATE
  ON employees
  FOR EACH ROW
  EXECUTE PROCEDURE log_last_name_changes();
INSERT INTO employees (first_name, last_name)
VALUES ('John', 'Doe');

INSERT INTO employees (first_name, last_name)
VALUES ('Lily', 'Bush');

UPDATE employees
SET last_name = 'Brown'
WHERE ID = 2;

SELECT * FROM employee_audits;

--b) Computes the age of a person when persons’ date of birth is inserted.
CREATE TABLE people(
   first_name VARCHAR(40) ,
   last_name VARCHAR(40) ,
   date_of_birth date,
    age INTEGER
);
CREATE OR REPLACE FUNCTION age_add()
  RETURNS TRIGGER
  AS
$$
BEGIN
    UPDATE people
    SET
        age = round((current_date - people.date_of_birth) / 365.25)
    WHERE
          first_name = new.first_name;
	RETURN NEW;
END;
$$LANGUAGE PLPGSQL;
CREATE TRIGGER in_age
  AFTER INSERT
  ON people
  FOR EACH ROW
  EXECUTE FUNCTION age_add();

INSERT INTO people (first_name,last_name,date_of_birth)
VALUES ('John', 'Doe','2002-10-25');

INSERT INTO people (first_name, last_name,date_of_birth)
VALUES ('Lily', 'Bush','2001-10-25');

SELECT * FROM people;

--c)Adds 12% tax on the price of the inserted item.
CREATE TABLE product(
   name VARCHAR(40) ,
   price int,
   with_tax int
);
CREATE OR REPLACE FUNCTION product_add()
  RETURNS TRIGGER
  AS
$$
BEGIN
    UPDATE product
    SET
        with_tax = price + (price * 0.12)
    WHERE
          name = new.name;
	RETURN NEW;
END;
$$LANGUAGE PLPGSQL;
CREATE TRIGGER in_age
  AFTER INSERT
  ON product
  FOR EACH ROW
  EXECUTE FUNCTION product_add();

INSERT INTO product (name,price)
VALUES ('potato',200);

INSERT INTO product (name, price)
VALUES ('apple',150);

SELECT * FROM product;

--d)Prevents deletion of any row from only one table.
CREATE OR REPLACE FUNCTION check_delete_row()
  RETURNS TRIGGER
  AS
$$
BEGIN
    RAISE EXCEPTION 'You cannot delete';
END
$$LANGUAGE PLPGSQL;
CREATE TRIGGER check_del
  BEFORE DELETE
  ON product
  FOR EACH ROW
  EXECUTE FUNCTION check_delete_row();

SELECT * FROM product;
DELETE from product where name = 'potato';

--e)  Launches functions 1.d and 1.e
create table user1(
  name varchar(255),
  password varchar(255),
  numb integer,
  sq_and_cu varchar(255),
  isValid boolean
);
CREATE OR replace FUNCTION pass_and_int() RETURNS trigger AS $emp_stamp$
    BEGIN
        new.isValid= check_pass(new.password);
        new.sq_and_cu = sq_cu(new.numb);
        RETURN NEW;
    END;
$emp_stamp$ LANGUAGE plpgsql;
CREATE TRIGGER pas_and_int BEFORE INSERT OR UPDATE ON user1
    FOR EACH ROW EXECUTE FUNCTION pass_and_int();
insert into user1(name, password, numb)
values ('Zhasik','Aa123456',4);
select * from user1;


--3.What is the difference between procedure and function?
--Differences between Stored Procedure and Function in SQL Server.
-- The procedure allows SELECT as well as DML(INSERT/UPDATE/DELETE)
-- statement in it whereas Function allows only SELECT statement in it.
-- Procedures cannot be utilized in a SELECT statement whereas Function
-- can be embedded in a SELECT statement.

--4.Create procedures that:
--a) Increases salary by 10% for every 2 years of work experience and provides 10% discount and after 5 years adds 1% to the discount.
CREATE TABLE people(
    id integer,
    name varchar,
    date_of_birth date,
    age integer,
    salary integer,
    workexperince integer,
    discount integer,
    primary key (id)
);
insert into people(id,name,date_of_birth,age,salary,workexperince,discount)
values(1,'John','1972-10-25',round((current_date - '1972-10-25') / 365.25),1000000,9,0);
insert into people(id,name,date_of_birth,age,salary,workexperince,discount)
values(2,'Fill','2000-10-25',round((current_date - '2000-10-25') / 365.25),1000000,6,0);

CREATE or REPLACE PROCEDURE example() AS $$
    BEGIN
        UPDATE people
        SET salary = (people.workexperince/2)*0.1*salary+salary,
            discount = 10
            where people.workexperince >= 2;
        UPDATE people
            set
            discount = people.discount+(people.workexperince/5)
                where people.workexperince >= 5;
        COMMIT;
    END;$$
LANGUAGE PLPGSQL;
call example();
select * from people;

--b) After reaching 40 years, increase salary by 15%. If work experience is more
--than 8 years, increase salary for 15% of the already increased value for work
--experience and provide a constant 20% discount.

create or replace procedure example2()
language plpgsql
as $$
begin
    update people
    set salary = people.salary*1.15
    where people.age >= 40;

    update people set discount = 20,
    salary = salary*1.15
    where people.workexperince >= 8 and people.age >= 40;

    commit;
end;$$;

call example2();
select * from people;

--5) Produce a CTE that can return the upward recommendation chain for any
--member. You should be able to select recommender from recommenders
--where member=x. Demonstrate it by getting the chains for members 12 and 22.
--Results table should have member and recommender, ordered by member
--ascending, recommender descending

create table members(
    memid integer,
    surname varchar(200),
    firstname varchar(200),
    address varchar(300),
    zipcode integer,
    telephone varchar(20),
    recommendedby integer,
    joindate timestamp
);
create table bookings(
    facid integer,
    memid integer,
    starttime timestamp,
    slots integer
);
create table facilities(
    facid integer,
    name varchar(200),
    membercost numeric,
    guestcost numeric,
    initialoutlay numeric,
    monthlymaintenance numeric
);
with recursive recommenders(recommender, member) as (
	select recommendedby, memid
		from members
	union all
	select mems.recommendedby, recs.member
		from recommenders recs
		inner join members mems
			on mems.memid = recs.recommender
)
select recs.member member, recs.recommender, mems.firstname, mems.surname
	from recommenders recs
	inner join members mems
		on recs.recommender = mems.memid
	where recs.member = 22 or recs.member = 12
order by recs.member ASC, recs.recommender desc;

--------------------------------------------------------
/**
drop function add_em(x integer);
drop function add_elements(x integer, y integer);
drop function divisible(integer);
drop function check_pass( text);
drop function sq_cu(in x integer,out s varchar,out c varchar);
drop table employees;
drop table employee_audits;
drop function log_last_name_changes();
drop table people;
drop function age_add();
drop table product;
drop function product_add();
drop function check_delete_row();
drop table user1;
drop function pass_and_int();
drop table people;
drop procedure example();
drop procedure example2();
drop table bookings;
drop table facilities;
drop table members;
**/