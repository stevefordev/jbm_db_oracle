/* 
*2005년 이전 고용된 사람들 중에서 평균 연봉 이하를 받는 
*직원들의 사번, 이름, 성, 고용일, 부서번호, 부서명을 출력하세요
*/

SELECT employee_id 사번, 
       first_name 이름, 
       last_name 성, 
       hire_date 고용일, 
       b.department_id 부서번호, 
       department_name 고용일 
FROM employees a, departments b
WHERE 
a.department_id = b.department_id
AND TO_CHAR(hire_date, 'YYYY') < 2005
AND (salary * 12) <= (SELECT AVG(salary * 12) 
               FROM employees)
ORDER BY 6
