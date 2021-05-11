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
 * @Description : 保修工单查询mapVO
 * @author lixinfei
 * @since 2021. 4. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2021. 4. 1.    lixinfei     		保修工单VO
 * </pre>
 */
public class WarrantyOrderMappingVO extends BaseVO{
	
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -8952098987891215477L;
    
	/**
	 * 申请编号
	 */
	private String reqNo;
	
    /**
     * 经销商代码
     */
    private String dlrCd; 
    
    /**
     * 经销商名称
     */
    private String dlrNm;
    
    /**
     * 车牌号
     */
    private String carRegNo;
    
    /**
     * 车辆识别码
     */
    private String vinNo;
    
    /**
     * 维修委托单号
     */
    private String roDocNo;
    
    /**
     * 车辆所有者姓名
     */
    private String carOwnerNm;
    
    /**
     * 送修人姓名
     */
    private String driverNm;
    
    /**
     * 送修人手机号
     */
    private String driverHpNo;
     
    /**
     * 维修委托类型
     */
    private String roTp;

    /**
     * 维修委托类型 字符串
     */
    private String roTpStr;
    
    /**
     * 状态（原:审核状态）
     */
    private String reqStatCd;

    /**
     * 状态（原:审核状态）
     */
    private String reqStatCdStr;
    
    /**
     * 申请原因类别
     */
    private String reqReasonTp;
    
    /**
     * 申请原因类别 字符串
     */
    private String reqReasonTpStr;
    
    /**
     * 申请原因描述
     */
    private String reqReasonDesc;
    
    /**
     * 厂家驳回原因/拒绝原因
     */
    private String approveDesc;

    /**
     * 申请人名称
     */
    private String reqUsrNm;  
    
    /**
     * 审核人姓名（判定人名称）
     */
    private String approveUsrNm;
    
    /**
     * 申请人岗位
     */
    private String reqTskNm;
    
    /**
     * 申请人手机号
     */
    private String reqHpNo;

    /**
     * 上传文件ID
     */
    private String fileDocNo;
    
    /**
     * 申请日期
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date reqDt;
    
    
    /**
     * 维修委托日期
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date roDt;
    
    /**
     * 交车确认日期
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date dlChkDt;
    
    /**
     * 如果是未审核状态的信息，不展示它的审核日期  (审核日期已修改为SE_1162T的APPROVE_DT)
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date approveDt;
    
    
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

	public String getDlrNm() {
		return dlrNm;
	}

	public void setDlrNm(String dlrNm) {
		this.dlrNm = dlrNm;
	}

	public String getCarRegNo() {
		return carRegNo;
	}

	public void setCarRegNo(String carRegNo) {
		this.carRegNo = carRegNo;
	}

	public String getVinNo() {
		return vinNo;
	}

	public void setVinNo(String vinNo) {
		this.vinNo = vinNo;
	}

	public String getRoDocNo() {
		return roDocNo;
	}

	public void setRoDocNo(String roDocNo) {
		this.roDocNo = roDocNo;
	}

	public String getCarOwnerNm() {
		return carOwnerNm;
	}

	public void setCarOwnerNm(String carOwnerNm) {
		this.carOwnerNm = carOwnerNm;
	}

	public String getDriverNm() {
		return driverNm;
	}

	public void setDriverNm(String driverNm) {
		this.driverNm = driverNm;
	}

	public String getDriverHpNo() {
		return driverHpNo;
	}

	public void setDriverHpNo(String driverHpNo) {
		this.driverHpNo = driverHpNo;
	}

	public String getRoTp() {
		return roTp;
	}

	public void setRoTp(String roTp) {
		this.roTp = roTp;
	}

	public String getReqStatCd() {
		return reqStatCd;
	}

	public void setReqStatCd(String reqStatCd) {
		this.reqStatCd = reqStatCd;
	}

    public String getReqReasonTp() {
		return reqReasonTp;
	}

	public void setReqReasonTp(String reqReasonTp) {
		this.reqReasonTp = reqReasonTp;
	}
	
	public String getRoTpStr() {
        return roTpStr;
    }

    public void setRoTpStr(String roTpStr) {
        this.roTpStr = roTpStr;
    }

    public String getReqStatCdStr() {
        return reqStatCdStr;
    }

    public void setReqStatCdStr(String reqStatCdStr) {
        this.reqStatCdStr = reqStatCdStr;
    }

    public String getReqReasonTpStr() {
        return reqReasonTpStr;
    }

    public void setReqReasonTpStr(String reqReasonTpStr) {
        this.reqReasonTpStr = reqReasonTpStr;
    }

    public String getReqReasonDesc() {
		return reqReasonDesc;
	}

	public void setReqReasonDesc(String reqReasonDesc) {
		this.reqReasonDesc = reqReasonDesc;
	}

	public String getApproveDesc() {
        return approveDesc;
    }

    public void setApproveDesc(String approveDesc) {
        this.approveDesc = approveDesc;
    }

    public String getReqUsrNm() {
		return reqUsrNm;
	}

	public void setReqUsrNm(String reqUsrNm) {
		this.reqUsrNm = reqUsrNm;
	}

	public String getApproveUsrNm() {
		return approveUsrNm;
	}

	public void setApproveUsrNm(String approveUsrNm) {
		this.approveUsrNm = approveUsrNm;
	}

	public String getReqTskNm() {
		return reqTskNm;
	}

	public void setReqTskNm(String reqTskNm) {
		this.reqTskNm = reqTskNm;
	}

	public String getReqHpNo() {
		return reqHpNo;
	}

	public void setReqHpNo(String reqHpNo) {
		this.reqHpNo = reqHpNo;
	}

	public String getFileDocNo() {
		return fileDocNo;
	}

	public void setFileDocNo(String fileDocNo) {
		this.fileDocNo = fileDocNo;
	}

    public Date getReqDt() {
        return reqDt;
    }

    public void setReqDt(Date reqDt) {
        this.reqDt = reqDt;
    }

    public Date getRoDt() {
        return roDt;
    }

    public void setRoDt(Date roDt) {
        this.roDt = roDt;
    }

    public Date getDlChkDt() {
        return dlChkDt;
    }

    public void setDlChkDt(Date dlChkDt) {
        this.dlChkDt = dlChkDt;
    }

    public Date getApproveDt() {
        return approveDt;
    }

    public void setApproveDt(Date approveDt) {
        this.approveDt = approveDt;
    }
  
	
}
