-- 금액 표시
SELECT employee_id, last_name, first_name, TO_CHAR(salary , '$999,999,999')
FROM employees

-- 
SELECT TO_CHAR(hire_date, 'YYYY"년" MM"월"')
FROM employees


-- CONCAT
SELECT CONCAT(CONCAT(first_name,' '), last_name) ENAME
FROM employees


SELECT SUBSTR('abcdefghijklmnopqrstuvwxyz', 5,4)
FROM DUAL

SELECT LENGTH('가나다라마바사아자차카타파하')
FROM DUAL

SELECT ROUND(312.14)
FROM DUAL

SELECT ROUND(314.14,-1)
FROM DUAL


SELECT TRUNC(532.14,-1)
FROM DUAL


SELECT SYSDATE + 99
FROM DUAL


--- HAVING
그룹을 묶은 다음에 조건식

--Structured Query Language
FROM-> WHERE-> GROUPBY-> HAVING-> SELECT-> ORDER BY 


INSERT INTO groups(no, name, debut_date)
VALUES(3, '방탄소년단', '06/13/2013')

SELECT *
FROM groups

SELECT * 
FROM idols

INSERT INTO idols (no, name, height, weight, birth_date, group_no)
VALUES (1, '뷔', 178, 62, '12/30/1995', 1)


INSERT INTO idols (no, name, height, weight, birth_date, group_no)
VALUES (4, '지민', 173, 61, '10/13/1995',3)
170 47 06 28 1991 1

UPDATE idols SET group_no = 3
WHERE no = 1

SELECT *
FROM idols a, groups b
WHERE a.group_no = b.no
