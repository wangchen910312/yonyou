package chn.bhmc.dms.cmm.cmp.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

public class DateBaDmsDownReVO extends BaseVO {


	/**
	 * 
	 */
	private static final long serialVersionUID = -4316438728282091026L;
	
     /**
      * 店代码
      */
	 private String dlrCd;
	 
	 /**
      * 文件名
      */
	 private String fileNm;
	 
	 /**
      * 文件路径
      */
	 private String fileRoute;
	 
	 /**
      * 下载人
      */
	 private String regUsrId;
	 
	 /**
      * 下载时间
      */
	 @JsonDeserialize(using=JsonDateDeserializer.class)
	    private Date regDt;
	 
	 /**
      * 更改人id
      */
	 private String updtUsrId;
	 
	 /**
      *更改时间
      */
	 @JsonDeserialize(using=JsonDateDeserializer.class)
	    private Date updtDt;
	 
	 /**
      * 下载是否成功
      */
	 private String   succeDown;
	 
	 /**
      * 失败原因
      */
	 private String  failReason;

	public String getDlrCd() {
		return dlrCd;
	}

	public void setDlrCd(String dlrCd) {
		this.dlrCd = dlrCd;
	}

	public String getFileNm() {
		return fileNm;
	}

	public void setFileNm(String fileNm) {
		this.fileNm = fileNm;
	}

	public String getFileRoute() {
		return fileRoute;
	}

	public void setFileRoute(String fileRoute) {
		this.fileRoute = fileRoute;
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

	public String getUpdtUsrId() {
		return updtUsrId;
	}

	public void setUpdtUsrId(String updtUsrId) {
		this.updtUsrId = updtUsrId;
	}

	public Date getUpdtDT() {
		return updtDt;
	}

	public void setUpdtDt(Date updtDt) {
		this.updtDt = updtDt;
	}

	public String getSucceDown() {
		return succeDown;
	}

	public void setSucceDown(String succeDown) {
		this.succeDown = succeDown;
	}

	public String getFailReason() {
		return failReason;
	}

	public void setFailReason(String failReason) {
		this.failReason = failReason;
	}
	 
	 
	
}
