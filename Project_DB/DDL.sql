CREATE TABLE vehicles
(
    vin varchar,
    option_id integer unique ,
    model_name varchar unique,
    brand_name varchar unique ,
    customer_id integer unique,
    manufacturer_id integer unique,
    inventory_id integer unique,
primary key (vin)
);
CREATE TABLE option
(
    option_id integer,
    engine varchar,
    transmission varchar,
    color varchar,
    mod_id integer unique,
    primary key (option_id),
    FOREIGN KEY(option_id) REFERENCES vehicles(option_id)
on delete set null
);
CREATE TABLE customer(
    customer_id integer primary key unique,
    name varchar,
    address varchar,
    phone varchar,
    gender varchar,
    annual_income integer,
    deal_id integer unique,
    FOREIGN KEY(customer_id) REFERENCES vehicles(customer_id)
                     on delete set null
);
CREATE TABLE manufacturer(
    manufacturer_id integer primary key,
    man_name varchar,
    man_location varchar,
    FOREIGN KEY (manufacturer_id) REFERENCES vehicles(manufacturer_id)
                         on delete set null
);
CREATE TABLE inventory(
    inventory_id integer primary key,
    inv_name varchar,
    inv_location varchar,
    date_in date,
    deal_id integer unique,
    FOREIGN KEY (inventory_id) REFERENCES vehicles(inventory_id)
);
CREATE TABLE dealer(
    deal_id integer primary key unique,
    deal_name varchar,
    deal_location varchar,
    FOREIGN KEY (deal_id) REFERENCES customer(deal_id),
    FOREIGN KEY (deal_id) REFERENCES inventory(deal_id)
);
CREATE TABLE car_model(
    model_id integer primary key,
    model_name varchar,
    model_year integer,
    body_style varchar,
    brand_name varchar unique,
    FOREIGN KEY (model_id) REFERENCES option(mod_id),
    FOREIGN KEY (model_name) REFERENCES vehicles(model_name)
);
CREATE TABLE brand(
    brand_name varchar primary key,
    num_of_employee integer,
    FOREIGN KEY (brand_name) REFERENCES car_model(brand_name),
    foreign key (brand_name) references vehicles(brand_name)
);
CREATE TABLE supplier(
    supplier_id integer primary key,
    supplier_name varchar,
    supplier_location varchar
);
CREATE TABLE sales(
    vin varchar ,
    customer_id integer,
    dealer_id integer,
    date_sal date,
    price integer,
    foreign key (vin) references vehicles(vin),
    foreign key (customer_id) references customer(customer_id),
    foreign key (dealer_id) references dealer(deal_id)
);