package chn.bhmc.dms.sal.veh.vo;

import com.fasterxml.jackson.annotation.JsonProperty;

import chn.bhmc.dms.core.datatype.BaseVO;
/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ApptionVehicleSearVO.java
 * @Description : 销售集团申请VIN_NO 返值实体类.
 * @author 贾明
 * @since 2019. 9. 4.
 * @version 1.0
 * @see
 * @Modification 
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2019. 9. 4.     贾明                                              销售集团申请VIN_NO 返值实体类
 * </pre>
 */
public class ApptionVehicleSearVO extends BaseVO{

	/**
	 *  B.DLR_CD
     ,B.USR_ID
     ,B.REQ_SEQ
     ,B.APPROVE_CD
     ,B.REQ_SAL_NO
	 */
	private static final long serialVersionUID = -5377612898717978890L;

     @JsonProperty("DLR_CD")
	   private String dlrCd;
     
     @JsonProperty("USR_ID")
	   private String usrId;
     
     @JsonProperty("REQ_SEQ")
	   private String reqSeq;
     
     @JsonProperty("APPROVE_CD")
	    private String approveCd;
     
     @JsonProperty("REQ_SAL_NO")
	    private String reqSalNo;

	public String getDlrCd() {
		return dlrCd;
	}

	public void setDlrCd(String dlrCd) {
		this.dlrCd = dlrCd;
	}

	public String getUsrId() {
		return usrId;
	}

	public void setUsrId(String usrId) {
		this.usrId = usrId;
	}

	public String getReqSeq() {
		return reqSeq;
	}

	public void setReqSeq(String reqSeq) {
		this.reqSeq = reqSeq;
	}

	public String getApproveCd() {
		return approveCd;
	}

	public void setApproveCd(String approveCd) {
		this.approveCd = approveCd;
	}

	public String getReqSalNo() {
		return reqSalNo;
	}

	public void setReqSalNo(String reqSalNo) {
		this.reqSalNo = reqSalNo;
	}
     
     
	
}
