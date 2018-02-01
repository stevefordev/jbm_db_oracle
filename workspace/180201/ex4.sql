-- 평균월급이  6000~9000 사이인 부서의 부서번호, 부서명, 도시, 평균월급을 구하세요
SELECT b.department_id 부서번호, 
       b.department_name 부서명, 
       c.city 도시, 
       ROUND(AVG(a.salary)) 평균월급 
FROM employees a, departments b, locations c
WHERE a.department_id = b.department_id
AND b.location_id = c.location_id
GROUP BY b.department_id, b.department_name, c.city
HAVING AVG(a.salary) BETWEEN 6000 AND 9000
ORDER BY 4 DESC
