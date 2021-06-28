select count(*) from PT_0201T t where t.DLR_CD ='A07AA';

select * from Pt_0201t;

select * from  PT_0211T t where t.DLR_CD='';

--A07AA
select * from cm_0801t t where t.USR_ID = 'admin';--DLR_CD
update cm_0801t t set t.DLR_CD = 'A07AA' where  t.USR_ID = 'admin';--D0411


SELECT * FROM CM_2401T WHERE GRID_ID = 'G-PAR-0519-182102' AND USR_ID = 'admin';


select t.DLR_CD from CM_0101T t where t.CS_AREA_CCBZ_ID='admin';

 select t.CS_AREA_CCBZ_ID from CM_0101T t where t.DLR_CD = 'D2327';--0807062

select t.CS_AREA_CCBZ_ID,t.DLR_CD from CM_0101T t group by t.CS_AREA_CCBZ_ID,t.DLR_CD;

select CS_AREA_CCBZ_ID from CM_0101T t;

select t8.USR_ID from cm_0801t  t8
inner join CM_0101T t1 on  t1.CS_AREA_CCBZ_ID = t8.USR_ID
group by t8.USR_ID
where t8.USR_ID = 0807062

SELECT
                        *
                        FROM CM_0101T
                        WHERE DMS_USE_YN = 'Y' and CS_AREA_CCBZ_ID ='0807062'

update CM_0101T  set DMS_USE_YN  = 'Y' where CS_AREA_CCBZ_ID ='0807062'
select * from cm_0801t t where t8.USR_ID = '0807050'

select t.CS_AREA_CCBZ_ID from CM_0101T t where t.DLR_CD = 'D2327';--0807062
select * from cm_0801t t where t.USR_ID = '0807050';--DLR_CD--用户信息  --38083c7ee9121e17401883566a148aa5c2e2d55dc53bc4a94a026517dbff3c6b
UPDATE cm_0801t SET USR_PW = '38083c7ee9121e17401883566a148aa5c2e2d55dc53bc4a94a026517dbff3c6b' WHERE USR_ID = '0807062';




 select t.CS_AREA_CCBZ_ID,DLR_CD from CM_0101T t where CS_AREA_CCBZ_ID ='0807050'
