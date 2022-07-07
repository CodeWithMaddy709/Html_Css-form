
-- 2a)
DECLARE 
     message varchar2(55) := ' ';
     current_lc_type levelclass.LC_TYPE%TYPE;
     current_lc_desc levelclass.LC_DESC%TYPE;
     current_lc_min levelclass.LC_MIN%TYPE; 
     current_lc_max levelclass.LC_MAX%TYPE;
     CURSOR class_cursor IS
       SELECT LC_TYPE,LC_DESC,LC_MIN,LC_MAX
       FROM levelclass;
BEGIN
    OPEN class_cursor;
    DBMS_OUTPUT.PUT_LINE('The List of LEVEL CLASS are:');
    LOOP 
        FETCH class_cursor INTO current_lc_type,current_lc_desc,current_lc_min,current_lc_max;
        EXIT WHEN class_cursor%NOTFOUND;
        IF ( current_lc_max <= 12 ) THEN 
           message  := 'Need to upgrade this class building';
       ELSIF ( current_lc_max <= 30 and current_lc_min > 12 ) THEN 
       message  := 'Need to Renovate this class building';
       ELSIF ( current_lc_max <= 90 and current_lc_min > 30 ) THEN 
       message  := 'No Renovation for this class building';
       ELSE 
        message  := 'Need to equip this class building with new speakers';
   END IF; 
        DBMS_OUTPUT.PUT_LINE('LC Type: '||current_lc_type||', Desc of Class : '||current_lc_desc||', '||message);
        
    END LOOP;
    CLOSE class_cursor;
END;

-- 2.b)
DECLARE 
     teacher varchar2(55) := ' ';
     current_S_ID STUDENT.S_ID%TYPE;
     current_S_LAST STUDENT.S_LAST%TYPE;
     current_S_FIRST STUDENT.S_FIRST%TYPE; 
     current_S_CLASS STUDENT.S_CLASS%TYPE;
     current_F_ID STUDENT.F_ID%TYPE;
     CURSOR student_cursor IS
       SELECT S_LAST,S_FIRST,S_CLASS,F_ID
       FROM STUDENT;
BEGIN
    OPEN student_cursor;
    DBMS_OUTPUT.PUT_LINE('The List of students of Vanier College are:');
    LOOP 
        FETCH student_cursor INTO current_S_LAST, current_S_FIRST,current_S_CLASS,current_F_ID;
        EXIT WHEN student_cursor%NOTFOUND;
        IF ( current_F_ID= 1 ) THEN 
          teacher  := 'Robertson Myra';
       ELSIF ( current_F_ID= 2  ) THEN 
       teacher  := 'Smith Neal';
       ELSIF ( current_F_ID= 3  ) THEN 
      teacher  := 'Arlec Lisa';
       ELSIF ( current_F_ID= 4  ) THEN 
      teacher  := 'Fillipo Paul';
       ELSE 
       teacher  := ' ';
   END IF; 
       
        DBMS_OUTPUT.PUT_LINE(current_S_LAST||'  '||current_S_FIRST||', who`s S_class is '||current_S_CLASS||', Supervisor name: '||teacher);
    END LOOP;
    CLOSE student_cursor;
END;






-- 2.c)

DECLARE 
     total number(10):=0;
     current_COURSE_NO course.COURSE_NO%TYPE;
     current_MAX_ENRL course.MAX_ENRL%TYPE;
     CURSOR course_cursor IS
       SELECT COURSE_NO,MAX_ENRL
       FROM course;
BEGIN
    OPEN course_cursor;
    DBMS_OUTPUT.PUT_LINE('The Total of available seat courses is:');
    LOOP 
        FETCH course_cursor INTO current_COURSE_NO, current_MAX_ENRL;
        EXIT WHEN course_cursor%NOTFOUND;
       
       
        DBMS_OUTPUT.PUT_LINE('The Course Inf  '||current_COURSE_NO||', Course Literal String and Course Code '||current_COURSE_NO||', Course Seates '|| current_MAX_ENRL);
        total:=total+current_MAX_ENRL;
    END LOOP;
     DBMS_OUTPUT.PUT_LINE('The Total of  course Numbering is :'||total);
    CLOSE course_cursor;
END;

-- 3a)
DECLARE 
     current_F_ID faculty.F_ID%TYPE;
     current_F_LAST faculty.F_LAST%TYPE;
     current_F_FIRST faculty.F_FIRST%TYPE;
     CURSOR faculty_cursor IS
       SELECT F_ID,F_LAST,F_FIRST
       FROM faculty;
BEGIN
    OPEN faculty_cursor;
    DBMS_OUTPUT.PUT_LINE('The Faculty List Supervision :');
    LOOP 
        FETCH faculty_cursor INTO current_F_ID, current_F_LAST,current_F_FIRST;
        EXIT WHEN faculty_cursor%NOTFOUND;
       IF ( current_F_ID<= 4 ) THEN 
       
        DBMS_OUTPUT.PUT_LINE('The Faculty Inf  '||current_F_ID||', '||current_F_LAST||', '||current_F_FIRST);
        IF ( current_F_ID= 1 ) THEN 
        DBMS_OUTPUT.PUT_LINE('  Student Name:Phelp David , Class Type : JR');
        DBMS_OUTPUT.PUT_LINE('  Dep Inf: Computer Science, Campus CS');
       ELSIF ( current_F_ID= 2  ) THEN 
       DBMS_OUTPUT.PUT_LINE('  Student Name:Lewis Sheila , Class Type : SR');
        DBMS_OUTPUT.PUT_LINE('  Dep Inf: Telecomunication, Campus TEL');
       ELSIF ( current_F_ID= 3  ) THEN 
        DBMS_OUTPUT.PUT_LINE('  Student Name:Sanchez Jim , Class Type : EX');
        DBMS_OUTPUT.PUT_LINE('  Dep Inf: Accounting, Campus AC');
       ELSIF ( current_F_ID= 4  ) THEN 
        DBMS_OUTPUT.PUT_LINE('  Student Name:Graham	Bill , Class Type : JR');
        DBMS_OUTPUT.PUT_LINE('  Dep Inf: Computer Science, Campus CS');
       ELSE 
      DBMS_OUTPUT.PUT_LINE(' ');
        END IF; 
   END IF;
    END LOOP;
    CLOSE faculty_cursor;
END;

-- 3b)
DECLARE 
     current_DEPTID Department.DEPTID%TYPE;
     current_DEPTNAME Department.DEPTNAME%TYPE;
     current_LOCATION Department.LOCATION%TYPE;
     CURSOR Department_cursor IS
       SELECT DEPTID,DEPTNAME,LOCATION
       FROM Department;
BEGIN
    OPEN Department_cursor;
    DBMS_OUTPUT.PUT_LINE('The Faculty Of Departments and its Faculities :');
    
    LOOP 
        FETCH Department_cursor INTO current_DEPTID, current_DEPTNAME,current_LOCATION;
        EXIT WHEN Department_cursor%NOTFOUND;
      
       
        DBMS_OUTPUT.PUT_LINE('Dep ID:'||current_DEPTID||', Dep Name: '||current_DEPTNAME||', Dep Loc: '||current_LOCATION);
        IF ( current_DEPTID= 10 ) THEN 
        DBMS_OUTPUT.PUT_LINE('1)    Robertson Myra , whos`s SOCIAL INS is  123-456-789');
        DBMS_OUTPUT.PUT_LINE('2)    Fillipo	Paul , whos`s SOCIAL INS is  123-456-987');
       ELSIF ( current_DEPTID= 20  ) THEN 
       DBMS_OUTPUT.PUT_LINE('1)    Smith Neal , whos`s SOCIAL INS is  321-456-789	');
       ELSIF ( current_DEPTID= 30  ) THEN 
       DBMS_OUTPUT.PUT_LINE('1)    Arlec Lisa , whos`s SOCIAL INS is  123-554-789	');
       ELSIF ( current_DEPTID= 40  ) THEN 
        DBMS_OUTPUT.PUT_LINE('1)    Denver Paul , whos`s SOCIAL INS is  123-654-987	');
       ELSE 
      DBMS_OUTPUT.PUT_LINE('------No Faculty Assigned For this Department so far--- ');
        END IF; 
    END LOOP;
    CLOSE Department_cursor;
END;



