SELECT * FROM attendance;
UPDATE ATTENDANCE
			SET start_time = to_char(SYSDATE, 'HH24:MI:SS')
			, status = 	CASE WHEN to_char(SYSDATE, 'HH24:MI:SS') <= '09:10:00' THEN 0
							WHEN to_char(SYSDATE, 'HH24:MI:SS') > '09:10:00' THEN 1
						END
		WHERE emp_no = 'J001'
		
		
		SELECT 
			CASE  
				WHEN to_date('14:54:33','hh24:mi:ss') <= to_date('09:10:00','hh24:mi:ss') 
				THEN 0
			END as
		FROM dual;
		
	SELECT * FROM ATTENDANCE a ;
	
select * from attendance WHERE EMP_NO='J001' AND ATT_DATE=TO_CHAR(SYSDATE,'YYYY.MM.DD');


		INSERT INTO attendance(no, emp_no, status, att_date, start_time)
		SELECT seq_no.nextval, emp_no, 3, sysdate, 
				from attendance
			WHERE attendance.emp_no = 'J001'
		
			
		--
		INSERT INTO attendance(no, emp_no, att_date, start_time, status)
		VALUES(seq_no.nextval,'J001',TO_CHAR(SYSDATE,'YYYY.MM.DD'),'09:00:10',
		CASE 
					WHEN TO_DATE('09:00:10', 'HH24:MI:SS') <= TO_DATE('09:10:00','HH24:MI:SS') THEN 0
					WHEN TO_DATE('09:00:10', 'HH24:MI:SS') > TO_DATE('09:10:00','HH24:MI:SS') THEN 1
		END); 	
			--

	
	
		
			
			
INSERT INTO ATTENDANCE 
	VALUES(ATTENDANCE_SEQ.NEXTVAL, 'J001',SYSDATE, 3,'15:12:12', '00:00:00', '00:00:00','00:00:00','00:00:00','00:00:00');			

CREATE SEQUENCE ATTENDANCE_SEQ
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 9999
       NOCYCLE
       NOCACHE
       NOORDER;
      
 DROP SEQUENCE ATTENDANCE_SEQ  
 
 SELECT * FROM ATTENDANCE a ;
 
select *
		from attendance 
		WHERE EMP_NO='J001'
			AND ATT_DATE=TO_CHAR(SYSDATE,'YYYY.MM.DD')
			
			
			
	UPDATE attendance
			SET end_time = '18:00:00'
			, status = CASE WHEN TO_DATE(start_time,'HH24:MI:SS') <= TO_DATE('09:10:00','HH24:MI:SS') 
									AND TO_DATE('09:00:10','HH24:MI:SS') < TO_DATE('18:00:00','HH24:MI:SS') then 2
							WHEN TO_DATE(start_time,'HH24:MI:SS') <= TO_DATE('09:10:00','HH24:MI:SS') 
									AND TO_DATE('09:00:10','HH24:MI:SS') > TO_DATE('18:00:00','HH24:MI:SS') then 0
							WHEN TO_DATE(start_time,'HH24:MI:SS') > TO_DATE('09:10:00','HH24:MI:SS') 
									AND TO_DATE('09:00:10','HH24:MI:SS') < TO_DATE('18:00:00','HH24:MI:SS') then 2
							WHEN TO_DATE(start_time,'HH24:MI:SS') > TO_DATE('09:10:00','HH24:MI:SS') 
									AND TO_DATE('09:00:10','HH24:MI:SS') >= TO_DATE('18:00:00','HH24:MI:SS') then 1
						END
			WHERE emp_no = 'J001' AND att_date = TO_CHAR(SYSDATE,'YYYY.MM.DD');
			
		update attendance set end_time = '00:000:00'
		where emp_no = 'J001'
		
		SELECT * FROM ATTENDANCE a ;
	UPDATE ATTENDANCE SET START_TIME ='09:00:00';
