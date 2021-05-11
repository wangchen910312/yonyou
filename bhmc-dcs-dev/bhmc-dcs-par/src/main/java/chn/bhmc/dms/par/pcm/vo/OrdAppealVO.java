package chn.bhmc.dms.par.pcm.vo;

import java.util.Date;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
/**
 * 缺货申诉
 * @author liuxueying
 *
 */
@ValidDescriptor({ 
	@ValidField(field="dlrCd", mesgKey="par.lbl.dlrCd")
	,@ValidField(field="ordNo", mesgKey="par.lbl.purcOrdNo")})
public class OrdAppealVO {
	
    private String dlrCd;
    
    private String questionNo;//申诉编号
    
    private String ordNo;//订单编号
    
    private String bmpOrdNo;//bmp订单编号
    
    private String regUsrId;//提交人
    
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;//提交时间
    
    private String content;//内容
    
    private String status;//单据状态(0已提报 1处理中 2完结)
    
    private String replyStatus;//回复状态( 0一级处理中 1二级处理中2已处理)
    
    private String partNo;//配件编号
    
    private String type;//类型 
    
    private String optType;//操作类型 0申诉 1催单
    
    private String regUsrNm;//提交人
    
    private String ordLine;//订单明细行号
    
    private String replyLevel;//处理环节
    
    private String relateNo;//关联编号
    
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date expectArrivalDt;//预计到货时间
	public String getDlrCd() {
		return dlrCd;
	}
	public void setDlrCd(String dlrCd) {
		this.dlrCd = dlrCd;
	}
	public String getQuestionNo() {
		return questionNo;
	}
	public void setQuestionNo(String questionNo) {
		this.questionNo = questionNo;
	}
	
	public String getOrdNo() {
		return ordNo;
	}
	public void setOrdNo(String ordNo) {
		this.ordNo = ordNo;
	}
	public String getBmpOrdNo() {
		return bmpOrdNo;
	}
	public void setBmpOrdNo(String bmpOrdNo) {
		this.bmpOrdNo = bmpOrdNo;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getReplyStatus() {
		return replyStatus;
	}
	public void setReplyStatus(String replyStatus) {
		this.replyStatus = replyStatus;
	}
	public String getPartNo() {
		return partNo;
	}
	public void setPartNo(String partNo) {
		this.partNo = partNo;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getOptType() {
		return optType;
	}
	public void setOptType(String optType) {
		this.optType = optType;
	}
	public String getRegUsrNm() {
		return regUsrNm;
	}
	public void setRegUsrNm(String regUsrNm) {
		this.regUsrNm = regUsrNm;
	}
	public String getOrdLine() {
		return ordLine;
	}
	public void setOrdLine(String ordLine) {
		this.ordLine = ordLine;
	}
	public String getReplyLevel() {
		return replyLevel;
	}
	public void setReplyLevel(String replyLevel) {
		this.replyLevel = replyLevel;
	}
	public Date getExpectArrivalDt() {
		return expectArrivalDt;
	}
	public void setExpectArrivalDt(Date expectArrivalDt) {
		this.expectArrivalDt = expectArrivalDt;
	}
	public String getRelateNo() {
		return relateNo;
	}
	public void setRelateNo(String relateNo) {
		this.relateNo = relateNo;
	}
    
}
