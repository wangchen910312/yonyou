package chn.bhmc.dms.ser.wac.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseSearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : FindClaimInvoiceRemittanceSearchVO.java
 * @Description : 索赔发票汇款查询条件VO.
 * @author chen shengan
 * @since 2021. 4. 09.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2021. 4. 09.     chen shengan       索赔发票汇款查询条件VO
 * </pre>
 */
public class FindClaimInvoiceRemittanceSearchVO extends BaseSearchVO {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6508457657256552532L;
	
	/**
	 * 经销商代码
	 */
	private String dlrCd;
	
	/**
	 * 经销商名称
	 */
	private String dlrNm;
	
	/**
	 * 结算报表编号
	 */
	private String invcNo;
	
	/**
	 * 汇款状态
	 */
	private String paymTp;
	
	/**
	 * 结算报表开始年月
	 */
	private String invcDtStart;
	
	/**
	 * 结算报表结束年月
	 */
	private String invcDtEnd;
	
	private String userId;
	

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getDlrCd() {
		return dlrCd;
	}

	public void setDlrCd(String dlrCd) {
		this.dlrCd = dlrCd;
	}

	public String getDlrNm() {
		return dlrNm;
	}

	public void setDlrNm(String dlrNm) {
		this.dlrNm = dlrNm;
	}

	public String getInvcNo() {
		return invcNo;
	}

	public void setInvcNo(String invcNo) {
		this.invcNo = invcNo;
	}

	public String getPaymTp() {
		return paymTp;
	}

	public void setPaymTp(String paymTp) {
		this.paymTp = paymTp;
	}

	public String getInvcDtStart() {
		return invcDtStart;
	}

	public void setInvcDtStart(String invcDtStart) {
		this.invcDtStart = invcDtStart;
	}

	public String getInvcDtEnd() {
		return invcDtEnd;
	}

	public void setInvcDtEnd(String invcDtEnd) {
		this.invcDtEnd = invcDtEnd;
	}

	public FindClaimInvoiceRemittanceSearchVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FindClaimInvoiceRemittanceSearchVO(String dlrCd, String dlrNm, String invcNo, String paymTp,
			String invcDtStart, String invcDtEnd, String userId) {
		super();
		this.dlrCd = dlrCd;
		this.dlrNm = dlrNm;
		this.invcNo = invcNo;
		this.paymTp = paymTp;
		this.invcDtStart = invcDtStart;
		this.invcDtEnd = invcDtEnd;
		this.userId = userId;
	}

	

}
