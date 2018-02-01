--사원의 사번, 이름, 본봉(원래연봉), 성과급 비율, 실수령액, 경력을 출력

--   뭔가 틀린거 같음 검수 필요
SELECT employee_id 사번, 
       CONCAT(CONCAT(first_name, ' '), last_name) 이름,
       TO_CHAR(salary * 12, '$999,999,999') 본봉,
       DECODE(commission_pct, null, '0%', CONCAT(TO_CHAR(commission_pct, '.00'),'%')) 성과급비율,
       TO_CHAR(salary * 12 * (1 +  NVL(commission_pct,0)), '$999,999,999') 실수령액,
       CONCAT((TO_CHAR(sysdate, 'YYYY') - TO_CHAR(hire_date, 'YYYY')), '년차') 경력
FROM employees
ORDER BY 6 DESC
