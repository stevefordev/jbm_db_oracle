
SELECT employee_id, salary, hire_date 
FROM employees;

-- AS 생략가능, double quartation 생략 가능 (한칸 띄울 경우 필요)
SELECT employee_id, first_name, last_name, (salary * 12) AS "연봉"
FROM employees;

-- field manual
-- 알리어스(alias:별칭) 
SELECT employee_id 사번, first_name 이름, last_name 성, (salary * 12) AS "연 봉"
FROM employees;

-- 직원 테이블에서 급여가 8000 이상 되는 사람을 출력
SELECT employee_id, first_name, salary, hire_date
FROM employees WHERE salary >= 8000 ORDER BY 3 DESC, 2 DESC;

-- 문자열 데이터 검색
SELECT *
FROM employees
WHERE JOB_ID = 'ST_CLERK' ORDER BY salary DESC;


-- 날짜 비교 (한글 세션이냐 영어 세션이냐에 따라서 날짜 표기가 달라 질 수 있다.)
SELECT employee_id, last_name, hire_date, salary
FROM employees
WHERE hire_date >='01/01/2004' ORDER BY hire_date DESC;


-- %’를 포함한 데이터 검색
SELECT *
FROM employees
WHERE last_name LIKE 'K%';

SELECT employee_id, first_name, last_name
FROM employees
WHERE last_name LIKE '%s'


SELECT employee_id, first_name, last_name
FROM employees 
WHERE first_name LIKE '%ab%'

-- sub query
SELECT employee_id, first_name, last_name, salary, manager_id
FROM employees
WHERE manager_id = 

(SELECT employee_id 
FROM employees 
WHERE first_name = 'Nancy' 
)
AND (salary BETWEEN 4000 AND 8000)
-- AND salary <= 8000 AND salary >= 4000


-- escape
SELECT * 
FROM employees 
WHERE job_id LIKE '%A_%' ESCAPE 'A'

-- 사원번호,이름,성,월급,고용일 
SELECT employee_id, first_name, last_name, salary, hire_date
FROM employees
WHERE (hire_date BETWEEN '01/01/2002' AND '12/31/2004')
OR (salary >= 20000)

-- IN 연산자
SELECT employee_id, first_name, last_name 
FROM employees
WHERE last_name IN ('Lorentz','Popp')

-- NOT IN (~ 을 제외한)
SELECT employee_id, first_name, last_name, department_id
FROM employees
WHERE department_id NOT IN (10,20,30)

-- NOT LIKE
SELECT employee_id, first_name
FROM employees
WHERE first_name NOT LIKE 'A%' AND first_name NOT LIKE '%s' 

-- 단일행 함수 NVL
SELECT employee_id, first_name,
salary * 12 + (salary * 12 * NVL(commission_pct,0)) 연봉
FROM employees
ORDER BY 3 DESC
-- salary * 12 * (1 + NVL(commission_pct,0)) 연봉


-- 단일행 함수 DECODE
SELECT DECODE(department_id, 10,'10번부서',20,
                                '20번부서','ㄴㄴ')
FROM employees

-- 그룹 함수
SELECT COUNT(*) 
FROM employees

SELECT MAX(salary) 
FROM employees

SELECT MIN(salary) 
FROM employees

SELECT AVG(salary) 
FROM employees


-- pivot
SELECT * FROM  (
 select to_char(hire_date,'YYYY') as A, count(*) AS B  from employees group by to_char(hire_date,'YYYY')
)
PIVOT (
SUM(B)
FOR A
IN (2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008)
)