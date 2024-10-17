use pro_ola;

-- which driver ,customer pair has more orders 
select * from 
(select * , rank() over (order by cnt desc) rnk from 
(select driverid, custid, count(*) cnt from trips
group by driverid , custid )a )b
where rnk = 1;

-- which area got highest trips in which duration
  
select * from 
(select *,rank() over(partition by duration order by cnt desc) rnk
from
(select duration,loc_from,  count(*) cnt from trips
group by duration, loc_from)b)c
where rnk =1 ;

select * from 
(select *,rank() over(partition by loc_from order by cnt desc) rnk
from
(select duration,loc_from,  count(*) cnt from trips
group by duration, loc_from)b)c
where rnk =1 ;

-- which area got the highest fare and the cancellation

select loc_from , sum(fare) from trips 
group by loc_from 
order by sum(fare) desc limit 1 ;

SELECT loc_from, COUNT(*) - sum(customer_not_cancelled) can
FROM trips_details4
GROUP BY loc_from
order by can desc limit 1 ;

SELECT loc_from, COUNT(*) - sum(driver_not_cancelled) dri
FROM trips_details4
GROUP BY loc_from
order by dri desc limit 1 ;

-- which duration got the highest no. of trips and fairs 

select * from(
SELECT *, rank() over(order by cnt  desc )rnk  from(
SELECT duration , count(*) cnt , sum(fare) FROM trips
group by duration
) a )b
where rnk = 1




