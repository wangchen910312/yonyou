select * from  CM_0809T t where t.VIEW_NM= '����������';--VIEW_ID:VIEW-D-10247

select * from  CM_0810T t where t.VIEW_ID='VIEW-D-80800';

select * from CM_0808T t where t.PARENT_VIEW_ID='VIEW-D-10247';

select * from  CM_0809T t where t.VIEW_NM= '����������';


select * from CM_0809T t where t.VIEW_ID = 'VIEW-D-80800';
--���Ȩ�޲˵�
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
('VIEW-D-80800',
'����ȷ����������',
'?? ?? ?? ??',
'/par/cpm/orderConfirmation/selectOrderConfirmation.do',
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

--ҳ�湦�ܸ��ӹ�ϵ
insert into CM_0808T (
PARENT_VIEW_ID,CHILD_VIEW_ID,REG_USR_ID,REG_DT,UPDT_USR_ID,UPDT_DT,SYS_CD,USE_YN)
values (
'VIEW-D-10161','VIEW-D-80800','SYSTEM',sysdate,null,null,'D','Y'
);

