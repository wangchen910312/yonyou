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
('VIEW-D-80802',
'Ë÷Åâ·¢Æ±½ÓÊÕ',
'??? ???? ??',
'/ser/wac/claimlnvoice/selectClaimInvoiceReceptionMain.do',
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

select * from CM_0809T t where t.VIEW_NM='Ë÷Åâ·¢Æ±±à¼­';



select * from CM_0808T t where t.CHILD_VIEW_ID  in ('VIEW-D-80802','VIEW-I-13274');

insert into CM_0808T (
PARENT_VIEW_ID,CHILD_VIEW_ID,REG_USR_ID,REG_DT,UPDT_USR_ID,UPDT_DT,SYS_CD,USE_YN)
values (
'VIEW-I-10312','VIEW-D-80802','SYSTEM',sysdate,null,null,'D','Y'
);
--VIEW-I-13274


select * from CM_0809T t where t.VIEW_ID  in ('VIEW-D-80802','VIEW-I-13274');
