SELECT a.location_id 지점번호, 
       a.city 도시명, 
       c.region_name 지역명
FROM locations a, countries b, regions c
WHERE a.country_id = b.country_id
AND b.region_id = c.region_id
AND a.location_id BETWEEN 1000 AND 1500
ORDER BY 1
