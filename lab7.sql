--Lab work 7
--Issayev Zhassulan
--1.
-- Large objects (photos, videos, CAD files, etc.) are stored as a large object:
-- a)blob: binary large object -- object is a large collection of uninterpreted
-- binary data (whose interpretation is left to an application outside of the database system)
-- b) clob: character large object -- object is a large collection of character data
-- When a query returns a large object, a pointer is returned rather than the large object itself.

--2. What is the difference between privilege, role and user?
--GRANT — define access privileges
--CREATE ROLE — define a new database role
--CREATE USER — define a new database role. CREATE USER is now an alias for CREATE ROLE. The only difference is that when
-- the command is spelled CREATE USER, LOGIN is assumed by default, whereas NOLOGIN is assumed when the command is spelled CREATE ROLE.
--a) create accountant, administrator, support roles and grant appropriate privileges
CREATE Role accountant   WITH login
CREATE ROLE administrator  WITH ADMIN postgres
CREATE Role support  WITH login

GRANT SELECT , INSERT , UPDATE , DELETE , TRUNCATE , REFERENCES , TRIGGER
    ON TABLE  transactions,customers
    TO GROUP  accountant  WITH GRANT OPTION
    --GRANTED BY  GROUP  accountant

GRANT SELECT , INSERT , UPDATE , DELETE , TRUNCATE , REFERENCES , TRIGGER
    ON TABLE  accounts
    TO GROUP  support  WITH GRANT OPTION

--b) create some users and assign them roles
CREATE USER Zhasik WITH ROLE administrator
CREATE USER Dimash WITH ROLE support
CREATE USER Darkhan WITH ROLE accountant

--c)give to some of them permission to grant roles to other users
Alter user Darkhan WITH CREATEDB CREATEROLE
Alter user Zhasik WITH CREATEDB CREATEROLE
Alter user Dimash WITH CREATEDB CREATEROLE

--d)revoke some privilege from particular user
REVOKE GRANT OPTION FOR SELECT ON accounts FROM dimash

--3.Add appropriate constraints
--b) add not null constraints
ALTER TABLE accounts ALTER COLUMN customer_id SET NOT NULL;

--5.Create indexes:
--a)index so that each customer can only have one account of one currency
CREATE UNIQUE INDEX index_
ON accounts (currency,customer_id)

--b)index for searching transactions by currency and balance
CREATE INDEX index2
ON transactions (src_account, dst_account)

--6. Write a SQL transaction that illustrates money transaction from oneaccount to another:
--a)create transaction with “init” status
-- start a transaction
BEGIN;
UPDATE accounts SET balance = balance - 100.00
    WHERE account_id = 'AB10203';
SAVEPOINT my_savepoint;
UPDATE accounts SET balance = balance + 100.00
    WHERE account_id = 'DK12000';
--not correct currency
ROLLBACK TO my_savepoint;
UPDATE accounts SET balance = balance + 100.00
    WHERE account_id = 'NK90123';
SELECT account_id,customer_id,balance
    from accounts
--COMMIT;