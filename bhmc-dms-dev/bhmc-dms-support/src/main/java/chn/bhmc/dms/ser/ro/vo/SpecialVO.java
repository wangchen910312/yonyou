package chn.bhmc.dms.ser.ro.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

public class SpecialVO extends BaseVO{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -6518548275718949808L;

	/**
	 * 
	 */
	
	/**
     * 申请编号
     */
    private String reqNo;
    /**
     * 店代码
     */
    private String dlrCd;
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
     * 工单开单日期
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date roDt;
    /**
     * 维修委托类型
     */
    private String roTp;
    /**
     * 车辆所有者ID
     */
    private String carOwnerId;
    /**
     * 车辆所有者名字
     */
    private String carOwnerNm;
    /**
     * 送修人id
     */
    private String driverId;
    /**
     * 送修人姓名
     */
    private String driverNm;
    /**
     * 送修人手机号
     */
    private String driverHpNo;
    /**
     * 上传文件ID
     */
    private String fileDocNo;
    /**
     *单据状态 “00”保存 “01”提报 “02”通过“03”拒绝 “04”驳回
     */
    private String reqStatCd;
    /**
     *申请原因类别 “01”厂家原因“02”客户原因“03”经销商原因“04”其他原因
     */
    private String reqReasonTp;
    /**
     * 申请原因描述
     */
    private String reqReasonDesc;
    /**
     * 审核原因
     */
    private String approveDesc;
    /**
     * 申请人id
     */
    private String reqUsrId;
    
    /**
     * 申请人名字
     */
    private String reqUsrNm;
    /**
     * 申请日期 (提报时录入的日期)
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date reqDt;
    /**
     * 审核人id
     */
    private String approveUsrId;
    /**
     * 审核人姓名
     */
    private String approveUsrNm; 
    /**
     * 录入人id
     */
    private String regUsrId;
    
    /**
     * 录入日期（保存时录入的日期）
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;
    /**
     * 申请人岗位
     */
    private String reqTskNm;
    /**
     * 申请人手机号
     */
    private String reqHpNo;
    /**
     * 修改人id
     */
    private String updtUserId;
    /**
     * 修改时间
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt;
    /**
     * 工单修改时间
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date roUpdtDt;
    
    /**
     * 是否取消标识Y是N否
     */
    private String cancelYn;
    
	public String getReqNo() {
		return reqNo;
	}
	public void setReqNo(String reqNo) {
		this.reqNo = reqNo;
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
	public Date getRoDt() {
		return roDt;
	}
	public void setRoDt(Date roDt) {
		this.roDt = roDt;
	}
	public String getRoTp() {
		return roTp;
	}
	public void setRoTp(String roTp) {
		this.roTp = roTp;
	}
	public String getCarOwnerId() {
		return carOwnerId;
	}
	public void setCarOwnerId(String carOwnerId) {
		this.carOwnerId = carOwnerId;
	}
	public String getCarOwnerNm() {
		return carOwnerNm;
	}
	public void setCarOwnerNm(String carOwnerNm) {
		this.carOwnerNm = carOwnerNm;
	}
	public String getDriverId() {
		return driverId;
	}
	public void setDriverId(String driverId) {
		this.driverId = driverId;
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
	public String getFileDocNo() {
		return fileDocNo;
	}
	public void setFileDocNo(String fileDocNo) {
		this.fileDocNo = fileDocNo;
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
	public String getReqUsrId() {
		return reqUsrId;
	}
	public void setReqUsrId(String reqUsrId) {
		this.reqUsrId = reqUsrId;
	}
	public Date getReqDt() {
		return reqDt;
	}
	public void setReqDt(Date reqDt) {
		this.reqDt = reqDt;
	}
	public String getApproveUsrId() {
		return approveUsrId;
	}
	public void setApproveUsrId(String approveUsrId) {
		this.approveUsrId = approveUsrId;
	}
	public String getApproveUsrNm() {
		return approveUsrNm;
	}
	public void setApproveUsrNm(String approveUsrNm) {
		this.approveUsrNm = approveUsrNm;
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
	public String getUpdtUserId() {
		return updtUserId;
	}
	public void setUpdtUserId(String updtUserId) {
		this.updtUserId = updtUserId;
	}

	public Date getUpdtDt() {
		return updtDt;
	}
	public void setUpdtDt(Date updtDt) {
		this.updtDt = updtDt;
	}
	public Date getRoUpdtDt() {
		return roUpdtDt;
	}
	public void setRoUpdtDt(Date roUpdtDt) {
		this.roUpdtDt = roUpdtDt;
	}
	public String getReqUsrNm() {
		return reqUsrNm;
	}
	public void setReqUsrNm(String reqUsrNm) {
		this.reqUsrNm = reqUsrNm;
	}
	public String getCancelYn() {
		return cancelYn;
	}
	public void setCancelYn(String cancelYn) {
		this.cancelYn = cancelYn;
	}
	public String getDlrCd() {
		return dlrCd;
	}
	public void setDlrCd(String dlrCd) {
		this.dlrCd = dlrCd;
	}
}
