package chn.bhmc.dms.ser.svi.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : WarrantyOrderVO.java
 * @Description : 保修工单审核VO
 * @author lixinfei
 * @since 2021. 4. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2021. 4. 1.    lixinfei     		保修工单审核VO
 * </pre>
 */
public class ReviewWarrantyOrderVO extends BaseVO{
	
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -8906198984591280476L;
    
    /**
     * SE_1163T ID
     */
    private String id;
    
    /**
     * 申请编号
     */
    private String reqNo;
    
    /**
     * 店代码
     */
    private String dlrCd; 
    
    /**
     * 审核状态
     */
    private String approveStatCd;
    
    /**
     * 审核原因
     */
    private String approveDesc;
    
    /**
     * 录入人ID
     */
    private String regUsrId;
    
    /**
     * 录入日期
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getReqNo() {
		return reqNo;
	}

	public void setReqNo(String reqNo) {
		this.reqNo = reqNo;
	}

	public String getDlrCd() {
		return dlrCd;
	}

	public void setDlrCd(String dlrCd) {
		this.dlrCd = dlrCd;
	}

	public String getApproveStatCd() {
		return approveStatCd;
	}

	public void setApproveStatCd(String approveStatCd) {
		this.approveStatCd = approveStatCd;
	}

	public String getApproveDesc() {
		return approveDesc;
	}

	public void setApproveDesc(String approveDesc) {
		this.approveDesc = approveDesc;
	}

	public String getRegUsrId() {
		return regUsrId;
	}

	public void setRegUsrId(String regUsrId) {
		this.regUsrId = regUsrId;
	}

	public Date getRegDt() {
		return regDt;
	}

	public void setRegDt(Date regDt) {
		this.regDt = regDt;
	}

	
}
