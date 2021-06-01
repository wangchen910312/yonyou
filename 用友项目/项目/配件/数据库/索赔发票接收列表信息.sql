--结算单列表信息
select ROWNUM AS RNUM , T1.* 
from(
    select invoice.DLR_CD,(select DLR_NM from CM_0101T where DLR_CD = invoice.DLR_CD) as DLR_NM,invoice.INVC_NO,
           invoice.RECEIPT_TP,invoice.RECIP_DT,invoice.FAIL_DT,pack.invc_Dt,pack.invc_Claim_Tot_Amt,pack.ddct_Tot_Amt,
           pack.confirm_Tot_Amt,invoice.TRSF_NO,invoice.EXPS_CMP_NM,invoice.TRSF_TP,invoice.FAIL_MSG,invoice.SENDER_NM,
           invoice.SENDER_TELNO,invoice.SENDER_ADDR
    from SE_0960T invoice 
    left join se_0930t pack on invoice.INVC_NO=pack.INVC_NO
    where 1 = 1
    ORDER BY pack.invc_Dt desc
) T1


select * from CM_0101T;

select * from se_0930t;
select * from SE_0960T