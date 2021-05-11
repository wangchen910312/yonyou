package chn.bhmc.dms.par.pcm.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

public class OrdAppealSearchVO  extends SearchVO{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String bmpOrdNo;//bmp订单编号
	
	private String partNo;//配件编号
	private String dlrCd;//经销商店代码
	private String ordLine;//行号
	private String questionNo;//申诉编号
	
	public String getBmpOrdNo() {
		return bmpOrdNo;
	}

	public void setBmpOrdNo(String bmpOrdNo) {
		this.bmpOrdNo = bmpOrdNo;
	}

	public String getPartNo() {
		return partNo;
	}

	public void setPartNo(String partNo) {
		this.partNo = partNo;
	}

	public String getDlrCd() {
		return dlrCd;
	}

	public void setDlrCd(String dlrCd) {
		this.dlrCd = dlrCd;
	}

	public String getOrdLine() {
		return ordLine;
	}

	public void setOrdLine(String ordLine) {
		this.ordLine = ordLine;
	}

	public String getQuestionNo() {
		return questionNo;
	}

	public void setQuestionNo(String questionNo) {
		this.questionNo = questionNo;
	}
	
	
}
