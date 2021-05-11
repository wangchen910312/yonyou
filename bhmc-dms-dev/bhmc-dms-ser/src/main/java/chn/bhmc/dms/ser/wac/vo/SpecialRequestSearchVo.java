package chn.bhmc.dms.ser.wac.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * 
 * @ClassName: SpecialRequestSearchVo
 * <p>Title: 特殊申请工单查询实体类（包含工单信息）</p >
 * @Description: SearchVo
 * @author wangc
 * @date 2021-03-29 04:08:02
 */
public class SpecialRequestSearchVo extends SearchVO{

    /**
	 * 
	 */
	private static final long serialVersionUID = -7629004201775980476L;

	/**
     * 申请编号
     */
    private String sreqNo;
    /**
     * 店代码
     */
    private String sdlrCd;
    /**
     * 车牌号
     */
    private String sCarRegNo;
    /**
     * 车辆识别码
     */
    private String svinNo;
    /**
     * 维修委托单号
     */
    private String sRoDocNo;
    /**
     * 工单开单日期
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sroDt;
    /**
     * 维修委托类型
     */
    private String sroTp;
    /**
     * 车辆所有者ID
     */
    private String scarOwnerId;
    /**
     * 车辆所有者名字
     */
    private String scarOwnerNm;
    /**
     * 送修人id
     */
    private String sdriverId;
    /**
     * 送修人姓名
     */
    private String sdriverNm;
    /**
     * 送修人手机号
     */
    private String sdriverHpNo;
    /**
     * 上传文件ID
     */
    private String sfileDocNo;
    /**
     * 单据状态 “00”保存 “01”提报 “02”通过“03”拒绝 “04”驳回
     */
    private String sReqStatCd;
    /**
     *申请原因类别 “01”厂家原因“02”客户原因“03”经销商原因“04”其他原因
     */
    private String sreqReasonTp;
    /**
     * 申请原因描述
     */
    private String sreqReasonDesc;
    /**
     * 审核原因
     */
    private String sapproveDesc;
    /**
     * 申请人id
     */
    private String sreqUsrId;
    /**
     * 申请人名字
     */
    private String sreqUsrNm;
    /**
     * 申请日期 (提报时录入的日期)
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sreqDt;
    /**
     * 审核人id
     */
    private String sapproveUsrId;
    /**
     * 审核人姓名
     */
    private String sapproveUsrNm; 
    /**
     * 录入人id
     */
    private String sregUsrId;
    
    /**
     * 录入日期（保存时录入的日期）
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sregDt;
    /**
     * 申请人岗位
     */
    private String sreqTskNm;
    /**
     * 申请人手机号
     */
    private String sreqHpNo;
    /**
     * 修改人id
     */
    private String supdtUserId;
    /**
     * 修改时间
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sUpdtDt;
    /**
     * 工单修改时间
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sroUpdtDt;
    /**
     * 开单开始日期
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sFromRoDt;
    
    /**
     * 开单结束日期
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sToRoDt;
    
    /**
     * 申请开始日期
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sFromReqDt;
    
    /**
     * 申请结束日期
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sToReqDt;
    /**
     * 是否取消标识Y是N否
     */
    private String cancelYn;
    
	public String getSreqNo() {
		return sreqNo;
	}
	
	public String getSdlrCd() {
		return sdlrCd;
	}

	public void setSdlrCd(String sdlrCd) {
		this.sdlrCd = sdlrCd;
	}



	public void setSreqNo(String sreqNo) {
		this.sreqNo = sreqNo;
	}

	public String getSvinNo() {
		return svinNo;
	}
	public void setSvinNo(String svinNo) {
		this.svinNo = svinNo;
	}
	
	public Date getSroDt() {
		return sroDt;
	}
	public void setSroDt(Date sroDt) {
		this.sroDt = sroDt;
	}
	public String getSroTp() {
		return sroTp;
	}
	public void setSroTp(String sroTp) {
		this.sroTp = sroTp;
	}
	public String getScarOwnerId() {
		return scarOwnerId;
	}
	public void setScarOwnerId(String scarOwnerId) {
		this.scarOwnerId = scarOwnerId;
	}
	public String getScarOwnerNm() {
		return scarOwnerNm;
	}
	public void setScarOwnerNm(String scarOwnerNm) {
		this.scarOwnerNm = scarOwnerNm;
	}
	public String getSdriverId() {
		return sdriverId;
	}
	public void setSdriverId(String sdriverId) {
		this.sdriverId = sdriverId;
	}
	public String getSdriverNm() {
		return sdriverNm;
	}
	public void setSdriverNm(String sdriverNm) {
		this.sdriverNm = sdriverNm;
	}
	public String getSdriverHpNo() {
		return sdriverHpNo;
	}
	public void setSdriverHpNo(String sdriverHpNo) {
		this.sdriverHpNo = sdriverHpNo;
	}
	public String getSfileDocNo() {
		return sfileDocNo;
	}
	public void setSfileDocNo(String sfileDocNo) {
		this.sfileDocNo = sfileDocNo;
	}

	public String getSreqReasonTp() {
		return sreqReasonTp;
	}
	public void setSreqReasonTp(String sreqReasonTp) {
		this.sreqReasonTp = sreqReasonTp;
	}
	public String getSreqReasonDesc() {
		return sreqReasonDesc;
	}
	public void setSreqReasonDesc(String sreqReasonDesc) {
		this.sreqReasonDesc = sreqReasonDesc;
	}
	public String getSapproveDesc() {
		return sapproveDesc;
	}
	public void setSapproveDesc(String sapproveDesc) {
		this.sapproveDesc = sapproveDesc;
	}
	public String getSreqUsrId() {
		return sreqUsrId;
	}
	public void setSreqUsrId(String sreqUsrId) {
		this.sreqUsrId = sreqUsrId;
	}
	public Date getSreqDt() {
		return sreqDt;
	}
	public void setSreqDt(Date sreqDt) {
		this.sreqDt = sreqDt;
	}
	public String getSapproveUsrId() {
		return sapproveUsrId;
	}
	public void setSapproveUsrId(String sapproveUsrId) {
		this.sapproveUsrId = sapproveUsrId;
	}
	public String getSapproveUsrNm() {
		return sapproveUsrNm;
	}
	public void setSapproveUsrNm(String sapproveUsrNm) {
		this.sapproveUsrNm = sapproveUsrNm;
	}
	public String getSregUsrId() {
		return sregUsrId;
	}
	public void setSregUsrId(String sregUsrId) {
		this.sregUsrId = sregUsrId;
	}
	public Date getSregDt() {
		return sregDt;
	}
	public void setSregDt(Date sregDt) {
		this.sregDt = sregDt;
	}
	public String getSreqTskNm() {
		return sreqTskNm;
	}
	public void setSreqTskNm(String sreqTskNm) {
		this.sreqTskNm = sreqTskNm;
	}
	public String getSreqHpNo() {
		return sreqHpNo;
	}
	public void setSreqHpNo(String sreqHpNo) {
		this.sreqHpNo = sreqHpNo;
	}
	public String getSupdtUserId() {
		return supdtUserId;
	}
	public void setSupdtUserId(String supdtUserId) {
		this.supdtUserId = supdtUserId;
	}
	public Date getsUpdtDt() {
		return sUpdtDt;
	}
	public void setsUpdtDt(Date sUpdtDt) {
		this.sUpdtDt = sUpdtDt;
	}
	public Date getSroUpdtDt() {
		return sroUpdtDt;
	}
	public void setSroUpdtDt(Date sroUpdtDt) {
		this.sroUpdtDt = sroUpdtDt;
	}
	public String getsCarRegNo() {
		return sCarRegNo;
	}
	public void setsCarRegNo(String sCarRegNo) {
		this.sCarRegNo = sCarRegNo;
	}
	public String getsRoDocNo() {
		return sRoDocNo;
	}
	public void setsRoDocNo(String sRoDocNo) {
		this.sRoDocNo = sRoDocNo;
	}
	public String getsReqStatCd() {
		return sReqStatCd;
	}
	public void setsReqStatCd(String sReqStatCd) {
		this.sReqStatCd = sReqStatCd;
	}
	public Date getsFromRoDt() {
		return sFromRoDt;
	}
	public void setsFromRoDt(Date sFromRoDt) {
		this.sFromRoDt = sFromRoDt;
	}
	public Date getsToRoDt() {
		return sToRoDt;
	}
	public void setsToRoDt(Date sToRoDt) {
		this.sToRoDt = sToRoDt;
	}
	public Date getsFromReqDt() {
		return sFromReqDt;
	}
	public void setsFromReqDt(Date sFromReqDt) {
		this.sFromReqDt = sFromReqDt;
	}
	public Date getsToReqDt() {
		return sToReqDt;
	}
	public void setsToReqDt(Date sToReqDt) {
		this.sToReqDt = sToReqDt;
	}
	public String getSreqUsrNm() {
		return sreqUsrNm;
	}
	public void setSreqUsrNm(String sreqUsrNm) {
		this.sreqUsrNm = sreqUsrNm;
	}
	public String getCancelYn() {
		return cancelYn;
	}
	public void setCancelYn(String cancelYn) {
		this.cancelYn = cancelYn;
	}
	
    
    
}
