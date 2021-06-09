select * from PT_0911IR;


select last_day(add_months(sysdate,-6))+1,last_day(add_months(sysdate,-1))  from dual;

select to_char(last_day(add_months(sysdate,-6))+1,'yyyymmdd') from dual;


delete from PT_0911IR i where i.IFRESULT = 'Z' AND substr(i.CREATETIME,0,8) = (select to_char(last_day(add_months(sysdate,-6))+1,'yyyymmdd') from dual);