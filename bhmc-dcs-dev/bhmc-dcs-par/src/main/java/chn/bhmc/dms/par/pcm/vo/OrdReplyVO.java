package chn.bhmc.dms.par.pcm.vo;

import java.util.Date;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
/**
 * 回复
 * @author liuxueying
 *
 */
public class OrdReplyVO {
	
    private String dlrCd;
    private String replyId;
    private String questionNo;//申诉编号
    private String bmpOrdNo;//bmp订单编号
    private String regUsrId;//提交人
    
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;//提交时间
    private String content;//内容
    private String optTp;//操作类型 0转办 1办结
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date expectArrivalDt;//预计到货时间
    private String replyLevel;//回复级别 0 回复-库存管理科 1回复-采购支援科
    private String partNo;//配件编号
    
    private String historyFlg;//历史单据
	public String getDlrCd() {
		return dlrCd;
	}
	public void setDlrCd(String dlrCd) {
		this.dlrCd = dlrCd;
	}
	public String getReplyId() {
		return replyId;
	}
	public void setReplyId(String replyId) {
		this.replyId = replyId;
	}
	public String getQuestionNo() {
		return questionNo;
	}
	public void setQuestionNo(String questionNo) {
		this.questionNo = questionNo;
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
	public String getOptTp() {
		return optTp;
	}
	public void setOptTp(String optTp) {
		this.optTp = optTp;
	}
	public Date getExpectArrivalDt() {
		return expectArrivalDt;
	}
	public void setExpectArrivalDt(Date expectArrivalDt) {
		this.expectArrivalDt = expectArrivalDt;
	}
	public String getReplyLevel() {
		return replyLevel;
	}
	public void setReplyLevel(String replyLevel) {
		this.replyLevel = replyLevel;
	}
	public String getPartNo() {
		return partNo;
	}
	public void setPartNo(String partNo) {
		this.partNo = partNo;
	}
	public String getHistoryFlg() {
		return historyFlg;
	}
	public void setHistoryFlg(String historyFlg) {
		this.historyFlg = historyFlg;
	}
    
}
