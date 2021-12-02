--1. Show sales trends for various brands over the past 3 years, by year, month, week. Then break
--these data out by gender of the buyer and then by income range
SELECT b.brand_name,count(sales.vin),date_sal
from sales
inner join vehicles v on sales.vin = v.vin
inner join brand b on v.brand_name = b.brand_name
where date_sal > '2018-01-01'
group by date_sal,b.brand_name
order by b.brand_name desc;

--2.Suppose that it is found that transmissions made by supplier Getrag between two given dates
--are defective. Find the VIN of each car containing such a transmission and the customer to
--which it was sold. If your design allows, suppose the defective transmissions all come from
--only one of Getrag’s plants.

SELECT vin,transmission
from vehicles
inner join option o on vehicles.option_id = o.option_id
where transmission = 'm';

--3. • Find the top 2 brands by dollar-amount sold in the past year.
SELECT v.brand_name,sum(price)
from sales
inner join vehicles v on sales.vin = v.vin
inner join brand b on v.brand_name = b.brand_name
group by v.brand_name
order by sum(price) desc limit 2;

--4. Find the top 2 brands by unit sales in the past year.
SELECT v.brand_name,sum(price)
from sales
inner join vehicles v on sales.vin = v.vin
inner join brand b on v.brand_name = b.brand_name
where date_sal >= '2021-01-01'
group by v.brand_name
order by sum(price) desc limit 2;

--5.In what month(s) do convertibles sell best?
SELECT EXTRACT(MONTH FROM date_sal) as month,count(EXTRACT(MONTH FROM date_sal))
from sales
inner join vehicles v on sales.vin = v.vin
inner join car_model cm on v.model_name = cm.model_name
where body_style = 'Convertible'
group by EXTRACT(MONTH FROM date_sal)
order by count(EXTRACT(MONTH FROM date_sal)) desc;

--6.Find those dealers who keep a vehicle in inventory for the longest average time
SELECT dealer_id,avg(date_sal - date_in) as day
from sales
inner join dealer d on sales.dealer_id = d.deal_id
inner join inventory i on d.deal_id = i.deal_id
group by dealer_id
order by day desc;

