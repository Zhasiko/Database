insert into vehicles (vin, option_id, model_name, brand_name, customer_id, manufacturer_id, inventory_id) values ('1N4AA5AP0CC754826', 20, 'Vandura G1500', 'BMW', 192, 263, 330);
insert into vehicles (vin, option_id, model_name, brand_name, customer_id, manufacturer_id, inventory_id) values ('SCBFR7ZA0CC735233', 58, 'MPV', 'Ford', 116, 300, 393);
insert into vehicles (vin, option_id, model_name, brand_name, customer_id, manufacturer_id, inventory_id) values ('WAUEF78E36A355113', 81, '1500', 'Chrysler',  105, 235, 331);
insert into vehicles (vin, option_id, model_name, brand_name, customer_id, manufacturer_id, inventory_id) values ('1GKS1CE03ER816272', 73, 'SC', 'Verano', 160, 295, 323);
insert into vehicles (vin, option_id, model_name, brand_name, customer_id, manufacturer_id, inventory_id) values ('WP1AA2A23DL619446', 8, 'Cabriolet', 'Mercedes', 142, 254, 359);
insert into vehicles (vin, option_id, model_name, brand_name, customer_id, manufacturer_id, inventory_id) values ('JN8AF5MR8BT237107', 90, 'S40', 'Volkswagen', 103, 222, 348);
insert into vehicles (vin, option_id, model_name, brand_name, customer_id, manufacturer_id, inventory_id) values ('2HKRM3H39DH343846', 93, 'Grand Cherokee', 'Volvo', 181, 229, 326);
insert into vehicles (vin, option_id, model_name, brand_name, customer_id, manufacturer_id, inventory_id) values ('SCBDR3ZA3AC082913', 48, 'Colorado', 'Studebaker', 154, 232, 319);
insert into vehicles (vin, option_id, model_name, brand_name, customer_id, manufacturer_id, inventory_id) values ('1N6AF0LY4FN464678', 98, 'Durango', 'Honda', 106, 253, 384);

insert into option (option_id, engine, transmission, color, mod_id) values (20, 'Pipefitter', 'm', 'Pink', 2361);
insert into option (option_id, engine, transmission, color, mod_id) values (58, 'Stucco Mason', 'm', 'Maroon', 2841);
insert into option (option_id, engine, transmission, color, mod_id) values (81, 'Pipefitter', 'a', 'Teal', 2471);
insert into option (option_id, engine, transmission, color, mod_id) values (73, 'Terrazzo', 'a', 'Green', 2521);
insert into option (option_id, engine, transmission, color, mod_id) values (8, 'Landscaper', 'a', 'Orange', 2721);
insert into option (option_id, engine, transmission, color, mod_id) values (90, 'Ironworker', 'a', 'Goldenrod', 2441);
insert into option (option_id, engine, transmission, color, mod_id) values (93, 'Brickmason', 'a', 'Maroon', 2362);
insert into option (option_id, engine, transmission, color, mod_id) values (48, 'Tile Setter', 'm', 'Orange', 2621);
insert into option (option_id, engine, transmission, color, mod_id) values (98, 'Electrician', 'm', 'Mauv', 2311);

insert into customer (customer_id, name, address, phone, gender, annual_income, deal_id) values (192, 'Thedrick', '3205 Banding Terrace', '892-987-3360', 'Female', 21573, 5010);
insert into customer (customer_id, name, address, phone, gender, annual_income, deal_id) values (116, 'Aloin', '67432 Sycamore Parkway', '227-825-4520', 'Female', 13625, 4767);
insert into customer (customer_id, name, address, phone, gender, annual_income, deal_id) values (105, 'Adorne', '49390 Pine View Terrace', '322-932-1476', 'Male', 44492, 3581);
insert into customer (customer_id, name, address, phone, gender, annual_income, deal_id) values (160, 'Gilligan', '63207 Anzinger Terrace', '137-580-9405', 'Male', 54102, 3482);
insert into customer (customer_id, name, address, phone, gender, annual_income, deal_id) values (142, 'Brody', '05 Del Sol Crossing', '738-511-2977', 'Male', 23686, 3050);
insert into customer (customer_id, name, address, phone, gender, annual_income, deal_id) values (103, 'Brew', '8 Londonderry Point', '663-127-3375', 'Female', 29280, 4934);
insert into customer (customer_id, name, address, phone, gender, annual_income, deal_id) values (181, 'Bert', '932 Thompson Plaza', '668-468-2263', 'Male', 56416, 2354);
insert into customer (customer_id, name, address, phone, gender, annual_income, deal_id) values (154, 'Clive', '532 Northridge Circle', '427-902-9125', 'Male', 92601, 4960);
insert into customer (customer_id, name, address, phone, gender, annual_income, deal_id) values (106, 'Modestine', '50635 Maple Wood Crossing', '887-655-1363', 'Male', 55985, 4873);

insert into manufacturer (manufacturer_id, man_name, man_location) values (263, 'Dotted Polypody', 'Ivry-sur-Seine');
insert into manufacturer (manufacturer_id, man_name, man_location) values (300, 'Manihot', 'Okegawa');
insert into manufacturer (manufacturer_id, man_name, man_location) values (235, 'Santa Rita Pricklypear', 'Plyussa');
insert into manufacturer (manufacturer_id, man_name, man_location) values (295, 'Shortleaf Woollygrass', 'Youxikou');
insert into manufacturer (manufacturer_id, man_name, man_location) values (254, 'Whitelady', 'Wuyao');
insert into manufacturer (manufacturer_id, man_name, man_location) values (222, 'Crater Lichen', 'Berb??rati');
insert into manufacturer (manufacturer_id, man_name, man_location) values (229, 'Solander''s Geranium', 'Nyrkiv');
insert into manufacturer (manufacturer_id, man_name, man_location) values (232, 'Largefruit Sand Verbena', 'Pawa');
insert into manufacturer (manufacturer_id, man_name, man_location) values (253, 'Tonkin Cane', 'Moluo');

insert into inventory (inventory_id, inv_name, inv_location, date_in, deal_id) values (330, 'Mountain Springparsley', 'Budapest', '2011/08/17', 5010);
insert into inventory (inventory_id, inv_name, inv_location, date_in, deal_id) values (393, 'Witch''s Hair Lichen', 'Ma????y', '2012/06/15', 4767);
insert into inventory (inventory_id, inv_name, inv_location, date_in, deal_id) values (331, 'Hairy Sunflower', 'Karonga', '2013/06/02', 3581);
insert into inventory (inventory_id, inv_name, inv_location, date_in, deal_id) values (323, 'Helminthocarpon Lichen', 'Zhlobin', '2021/01/18', 3482);
insert into inventory (inventory_id, inv_name, inv_location, date_in, deal_id) values (359, 'Maui Cyanea', 'Ambarakaraka', '2011/12/27', 3050);
insert into inventory (inventory_id, inv_name, inv_location, date_in, deal_id) values (348, 'Fragrant Clematis', 'Kolor', '2018/06/19', 4934);
insert into inventory (inventory_id, inv_name, inv_location, date_in, deal_id) values (326, 'Lanceleaf Nightshade', 'Changqiao', '2015/03/13', 2354);
insert into inventory (inventory_id, inv_name, inv_location, date_in, deal_id) values (319, 'Owl''s Crown', 'Rizal', '2012/02/23', 4960);
insert into inventory (inventory_id, inv_name, inv_location, date_in, deal_id) values (384, 'Flowery Phlox', 'Ba??ka Palanka', '2016/12/11', 4873);

insert into dealer (deal_id, deal_name, deal_location) values (5010, 'Sindee', 'Cill Airne');
insert into dealer (deal_id, deal_name, deal_location) values (4767, 'Kathye', 'Tongole');
insert into dealer (deal_id, deal_name, deal_location) values (3581, 'Faber', 'Repentigny');
insert into dealer (deal_id, deal_name, deal_location) values (3482, 'Aura', 'Axio??poli');
insert into dealer (deal_id, deal_name, deal_location) values (3050, 'Ulrika', 'Zombo');
insert into dealer (deal_id, deal_name, deal_location) values (4934, 'Salli', 'Changbao');
insert into dealer (deal_id, deal_name, deal_location) values (2354, 'Margit', 'Croissy-sur-Seine');
insert into dealer (deal_id, deal_name, deal_location) values (4960, 'Berky', 'San Diego');
insert into dealer (deal_id, deal_name, deal_location) values (4873, 'Rea', 'Campinas');

insert into car_model (model_id, model_name, model_year, body_style, brand_name) values (2361, 'Vandura G1500', 2012, 'Convertible', 'BMW');
insert into car_model (model_id, model_name, model_year, body_style, brand_name) values (2841, 'MPV', 1994, 'Hatchback', 'Ford');
insert into car_model (model_id, model_name, model_year, body_style, brand_name) values (2471, '1500', 2002, 'Convertible', 'Chrysler');
insert into car_model (model_id, model_name, model_year, body_style, brand_name) values (2521, 'SC', 2007, 'Hatchback', 'Verano');
insert into car_model (model_id, model_name, model_year, body_style, brand_name) values (2721, 'Cabriolet', 1985, 'Convertible', 'Mercedes');
insert into car_model (model_id, model_name, model_year, body_style, brand_name) values (2441, 'S40', 2006, 'Convertible', 'Volkswagen');
insert into car_model (model_id, model_name, model_year, body_style, brand_name) values (2362, 'Grand Cherokee', 1992, 'Minivan', 'Volvo');
insert into car_model (model_id, model_name, model_year, body_style, brand_name) values (2621, 'Colorado', 1962, 'Pickup truck', 'Studebaker');
insert into car_model (model_id, model_name, model_year, body_style, brand_name) values (2311, 'Durango', 2005, 'Pickup truck', 'Honda');

insert into brand (brand_name, num_of_employee) values ('BMW', 125);
insert into brand (brand_name, num_of_employee) values ('Ford', 134);
insert into brand (brand_name, num_of_employee) values ('Chrysler', 119);
insert into brand (brand_name, num_of_employee) values ('Verano', 158);
insert into brand (brand_name, num_of_employee) values ('Mercedes', 104);
insert into brand (brand_name, num_of_employee) values ('Volkswagen', 142);
insert into brand (brand_name, num_of_employee) values ('Volvo', 157);
insert into brand (brand_name, num_of_employee) values ('Studebaker', 143);
insert into brand (brand_name, num_of_employee) values ('Honda', 136);

insert into supplier (supplier_id, supplier_name, supplier_location) values (32, 'Bayer-Crist', 'Xingang');
insert into supplier (supplier_id, supplier_name, supplier_location) values (27, 'Stracke-Armstrong', 'Argasari');
insert into supplier (supplier_id, supplier_name, supplier_location) values (63, 'Collins-Franecki', 'El Para??so');
insert into supplier (supplier_id, supplier_name, supplier_location) values (7, 'McDermott-Barrows', 'S??ngho 1-tong');
insert into supplier (supplier_id, supplier_name, supplier_location) values (4, 'Kohler-Jenkins', 'Taquaritinga');
insert into supplier (supplier_id, supplier_name, supplier_location) values (100, 'Purdy LLC', 'Berl??n');
insert into supplier (supplier_id, supplier_name, supplier_location) values (9, 'Ortiz-Murazik', 'Cipadung Timur');
insert into supplier (supplier_id, supplier_name, supplier_location) values (96, 'Bednar-Lowe', 'Novais');
insert into supplier (supplier_id, supplier_name, supplier_location) values (70, 'Okuneva Inc', 'Seremban');

insert into sales (vin, customer_id, dealer_id, date_sal, price) values ('1N4AA5AP0CC754826', 192, 5010, '2017/03/29', 5106);
insert into sales (vin, customer_id, dealer_id, date_sal, price) values ('1N4AA5AP0CC754826', 116, 5010, '2016/11/27', 17161);
insert into sales (vin, customer_id, dealer_id, date_sal, price) values ('1N4AA5AP0CC754826', 105, 5010, '2016/06/01', 17029);
insert into sales (vin, customer_id, dealer_id, date_sal, price) values ('1N4AA5AP0CC754826', 160, 5010, '2020/08/26', 18897);
insert into sales (vin, customer_id, dealer_id, date_sal, price) values ('SCBFR7ZA0CC735233', 142, 4767, '2016/04/10', 9406);
insert into sales (vin, customer_id, dealer_id, date_sal, price) values ('SCBFR7ZA0CC735233', 103, 4767, '2018/12/12', 7833);
insert into sales (vin, customer_id, dealer_id, date_sal, price) values ('SCBFR7ZA0CC735233', 181, 4767, '2019/09/22', 16399);
insert into sales (vin, customer_id, dealer_id, date_sal, price) values ('WAUEF78E36A355113', 154, 3581, '2016/09/06', 7526);
insert into sales (vin, customer_id, dealer_id, date_sal, price) values ('WAUEF78E36A355113', 106, 3581, '2021/02/13', 17728);
insert into sales (vin, customer_id, dealer_id, date_sal, price) values ('1GKS1CE03ER816272', 106, 3482, '2021/01/25', 11821);
insert into sales (vin, customer_id, dealer_id, date_sal, price) values ('WP1AA2A23DL619446', 154, 3050, '2017/10/17', 11410);
insert into sales (vin, customer_id, dealer_id, date_sal, price) values ('WP1AA2A23DL619446', 181, 3050, '2019/04/23', 8663);
insert into sales (vin, customer_id, dealer_id, date_sal, price) values ('JN8AF5MR8BT237107', 181, 4934, '2018/08/04', 17911);
insert into sales (vin, customer_id, dealer_id, date_sal, price) values ('JN8AF5MR8BT237107', 103, 4934, '2018/10/14', 8817);
insert into sales (vin, customer_id, dealer_id, date_sal, price) values ('JN8AF5MR8BT237107', 105, 4934, '2017/02/09', 11037);
insert into sales (vin, customer_id, dealer_id, date_sal, price) values ('2HKRM3H39DH343846', 105, 2354, '2018/10/18', 6201);
insert into sales (vin, customer_id, dealer_id, date_sal, price) values ('2HKRM3H39DH343846', 103, 2354, '2021/04/03', 6541);
insert into sales (vin, customer_id, dealer_id, date_sal, price) values ('SCBDR3ZA3AC082913', 181, 4960, '2019/07/27', 11539);
insert into sales (vin, customer_id, dealer_id, date_sal, price) values ('1N6AF0LY4FN464678', 154, 4873, '2018/06/10', 14469);
insert into sales (vin, customer_id, dealer_id, date_sal, price) values ('1N6AF0LY4FN464678', 106, 4873, '2020/10/15', 12583);