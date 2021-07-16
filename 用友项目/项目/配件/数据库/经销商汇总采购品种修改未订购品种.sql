select * from cm_0501t t where t.MESG_KEY = 'par.lbl.purcItemCnt';--par.lbl.purcItemCnt
select * from cm_0501t t where t.MESG_KEY = 'par.lbl.ordQty';

update cm_0501t t set t.MESG_TXT = '订购品种' where t.MESG_KEY = 'par.lbl.purcItemCnt' and t.LANG_CD = 'zh';
update cm_0501t t set t.MESG_TXT = '采购汇总(事业部)' where t.MESG_KEY = 'par.menu.purcOrdDepStatistics' and t.LANG_CD = 'zh';

update cm_0501t t set t.MESG_TXT = '订购总金额(元)' where t.MESG_KEY = 'par.lbl.ordTotAmt' and t.LANG_CD = 'zh';
update cm_0501t t set t.MESG_TXT = '平均发货时长(天)' where t.MESG_KEY = 'par.lbl.avgDay' and t.LANG_CD = 'zh';
update cm_0501t t set t.MESG_TXT = '平均缺货时长(天)' where t.MESG_KEY = 'par.lbl.boAvgDay' and t.LANG_CD = 'zh';

select * from cm_0501t t where t.MESG_TXT = '保存';--par.btn.save  --VIEW-I-13398	


select * from cm_0501t t where t.MESG_KEY = 'par.title.serReceiveHeader';

--1、配件领用汇总（店）  par.title.wserReceiveHeader
--2、配件领用明细（店+委托类型） par.lbl.wserReceiveDetail

select * from cm_0501t t where t.MESG_KEY in(
'par.lbl.avgDay',
'par.lbl.boAvgDay',
'par.lbl.ordTotAmt'
);

