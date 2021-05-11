package chn.bhmc.dms.sal.rcp.vo;

import com.fasterxml.jackson.annotation.JsonProperty;

import chn.bhmc.dms.core.datatype.BaseVO;
/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : InvoiceVO.java
 * @Description : 发票提交时检验返回值.
 * @author 贾明
 * @since 2020. 5. 20.
 * @version 1.0
 * @see
 * @Modification 
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2020. 5. 20.     贾明                                              发票提交时检验返回值
 * </pre>
 */
public class InvoiceVO extends BaseVO{

	
	

     /**
	 * 
	 */
	private static final long serialVersionUID = 1531563811599646687L;

	@JsonProperty("DLR_CD")
	   private String dlrCd;
     
     @JsonProperty("VIN_NO")
	   private String vinNo;
     
     @JsonProperty("RECEIPT_NO")
	   private String receiptNo;
     
     @JsonProperty("RECEIPT_CD")
	    private String receiptCd;

	public String getDlrCd() {
		return dlrCd;
	}

	public void setDlrCd(String dlrCd) {
		this.dlrCd = dlrCd;
	}

	public String getVinNo() {
		return vinNo;
	}

	public void setVinNo(String vinNo) {
		this.vinNo = vinNo;
	}

	public String getReceiptNo() {
		return receiptNo;
	}

	public void setReceiptNo(String receiptNo) {
		this.receiptNo = receiptNo;
	}

	public String getReceiptCd() {
		return receiptCd;
	}

	public void setReceiptCd(String receiptCd) {
		this.receiptCd = receiptCd;
	}
     
    
	
     
	
}
