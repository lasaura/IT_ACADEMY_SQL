/*
1)
SELECT COUNT(*) AS TOTAL
FROM Flights;
2)
select Origin, AVG(ArrDelay), AVG(DepDelay)
from flights
group by Origin;
3)
select Origin, colYear, colMonth, AVG(ArrDelay)
from flights
group by Origin, colYear, colMonth
order by Origin, colYear, colMonth;
4)
select u.city, ColYear, colMonth, avg (arrdelay) as promedio
from USAirports u right join flights f on u.IATA = f.origin
group by u.city, colYear, colMonth
order by u.city asc, colYear asc, colMonth asc;
5)
select UniqueCarrier, colYear, colMonth, AVG(ArrDelay), count(cancelled) AS TOTAL_CANC
from flights
where cancelled > '0'
group by UniqueCarrier, colYear, colMonth, Cancelled
order by colMonth,Cancelled DESC;

6)
select tailnum, sum(distance) as MILLAS_RECORRIDAS
from flights
group by tailnum
order by MILLAS_RECORRIDAS DESC
limit 10;

7)

select UniqueCarrier, AVG(ArrDelay) as MEDIA
from flights
group by UniqueCarrier
having avg(ArrDelay) > 10
order by MEDIA DESC;

