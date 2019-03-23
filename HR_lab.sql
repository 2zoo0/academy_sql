--1. employees 테이블에서 job_id 를 중복 배제하여 조회 하고
--   job_title 같이 출력
--19건
SELECT DISTINCT
       e.job_id
     , j.job_title 
  FROM employees e, jobs j
 WHERE j.job_id = E.job_id
;
/* JOB_ID, JOB_TITLE
---------------------------------------------
AD_ASST	    Administration Assistant
SA_REP	    Sales Representative
IT_PROG	    Programmer
MK_MAN	    Marketing Manager
AC_MGR	    Accounting Manager
FI_MGR	    Finance Manager
AC_ACCOUNT	Public Accountant
PU_MAN	    Purchasing Manager
SH_CLERK	Shipping Clerk
FI_ACCOUNT	Accountant
AD_PRES	    President
SA_MAN	    Sales Manager
MK_REP	    Marketing Representative
AD_VP	    Administration Vice President
PU_CLERK	Purchasing Clerk
ST_MAN	    Stock Manager
ST_CLERK	Stock Clerk
HR_REP	    Human Resources Representative
PR_REP	    Public Relations Representative
*/

--2. employees 테이블에서 사번, 라스트네임, 급여, 커미션 팩터,
--   급여x커미션팩터(null 처리) 조회
--   커미션 컬럼에 대해 null 값이면 0으로 처리하도록 함
--107건
SELECT e.EMPLOYEE_ID
     , e.LAST_NAME
     , e.SALARY
     , nvl(e.COMMISSION_PCT, 0) "COMMISSION_PCT"
     , e.SALARY * nvl(e.COMMISSION_PCT, 0) "SAL x COMM_PCT"
  FROM employees e
;
/* EMPLOYEE_ID, LAST_NAME, SALARY, COMMISSION_PCT, SAL x COMM_PCT
------------------------------------------------------------------
100	King	    24000	0	0
101	Kochhar	    17000	0	0
102	De Haan 	17000	0	0
103	Hunold	    9000	0	0
104	Ernst	    6000	0	0
105	Austin	    4800	0	0
106	Pataballa	4800	0	0
107	Lorentz	    4200	0	0
108	Greenberg	12008	0	0
109	Faviet	    9000	0	0
110	Chen	    8200	0	0
111	Sciarra	    7700	0	0
112	Urman	    7800	0	0
113	Popp	    6900	0	0
114	Raphaely	11000	0	0
115	Khoo	    3100	0	0
116	Baida	2900	0	0
117	Tobias	2800	0	0
118	Himuro	2600	0	0
119	Colmenares	2500	0	0
120	Weiss	8000	0	0
121	Fripp	8200	0	0
122	Kaufling	7900	0	0
123	Vollman	6500	0	0
124	Mourgos	5800	0	0
125	Nayer	3200	0	0
126	Mikkilineni	2700	0	0
127	Landry	2400	0	0
128	Markle	2200	0	0
129	Bissot	3300	0	0
130	Atkinson	2800	0	0
131	Marlow	2500	0	0
132	Olson	2100	0	0
133	Mallin	3300	0	0
134	Rogers	2900	0	0
135	Gee	2400	0	0
136	Philtanker	2200	0	0
137	Ladwig	3600	0	0
138	Stiles	3200	0	0
139	Seo	2700	0	0
140	Patel	2500	0	0
141	Rajs	3500	0	0
142	Davies	3100	0	0
143	Matos	2600	0	0
144	Vargas	2500	0	0
145	Russell	14000	0.4	5600
146	Partners	13500	0.3	4050
147	Errazuriz	12000	0.3	3600
148	Cambrault	11000	0.3	3300
149	Zlotkey	10500	0.2	2100
150	Tucker	10000	0.3	3000
151	Bernstein	9500	0.25	2375
152	Hall	9000	0.25	2250
153	Olsen	8000	0.2	1600
154	Cambrault	7500	0.2	1500
155	Tuvault	7000	0.15	1050
156	King	10000	0.35	3500
157	Sully	9500	0.35	3325
158	McEwen	9000	0.35	3150
159	Smith	8000	0.3	2400
160	Doran	7500	0.3	2250
161	Sewall	7000	0.25	1750
162	Vishney	10500	0.25	2625
163	Greene	9500	0.15	1425
164	Marvins	7200	0.1	720
165	Lee	6800	0.1	680
166	Ande	6400	0.1	640
167	Banda	6200	0.1	620
168	Ozer	11500	0.25	2875
169	Bloom	10000	0.2	2000
170	Fox	9600	0.2	1920
171	Smith	7400	0.15	1110
172	Bates	7300	0.15	1095
173	Kumar	6100	0.1	610
174	Abel	11000	0.3	3300
175	Hutton	8800	0.25	2200
176	Taylor	8600	0.2	1720
177	Livingston	8400	0.2	1680
178	Grant	7000	0.15	1050
179	Johnson	6200	0.1	620
180	Taylor	3200	0	0
181	Fleaur	3100	0	0
182	Sullivan	2500	0	0
183	Geoni	2800	0	0
184	Sarchand	4200	0	0
185	Bull	4100	0	0
186	Dellinger	3400	0	0
187	Cabrio	3000	0	0
188	Chung	3800	0	0
189	Dilly	3600	0	0
190	Gates	2900	0	0
191	Perkins	2500	0	0
192	Bell	4000	0	0
193	Everett	3900	0	0
194	McCain	3200	0	0
195	Jones	2800	0	0
196	Walsh	3100	0	0
197	Feeney	3000	0	0
198	OConnell	2600	0	0
199	Grant	2600	0	0
200	Whalen	4400	0	0
201	Hartstein	13000	0	0
202	Fay	6000	0	0
203	Mavris	6500	0	0
204	Baer	10000	0	0
205	Higgins	12008	0	0
206	Gietz	8300	0	0
*/

 
--3. employees 테이블에서 사번, 라스트네임, 급여, 커미션 팩터(null 값 처리) 조회
--   단, 2007년 이 후 입사자에 대하여 조회, 고용년도 순 오름차순 정렬
--30건
SELECT e.EMPLOYEE_ID
     , e.LAST_NAME
     , e.SALARY
     , nvl(e.COMMISSION_PCT, 0) "COMMISSION_PCT"
  FROM employees e
 WHERE e.HIRE_DATE >= '07/01/01'
 ORDER BY e.HIRE_DATE
;
/* 
EMPLOYEE_ID, LAST_NAME, SALARY, COMMISSION_PCT
-----------------------------------------------
127	Landry	        2400	0
107	Lorentz	        4200	0
187	Cabrio	        3000	0
171	Smith	        7400	0.15
195	Jones	        2800	0
163	Greene	        9500	0.15
172	Bates	        7300	0.15
132	Olson	        2100	0
104	Ernst	        6000	0
178	Grant	        7000	0.15
198	OConnell	    2600	0
182	Sullivan	    2500	0
119	Colmenares	    2500	0
148	Cambrault	    11000	0.3
124	Mourgos	        5800	0
155	Tuvault	        7000	0.15
113	Popp	        6900	0
135	Gee	            2400	0
191	Perkins	        2500	0
179	Johnson	        6200	0.1
199	Grant	        2600	0
164	Marvins	        7200	0.1
149	Zlotkey	        10500	0.2
183	Geoni	        2800	0
136	Philtanker	    2200	0
165	Lee	            6800	0.1
128	Markle	        2200	0
166	Ande	        6400	0.1
167	Banda	        6200	0.1
173	Kumar	        6100	0.1
*/

--4. Finance 부서에 소속된 직원의 목록 조회
--조인으로 해결
SELECT e.EMPLOYEE_ID
     , e.LAST_NAME
     , e.DEPARTMENT_ID
     , d.DEPARTMENT_NAME
  FROM employees e , DEPARTMENTS d
 WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID
   AND d.DEPARTMENT_NAME = 'Finance'
;



--서브쿼리로 해결
SELECT e.EMPLOYEE_ID
     , e.LAST_NAME
     , e.DEPARTMENT_ID
     , (SELECT d.DEPARTMENT_NAME
          FROM departments d
         WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID) "DNAME"
  FROM employees e
 WHERE e.DEPARTMENT_ID = (SELECT d.DEPARTMENT_ID
                            FROM departments d
                           WHERE d.DEPARTMENT_NAME = 'Finance')
;

/* EMPLOYEE_ID, LAST_NAME, DEPARTMENT_ID, DEPARTMENT_NAME
-----------------------------------------------------------
        108	Greenberg	100	Finance
        109	Faviet	    100	Finance
        110	Chen	    100	Finance
        111	Sciarra	    100	Finance
        112	Urman	    100	Finance
        113	Popp	    100	Finance
*/

--6건
 
--5. Steven King 의 직속 부하직원의 모든 정보를 조회
--14건
-- 조인 이용
SELECT e1.*
  FROM employees e1 JOIN employees e2
    ON e1.employee_id = e2.manager_id
 WHERE e1.FIRST_NAME = 'Steven'
   AND e1.LAST_NAME = 'King'
;

-- 서브쿼리 이용
 SELECT *
  FROM employees
 WHERE manager_id = (SELECT employee_id
                       FROM employees
                      WHERE FIRST_NAME = 'Steven'
                        AND LAST_NAME = 'King')
;

/* EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID
---------------------------------------------------------------------------------------------------------------------------------
101	Neena	Kochhar	    NKOCHHAR	515.123.4568	    05/09/21	AD_VP	17000		100	90
102	Lex	    De Haan     LDEHAAN	    515.123.4569	    01/01/13	AD_VP	17000		100	90
114	Den	    Raphaely	DRAPHEAL	515.127.4561    	02/12/07	PU_MAN	11000		100	30
120	Matthew	Weiss	    MWEISS	    650.123.1234    	04/07/18	ST_MAN	8000		100	50
121	Adam	Fripp	    AFRIPP	    650.123.2234    	05/04/10	ST_MAN	8200		100	50
122	Payam	Kaufling	PKAUFLIN	650.123.3234	    03/05/01	ST_MAN	7900		100	50
123	Shanta	Vollman	    SVOLLMAN	650.123.4234	    05/10/10	ST_MAN	6500		100	50
124	Kevin	Mourgos	    KMOURGOS	650.123.5234	    07/11/16	ST_MAN	5800		100	50
145	John	Russell 	JRUSSEL	    011.44.1344.429268	04/10/01	SA_MAN	14000	0.4	100	80
146	Karen	Partners	KPARTNER	011.44.1344.467268	05/01/05	SA_MAN	13500	0.3	100	80
147	Alberto	Errazuriz	AERRAZUR	011.44.1344.429278	05/03/10	SA_MAN	12000	0.3	100	80
148	Gerald	Cambrault	GCAMBRAU	011.44.1344.619268	07/10/15	SA_MAN	11000	0.3	100	80
149	Eleni	Zlotkey 	EZLOTKEY	011.44.1344.429018	08/01/29	SA_MAN	10500	0.2	100	80
201	Michael	Hartstein	MHARTSTE	515.123.5555	    04/02/17	MK_MAN	13000		100	20
조인이용과 서브쿼리 이용 내용이 같으므로 테이블 한개만 주석
*/

--6. Steven King의 직속 부하직원 중에서 Commission_pct 값이 null이 아닌 직원 목록
--5건
SELECT * 
  FROM employees e
 WHERE manager_id = (SELECT employee_id
                       FROM employees
                      WHERE FIRST_NAME = 'Steven'
                        AND LAST_NAME = 'King')
   AND Commission_pct IS NOT NULL
;
/* EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID
---------------------------------------------------------------------------------------------------------------------------------
145	John	Russell	    JRUSSEL	    011.44.1344.429268	04/10/01	SA_MAN	14000	0.4	100	80
146	Karen	Partners	KPARTNER	011.44.1344.467268	05/01/05	SA_MAN	13500	0.3	100	80
147	Alberto	Errazuriz	AERRAZUR	011.44.1344.429278	05/03/10	SA_MAN	12000	0.3	100	80
148	Gerald	Cambrault	GCAMBRAU	011.44.1344.619268	07/10/15	SA_MAN	11000	0.3	100	80
149	Eleni	Zlotkey	    EZLOTKEY	011.44.1344.429018	08/01/29	SA_MAN	10500	0.2	100	80
*/


--7. 각 job 별 최대급여를 구하여 출력 job_id, job_title, job별 최대급여 조회
--19건
SELECT e.JOB_ID
     , (SELECT job_title FROM JOBS WHERE JOB_ID = e.JOB_ID) job_title
     , MAX(salary) "JOB 별 최대급여"
  FROM employees e
 GROUP BY JOB_ID, e.JOB_ID
;
/* JOB_ID, JOB_TITLE, JOB 별 최대급여
----------------------------------------------------
IT_PROG	    Programmer	                    9000
AC_MGR	    Accounting Manager	            12008
AC_ACCOUNT	Public Accountant	            8300
ST_MAN	    Stock Manager	                8200
PU_MAN	    Purchasing Manager	            11000
AD_ASST 	Administration Assistant	    4400
AD_VP	    Administration Vice President	17000
SH_CLERK	Shipping Clerk	                4200
FI_ACCOUNT	Accountant	                    9000
FI_MGR	    Finance Manager	                12008
PU_CLERK	Purchasing Clerk	            3100
SA_MAN	    Sales Manager	                14000
MK_MAN	    Marketing Manager	            13000
PR_REP	    Public Relations Representative	10000
AD_PRES	    President	                    24000
SA_REP	    Sales Representative	        11500
MK_REP	    Marketing Representative	    6000
ST_CLERK	Stock Clerk	                    3600
HR_REP	    Human Resources Representative	6500
*/
 
--8. 각 Job 별 최대급여를 받는 사람의 정보를 출력,
--  급여가 높은 순서로 출력
-- 20건

----서브쿼리 이용
SELECT e.EMPLOYEE_ID
     , e.FIRST_NAME
     , e.LAST_NAME
     , e.EMAIL
     , e.HIRE_DATE
     , e.JOB_ID
     , e.SALARY
  FROM EMPLOYEES e
 WHERE (JOB_ID, salary) IN (SELECT JOB_ID
                                 , MAX(salary)
                              FROM employees
                             GROUP BY JOB_ID)
 ORDER BY e.SALARY DESC
 ;
----join 이용

SELECT e.EMPLOYEE_ID
     , e.FIRST_NAME
     , e.LAST_NAME
     , e.EMAIL
     , e.HIRE_DATE
     , e.JOB_ID
     , e.SALARY
  FROM employees e, (SELECT job_id 
                          , MAX(salary) "MAXSAL"
                       FROM employees
                      GROUP BY JOB_ID) j
 WHERE E.salary = j.MAXSAL
   AND E.job_id = j.job_id
 ORDER BY e.SALARY DESC
;

/*  EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID, SALARY
--------------------------------------------------------------------------
100	Steven	King	SKING	03/06/17	AD_PRES	24000
101	Neena	Kochhar	NKOCHHAR	05/09/21	AD_VP	17000
102	Lex	De Haan	LDEHAAN	01/01/13	AD_VP	17000
145	John	Russell	JRUSSEL	04/10/01	SA_MAN	14000
201	Michael	Hartstein	MHARTSTE	04/02/17	MK_MAN	13000
108	Nancy	Greenberg	NGREENBE	02/08/17	FI_MGR	12008
205	Shelley	Higgins	SHIGGINS	02/06/07	AC_MGR	12008
168	Lisa	Ozer	LOZER	05/03/11	SA_REP	11500
114	Den	Raphaely	DRAPHEAL	02/12/07	PU_MAN	11000
204	Hermann	Baer	HBAER	02/06/07	PR_REP	10000
103	Alexander	Hunold	AHUNOLD	06/01/03	IT_PROG	9000
109	Daniel	Faviet	DFAVIET	02/08/16	FI_ACCOUNT	9000
206	William	Gietz	WGIETZ	02/06/07	AC_ACCOUNT	8300
121	Adam	Fripp	AFRIPP	05/04/10	ST_MAN	8200
203	Susan	Mavris	SMAVRIS	02/06/07	HR_REP	6500
202	Pat	Fay	PFAY	05/08/17	MK_REP	6000
200	Jennifer	Whalen	JWHALEN	03/09/17	AD_ASST	4400
184	Nandita	Sarchand	NSARCHAN	04/01/27	SH_CLERK	4200
137	Renske	Ladwig	RLADWIG	03/07/14	ST_CLERK	3600
115	Alexander	Khoo	AKHOO	03/05/18	PU_CLERK	3100
*/


--20건

--9. 7번 출력시 job_id 대신 Job_name, manager_id 대신 Manager의 last_name, department_id 대신 department_name 으로 출력
--20건

SELECT e.EMPLOYEE_ID
     , e.FIRST_NAME
     , e.LAST_NAME
     , e.EMAIL
     , e.HIRE_DATE
     , j.job_title
     , e.SALARY
     , e1.last_name "Manager's last_name"
     , D.department_name
  FROM employees e
  JOIN departments d
    ON E.department_id = D.department_id
  JOIN JOBS j
    ON E.job_id = j.job_id
  LEFT OUTER JOIN employees e1
    ON E.manager_id = e1.employee_id
 WHERE (e.JOB_ID, e.salary) IN (SELECT JOB_ID
                                 , MAX(salary)
                              FROM employees
                             GROUP BY JOB_ID)
 ORDER BY e.SALARY DESC
 ;
 
/* EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, HIRE_DATE, JOB_TITLE, SALARY, Manager's last_name, DEPARTMENT_NAME
--------------------------------------------------------------------------------------------------------------------------
100	Steven	King	SKING	    03/06/17	President	                    24000		    Executive
101	Neena	Kochhar	NKOCHHAR	05/09/21	Administration Vice President	17000	King	Executive
102	Lex	    De Haan	LDEHAAN	    01/01/13	Administration Vice President	17000	King	Executive
145	John	Russell	JRUSSEL	04/10/01	Sales Manager	14000	King	Sales
201	Michael	Hartstein	MHARTSTE	04/02/17	Marketing Manager	13000	King	Marketing
108	Nancy	Greenberg	NGREENBE	02/08/17	Finance Manager	12008	Kochhar	Finance
205	Shelley	Higgins	SHIGGINS	02/06/07	Accounting Manager	12008	Kochhar	Accounting
168	Lisa	Ozer	LOZER	05/03/11	Sales Representative	11500	Cambrault	Sales
114	Den	Raphaely	DRAPHEAL	02/12/07	Purchasing Manager	11000	King	Purchasing
204	Hermann	Baer	HBAER	02/06/07	Public Relations Representative	10000	Kochhar	Public Relations
103	Alexander	Hunold	AHUNOLD	06/01/03	Programmer	9000	De Haan	IT
109	Daniel	Faviet	DFAVIET	02/08/16	Accountant	9000	Greenberg	Finance
206	William	Gietz	WGIETZ	02/06/07	Public Accountant	8300	Higgins	Accounting
121	Adam	Fripp	AFRIPP	05/04/10	Stock Manager	8200	King	Shipping
203	Susan	Mavris	SMAVRIS	02/06/07	Human Resources Representative	6500	Kochhar	Human Resources
202	Pat	Fay	PFAY	05/08/17	Marketing Representative	6000	Hartstein	Marketing
200	Jennifer	Whalen	JWHALEN	03/09/17	Administration Assistant	4400	Kochhar	Administration
184	Nandita	Sarchand	NSARCHAN	04/01/27	Shipping Clerk	4200	Fripp	Shipping
137	Renske	Ladwig	RLADWIG	03/07/14	Stock Clerk	3600	Vollman	Shipping
115	Alexander	Khoo	AKHOO	03/05/18	Purchasing Clerk	3100	Raphaely	Purchasing
*/


--10. 전체 직원의 급여 평균을 구하여 출력
SELECT AVG(e.salary) "AVG salary"-- 6461.831775700934579439252336448598130841
  FROM employees e
;

--11. 전체 직원의 급여 평균보다 높은 급여를 받는 사람의 목록 출력. 급여 오름차순 정렬
--51건

SELECT e.employee_id
     , e.first_name ||' '|| e.last_name empName
     , e.salary
  FROM employees e
 WHERE e.salary > (SELECT AVG(e.salary)
                     FROM employees e)
 ORDER BY e.salary
;
/* EMPLOYEE_ID, EMPNAME, SALARY
--------------------------------
203	Susan Mavris	    6500
123	Shanta Vollman	    6500
165	David Lee	        6800
113	Luis Popp	        6900
155	Oliver Tuvault	    7000
161	Sarath Sewall	    7000
178	Kimberely Grant 	7000
164	Mattea Marvins	    7200
172	Elizabeth Bates	    7300
171	William Smith	    7400
154	Nanette Cambrault	7500
160	Louise Doran	    7500
111	Ismael Sciarra	    7700
112	Jose Manuel Urman	7800
122	Payam Kaufling	    7900
120	Matthew Weiss	    8000
159	Lindsey Smith	    8000
153	Christopher Olsen	8000
121	Adam Fripp	        8200
110	John Chen	        8200
206	William Gietz	    8300
177	Jack Livingston 	8400
176	Jonathon Taylor	    8600
175	Alyssa Hutton	    8800
158	Allan McEwen	    9000
152	Peter Hall	        9000
109	Daniel Faviet	    9000
103	Alexander Hunold	9000
157	Patrick Sully	    9500
151	David Bernstein	    9500
163	Danielle Greene	    9500
170	Tayler Fox	        9600
156	Janette King	    10000
150	Peter Tucker	    10000
204	Hermann Baer	    10000
169	Harrison Bloom	    10000
149	Eleni Zlotkey	    10500
162	Clara Vishney	    10500
174	Ellen Abel	        11000
148	Gerald Cambrault	11000
114	Den Raphaely	    11000
168	Lisa Ozer	        11500
147	Alberto Errazuriz	12000
108	Nancy Greenberg	    12008
205	Shelley Higgins	    12008
201	Michael Hartstein	13000
146	Karen Partners	    13500
145	John Russell	    14000
102	Lex De Haan	        17000
101	Neena Kochhar	    17000
100	Steven King	        24000
*/

--12. 각 부서별 평균 급여를 구하여 출력
--12건
SELECT e.department_id
     , TO_CHAR(AVG(e.salary), 99999.99) 평균급여
  FROM employees e
 GROUP BY e.department_id
;
/* DEPARTMENT_ID, 평균급여
--------------------------
            100	  8601.33
            30	  4150.00
                  7000.00
            90	 19333.33
            20	  9500.00
            70	 10000.00
            110	 10154.00
            50	  3475.56
            80	  8955.88
            40	  6500.00
            60	  5760.00
            10	  4400.00
*/
--13. 12번의 결과에 department_name 같이 출력
--12건
SELECT e.department_id
     , (SELECT DEPARTMENT_NAME
          FROM departments
         WHERE department_id = e.department_id) department_name
     , TO_CHAR(AVG(e.salary), 99999.99) 평균급여
  FROM employees e
 GROUP BY e.department_id
;
/* DEPARTMENT_ID, DEPARTMENT_NAME, 평균급여
100	Finance	              8601.33
30	Purchasing	          4150.00
                          7000.00
90	Executive	         19333.33
20	Marketing	          9500.00
70	Public Relations	 10000.00
110	Accounting	         10154.00
50	Shipping	          3475.56
80	Sales	              8955.88
40	Human Resources	      6500.00
60	IT	                  5760.00
10	Administration	      4400.00
*/

--14. employees 테이블이 각 job_id 별 인원수와 job_title을 같이 출력하고 job_id 오름차순 정렬
-- 19건
SELECT e.job_id
     , (SELECT job_title
          FROM jobs j
         WHERE j.job_id = e.job_id) job_title
     , count(*) 인원수
  FROM employees e
 GROUP BY e.job_id
 ORDER BY job_id
;

/*  JOB_ID,      JOB_TITLE,    인원수
---------------------------------------------
AC_ACCOUNT	Public Accountant	            1
AC_MGR	    Accounting Manager	            1
AD_ASST 	Administration Assistant	    1
AD_PRES	    President	                    1
AD_VP	    Administration Vice President	2
FI_ACCOUNT	Accountant	                    5
FI_MGR	    Finance Manager	                1
HR_REP	    Human Resources Representative	1
IT_PROG 	Programmer	                    5
MK_MAN	    Marketing Manager	            1
MK_REP	    Marketing Representative	    1
PR_REP	    Public Relations Representative	1
PU_CLERK	Purchasing Clerk	            5
PU_MAN	    Purchasing Manager	            1
SA_MAN	    Sales Manager	                5
SA_REP	    Sales Representative	        30
SH_CLERK	Shipping Clerk	                20
ST_CLERK	Stock Clerk	                    20
ST_MAN	    Stock Manager	                5
*/

--15. employees 테이블의 job_id별 최저급여,
--   최대급여를 job_title과 함께 출력 job_id 알파벳순 오름차순 정렬
-- 19건
SELECT e.job_id
     , (SELECT job_title
          FROM jobs j
         WHERE j.job_id = e.job_id) job_title
     , min(e.salary) 최저급여
  FROM employees e
 GROUP BY e.job_id
 ORDER BY job_id
;
/* JOB_ID, JOB_TITLE, 최저급여
-----------------------------------------
AC_ACCOUNT	Public Accountant	8300
AC_MGR	Accounting Manager	12008
AD_ASST	Administration Assistant	4400
AD_PRES	President	24000
AD_VP	Administration Vice President	17000
FI_ACCOUNT	Accountant	6900
FI_MGR	Finance Manager	12008
HR_REP	Human Resources Representative	6500
IT_PROG	Programmer	4200
MK_MAN	Marketing Manager	13000
MK_REP	Marketing Representative	6000
PR_REP	Public Relations Representative	10000
PU_CLERK	Purchasing Clerk	2500
PU_MAN	Purchasing Manager	11000
SA_MAN	Sales Manager	10500
SA_REP	Sales Representative	6100
SH_CLERK	Shipping Clerk	2500
ST_CLERK	Stock Clerk	2100
ST_MAN	Stock Manager	5800
*/
 --16. Employees 테이블에서 인원수가 가장 많은 job_id를 구하고
--   해당 job_id 의 job_title 과 그 때 직원의 인원수를 같이 출력

SELECT e.JOB_ID
     , J.JOB_TITLE
     , COUNT(e.job_id) "인원수"
  FROM EMPLOYEES e, JOBS j
 WHERE E.JOB_ID = J.JOB_ID 
 GROUP BY e.JOB_ID, J.JOB_TITLE
HAVING COUNT(*) = (SELECT MAX(COUNT(*))
                    FROM EMPLOYEES e
                   GROUP BY e.JOB_ID)
;

/* JOB_ID, JOB_TITLE, 인원수
-----------------------------------
SA_REP	Sales Representative	30
*/

--17.사번,last_name, 급여, 직책이름(job_title), 부서명(department_name), 부서매니저이름
--  부서 위치 도시(city), 나라(country_name), 지역(region_name) 을 출력
----------- 부서가 배정되지 않은 인원 고려 ------
-- 107건
SELECT e.EMPLOYEE_ID 사번
     , e.LAST_NAME 이름
     , e.SALARY 급여
     , j.JOB_TITLE 직책이름
     , d.DEPARTMENT_NAME 부서명
     , (SELECT emp.LAST_NAME 
          FROM employees emp 
         WHERE emp.EMPLOYEE_ID = d.DEPARTMENT_ID) 부서매니저이름
     , l.CITY 도시
     , c.COUNTRY_NAME 나라
     , r.REGION_NAME 지역
  FROM EMPLOYEES e LEFT OUTER JOIN DEPARTMENTS d
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
  JOIN JOBS j
    ON e.JOB_ID = j.JOB_ID
  LEFT OUTER JOIN LOCATIONS l
    ON l.LOCATION_ID = d.LOCATION_ID
  LEFT OUTER JOIN COUNTRIES c
    ON c.COUNTRY_ID = l.COUNTRY_ID
  LEFT OUTER JOIN REGIONS r
    ON r.REGION_ID = c.REGION_ID
 ORDER BY e.EMPLOYEE_ID 
;




/*  사번, 이름, 급여, 직책이름, 부서명, 부서매니저이름, 도시, 나라, 지역
-------------------------------------------------------------------------------------------------------------------
100	King	24000	President	Executive		Seattle	United States of America	Americas
101	Kochhar	17000	Administration Vice President	Executive		Seattle	United States of America	Americas
102	De Haan	17000	Administration Vice President	Executive		Seattle	United States of America	Americas
103	Hunold	9000	Programmer	IT		Southlake	United States of America	Americas
104	Ernst	6000	Programmer	IT		Southlake	United States of America	Americas
105	Austin	4800	Programmer	IT		Southlake	United States of America	Americas
106	Pataballa	4800	Programmer	IT		Southlake	United States of America	Americas
107	Lorentz	4200	Programmer	IT		Southlake	United States of America	Americas
108	Greenberg	12008	Finance Manager	Finance	King	Seattle	United States of America	Americas
109	Faviet	9000	Accountant	Finance	King	Seattle	United States of America	Americas
110	Chen	8200	Accountant	Finance	King	Seattle	United States of America	Americas
111	Sciarra	7700	Accountant	Finance	King	Seattle	United States of America	Americas
112	Urman	7800	Accountant	Finance	King	Seattle	United States of America	Americas
113	Popp	6900	Accountant	Finance	King	Seattle	United States of America	Americas
114	Raphaely	11000	Purchasing Manager	Purchasing		Seattle	United States of America	Americas
115	Khoo	3100	Purchasing Clerk	Purchasing		Seattle	United States of America	Americas
116	Baida	2900	Purchasing Clerk	Purchasing		Seattle	United States of America	Americas
117	Tobias	2800	Purchasing Clerk	Purchasing		Seattle	United States of America	Americas
118	Himuro	2600	Purchasing Clerk	Purchasing		Seattle	United States of America	Americas
119	Colmenares	2500	Purchasing Clerk	Purchasing		Seattle	United States of America	Americas
120	Weiss	8000	Stock Manager	Shipping		South San Francisco	United States of America	Americas
121	Fripp	8200	Stock Manager	Shipping		South San Francisco	United States of America	Americas
122	Kaufling	7900	Stock Manager	Shipping		South San Francisco	United States of America	Americas
123	Vollman	6500	Stock Manager	Shipping		South San Francisco	United States of America	Americas
124	Mourgos	5800	Stock Manager	Shipping		South San Francisco	United States of America	Americas
125	Nayer	3200	Stock Clerk	Shipping		South San Francisco	United States of America	Americas
126	Mikkilineni	2700	Stock Clerk	Shipping		South San Francisco	United States of America	Americas
127	Landry	2400	Stock Clerk	Shipping		South San Francisco	United States of America	Americas
128	Markle	2200	Stock Clerk	Shipping		South San Francisco	United States of America	Americas
129	Bissot	3300	Stock Clerk	Shipping		South San Francisco	United States of America	Americas
130	Atkinson	2800	Stock Clerk	Shipping		South San Francisco	United States of America	Americas
131	Marlow	2500	Stock Clerk	Shipping		South San Francisco	United States of America	Americas
132	Olson	2100	Stock Clerk	Shipping		South San Francisco	United States of America	Americas
133	Mallin	3300	Stock Clerk	Shipping		South San Francisco	United States of America	Americas
134	Rogers	2900	Stock Clerk	Shipping		South San Francisco	United States of America	Americas
135	Gee	2400	Stock Clerk	Shipping		South San Francisco	United States of America	Americas
136	Philtanker	2200	Stock Clerk	Shipping		South San Francisco	United States of America	Americas
137	Ladwig	3600	Stock Clerk	Shipping		South San Francisco	United States of America	Americas
138	Stiles	3200	Stock Clerk	Shipping		South San Francisco	United States of America	Americas
139	Seo	2700	Stock Clerk	Shipping		South San Francisco	United States of America	Americas
140	Patel	2500	Stock Clerk	Shipping		South San Francisco	United States of America	Americas
141	Rajs	3500	Stock Clerk	Shipping		South San Francisco	United States of America	Americas
142	Davies	3100	Stock Clerk	Shipping		South San Francisco	United States of America	Americas
143	Matos	2600	Stock Clerk	Shipping		South San Francisco	United States of America	Americas
144	Vargas	2500	Stock Clerk	Shipping		South San Francisco	United States of America	Americas
145	Russell	14000	Sales Manager	Sales		Oxford	United Kingdom	Europe
146	Partners	13500	Sales Manager	Sales		Oxford	United Kingdom	Europe
147	Errazuriz	12000	Sales Manager	Sales		Oxford	United Kingdom	Europe
148	Cambrault	11000	Sales Manager	Sales		Oxford	United Kingdom	Europe
149	Zlotkey	10500	Sales Manager	Sales		Oxford	United Kingdom	Europe
150	Tucker	10000	Sales Representative	Sales		Oxford	United Kingdom	Europe
151	Bernstein	9500	Sales Representative	Sales		Oxford	United Kingdom	Europe
152	Hall	9000	Sales Representative	Sales		Oxford	United Kingdom	Europe
153	Olsen	8000	Sales Representative	Sales		Oxford	United Kingdom	Europe
154	Cambrault	7500	Sales Representative	Sales		Oxford	United Kingdom	Europe
155	Tuvault	7000	Sales Representative	Sales		Oxford	United Kingdom	Europe
156	King	10000	Sales Representative	Sales		Oxford	United Kingdom	Europe
157	Sully	9500	Sales Representative	Sales		Oxford	United Kingdom	Europe
158	McEwen	9000	Sales Representative	Sales		Oxford	United Kingdom	Europe
159	Smith	8000	Sales Representative	Sales		Oxford	United Kingdom	Europe
160	Doran	7500	Sales Representative	Sales		Oxford	United Kingdom	Europe
161	Sewall	7000	Sales Representative	Sales		Oxford	United Kingdom	Europe
162	Vishney	10500	Sales Representative	Sales		Oxford	United Kingdom	Europe
163	Greene	9500	Sales Representative	Sales		Oxford	United Kingdom	Europe
164	Marvins	7200	Sales Representative	Sales		Oxford	United Kingdom	Europe
165	Lee	6800	Sales Representative	Sales		Oxford	United Kingdom	Europe
166	Ande	6400	Sales Representative	Sales		Oxford	United Kingdom	Europe
167	Banda	6200	Sales Representative	Sales		Oxford	United Kingdom	Europe
168	Ozer	11500	Sales Representative	Sales		Oxford	United Kingdom	Europe
169	Bloom	10000	Sales Representative	Sales		Oxford	United Kingdom	Europe
170	Fox	9600	Sales Representative	Sales		Oxford	United Kingdom	Europe
171	Smith	7400	Sales Representative	Sales		Oxford	United Kingdom	Europe
172	Bates	7300	Sales Representative	Sales		Oxford	United Kingdom	Europe
173	Kumar	6100	Sales Representative	Sales		Oxford	United Kingdom	Europe
174	Abel	11000	Sales Representative	Sales		Oxford	United Kingdom	Europe
175	Hutton	8800	Sales Representative	Sales		Oxford	United Kingdom	Europe
176	Taylor	8600	Sales Representative	Sales		Oxford	United Kingdom	Europe
177	Livingston	8400	Sales Representative	Sales		Oxford	United Kingdom	Europe
178	Grant	7000	Sales Representative					
179	Johnson	6200	Sales Representative	Sales		Oxford	United Kingdom	Europe
180	Taylor	3200	Shipping Clerk	Shipping		South San Francisco	United States of America	Americas
181	Fleaur	3100	Shipping Clerk	Shipping		South San Francisco	United States of America	Americas
182	Sullivan	2500	Shipping Clerk	Shipping		South San Francisco	United States of America	Americas
183	Geoni	2800	Shipping Clerk	Shipping		South San Francisco	United States of America	Americas
184	Sarchand	4200	Shipping Clerk	Shipping		South San Francisco	United States of America	Americas
185	Bull	4100	Shipping Clerk	Shipping		South San Francisco	United States of America	Americas
186	Dellinger	3400	Shipping Clerk	Shipping		South San Francisco	United States of America	Americas
187	Cabrio	3000	Shipping Clerk	Shipping		South San Francisco	United States of America	Americas
188	Chung	3800	Shipping Clerk	Shipping		South San Francisco	United States of America	Americas
189	Dilly	3600	Shipping Clerk	Shipping		South San Francisco	United States of America	Americas
190	Gates	2900	Shipping Clerk	Shipping		South San Francisco	United States of America	Americas
191	Perkins	2500	Shipping Clerk	Shipping		South San Francisco	United States of America	Americas
192	Bell	4000	Shipping Clerk	Shipping		South San Francisco	United States of America	Americas
193	Everett	3900	Shipping Clerk	Shipping		South San Francisco	United States of America	Americas
194	McCain	3200	Shipping Clerk	Shipping		South San Francisco	United States of America	Americas
195	Jones	2800	Shipping Clerk	Shipping		South San Francisco	United States of America	Americas
196	Walsh	3100	Shipping Clerk	Shipping		South San Francisco	United States of America	Americas
197	Feeney	3000	Shipping Clerk	Shipping		South San Francisco	United States of America	Americas
198	OConnell	2600	Shipping Clerk	Shipping		South San Francisco	United States of America	Americas
199	Grant	2600	Shipping Clerk	Shipping		South San Francisco	United States of America	Americas
200	Whalen	4400	Administration Assistant	Administration		Seattle	United States of America	Americas
201	Hartstein	13000	Marketing Manager	Marketing		Toronto	Canada	Americas
202	Fay	6000	Marketing Representative	Marketing		Toronto	Canada	Americas
203	Mavris	6500	Human Resources Representative	Human Resources		London	United Kingdom	Europe
204	Baer	10000	Public Relations Representative	Public Relations		Munich	Germany	Europe
205	Higgins	12008	Accounting Manager	Accounting	Chen	Seattle	United States of America	Americas
206	Gietz	8300	Public Accountant	Accounting	Chen	Seattle	United States of America	Americas				
*/

--18.부서 아이디, 부서명, 부서에 속한 인원숫자를 출력
-- 27건
SELECT d.DEPARTMENT_ID "부서 아이디"
     , d.DEPARTMENT_NAME "부서명"
     , COUNT(e.employee_id) "인원수"
  FROM EMPLOYEES e RIGHT OUTER JOIN departments d
 ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
 GROUP BY d.DEPARTMENT_ID , d.DEPARTMENT_NAME
 ORDER BY d.DEPARTMENT_ID
;
/* 부서 아이디, 부서명, 인원수
-----------------------------
10	Administration	1
20	Marketing	2
30	Purchasing	6
40	Human Resources	1
50	Shipping	45
60	IT	5
70	Public Relations	1
80	Sales	34
90	Executive	3
100	Finance	6
110	Accounting	2
120	Treasury	0
130	Corporate Tax	0
140	Control And Credit	0
150	Shareholder Services	0
160	Benefits	0
170	Manufacturing	0
180	Construction	0
190	Contracting	0
200	Operations	0
210	IT Support	0
220	NOC	0
230	IT Helpdesk	0
240	Government Sales	0
250	Retail Sales	0
260	Recruiting	0
270	Payroll	0
*/


--19.인원이 가장 많은 상위 다섯 부서아이디, 부서명, 인원수 목록 출력
-- 5건
SELECT *
  FROM (SELECT d.DEPARTMENT_ID "부서아이디"
             , d.DEPARTMENT_NAME "부서명"
             , COUNT(*) "인원수"
          FROM EMPLOYEES e RIGHT OUTER JOIN departments d
            ON E.DEPARTMENT_ID = d.DEPARTMENT_ID
         GROUP BY d.DEPARTMENT_ID, d.DEPARTMENT_NAME
         ORDER BY "인원수" DESC) a
 WHERE ROWNUM <= 5
;
 
/* 부서아이디, 부서명, 인원수
-----------------------------
50	Shipping	45
80	Sales	34
100	Finance	6
30	Purchasing	6
60	IT	5
*/

--20. 부서별, 직책별 평균 급여를 구하여라.
--   부서이름, 직책이름, 평균급여 소수점 둘째자리에서 반올림으로 구하여라.
-- 19건
SELECT d.department_name "부서이름"
     , j.job_title "직책이름"
     , TO_CHAR(TRUNC(AVG(E.salary), 2), '999,999.00') "평균급여"
  FROM employees e , jobs j, departments d
 WHERE e.department_id = d.department_id
   AND e.job_id = j.job_id
 GROUP BY e.department_id, e.job_id, d.department_name, j.job_title
;
/* 부서이름, 직책이름, 평균급여
---------------------------------------------------------------------
Accounting	Public Accountant	   8,300.00
Purchasing	Purchasing Clerk	   2,780.00
Shipping	Shipping Clerk	   3,215.00
Finance	    Finance Manager	  12,008.00
Finance	    Accountant	   7,920.00
Purchasing	Purchasing Manager	  11,000.00
Human Resources	Human Resources Representative	   6,500.00
Public Relations	Public Relations Representative	  10,000.00
Sales	Sales Representative	   8,396.55
Sales	Sales Manager	  12,200.00
Shipping	Stock Clerk	   2,785.00
Executive	Administration Vice President	  17,000.00
Administration	Administration Assistant	   4,400.00
Shipping	Stock Manager	   7,280.00
Marketing	Marketing Manager	  13,000.00
IT	Programmer	   5,760.00
Accounting	Accounting Manager	  12,008.00
Marketing	Marketing Representative	   6,000.00
Executive	President	  24,000.00
*/

--21.각 부서의 정보를 부서매니저 이름과 함께 출력(부서는 모두 출력되어야 함)
-- 27건
SELECT d.DEPARTMENT_ID "부서아이디"
     , d.DEPARTMENT_NAME "부서명"
     , e.first_name|| ' ' ||e.last_name "부서매니저 이름"
     , l.city "도시명"
  FROM departments d LEFT OUTER JOIN employees e
    ON d.manager_id = e.employee_id
  LEFT OUTER JOIN locations l
   ON d.location_id = l.location_id
;
/* 부서아이디, 부서명, 부서매니저 이름, 도시명
------------------------------------------------------
90	Executive	        Steven King	        Seattle
60	IT	                Alexander Hunold	Southlake
100	Finance	            Nancy Greenberg	    Seattle
30	Purchasing	        Den Raphaely	    Seattle
50	Shipping	        Adam Fripp	        South San Francisco
80	Sales	            John Russell	    Oxford
10	Administration	    Jennifer Whalen	    Seattle
20	Marketing	        Michael Hartstein	Toronto
40	Human Resources	    Susan Mavris	    London
70	Public Relations	Hermann Baer	    Munich
110	Accounting	        Shelley Higgins	    Seattle
120	Treasury	 	                        Seattle
130	Corporate Tax	 	                    Seattle
140	Control And Credit	 	                Seattle
150	Shareholder Services	 	            Seattle
160	Benefits	 	                        Seattle
170	Manufacturing	 	                    Seattle
180	Construction	 	                    Seattle
190	Contracting	 	                        Seattle
200	Operations	 	                        Seattle
210	IT Support	 	                        Seattle
220	NOC	 	                                Seattle
230	IT Helpdesk	 	                        Seattle
240	Government Sales	                	Seattle
250	Retail Sales	 	                    Seattle
260	Recruiting	                        	Seattle
270	Payroll	 	                            Seattle
*/

--22. 부서가 가장 많은 도시이름을 출력
SELECT l.city "도시"
     , COUNT(*) "부서가 가장 많은 도시"
  FROM departments d, locations l
 WHERE d.location_id = l.location_id
 GROUP BY d.location_id, l.city
HAVING COUNT(*) = (SELECT MAX(COUNT(*))
                     FROM departments
                    GROUP BY location_id)
;
/* 도시, 부서가 가장 많은 도시
   Seattle	            21
*/

--23. 부서가 없는 도시 목록 출력
-- 16건
--조인사용
SELECT l.city "도시"
  FROM departments d RIGHT OUTER JOIN locations l
    ON d.location_id = l.location_id
 GROUP BY l.city, d.department_name 
HAVING(d.department_name IS NULL)
;

--집합연산 사용
SELECT l.city "도시"
  FROM departments d RIGHT OUTER JOIN locations l
    ON d.location_id = l.location_id
 GROUP BY l.city, d.department_name 
MINUS
SELECT l.city "도시"
     , d.department_name "부서가 없는 도시"
  FROM departments d , locations l
 WHERE d.location_id = l.location_id
;
--서브쿼리 사용  
SELECT l.city
  FROM locations l
 WHERE NOT L.location_id IN(SELECT D.location_id
                              FROM departments d)
;
/* CITY
------------
Roma
Venice
Tokyo
Hiroshima
South Brunswick
Whitehorse
Beijing
Bombay
Sydney
Singapore
Stretford
Sao Paulo
Geneva
Bern
Utrecht
Mexico City
*/

--24.평균 급여가 가장 높은 부서명을 출력
SELECT d.department_name "부서명"
     , TRUNC(AVG(e.salary), 2) "평균 급여"
  FROM employees e, departments d
 WHERE e.department_id = d.department_id
 GROUP BY d.department_name
HAVING AVG(salary) = (SELECT MAX(AVG(salary))
                        FROM employees
                       GROUP BY department_id)
;
/* 부서명, 평균 급여
Executive	19333.33
*/

--25. Finance 부서의 평균 급여보다 높은 급여를 받는 직원의 목록 출력
-- 28건
SELECT e.employee_id "직원 아이디"
     , e.first_name || ' ' || e.last_name "직원명"
     , TRUNC(AVG(e.salary), 2) "평균 급여"
  FROM employees e, departments d
 WHERE e.department_id = d.department_id
 GROUP BY d.department_name, e.employee_id, e.first_name || ' ' || e.last_name
HAVING AVG(salary) >= (SELECT AVG(e.salary)
                        FROM employees e
                       WHERE e.department_id = (SELECT d.department_id
                                                  FROM departments d
                                                 WHERE d.department_name = 'Finance'))
;
/* 직원 아이디, 직원명, 평균 급여
---------------------------------
114	Den Raphaely	11000
147	Alberto Errazuriz	12000
152	Peter Hall	9000
175	Alyssa Hutton	8800
102	Lex De Haan	17000
205	Shelley Higgins	12008
168	Lisa Ozer	11500
204	Hermann Baer	10000
145	John Russell	14000
150	Peter Tucker	10000
108	Nancy Greenberg	12008
109	Daniel Faviet	9000
103	Alexander Hunold	9000
156	Janette King	10000
158	Allan McEwen	9000
148	Gerald Cambrault	11000
163	Danielle Greene	9500
201	Michael Hartstein	13000
146	Karen Partners	13500
157	Patrick Sully	9500
170	Tayler Fox	9600
174	Ellen Abel	11000
151	David Bernstein	9500
162	Clara Vishney	10500
101	Neena Kochhar	17000
149	Eleni Zlotkey	10500
169	Harrison Bloom	10000
100	Steven King	24000
*/

-- 26. 각 부서별 인원수를 출력하되, 인원이 없는 부서는 0으로 나와야 하며
--     부서는 정식 명칭으로 출력하고 인원이 많은 순서로 정렬.
-- 27건
SELECT d.department_name "부서명"
     , count(e.employee_id) "인원수"
  FROM employees e RIGHT OUTER JOIN departments d
    ON e.department_id = d.department_id
 GROUP BY e.department_id, d.department_name
 ORDER BY "인원수" DESC
;

/* 부서명, 인원수
-----------------
Shipping	45
Sales	34
Purchasing	6
Finance	6
IT	5
Executive	3
Accounting	2
Marketing	2
Administration	1
Public Relations	1
Human Resources	1
Control And Credit	0
Shareholder Services	0
IT Helpdesk	0
Operations	0
Payroll	0
Recruiting	0
Retail Sales	0
NOC	0
Contracting	0
Corporate Tax	0
Benefits	0
Government Sales	0
Construction	0
Manufacturing	0
IT Support	0
Treasury	0
*/
--27. 지역별 등록된 나라의 갯수 출력(지역이름, 등록된 나라의 갯수)
-- 4건
SELECT r.region_name "지역이름"
     , COUNT(c.region_id) "등록된 나라의 갯수"
  FROM countries c, regions r
 WHERE c.region_id = r.region_id
 GROUP BY r.region_name
;
/* 지역이름,    등록된 나라의 갯수
-------------------------------        
    Middle East and Africa	6
    Europe	                8
    Asia	                6
    Americas	            5
*/

 
--28. 가장 많은 나라가 등록된 지역명 출력
-- 1건
SELECT r.region_name "최다 나라 등록된지역"
  FROM countries c, regions r
 WHERE c.region_id = r.region_id
 GROUP BY r.region_name HAVING((SELECT MAX(COUNT(c.region_id))
                                  FROM countries c, regions r
                                 WHERE c.region_id = r.region_id
                                 GROUP BY r.region_name) = COUNT(c.region_id))
;

/* 최다 나라 등록된지역
Europe
*/