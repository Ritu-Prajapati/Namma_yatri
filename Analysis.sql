use pro_ola;

-- Getting to know more about data

-- average distance per trips = 14.39
select avg(distance) from trips;

--  average fare per trips
select avg(fare) from trips;

-- distance travelled 
select sum(distance) from trips;

-- most used payment method = "credit card" 
select a.method from payment a 
inner join 
(select faremethod ,  count(faremethod) from trips
group by faremethod
order by count(faremethod) desc limit 1) b 
on a.id = b.faremethod;

-- highest payment was made throught which payment 
	select a.method from payment a  
	inner join
	( select faremethod from trips
     order by fare desc limit 1) b 
	 on a.id = b.faremethod;

-- which two location has most no. of trips 

select * from 
(select *, dense_rank() over(order by trip desc) rnk
 from 
(SELECT loc_from , loc_to, COUNT(*) trip FROM trips
GROUP BY loc_from, loc_to
)a)b
where rnk = 1;

-- top 5 earning drivers 

select * from 
(select *, dense_rank() over(order by fares desc) rnk
from
(select driverid , sum(fare) fares from trips 
group by driverid ) a)b 
where rnk < 6  ; 

-- which duration have more trips 
select duration , count(*) from trips 
group by duration 
order by count(*) desc;

-- whcih driver and customer has more pairs 
select * from 
(select *, dense_rank() over(order by cnt desc) rnk from
(
select driverid, custid, count(*) cnt from trips 
group by driverid, custid
) a )b
where rnk =1 ;

-- search to estimates rate 

select (sum(searches_got_estimate)/ sum(searches))* 100 as rate from trips_details4;

-- estimates to search of quotes rate 
select (sum(searches_for_quotes)/ sum(searches_got_estimate))* 100 as rate from trips_details4;

-- quote acceptance rate 
select (sum(searches_got_quotes)/ sum(searches_for_quotes))* 100 as rate from trips_details4;

-- quote to booking rate 
select (sum(otp_entered)/ sum(searches_got_quotes))* 100 as rate from trips_details4;

-- booking cancellation rate 
select (select count(driver_not_cancelled) from trips_details4
where driver_not_cancelled = 0)/sum(searches_got_quotes) as rate from trips_details4;

-- conversion rate 
select (sum(end_ride) * 100)/ sum(searches) rate from trips_details4 ; 

-- which area got highest trips in which duration 

select duration, loc_from , count(*) from trips
group by duration, loc_from 