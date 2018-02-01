-- 각 도시별 인원수와 평균 급여를 구하세요
SELECT c.city 도시명, 
       TO_CHAR(ROUND(AVG(a.salary)), '$999,999,999') 평균급여, 
       COUNT(a.employee_id) 사람수
FROM employees a, departments b, locations c
WHERE a.department_id = b.department_id 
AND b.location_id = c.location_id
GROUP BY c.city
ORDER BY 2
