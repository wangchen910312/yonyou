package chn.bhmc.dms.ser.wac.vo;


import java.util.Date;

import chn.bhmc.dms.core.datatype.BaseVO;
/**
 * 
 *<p>Title:结算单实体类</p>
 * @author wangc
 * @param 
 * @return
 */
public class ClaimInvoiceVO extends BaseVO {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7192238123387331012L;
	/**
	 * 经销商id
	 */
	private String dlrCd;
	
	/**
	 * 经销商名字
	 */
	private String dlrNm;
	/**
	 * 索赔结算单信息
	 */
	private String invcNo;
    /**
     * 开票状态 01：未开票  02：已开票 03：已退票
     */
    private String receiptTp;

    /**
     * 快递公司
     */
    private String expsCmpNm;

    /**
     * 快递状态   01：未邮寄 02：已邮寄 03：车厂接收  04：退票接收  05：未接收 
     */
    private String trsfTp;

    /**
     * 快递单号
     */
    private String trsfNo;

    /**
     * 快递备注
     */
    private String remark;

    /**
     * 寄件人
     */
    private String senderNm;

    /**
     * 收件人
     */
    private String recipNm;

    /**
     * 寄件人联系电话
     */
    private String senderTelno;

    /**
     * 收件人联系电话
     */
    private String recipTelno;

    /**
     * 寄件人地址
     */
    private String senderAddr;

    /**
     * 收件人地址
     */
    private String recipAddr;

    /**
     * 汇(收)款状态  01：未汇款 02：已汇款 03：已收款
     */
    private String paymTp;

    /**
     * 汇款日期
     */
    private Date paymDt;

    /**
     * 收款日期
     */
    private Date rcvCpltDt;

    /**
     * 退票次数
     */
    private int failCnt;

    /**
     * 退票原因  01:金额错误 02: 税号错误 03: 税率错误 04: 没盖章 05: 发票破损 06: 三包凭证错误 07:其他
     */
    private String failMsg;

    /**
     * 退票备注
     */
    private String failRemark;

    /**
     * 录入日期
     */
    private Date regDt;

    /**
     * 录入人
     */
    private String regUsrId;

    /**
     * 修改日期
     */
    private Date updtDt;

    /**
     * 修改人
     */
    private String updtUsrId;
    
    /**
     * 扣减金额
     */
    private double ddctTotAmt;
    
    /**
     * 确认金额
     */
    private double confirmTotAmt; 
    
    /**
     * 收票日期
     */
    private Date recipDt;
    /**
     * 退票日期
     */
    private Date failDt;
    /**
     * 结算报表年月
     */
    private Date invcDt;
    /**
     * 结算金额
     */
    private double invcClaimTotAmt;
    
    /**
     * 是否取消 Y是 N否
     */
    private String cancelYn;

    /**
     * 开票状态
     * @return RECEIPT_TP 开票状态
     */
    public String getReceiptTp() {
        return receiptTp;
    }

    /**
     * 开票状态
     * @param receiptTp 开票状态
     */
    public void setReceiptTp(String receiptTp) {
        this.receiptTp = receiptTp == null ? null : receiptTp.trim();
    }

    /**
     * 快递公司
     * @return EXPS_CMP_NM 快递公司
     */
    public String getExpsCmpNm() {
        return expsCmpNm;
    }

    /**
     * 快递公司
     * @param expsCmpNm 快递公司
     */
    public void setExpsCmpNm(String expsCmpNm) {
        this.expsCmpNm = expsCmpNm == null ? null : expsCmpNm.trim();
    }

    /**
     * 快递状态 
     * @return TRSF_TP 快递状态 
     */
    public String getTrsfTp() {
        return trsfTp;
    }

    /**
     * 快递状态 
     * @param trsfTp 快递状态 
     */
    public void setTrsfTp(String trsfTp) {
        this.trsfTp = trsfTp == null ? null : trsfTp.trim();
    }

    /**
     * 快递单号
     * @return TRSF_NO 快递单号
     */
    public String getTrsfNo() {
        return trsfNo;
    }

    /**
     * 快递单号
     * @param trsfNo 快递单号
     */
    public void setTrsfNo(String trsfNo) {
        this.trsfNo = trsfNo == null ? null : trsfNo.trim();
    }

    /**
     * 快递备注
     * @return REMARK 快递备注
     */
    public String getRemark() {
        return remark;
    }

    /**
     * 快递备注
     * @param remark 快递备注
     */
    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    /**
     * 寄件人
     * @return SENDER_NM 寄件人
     */
    public String getSenderNm() {
        return senderNm;
    }

    /**
     * 寄件人
     * @param senderNm 寄件人
     */
    public void setSenderNm(String senderNm) {
        this.senderNm = senderNm == null ? null : senderNm.trim();
    }

    /**
     * 收件人
     * @return RECIP_NM 收件人
     */
    public String getRecipNm() {
        return recipNm;
    }

    /**
     * 收件人
     * @param recipNm 收件人
     */
    public void setRecipNm(String recipNm) {
        this.recipNm = recipNm == null ? null : recipNm.trim();
    }

    /**
     * 寄件人联系电话
     * @return SENDER_TELNO 寄件人联系电话
     */
    public String getSenderTelno() {
        return senderTelno;
    }

    /**
     * 寄件人联系电话
     * @param senderTelno 寄件人联系电话
     */
    public void setSenderTelno(String senderTelno) {
        this.senderTelno = senderTelno == null ? null : senderTelno.trim();
    }

    /**
     * 收件人联系电话
     * @return RECIP_TELNO 收件人联系电话
     */
    public String getRecipTelno() {
        return recipTelno;
    }

    /**
     * 收件人联系电话
     * @param recipTelno 收件人联系电话
     */
    public void setRecipTelno(String recipTelno) {
        this.recipTelno = recipTelno == null ? null : recipTelno.trim();
    }

    /**
     * 寄件人地址
     * @return SENDER_ADDR 寄件人地址
     */
    public String getSenderAddr() {
        return senderAddr;
    }

    /**
     * 寄件人地址
     * @param senderAddr 寄件人地址
     */
    public void setSenderAddr(String senderAddr) {
        this.senderAddr = senderAddr == null ? null : senderAddr.trim();
    }

    /**
     * 收件人地址
     * @return RECIP_ADDR 收件人地址
     */
    public String getRecipAddr() {
        return recipAddr;
    }

    /**
     * 收件人地址
     * @param recipAddr 收件人地址
     */
    public void setRecipAddr(String recipAddr) {
        this.recipAddr = recipAddr == null ? null : recipAddr.trim();
    }

    /**
     * 汇(收)款状态
     * @return PAYM_TP 汇(收)款状态
     */
    public String getPaymTp() {
        return paymTp;
    }

    /**
     * 汇(收)款状态
     * @param paymTp 汇(收)款状态
     */
    public void setPaymTp(String paymTp) {
        this.paymTp = paymTp == null ? null : paymTp.trim();
    }

    /**
     * 汇款日期
     * @return PAYM_DT 汇款日期
     */
    public Date getPaymDt() {
        return paymDt;
    }

    /**
     * 汇款日期
     * @param paymDt 汇款日期
     */
    public void setPaymDt(Date paymDt) {
        this.paymDt = paymDt;
    }

    /**
     * 收款日期
     * @return RCV_CPLT_DT 收款日期
     */
    public Date getRcvCpltDt() {
        return rcvCpltDt;
    }

    /**
     * 收款日期
     * @param rcvCpltDt 收款日期
     */
    public void setRcvCpltDt(Date rcvCpltDt) {
        this.rcvCpltDt = rcvCpltDt;
    }

    /**
     * 退票次数
     * @return FAIL_CNT 退票次数
     */
    public int getFailCnt() {
        return failCnt;
    }

    /**
     * 退票次数
     * @param failCnt 退票次数
     */
    public void setFailCnt(int failCnt) {
        this.failCnt = failCnt;
    }

    /**
     * 退票备注
     * @return FAIL_MSG 退票备注
     */
    public String getFailMsg() {
        return failMsg;
    }

    /**
     * 退票备注
     * @param failMsg 退票备注
     */
    public void setFailMsg(String failMsg) {
        this.failMsg = failMsg == null ? null : failMsg.trim();
    }

    /**
     * null
     * @return FAIL_REMARK null
     */
    public String getFailRemark() {
        return failRemark;
    }

    /**
     * null
     * @param failRemark null
     */
    public void setFailRemark(String failRemark) {
        this.failRemark = failRemark == null ? null : failRemark.trim();
    }

    /**
     * 录入日期
     * @return REG_DT 录入日期
     */
    public Date getRegDt() {
        return regDt;
    }

    /**
     * 录入日期
     * @param regDt 录入日期
     */
    public void setRegDt(Date regDt) {
        this.regDt = regDt;
    }

    /**
     * 录入人
     * @return REG_USR_ID 录入人
     */
    public String getRegUsrId() {
        return regUsrId;
    }

    /**
     * 录入人
     * @param regUsrId 录入人
     */
    public void setRegUsrId(String regUsrId) {
        this.regUsrId = regUsrId == null ? null : regUsrId.trim();
    }

    /**
     * 修改日期
     * @return UPDT_DT 修改日期
     */
    public Date getUpdtDt() {
        return updtDt;
    }

    /**
     * 修改日期
     * @param updtDt 修改日期
     */
    public void setUpdtDt(Date updtDt) {
        this.updtDt = updtDt;
    }

    /**
     * 修改人
     * @return UPDT_USR_ID 修改人
     */
    public String getUpdtUsrId() {
        return updtUsrId;
    }

    /**
     * 修改人
     * @param updtUsrId 修改人
     */
    public void setUpdtUsrId(String updtUsrId) {
        this.updtUsrId = updtUsrId == null ? null : updtUsrId.trim();
    }

	public String getDlrCd() {
		return dlrCd;
	}

	public void setDlrCd(String dlrCd) {
		this.dlrCd = dlrCd;
	}

	public String getInvcNo() {
		return invcNo;
	}

	public void setInvcNo(String invcNo) {
		this.invcNo = invcNo;
	}

	public double getDdctTotAmt() {
		return ddctTotAmt;
	}

	public void setDdctTotAmt(double ddctTotAmt) {
		this.ddctTotAmt = ddctTotAmt;
	}

	public double getConfirmTotAmt() {
		return confirmTotAmt;
	}

	public void setConfirmTotAmt(double confirmTotAmt) {
		this.confirmTotAmt = confirmTotAmt;
	}

	public Date getRecipDt() {
		return recipDt;
	}

	public void setRecipDt(Date recipDt) {
		this.recipDt = recipDt;
	}

	public Date getInvcDt() {
		return invcDt;
	}

	public void setInvcDt(Date invcDt) {
		this.invcDt = invcDt;
	}

	public double getInvcClaimTotAmt() {
		return invcClaimTotAmt;
	}

	public void setInvcClaimTotAmt(double invcClaimTotAmt) {
		this.invcClaimTotAmt = invcClaimTotAmt;
	}

	public String getDlrNm() {
		return dlrNm;
	}

	public void setDlrNm(String dlrNm) {
		this.dlrNm = dlrNm;
	}

	public Date getFailDt() {
		return failDt;
	}

	public void setFailDt(Date failDt) {
		this.failDt = failDt;
	}

	public String getCancelYn() {
		return cancelYn;
	}

	public void setCancelYn(String cancelYn) {
		this.cancelYn = cancelYn;
	}
    
    
}