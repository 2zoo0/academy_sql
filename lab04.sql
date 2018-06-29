-- 실습문제 4


-- 실습 3)
SELECT e1.EMPNO 사번
     , e1.ENAME 사명
     , e1.MGR 상사번호
     , e2.EMPNO 상사사번
     , e2.ENAME 상사명
  FROM emp e1, emp e2
 WHERE e1.MGR = e2.EMPNO(+)
;
/* 사번, 사명, 상사번호, 상사사번, 상사명
---------------------------------------
7902	FORD	7566	7566	JONES
7900	JAMES	7698	7698	BLAKE
7844	TURNER	7698	7698	BLAKE
7654	MARTIN	7698	7698	BLAKE
7521	WARD	7698	7698	BLAKE
7499	ALLEN	7698	7698	BLAKE
7934	MILLER	7782	7782	CLARK
7782	CLARK	7839	7839	KING
7698	BLAKE	7839	7839	KING
7566	JONES	7839	7839	KING
7369	SMITH	7902	7902	FORD
7777	J%JONES			
8888	J			
9999	J_JUNE			
7839	KING			

*/

-- 실습 4)
SELECT e1.EMPNO 사번
     , e1.ENAME 사명
     , e1.MGR 상사번호
     , e2.EMPNO 상사사번
     , e2.ENAME 상사명
  FROM emp e1 RIGHT OUTER JOIN emp e2
    ON e1.MGR = e2.EMPNO
 ORDER BY e1.EMPNO
;
/* 사번, 사명, 상사번호, 상사사번, 상사명
--------------------------------------
7369	SMITH	7902	7902	FORD
7499	ALLEN	7698	7698	BLAKE
7521	WARD	7698	7698	BLAKE
7566	JONES	7839	7839	KING
7654	MARTIN	7698	7698	BLAKE
7698	BLAKE	7839	7839	KING
7782	CLARK	7839	7839	KING
7844	TURNER	7698	7698	BLAKE
7900	JAMES	7698	7698	BLAKE
7902	FORD	7566	7566	JONES
7934	MILLER	7782	7782	CLARK
  여기부터는부하직원 없음  8888	J
                        7934	MILLER
                        7900	JAMES
                        7844	TURNER
                        7777	J%JONES
                        7654	MARTIN
                        7521	WARD
                        9999	J_JUNE
                        7369	SMITH
                        7499	ALLEN
*/

-- 실습 5)
SELECT e.ENAME 
     , e.JOB
  FROM emp e
 WHERE e.JOB = (SELECT e.JOB
                  FROM emp e
                 WHERE e.ENAME = 'JAMES')    
;
/* ENAME, JOB
--------------
SMITH	CLERK
JAMES	CLERK
MILLER	CLERK
J_JUNE	CLERK
J	    CLERK
J%JONES	CLERK
*/

-- 실습 6)
SELECT e.EMPNO
     , e.ENAME
     , e.MGR
     , (SELECT ENAME 
          FROM emp 
         WHERE e.MGR = EMPNO) "MGRNAME"
FROM emp e
;
/* EMPNO, ENAME, MGR, MGRNAME
-------------------------------
7369	SMITH	7902	FORD
7499	ALLEN	7698	BLAKE
7521	WARD	7698	BLAKE
7566	JONES	7839	KING
7654	MARTIN	7698	BLAKE
7698	BLAKE	7839	KING
7782	CLARK	7839	KING
7839	KING		
7844	TURNER	7698	BLAKE
7900	JAMES	7698	BLAKE
7902	FORD	7566	JONES
7934	MILLER	7782	CLARK
9999	J_JUNE		
8888	J		
7777	J%JONES		
*/
-- 실습 7)
SELECT e.EMPNO
     , e.ENAME
     , e.SAL
     , (SELECT d.dname
          FROM dept d
         WHERE e.DEPTNO = d.DEPTNO) "DNAME"
     , (SELECT d.loc
          FROM dept d
         WHERE e.DEPTNO = d.DEPTNO) "LOC"   
FROM emp e
;

/* EMPNO, ENAME, SAL, DNAME, LOC
----------------------------------------
7369	SMITH	800	    RESEARCH	DALLAS
7499	ALLEN	1600	SALES	    CHICAGO
7521	WARD	1250	SALES	    CHICAGO
7566	JONES	2975	RESEARCH	DALLAS
7654	MARTIN	1250	SALES	    CHICAGO
7698	BLAKE	2850	SALES	    CHICAGO
7782	CLARK	2450	ACCOUNTING	NEW YORK
7839	KING	5000	ACCOUNTING	NEW YORK
7844	TURNER	1500	SALES	    CHICAGO
7900	JAMES	950	    SALES	    CHICAGO
7902	FORD	3000	RESEARCH	DALLAS
7934	MILLER	1300	ACCOUNTING	NEW YORK
9999	J_JUNE	500		
8888	J	400		
7777	J%JONES	300		
*/

----DDL

-- 실습 1)
CREATE TABLE CUSTOMER 
( userid VARCHAR2(4) PRIMARY KEY
, name VARCHAR2(30) NOT NULL
, birthyear NUMBER(4)
, regdate DATE DEFAULT sysdate
, address VARCHAR2(30)
); -- Table CUSTOMER이(가) 생성되었습니다.

-- 실습 2)
SELECT *
  FROM CUSTOMER
; 

-- 실습 3)
CREATE TABLE NEW_CUST
AS SELECT * 
     FROM CUSTOMER
    WHERE 1!=1
; -- Table NEW_CUST이(가) 생성되었습니다.

-- 실습 4)
SELECT *
  FROM NEW_CUST
; 

-- 실습 5)
CREATE TABLE salesman
AS SELECT *
     FROM emp e
    WHERE E.JOB = 'SALESMAN'
; -- Table SALESMAN이(가) 생성되었습니다.

-- 실습 6)
SELECT *
  FROM salesman
; 
/* EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
----------------------------------------------------------------
7499	ALLEN	SALESMAN	7698	81/02/20	1600	300	 30
7521	WARD	SALESMAN	7698	81/02/22	1250	500	 30
7654	MARTIN	SALESMAN	7698	81/09/28	1250	1400 30
7844	TURNER	SALESMAN	7698	81/09/08	1500	0	 30 */

-- 실습 7)
ALTER TABLE CUSTOMER ADD phone VARCHAR2(11);
ALTER TABLE CUSTOMER ADD grade VARCHAR2(30) CHECK(grade IN('VIP', 'GOLD', 'SILVER'));
--Table CUSTOMER이(가) 변경되었습니다.
--Table CUSTOMER이(가) 변경되었습니다.

-- 실습 8)
ALTER TABLE CUSTOMER DROP COLUMN grade; -- Table CUSTOMER이(가) 변경되었습니다.

-- 실습 9)
ALTER TABLE CUSTOMER MODIFY phone NUMBER(4); -- Table CUSTOMER이(가) 변경되었습니다.
ALTER TABLE CUSTOMER MODIFY phone VARCHAR2(30); -- Table CUSTOMER이(가) 변경되었습니다.