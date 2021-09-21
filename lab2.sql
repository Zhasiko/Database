/* Laborotory work 2
Issayev Zhassulan
  */
  --EX 1:

  /* 2.	DDL commands are CREATE, ALTER, DROP, TRUNCATE, etc.,
     and DML commands are INSERT, UPDATE, DELETE, SELECT, etc
   */
create table student(
    ID int not null,
    Fname varchar(20),
    Lname varchar(20),
    address varchar(30),  --create table
    city varchar(15),
    marks int,
    primary key (ID)
);

insert into student(id, fname, lname, address, city, marks) -- insert
values (1,'Zhassulan','Issayev','Abay st','Almaty',101);

update student
set fname = 'John', lname = 'Doe'  -- update
where id = 1;

delete from student     --delete
where city = 'Almaty';

select *from student; --select

drop table student;  --delete table
-----------------------------------------------

-- EX 2
create table customers(
    ID serial
                      constraint customers_pk
        primary key,
    full_name varchar(50) not null ,
    timestamp timestamp,
    delivery_address text
);

create table products(
    id varchar,
    name varchar not null ,
    description text not null,
    price double precision,
    primary key (id)
);

create table orders(
    code serial
        constraint orders_pk
        primary key ,
    customer_id int
                  constraint orders_customers_id_fk
                  references customers(id),
    total_sum double precision,
    is_paid boolean
);

create table order_items(
    order_code int
                        constraint order_items_orders_code_fk
                        references orders(code),
    product_id varchar not null
                        constraint orders_products_id_fk
                        references products(id),
    quantity int
);

-------------------------------------------------------------------
-- Ex3:

create table student(
    name varchar(20),
    age int,
    dob date,
    sex varchar(3),
    marks int,
    about_student text,
    dormitory_status varchar,
    more varchar,
                     primary key (name)
);

create table instructors(
    iname varchar(20),
    language varchar,
    experience text,
    possibilty_online varchar,
                        primary key(iname)
);

create table paricipants
(
    lesson     varchar,
    instructor varchar
        constraint paricipants_instructors_iname_fk
            references instructors (iname),
    students   varchar
        constraint paricipants_students_name_fk
            references student(name),
    class_num  int
);
--------------------------------------------------------

--EX4:
insert into customers(full_name, delivery_address) -- insert
values ('Zhassulan','Abay st, Almaty');

update customers
set full_name = 'John'  -- update
where delivery_address = 'Abay st, Almaty';

delete from customers     --delete
where full_name = 'John';






