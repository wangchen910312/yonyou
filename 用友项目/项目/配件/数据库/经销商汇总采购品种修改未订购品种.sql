select * from cm_0501t t where t.MESG_KEY = 'par.lbl.purcItemCnt';--par.lbl.purcItemCnt
select * from cm_0501t t where t.MESG_KEY = 'par.lbl.ordQty';

update cm_0501t t set t.MESG_TXT = '����Ʒ��' where t.MESG_KEY = 'par.lbl.purcItemCnt' and t.LANG_CD = 'zh';
update cm_0501t t set t.MESG_TXT = '�ɹ�����(��ҵ��)' where t.MESG_KEY = 'par.menu.purcOrdDepStatistics' and t.LANG_CD = 'zh';

update cm_0501t t set t.MESG_TXT = '�����ܽ��(Ԫ)' where t.MESG_KEY = 'par.lbl.ordTotAmt' and t.LANG_CD = 'zh';
update cm_0501t t set t.MESG_TXT = 'ƽ������ʱ��(��)' where t.MESG_KEY = 'par.lbl.avgDay' and t.LANG_CD = 'zh';
update cm_0501t t set t.MESG_TXT = 'ƽ��ȱ��ʱ��(��)' where t.MESG_KEY = 'par.lbl.boAvgDay' and t.LANG_CD = 'zh';

select * from cm_0501t t where t.MESG_TXT = '����';--par.btn.save  --VIEW-I-13398	


select * from cm_0501t t where t.MESG_KEY = 'par.title.serReceiveHeader';

--1��������û��ܣ��꣩  par.title.wserReceiveHeader
--2�����������ϸ����+ί�����ͣ� par.lbl.wserReceiveDetail

select * from cm_0501t t where t.MESG_KEY in(
'par.lbl.avgDay',
'par.lbl.boAvgDay',
'par.lbl.ordTotAmt'
);

