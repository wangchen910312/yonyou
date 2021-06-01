--共同编码
select * from CM_0301T t where t.CMM_GRP_CD_NM in ('');
select * from CM_0302T;
select * from CM_0303T;
select * from CM_0304T;
--菜单列表
select * from CM_0809T t where t.VIEW_NM in ('索赔发票创建','索赔发票收款');
select * from CM_0808T t where t.CHILD_VIEW_ID in  ('VIEW-D-13331','VIEW-D-13332');


Insert into CM_0809T (VIEW_ID,VIEW_NM,VIEW_INFO_CONT,VIEW_URL,VIEW_TP,MESG_KEY,SORT_ORDER,DISPLAY_YN,T_CD,ICON_NM,REG_USR_ID,REG_DT,UPDT_USR_ID,UPDT_DT,WEB_MOBILE_DSTIN_CD,SYS_CD,USE_YN) values ('VIEW-D-13331','索赔发票创建',null,'/ser/wac/web/ClaimInvoiceCrtController.do','01','cmm.menu.invoiceCreate',15,'Y',null,null,'admin',to_date('2021-04-12 11:19:13','YYYY-MM-DD HH24:MI:SS'),null,null,'W','D','Y');
Insert into CM_0809T (VIEW_ID,VIEW_NM,VIEW_INFO_CONT,VIEW_URL,VIEW_TP,MESG_KEY,SORT_ORDER,DISPLAY_YN,T_CD,ICON_NM,REG_USR_ID,REG_DT,UPDT_USR_ID,UPDT_DT,WEB_MOBILE_DSTIN_CD,SYS_CD,USE_YN) values ('VIEW-D-13332','索赔发票收款',null,'/ser/wac/web/ClaimInvoiceRecController.do','01','cmm.menu.invoiceReceive',16,'Y',null,null,'admin',to_date('2021-04-12 13:53:07','YYYY-MM-DD HH24:MI:SS'),null,null,'W','D','Y');

Insert into CM_0808T (PARENT_VIEW_ID,CHILD_VIEW_ID,REG_USR_ID,REG_DT,UPDT_USR_ID,UPDT_DT,SYS_CD,USE_YN) values ('VIEW-D-10330','VIEW-D-13331','admin',to_date('2021-04-12 11:19:13','YYYY-MM-DD HH24:MI:SS'),null,null,'D','Y');
Insert into CM_0808T (PARENT_VIEW_ID,CHILD_VIEW_ID,REG_USR_ID,REG_DT,UPDT_USR_ID,UPDT_DT,SYS_CD,USE_YN) values ('VIEW-D-10330','VIEW-D-13332','admin',to_date('2021-04-12 13:53:07','YYYY-MM-DD HH24:MI:SS'),null,null,'D','Y');




