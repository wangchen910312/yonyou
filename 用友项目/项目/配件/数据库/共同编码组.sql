select * from CM_0301T t where t.CMM_GRP_CD_NM='索赔状态';
--CMM_GRP_CD,CMM_GRP_CD_NM,REMARK,USE_YN,REG_USR_ID,REG_DT,UPDT_USR_ID,UPDT_DT,REMARK_TITLE_NM,SYS_CD_YN
--PAR224,索赔状态,<NULL>,Y,admin,2016/02/16,<NULL>,<NULL>,<NULL>,Y
select * from CM_0301T t where t.CMM_GRP_CD='SER601';

select * from CM_0301T t where t.CMM_GRP_CD_NM='单据状态';

select * from CM_0302T t where t.CMM_GRP_CD_TXT='待判定';
--共同编码
insert into "DMSDB"."CM_0301T" ("CMM_GRP_CD", "CMM_GRP_CD_NM", "REMARK", "USE_YN", "REG_USR_ID", "REG_DT", "UPDT_USR_ID", "UPDT_DT", "REMARK_TITLE_NM", "SYS_CD_YN") values ('SER601', '保修索赔工单确认申请的审批状态', null, 'Y', 'admin', TO_DATE('2021/03/30 11:07:14', 'YYYY/MM/DD HH24:MI:SS'), 'admin', TO_DATE('2021/03/30 11:25:13', 'YYYY/MM/DD HH24:MI:SS'), null, 'Y');


insert into "DMSDB"."CM_0302T" ("CMM_GRP_CD", "LANG_CD", "CMM_GRP_CD_TXT", "REG_USR_ID", "REG_DT", "UPDT_USR_ID", "UPDT_DT", "REMARK_TITLE_NM") values ('SER601', 'en', 'approval status', 'admin', TO_DATE('2021/03/30 11:09:46', 'YYYY/MM/DD HH24:MI:SS'), null, null, null);
insert into "DMSDB"."CM_0302T" ("CMM_GRP_CD", "LANG_CD", "CMM_GRP_CD_TXT", "REG_USR_ID", "REG_DT", "UPDT_USR_ID", "UPDT_DT", "REMARK_TITLE_NM") values ('SER601', 'ko', '?? ??', 'admin', TO_DATE('2021/03/30 11:10:03', 'YYYY/MM/DD HH24:MI:SS'), null, null, null);
insert into "DMSDB"."CM_0302T" ("CMM_GRP_CD", "LANG_CD", "CMM_GRP_CD_TXT", "REG_USR_ID", "REG_DT", "UPDT_USR_ID", "UPDT_DT", "REMARK_TITLE_NM") values ('SER601', 'zh', '审批状态', 'admin', TO_DATE('2021/03/30 11:09:11', 'YYYY/MM/DD HH24:MI:SS'), null, null, null);


insert into "DMSDB"."CM_0303T" ("CMM_CD", "CMM_GRP_CD", "CMM_CD_NM", "REMARK1", "REMARK2", "REMARK3", "REMARK4", "REMARK5", "REMARK6", "REMARK7", "REMARK8", "REMARK9", "REMARK10", "USE_YN", "SORT_ORDER", "REG_USR_ID", "REG_DT", "UPDT_USR_ID", "UPDT_DT") values ('00', 'SER601', '保存', null, null, null, null, null, null, null, null, null, null, 'Y', 1, 'admin', TO_DATE('2021/03/30 13:07:59', 'YYYY/MM/DD HH24:MI:SS'), null, null);
insert into "DMSDB"."CM_0303T" ("CMM_CD", "CMM_GRP_CD", "CMM_CD_NM", "REMARK1", "REMARK2", "REMARK3", "REMARK4", "REMARK5", "REMARK6", "REMARK7", "REMARK8", "REMARK9", "REMARK10", "USE_YN", "SORT_ORDER", "REG_USR_ID", "REG_DT", "UPDT_USR_ID", "UPDT_DT") values ('04', 'SER601', '驳回', null, null, null, null, null, null, null, null, null, null, 'Y', 5, 'admin', TO_DATE('2021/03/30 13:09:27', 'YYYY/MM/DD HH24:MI:SS'), null, null);
insert into "DMSDB"."CM_0303T" ("CMM_CD", "CMM_GRP_CD", "CMM_CD_NM", "REMARK1", "REMARK2", "REMARK3", "REMARK4", "REMARK5", "REMARK6", "REMARK7", "REMARK8", "REMARK9", "REMARK10", "USE_YN", "SORT_ORDER", "REG_USR_ID", "REG_DT", "UPDT_USR_ID", "UPDT_DT") values ('01', 'SER601', '提报', null, null, null, null, null, null, null, null, null, null, 'Y', 2, 'admin', TO_DATE('2021/03/30 13:08:23', 'YYYY/MM/DD HH24:MI:SS'), null, null);
insert into "DMSDB"."CM_0303T" ("CMM_CD", "CMM_GRP_CD", "CMM_CD_NM", "REMARK1", "REMARK2", "REMARK3", "REMARK4", "REMARK5", "REMARK6", "REMARK7", "REMARK8", "REMARK9", "REMARK10", "USE_YN", "SORT_ORDER", "REG_USR_ID", "REG_DT", "UPDT_USR_ID", "UPDT_DT") values ('02', 'SER601', '通过', null, null, null, null, null, null, null, null, null, null, 'Y', 3, 'admin', TO_DATE('2021/03/30 13:08:45', 'YYYY/MM/DD HH24:MI:SS'), null, null);
insert into "DMSDB"."CM_0303T" ("CMM_CD", "CMM_GRP_CD", "CMM_CD_NM", "REMARK1", "REMARK2", "REMARK3", "REMARK4", "REMARK5", "REMARK6", "REMARK7", "REMARK8", "REMARK9", "REMARK10", "USE_YN", "SORT_ORDER", "REG_USR_ID", "REG_DT", "UPDT_USR_ID", "UPDT_DT") values ('03', 'SER601', '拒绝', null, null, null, null, null, null, null, null, null, null, 'Y', 4, 'admin', TO_DATE('2021/03/30 13:09:13', 'YYYY/MM/DD HH24:MI:SS'), null, null);



insert into "DMSDB"."CM_0304T" ("CMM_CD", "LANG_CD", "CMM_CD_TXT", "REG_USR_ID", "REG_DT", "UPDT_USR_ID", "UPDT_DT", "CMM_GRP_CD") values ('03', 'zh', '拒绝', 'admin', TO_DATE('2021/03/30 13:17:44', 'YYYY/MM/DD HH24:MI:SS'), null, null, 'SER601');
insert into "DMSDB"."CM_0304T" ("CMM_CD", "LANG_CD", "CMM_CD_TXT", "REG_USR_ID", "REG_DT", "UPDT_USR_ID", "UPDT_DT", "CMM_GRP_CD") values ('02', 'en', 'pass', 'admin', TO_DATE('2021/03/30 13:15:25', 'YYYY/MM/DD HH24:MI:SS'), null, null, 'SER601');
insert into "DMSDB"."CM_0304T" ("CMM_CD", "LANG_CD", "CMM_CD_TXT", "REG_USR_ID", "REG_DT", "UPDT_USR_ID", "UPDT_DT", "CMM_GRP_CD") values ('00', 'ko', '????', 'admin', TO_DATE('2021/03/30 13:13:51', 'YYYY/MM/DD HH24:MI:SS'), null, null, 'SER601');
insert into "DMSDB"."CM_0304T" ("CMM_CD", "LANG_CD", "CMM_CD_TXT", "REG_USR_ID", "REG_DT", "UPDT_USR_ID", "UPDT_DT", "CMM_GRP_CD") values ('01', 'zh', '提报', 'admin', TO_DATE('2021/03/30 13:14:21', 'YYYY/MM/DD HH24:MI:SS'), null, null, 'SER601');
insert into "DMSDB"."CM_0304T" ("CMM_CD", "LANG_CD", "CMM_CD_TXT", "REG_USR_ID", "REG_DT", "UPDT_USR_ID", "UPDT_DT", "CMM_GRP_CD") values ('01', 'ko', '??', 'admin', TO_DATE('2021/03/30 13:14:32', 'YYYY/MM/DD HH24:MI:SS'), null, null, 'SER601');
insert into "DMSDB"."CM_0304T" ("CMM_CD", "LANG_CD", "CMM_CD_TXT", "REG_USR_ID", "REG_DT", "UPDT_USR_ID", "UPDT_DT", "CMM_GRP_CD") values ('00', 'zh', '保存', 'admin', TO_DATE('2021/03/30 13:09:51', 'YYYY/MM/DD HH24:MI:SS'), null, null, 'SER601');
insert into "DMSDB"."CM_0304T" ("CMM_CD", "LANG_CD", "CMM_CD_TXT", "REG_USR_ID", "REG_DT", "UPDT_USR_ID", "UPDT_DT", "CMM_GRP_CD") values ('01', 'en', 'submit', 'admin', TO_DATE('2021/03/30 13:14:15', 'YYYY/MM/DD HH24:MI:SS'), null, null, 'SER601');
insert into "DMSDB"."CM_0304T" ("CMM_CD", "LANG_CD", "CMM_CD_TXT", "REG_USR_ID", "REG_DT", "UPDT_USR_ID", "UPDT_DT", "CMM_GRP_CD") values ('02', 'zh', '通过', 'admin', TO_DATE('2021/03/30 13:15:03', 'YYYY/MM/DD HH24:MI:SS'), null, null, 'SER601');
insert into "DMSDB"."CM_0304T" ("CMM_CD", "LANG_CD", "CMM_CD_TXT", "REG_USR_ID", "REG_DT", "UPDT_USR_ID", "UPDT_DT", "CMM_GRP_CD") values ('03', 'en', 'refuse', 'admin', TO_DATE('2021/03/30 13:17:52', 'YYYY/MM/DD HH24:MI:SS'), null, null, 'SER601');
insert into "DMSDB"."CM_0304T" ("CMM_CD", "LANG_CD", "CMM_CD_TXT", "REG_USR_ID", "REG_DT", "UPDT_USR_ID", "UPDT_DT", "CMM_GRP_CD") values ('03', 'ko', '????', 'admin', TO_DATE('2021/03/30 13:18:09', 'YYYY/MM/DD HH24:MI:SS'), null, null, 'SER601');
insert into "DMSDB"."CM_0304T" ("CMM_CD", "LANG_CD", "CMM_CD_TXT", "REG_USR_ID", "REG_DT", "UPDT_USR_ID", "UPDT_DT", "CMM_GRP_CD") values ('04', 'ko', '????.????', 'admin', TO_DATE('2021/03/30 13:18:34', 'YYYY/MM/DD HH24:MI:SS'), null, null, 'SER601');
insert into "DMSDB"."CM_0304T" ("CMM_CD", "LANG_CD", "CMM_CD_TXT", "REG_USR_ID", "REG_DT", "UPDT_USR_ID", "UPDT_DT", "CMM_GRP_CD") values ('04', 'en', 'reject', 'admin', TO_DATE('2021/03/30 13:18:45', 'YYYY/MM/DD HH24:MI:SS'), null, null, 'SER601');
insert into "DMSDB"."CM_0304T" ("CMM_CD", "LANG_CD", "CMM_CD_TXT", "REG_USR_ID", "REG_DT", "UPDT_USR_ID", "UPDT_DT", "CMM_GRP_CD") values ('04', 'zh', '驳回', 'admin', TO_DATE('2021/03/30 13:18:54', 'YYYY/MM/DD HH24:MI:SS'), null, null, 'SER601');
insert into "DMSDB"."CM_0304T" ("CMM_CD", "LANG_CD", "CMM_CD_TXT", "REG_USR_ID", "REG_DT", "UPDT_USR_ID", "UPDT_DT", "CMM_GRP_CD") values ('00', 'en', 'save', 'admin', TO_DATE('2021/03/30 13:13:58', 'YYYY/MM/DD HH24:MI:SS'), null, null, 'SER601');
insert into "DMSDB"."CM_0304T" ("CMM_CD", "LANG_CD", "CMM_CD_TXT", "REG_USR_ID", "REG_DT", "UPDT_USR_ID", "UPDT_DT", "CMM_GRP_CD") values ('02', 'ko', '????.', 'admin', TO_DATE('2021/03/30 13:14:52', 'YYYY/MM/DD HH24:MI:SS'), null, null, 'SER601');






