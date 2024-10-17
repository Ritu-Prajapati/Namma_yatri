use pro_ola;

-- Q1 Diff between trips and trips_details4 table:
  -- total trips from trips table:
      select count(*) from trips;

  -- total trips table 4:
	  select count(*) from trips_details4;
 
-- total trips:
select count(distinct tripid) from trips_details4;

-- Q2 check dublicate value in tripid
 select tripid, count(tripid) cnt from trips_details4
 group by tripid
 having cnt>1;
 
-- Q3 total no. drivers 
select count( distinct driverid) total_drivers from trips;

-- ALL SUM OF THE COLUMNS 

-- Q4 Total earnings from the trips;
select sum(fare) from trips;

-- Q5 total completed trips 
select count(distinct tripid) from trips;

-- Q6 total searches 
select sum(searches) from trips_details4;

-- Q7 total searches _got_estimate
select sum(searches_got_estimate) from trips_details4;

-- Q8 total searches_for_quotes
select sum(searches_for_quotes) from trips_details4;

-- Q9 total searches_got_quotes
select sum(searches_got_quotes) from trips_details4;

-- Q9 total drivers cancelled 
select count(driver_not_cancelled) from trips_details4
where driver_not_cancelled = 0;

-- Q10 total no. of otp entered 
select sum(otp_entered) from trips_details4;

-- Q11 total no. of end ride 
select sum(end_ride) from trips_details4;

select count(otp_entered) from trips_details4
where otp_entered = 0 and end_ride=1

-- ** all the total of columns is done 
