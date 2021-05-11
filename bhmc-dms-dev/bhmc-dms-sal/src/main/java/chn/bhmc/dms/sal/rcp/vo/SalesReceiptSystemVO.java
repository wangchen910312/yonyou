package chn.bhmc.dms.sal.rcp.vo;

import com.fasterxml.jackson.annotation.JsonProperty;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <p>Title: 发票管理 -> 经销商上线发票系统</p>
 * @author Gongrs 2021年4月29日 下午2:31:12
 */
public class SalesReceiptSystemVO extends BaseVO{

	private static final long serialVersionUID = 1531563811599645501L;

	// 经销商代码
	@JsonProperty("DLR_CD")
	private String dlrCd;
     
	// 上线发票系统标识（01.美丽源、02.数衍）
	@JsonProperty("RECEIPT_SYSTEM_FLAG")
	private String receiptSystemFlag;

	public String getDlrCd() {
		return dlrCd;
	}

	public void setDlrCd(String dlrCd) {
		this.dlrCd = dlrCd;
	}

	public String getReceiptSystemFlag() {
		return receiptSystemFlag;
	}

	public void setReceiptSystemFlag(String receiptSystemFlag) {
		this.receiptSystemFlag = receiptSystemFlag;
	}

}
