--사원의 사번, 이름, 본봉(원래연봉), 성과급 비율, 실수령액, 경력을 출력

SELECT employee_id 사번, 
       CONCAT(CONCAT(first_name, ' '), last_name) 이름,
       TO_CHAR(salary * 12, '$999,999,999') 본봉,
       DECODE(commission_pct, null, '0%', CONCAT(ROUND(commission_pct, 2),'%')) 성과급비율,
       TO_CHAR(salary * 12 * (1 +  NVL(commission_pct,0)), '$999,999,999') 실수령액,
       CONCAT( ROUND((sysdate - hire_date) / 365), '년차') 경력   
FROM employees
ORDER BY 6 DESC, 5 DESC


SELECT employee_id 사번, 
       first_name ||' '|| last_name 이름,
       TO_CHAR(salary * 12, '$999,999,999') 본봉,
       (100 * NVL(commission_pct,0))||'%' 성과급비율,
       TO_CHAR(salary * 12 * (1 +  NVL(commission_pct,0)), '$999,999,999') 실수령액,
       ROUND((sysdate - hire_date) / 365) || '년차' 경력   
FROM employees
ORDER BY 6 DESC, 5 DESC
