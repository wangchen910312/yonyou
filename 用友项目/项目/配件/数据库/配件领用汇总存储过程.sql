create or replace PROCEDURE SP_PAR_PartsReceive 
AS 
BEGIN
    --���µ�ҵ�������
    MERGE INTO PT_0911T o 
      USING (select * from (select * from PT_0911IR r where r.IFRESULT = 'N') a where exists(
      select b1.BAT_ID from (
      select row_number() over(partition by b.DLR_CD order by b.CREATETIME) rn
      ,b.CREATETIME,b.BAT_ID,b.DLR_CD
      from
      (select t1.CREATETIME,t1.BAT_ID,t1.DLR_CD from (
       select to_date(t.CREATETIME,'yyyy-mm-dd hh24:mi:ss') as CREATETIME,t.BAT_ID,t.DLR_CD from (
       select * from PT_0911IR r1 where r1.IFRESULT = 'N'
       ) t group by t.CREATETIME,t.BAT_ID,t.DLR_CD ) t1
       order by t1.CREATETIME desc) b ) b1
       where b1.rn = 1 and b1.BAT_ID = a.BAT_ID)) i on (i.DLR_CD = o.DLR_CD  and i.YEAR_MONTH = o.YEAR_MONTH and i.DELEGATE_TYPE = o.DELEGATE_TYPE)
       WHEN MATCHED THEN
       UPDATE
      SET DELIVERY_AMT = i.DELIVERY_AMT,
          PART_NUM = i.PART_NUM,
          COST_AMT = i.COST_AMT,
          UPDATETIME = sysdate
       WHEN NOT MATCHED THEN
        INSERT (ID,DLR_CD,DLR_NM,DELEGATE_TYPE,PART_NUM,DELIVERY_AMT,COST_AMT,YEAR_MONTH,CREATETIME) 
        VALUES (SEQ_PT_0911T.nextval,i.DLR_CD,i.DLR_NM,i.DELEGATE_TYPE,i.PART_NUM,i.DELIVERY_AMT,i.COST_AMT,i.YEAR_MONTH,sysdate);
      --���µ�����bat_id�޸�״̬ΪZ
      update PT_0911IR A SET A.IFRESULT = 'Z' ,A.UPDATETIME = to_char(sysdate,'yyyy-mm-dd hh24:mi:ss')  WHERE EXISTS(
        SELECT '1' FROM (select b1.DLR_CD from (
      select row_number() over(partition by b.DLR_CD order by b.CREATETIME) rn
      ,b.CREATETIME,b.BAT_ID,b.DLR_CD
      from
      (select t1.CREATETIME,t1.BAT_ID,t1.DLR_CD from (
       select to_date(t.CREATETIME,'yyyy-mm-dd hh24:mi:ss') as CREATETIME,t.BAT_ID,t.DLR_CD from (
       select * from PT_0911IR r1 where r1.IFRESULT = 'N'
       ) t group by t.CREATETIME,t.BAT_ID,t.DLR_CD ) t1
       order by t1.CREATETIME desc) b ) b1
       where b1.rn = 1) C WHERE A.DLR_CD = C.DLR_CD
      );
      --ɾ���������ʷ����
      delete from PT_0911IR i where i.IFRESULT = 'Z' AND substr(i.CREATETIME,0,8) = (select to_char(last_day(add_months(sysdate,-6))+1,'yyyymmdd') from dual);
      COMMIT;
END;

call SP_PAR_PartsReceive();
---�޸Ľӿڱ�״̬
update PT_0911IR A SET A.IFRESULT = 'Z' ,A.UPDATETIME = to_char(sysdate,'yyyy-mm-dd hh24:mi:ss')  WHERE EXISTS(
  SELECT '1' FROM (select b1.DLR_CD from (
select row_number() over(partition by b.DLR_CD order by b.CREATETIME) rn
,b.CREATETIME,b.BAT_ID,b.DLR_CD
from
(select t1.CREATETIME,t1.BAT_ID,t1.DLR_CD from (
 select to_date(t.CREATETIME,'yyyy-mm-dd hh24:mi:ss') as CREATETIME,t.BAT_ID,t.DLR_CD from (
 select * from PT_0911IR r1 where r1.IFRESULT = 'N'
 ) t group by t.CREATETIME,t.BAT_ID,t.DLR_CD ) t1
 order by t1.CREATETIME desc) b ) b1
 where b1.rn = 1) C WHERE A.DLR_CD = C.DLR_CD
);
--���½ӿڱ������״̬

select * from PT_0911T;

delete from PT_0911T;

select * from PT_0911IR;


update PT_0911IR set IFRESULT = 'N';
---�������½ӿڱ����ݵ�ҵ�����������
MERGE INTO PT_0911T o 
USING (select * from (select * from PT_0911IR r where r.IFRESULT = 'N') a where exists(
select b1.BAT_ID from (
select row_number() over(partition by b.DLR_CD order by b.CREATETIME) rn
,b.CREATETIME,b.BAT_ID,b.DLR_CD
from
(select t1.CREATETIME,t1.BAT_ID,t1.DLR_CD from (
 select to_date(t.CREATETIME,'yyyy-mm-dd hh24:mi:ss') as CREATETIME,t.BAT_ID,t.DLR_CD from (
 select * from PT_0911IR r1 where r1.IFRESULT = 'N'
 ) t group by t.CREATETIME,t.BAT_ID,t.DLR_CD ) t1
 order by t1.CREATETIME desc) b ) b1
 where b1.rn = 1 and b1.BAT_ID = a.BAT_ID)) i on (i.DLR_CD = o.DLR_CD  and i.YEAR_MONTH = o.YEAR_MONTH and i.DELEGATE_TYPE = o.DELEGATE_TYPE)
 WHEN MATCHED THEN
 UPDATE
SET DELIVERY_AMT = i.DELIVERY_AMT,
    PART_NUM = i.PART_NUM,
    COST_AMT = i.COST_AMT,
    UPDATETIME = sysdate
 WHEN NOT MATCHED THEN
  INSERT (ID,DLR_CD,DLR_NM,DELEGATE_TYPE,PART_NUM,DELIVERY_AMT,COST_AMT,YEAR_MONTH,CREATETIME) 
  VALUES (SEQ_PT_0911T.nextval,i.DLR_CD,i.DLR_NM,i.DELEGATE_TYPE,i.PART_NUM,i.DELIVERY_AMT,i.COST_AMT,i.YEAR_MONTH,sysdate);



CREATE SEQUENCE DMSDB.SEQ_PT_0911T
  START WITH 1
  MAXVALUE 9999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  NOORDER;
  
  
  

--���˲�ѯ��Ч����
select * from (select * from PT_0911IR r where r.IFRESULT = 'N') a where exists(
select b1.BAT_ID from (
select row_number() over(partition by b.DLR_CD order by b.CREATETIME) rn
,b.CREATETIME,b.BAT_ID,b.DLR_CD
from
(select t1.CREATETIME,t1.BAT_ID,t1.DLR_CD from (
 select to_date(t.CREATETIME,'yyyy-mm-dd hh24:mi:ss') as CREATETIME,t.BAT_ID,t.DLR_CD from (
 select * from PT_0911IR r1 where r1.IFRESULT = 'N'
 ) t group by t.CREATETIME,t.BAT_ID,t.DLR_CD ) t1
 order by t1.CREATETIME desc) b ) b1
 where b1.rn = 1 and b1.BAT_ID = a.BAT_ID);
 
 
 
 ---��������
select b1.BAT_ID from (
select row_number() over(partition by b.DLR_CD order by b.CREATETIME) rn
,b.CREATETIME,b.BAT_ID,b.DLR_CD
from
(select t1.CREATETIME,t1.BAT_ID,t1.DLR_CD from (
 select to_date(t.CREATETIME,'yyyy-mm-dd hh24:mi:ss') as CREATETIME,t.BAT_ID,t.DLR_CD from (
 select * from PT_0911IR r1 where r1.IFRESULT = 'N'
 ) t group by t.CREATETIME,t.BAT_ID,t.DLR_CD ) t1
 order by t1.CREATETIME desc) b ) b1
 where b1.rn = 1;
 
 
 
 select b1.DLR_CD from (
select row_number() over(partition by b.DLR_CD order by b.CREATETIME) rn
,b.CREATETIME,b.BAT_ID,b.DLR_CD
from
(select t1.CREATETIME,t1.BAT_ID,t1.DLR_CD from (
 select to_date(t.CREATETIME,'yyyy-mm-dd hh24:mi:ss') as CREATETIME,t.BAT_ID,t.DLR_CD from (
 select * from PT_0911IR r1 where r1.IFRESULT = 'N'
 ) t group by t.CREATETIME,t.BAT_ID,t.DLR_CD ) t1
 order by t1.CREATETIME desc) b ) b1
 where b1.rn = 1;
 
 

