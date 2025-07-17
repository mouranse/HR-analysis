create database human_res;
use human_res;

select * from hr;

alter table hr
change column empid emp_id varchar(20) null;

describe hr;

select birthdate from hr;

set sql_safe_updates = 0;

update hr
set birthdate = case
	when birthdate like '%/%' then date_format(str_to_date(birthdate, '%m/%d/%Y'),'%Y-%m-%d')
 	when birthdate like '%-%' then date_format(str_to_date(birthdate, '%m-%d-%Y'),'%Y-%m-%d')   
    else null
end;
alter table hr
modify column birthdate date;
select birthdate from hr;

update hr
set hire_date = case
	when hire_date like '%/%' then date_format(str_to_date(hire_date, '%m/%d/%Y'),'%Y-%m-%d')
 	when hire_date like '%-%' then date_format(str_to_date(hire_date, '%m-%d-%Y'),'%Y-%m-%d')   
    else null
end;

alter table hr 
modify column hire_date date;

select hire_date from hr;

update hr
set termdate = date(str_to_date(termdate,'%Y-%m-%d %H:%i:%s UTC'))
where termdate is not null and termdate != '';

select termdate from hr;

UPDATE hr
SET termdate = DATE(STR_TO_DATE(termdate, '%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate IS NOT NULL AND termdate != '';

UPDATE hr
SET termdate = CASE
    WHEN termdate IS NOT NULL AND termdate != ''
        THEN DATE(STR_TO_DATE(termdate, '%Y-%m-%d %H:%i:%s UTC'))
    ELSE '0000-00-00'
END;

UPDATE hr
SET termdate = '0000-00-00'
WHERE termdate IS NULL OR termdate = '';

ALTER TABLE hr MODIFY termdate VARCHAR(50);

UPDATE hr
SET termdate = CASE
    WHEN termdate IS NOT NULL AND termdate != ''
        THEN DATE_FORMAT(STR_TO_DATE(termdate, '%Y-%m-%d %H:%i:%s UTC'), '%Y-%m-%d')
    ELSE '0000-00-00'
END;

UPDATE hr
SET termdate = CASE
    WHEN termdate IS NOT NULL AND termdate != ''
        THEN DATE_FORMAT(STR_TO_DATE(termdate, '%Y-%m-%d %H:%i:%s UTC'), '%Y-%m-%d')
    ELSE NULL
END;


ALTER TABLE hr MODIFY termdate DATE;
select termdate from hr;

alter table hr 
modify column termdate date;

UPDATE hr
SET termdate = CASE
    WHEN termdate IS NOT NULL AND termdate != ''
         THEN DATE(STR_TO_DATE(termdate, '%Y-%m-%d %H:%i:%s UTC'))
    ELSE NULL
END;

describe hr;

alter table hr
add column age INT;

select * from hr;

select min(age) as youngest, 
max(age) as oldest
from hr;

select count(*) from hr where age <18;

update hr
set age = timestampdiff(year, birthdate, curdate());