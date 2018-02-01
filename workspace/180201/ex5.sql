
-- 부서명이 'Finance' 인 부서에 근무하는 사원들의 사원성명, 직업명, 직장상사명을 출력하세요
SELECT a.employee_id 사번,
       CONCAT(CONCAT(a.first_name, ' '), a.last_name) 사원성명,
       c.job_title 직업명,
       CONCAT(CONCAT(d.first_name,' '), d.last_name) 상사명
FROM employees a, departments b, jobs c, employees d
WHERE a.department_id = b.department_id
AND b.department_name = 'Finance'
AND a.job_id = c.job_id
AND a.manager_id = d.employee_id


