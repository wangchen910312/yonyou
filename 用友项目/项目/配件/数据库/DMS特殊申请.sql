SELECT specialReques.CAR_REG_NO,specialReques.VIN_NO,repairOrder.RO_DOC_NO,specialReques.CAR_OWNER_NM,specialReques.DRIVER_NM,
 specialReques.DRIVER_HP_NO,specialReques.REQ_REASON_TP,specialReques.REQ_REASON_DESC,specialReques.APPROVE_DESC, 
 specialReques.REQ_USR_ID AS REQ_USR_NM, specialReques.APPROVE_USR_NM, specialReques.CAR_OWNER_NM, specialReques.DRIVER_NM, 
 specialReques.RO_DT, specialReques.REQ_DT FROM (
 select  se0300t.RO_DOC_NO 
 from SE_0300T se0300t 
 where se0300t.DL_STAT_CD =  '02' 
 AND se0300t.RO_STAT_CD = '03'   
 AND se0300t.CUST_CONFIRM_YN ='Y'                                     
 AND se0300t.CUST_CONFIRM_CD IS NULL) repairOrder 
 left join SE_1162T as specialReques on specialReques.RO_DOC_NO = repairOrder.RO_DOC_NO;
 
 
 
 
 
 SELECT count(*) FROM (
 select  se0300t.RO_DOC_NO 
 from SE_0300T se0300t 
 where se0300t.DL_STAT_CD =  '02' 
 AND se0300t.RO_STAT_CD = '03'   
 AND se0300t.CUST_CONFIRM_YN ='Y'                                     
 AND se0300t.CUST_CONFIRM_CD IS NULL) repairOrder 
 left join SE_1162T as specialReques on specialReques.RO_DOC_NO = repairOrder.RO_DOC_NO;
 
 
 select repairOrder.*,specialReques.* from SE_0300T repairOrder
 left join SE_1162T specialReques on specialReques.RO_DOC_NO = repairOrder.RO_DOC_NO;
 
 
 
 select * from  CM_0809T t where t.VIEW_NM= 'À˜≈‚…Í«Î';
 
--VIEW_ID	VIEW_NM	VIEW_INFO_CONT	VIEW_URL	VIEW_TP	MESG_KEY	SORT_ORDER	DISPLAY_YN	T_CD	ICON_NM	REG_USR_ID	REG_DT	UPDT_USR_ID	UPDT_DT	WEB_MOBILE_DSTIN_CD	SYS_CD	USE_YN
--VIEW-D-10354	À˜≈‚…Í«Î	?????	/ser/wac/claimReq/selectClaimRequestMain.do	01	ser.menu.claimReqMng	3	Y	12033	<NULL>	SYSTEM	2016/12/06	SYSTEM	2017/03/13	W	D	Y
 
 select * from CM_0808T t where t.CHILD_VIEW_ID='VIEW-D-10354';--VIEW-D-10330 À˜≈‚…Í«Î
 
 --ÃÌº”Ãÿ ‚…Í«Î»®œﬁ
insert into CM_0809T 
(VIEW_ID,
VIEW_NM,
VIEW_INFO_CONT,
VIEW_URL,
VIEW_TP,
MESG_KEY,
SORT_ORDER,
DISPLAY_YN,
T_CD,
ICON_NM,
REG_USR_ID,
REG_DT,
UPDT_USR_ID,
UPDT_DT,
WEB_MOBILE_DSTIN_CD,
SYS_CD,
USE_YN)
values 
('VIEW-D-80801',
'Ãÿ ‚…Í«Î',
'?? ?? ?? ??',
'/ser/wac/special/selectSpecialRequestMain.do',
'01',
'par.menu.orderConfirmation',
80,
'Y',
'13005',
NULL,
'SYSTEM',
sysdate,
'SYSTEM',
sysdate,
'W',
'D',
'Y');


insert into CM_0808T (
PARENT_VIEW_ID,CHILD_VIEW_ID,REG_USR_ID,REG_DT,UPDT_USR_ID,UPDT_DT,SYS_CD,USE_YN)
values (
'VIEW-D-10330','VIEW-D-80801','SYSTEM',sysdate,null,null,'D','Y'
);

--π≤Õ¨±‡¬Î
insert into CM_0301T (CMM_GRP_CD,CMM_GRP_CD_NM,REMARK,USE_YN,REG_USR_ID,REG_DT,UPDT_USR_ID,UPDT_DT,REMARK_TITLE_NM,SYS_CD_YN)
values ('SER099','µ•æ›◊¥Ã¨',null,'Y','admin',sysdate,null,null,null,'Y');




SELECT specialReques.CAR_REG_NO,specialReques.VIN_NO,repairOrder.RO_DOC_NO,specialReques.CAR_OWNER_NM,specialReques.DRIVER_NM,
 specialReques.DRIVER_HP_NO,specialReques.REQ_REASON_TP,specialReques.REQ_REASON_DESC,specialReques.APPROVE_DESC, 
 specialReques.REQ_USR_ID AS REQ_USR_NM, specialReques.APPROVE_USR_NM, specialReques.CAR_OWNER_NM, specialReques.DRIVER_NM, 
 specialReques.RO_DT, specialReques.REQ_DT,ROWNUM FROM (
 select  se0300t.RO_DOC_NO
 from SE_0300T se0300t 
 where se0300t.DL_STAT_CD =  '02' 
 AND se0300t.RO_STAT_CD = '03'   
 AND se0300t.CUST_CONFIRM_YN ='Y'                                     
 AND se0300t.CUST_CONFIRM_CD IS NULL
 )repairOrder 
left join SE_1162T as specialReques on specialReques.RO_DOC_NO = repairOrder.RO_DOC_NO;





 SELECT *
         FROM (
              SELECT ROWNUM AS RNUM , T1.*
                FROM (
                  SELECT specialReques.CAR_REG_NO,specialReques.VIN_NO,repairOrder.RO_DOC_NO,specialReques.CAR_OWNER_NM,specialReques.DRIVER_NM,
					 specialReques.DRIVER_HP_NO,specialReques.REQ_REASON_TP,specialReques.REQ_REASON_DESC,specialReques.APPROVE_DESC, 
					 specialReques.REQ_USR_ID AS REQ_USR_NM, specialReques.APPROVE_USR_NM, specialReques.CAR_OWNER_NM, specialReques.DRIVER_NM, 
					 specialReques.RO_DT, specialReques.REQ_DT,ROWNUM FROM (
					 select  se0300t.RO_DOC_NO
					 from SE_0300T se0300t 
					 where se0300t.DL_STAT_CD =  '02' 
					 AND se0300t.RO_STAT_CD = '03'   
					 AND se0300t.CUST_CONFIRM_YN ='Y'                                     
					 AND se0300t.CUST_CONFIRM_CD IS NULL
					 )repairOrder 
				   left join SE_1162T as specialReques on specialReques.RO_DOC_NO = repairOrder.RO_DOC_NO
                ) T1 where 1= 1  AND ROWNUM <= 20;
