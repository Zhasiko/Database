--LAB WORK 6
--Issayev Zhassulan

--1.Write a SQL query using Joins:
--a)Combine each row of dealer table with each row of client table
SELECT *
from dealer
inner join client on dealer.id = client.dealer_id

--b) find all dealers along with client name, city, grade, sell number, date, and amount
Select client.dealer_id, client.name, client.city,client.priority,sell.id,sell.date,sell.amount
From client
inner join sell on client.id = sell.client_id

--c) find the dealer and client who belongs to same city
Select dealer.name,client.name
from dealer
cross join client
where dealer.location = client.city

--d) find sell id, amount, client name, city those sells where sell amount exists between100 and 500
Select sell.id,sell.amount,client.name,client.city
from sell
inner join client  on sell.client_id = client.id
where amount > 100 and amount < 500

--e)find dealers who works either for one or more client or not yet join under any of the clients
select dealer.name as dealer_name,count(client.id) as number_of_clients
from dealer
left join client on dealer.id = client.dealer_id
group by dealer.name

--f)find the dealers and the clients he service, return client name, city, dealer name,commission.

select client.name, client.city,dealer.name,dealer.charge
from dealer
inner join client on dealer.id = client.dealer_id

--g)find client name, client city, dealer, commission those dealers who received a commission from the sell more than 12%
select client.name,client.city,dealer.name,dealer.charge
from client
inner join dealer on dealer.id = client.dealer_id
where dealer.charge > 0.12

--h) make a report with client name, city, sell id, sell date, sell amount, dealer name and commission to find that either any of the existing clients haven’t made a purchase(sell) or made one or more purchase(sell) by their dealer or by own.
select client.name,client.city,sell.id,sell.date,sell.amount, dealer.name,dealer.charge
from dealer
inner join client  on dealer.id = client.dealer_id
inner join sell  on client.id = sell.client_id

--i)
select sell.client_id, client.name, client.priority, dealer.name,sell.id,sell.amount
from sell
inner join client on sell.client_id = client.id
inner join dealer on sell.dealer_id = dealer.id
Where priority is not Null
group by sell.client_id, client.name, client.priority, dealer.name, sell.id
having sum(Amount) > 2000



--2.Create following views:
--a) count the number of unique clients, compute average and total purchase amount of client orders by each date.
Create view total_avg (date,total)
AS
Select date,count(id)
from sell
group by date
select total_avg.date,total, avg(total)
from sell,total_avg
group by total_avg.date,total


--b) find top 5 dates with the greatest total sell amount
create view greatest_amount(date,sum)
as
    SELECT date,sum(amount)
    from sell
    group by date
    order by sum(amount) DESC
    LIMIT 5
Select *
from greatest_amount

--c) count the number of sales, compute average and total amount of allsales of each dealer
create view tot_avg_dealer(dealer_id,total)
AS
    SELECT dealer_id,count(id)
from sell
group by dealer_id
select dealer_id,total,avg(total)
from tot_avg_dealer
group by dealer_id, total

--d)compute how much all dealers earned from charge(total sell amount *charge) in each location
create view dealers_earned(location,earned)
as
    select location,sum(amount*dealer.charge)
from dealer,sell
group by location
select *
from dealers_earned

--e) compute number of sales, average and total amount of all sales dealers made in each location
create view avg_tot_location(location,total,avg)
as
select dealer.location,sum(sell.amount),avg(amount)
from dealer,sell
where dealer.id = sell.dealer_id
group by dealer.location
select *
from avg_tot_location

--f) compute number of sales, average and total amount of expenses in each city clients made.
create view avg_tot_client(city,total,avg)
as
select client.city,sum(amount),avg(amount)
from client,sell
where client.id = sell.client_id
group by client.city
select *
from avg_tot_client

--g) find cities where total expenses more than total amount of sales in locations
Select city,avg_tot_client.total,avg_tot_location.total
from avg_tot_client
full outer join avg_tot_location on city = location
where avg_tot_client.total > avg_tot_location.total

--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-

drop view total_avg
drop view greatest_amount
drop view tot_avg_dealer
drop view dealers_earned
drop view avg_tot_location
drop view avg_tot_client