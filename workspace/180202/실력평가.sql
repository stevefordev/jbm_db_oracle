-- 18번 문제
SELECT country_id 국가번호, country_name 국가명
FROM countries
WHERE country_id LIKE '%M%';

-- 19번 문제
SELECT employee_id 사번, 
       first_name 이름,
       last_name 성,
       TO_CHAR(salary, '$999,999') 월급
FROM employees 
WHERE salary = (SELECT MIN(salary) FROM employees);

-- 20번 문제
SELECT first_name ||' '|| last_name 이름,
       job_id 직업아이디,
       l.city 도시
FROM employees e,departments d,locations l
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id
AND e.job_id = 'SA_MAN';

-- 21번 문제
SELECT e.employee_id 사번, 
       first_name 이름,
       last_name 성,
       DECODE(l.country_id, 'US', '미국', 'UK', '영국', 'CA', '캐나다', 'DE', '독일') 국가명
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id
ORDER BY e.employee_id desc;

-- 22번 문제
SELECT TO_CHAR(hire_date, 'YYYY') 입사년도,
       count(employee_id) 사번, 
       TO_CHAR(SUM(salary * 12 * (1 +  NVL(commission_pct,0)))  , '$999,999,999') "총 연봉",
       TO_CHAR(AVG(salary * 12 * (1 +  NVL(commission_pct,0)))  , '$999,999,999') "평균 연봉"
FROM employees 
GROUP BY TO_CHAR(hire_date, 'YYYY')
ORDER BY 1

-- 23번 문제
SELECT sub.department_id 부서번호,
       sub.department_name 부서명,
       e.first_name ||' '|| e.last_name "매니져명"
FROM employees e, 
(SELECT d.department_id ,
       d.department_name ,
       d.manager_id

FROM employees e, departments d
WHERE e.department_id = d.department_id
GROUP BY d.department_id, d.department_name, d.manager_id) sub

WHERE e.employee_id = sub.manager_id
ORDER BY 1
