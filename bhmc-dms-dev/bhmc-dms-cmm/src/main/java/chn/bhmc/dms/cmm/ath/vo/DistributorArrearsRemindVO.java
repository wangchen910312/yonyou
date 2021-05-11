package chn.bhmc.dms.cmm.ath.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DistributorArrearsRemindVO.java
 * @Description : 经销商欠款提醒
 * @author JiaMing
 * @since 2019-2-27
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2019-2-27.       JiaMing                  贾明
 * </pre>
 */
public class DistributorArrearsRemindVO extends BaseVO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1312294744557075750L;
	
	/**
	 * 店代码
	 */
	private String dlrCd;
	/**
	 * 运维服务周期 开始时间
	 */
	@JsonDeserialize(using=JsonDateDeserializer.class)
	private Date opermServSt; 
	
	/**
	 * 运维服务周期 结束时间
	 */
	@JsonDeserialize(using=JsonDateDeserializer.class)
	private Date opermServEn; 
	
	/**
	 * 运维服务周期 更新时间
	 */
	@JsonDeserialize(using=JsonDateDeserializer.class)
	private Date opermServUpdt; 
	
	/**
	 * 是否已欠款（Y：是 N：否）
	 */
	private String arrearsYn;
	
	/**
	 * 写入人用户id
	 */
	private String regUsrId;
	
	/**
	 * 写入时间
	 */
	@JsonDeserialize(using=JsonDateDeserializer.class)
	private Date regDt; //opermServEn
	
	/**
	 * 更新人id
	 */
	private String updtUsrId;
	
	/**
	 * 更新人修改数据时间
	 */
	@JsonDeserialize(using=JsonDateDeserializer.class)
	private Date UpdtDt;
	
	/**
	 * 合同时间
	 */
	@JsonDeserialize(using=JsonDateDeserializer.class)
	private Date  contrantDt;
	

	public String getDlrCd() {
		return dlrCd;
	}

	public void setDlrCd(String dlrCd) {
		this.dlrCd = dlrCd;
	}

	public Date getOpermServSt() {
		return opermServSt;
	}

	public void setOpermServSt(Date opermServSt) {
		this.opermServSt = opermServSt;
	}

	public Date getOpermServEn() {
		return opermServEn;
	}

	public void setOpermServEn(Date opermServEn) {
		this.opermServEn = opermServEn;
	}

	public Date getOpermServUpdt() {
		return opermServUpdt;
	}

	public void setOpermServUpdt(Date opermServUpdt) {
		this.opermServUpdt = opermServUpdt;
	}

	public String getArrearsYn() {
		return arrearsYn;
	}

	public void setArrearsYn(String arrearsYn) {
		this.arrearsYn = arrearsYn;
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

	public Date getUpdtDt() {
		return UpdtDt;
	}

	public void setUpdtDt(Date updtDt) {
		UpdtDt = updtDt;
	}

	public Date getContrantDt() {
		return contrantDt;
	}

	public void setContrantDt(Date contrantDt) {
		this.contrantDt = contrantDt;
	}
	
	
	
	

}
