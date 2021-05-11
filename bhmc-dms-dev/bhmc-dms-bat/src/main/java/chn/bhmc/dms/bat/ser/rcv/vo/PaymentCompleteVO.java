package chn.bhmc.dms.bat.ser.rcv.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

public class PaymentCompleteVO extends BaseVO{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3472618274920840379L;
	
	private String paymAmt;
	
	private double calcAmt;
	
	private Double rcvAmt;
	
	private String calcDocNo;
	
	private String roDocNo;
	
	private String rcvSubDocNo;
	
	private String tradeId;

	private String rcvDocNo;
	
	
	private String dlrCd;
	
	private String regUsrId;
	
	

	public String getPaymAmt() {
		return paymAmt;
	}

	public void setPaymAmt(String paymAmt) {
		this.paymAmt = paymAmt;
	}

	public String getDlrCd() {
		return dlrCd;
	}

	public void setDlrCd(String dlrCd) {
		this.dlrCd = dlrCd;
	}

	public String getRegUsrId() {
		return regUsrId;
	}

	public void setRegUsrId(String regUsrId) {
		this.regUsrId = regUsrId;
	}

	public double getCalcAmt() {
		return calcAmt;
	}

	public void setCalcAmt(double calcAmt) {
		this.calcAmt = calcAmt;
	}

	public Double getRcvAmt() {
		return rcvAmt;
	}

	public void setRcvAmt(Double rcvAmt) {
		this.rcvAmt = rcvAmt;
	}

	public String getCalcDocNo() {
		return calcDocNo;
	}

	public void setCalcDocNo(String calcDocNo) {
		this.calcDocNo = calcDocNo;
	}

	public String getRoDocNo() {
		return roDocNo;
	}

	public void setRoDocNo(String roDocNo) {
		this.roDocNo = roDocNo;
	}

	public String getRcvDocNo() {
		return rcvDocNo;
	}

	public void setRcvDocNo(String rcvDocNo) {
		this.rcvDocNo = rcvDocNo;
	}

	public String getRcvSubDocNo() {
		return rcvSubDocNo;
	}

	public void setRcvSubDocNo(String rcvSubDocNo) {
		this.rcvSubDocNo = rcvSubDocNo;
	}

	public String getTradeId() {
		return tradeId;
	}

	public void setTradeId(String tradeId) {
		this.tradeId = tradeId;
	}
	
	
	

}
