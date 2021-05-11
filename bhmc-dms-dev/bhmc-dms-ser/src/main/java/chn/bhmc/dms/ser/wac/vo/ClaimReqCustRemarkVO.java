package chn.bhmc.dms.ser.wac.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

public class ClaimReqCustRemarkVO  extends BaseVO{

	private static final long serialVersionUID = -8138404707878121455L;
	
	/**
	 * 客户主诉代码
	 */
	private String lineNo;
	
	/**
	 * 客户主诉内容
	 */
	private String custReqCont;

	public String getLineNo() {
		return lineNo;
	}

	public void setLineNo(String lineNo) {
		this.lineNo = lineNo;
	}

	public String getCustReqCont() {
		return custReqCont;
	}

	public void setCustReqCont(String custReqCont) {
		this.custReqCont = custReqCont;
	}
	
	

}
