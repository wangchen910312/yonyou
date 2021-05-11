package chn.bhmc.dms.cmm.cmp.vo;

import java.io.Serializable;
import java.util.Date;

import chn.bhmc.dms.core.datatype.SearchVO;

public class TmpDcsErpCarDetailVO extends SearchVO implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private String dlrCd;
	private String vinNo;
	private String vinNo1;
	private String vinNo2;
	private String carStatCd;
	private Date pltGiDt;
	private Date grDt;
	private Date grteStartDt;
	private Date custSaleDt;
	private String strNo;
	private String strYn;
	
	private String erpDlrCd;
	private String erpVinNo;
	private String erpVinNo1;
	private String erpVinNo2;
	private String erpCarStatCd;
	private Date erpPltGiDt;
	private Date erpGrDt;
	private Date erpGrteStartDt;
	private Date erpCustSaleDt;
	private String erpStrNo;
	private String erpStrYn;

	private String regUsrId;
	private Date regDt;
	private String updtUsrId;
	private Date updtDt;
	private String erpRegUsrId;
	private Date erpRegDt;
	private String erpUpdtUsrId;
	private Date erpUpdtDt;
	
	private String checkResult;
	private String checkReason;
	private String updateResult;
	private String updateReason;
	
	//show
	private String pltGiDtStr;
	private String grDtStr;
	private String grteStartDtStr;
	private String custSaleDtStr;
	private String regDtStr;
	private String updtDtStr;
	private String erpPltGiDtStr;
	private String erpGrDtStr;
	private String erpGrteStartDtStr;
	private String erpCustSaleDtStr;
	private String erpRegDtStr;
	private String erpUpdtDtStr;
	
	public String getDlrCd() {
		return dlrCd;
	}
	public void setDlrCd(String dlrCd) {
		this.dlrCd = dlrCd;
	}
	public String getVinNo() {
		return vinNo;
	}
	public void setVinNo(String vinNo) {
		this.vinNo = vinNo;
	}
	public String getVinNo1() {
		return vinNo1;
	}
	public void setVinNo1(String vinNo1) {
		this.vinNo1 = vinNo1;
	}
	public String getVinNo2() {
		return vinNo2;
	}
	public void setVinNo2(String vinNo2) {
		this.vinNo2 = vinNo2;
	}
	public String getCarStatCd() {
		return carStatCd;
	}
	public void setCarStatCd(String carStatCd) {
		this.carStatCd = carStatCd;
	}
	public Date getPltGiDt() {
		return pltGiDt;
	}
	public void setPltGiDt(Date pltGiDt) {
		this.pltGiDt = pltGiDt;
	}
	public Date getGrDt() {
		return grDt;
	}
	public void setGrDt(Date grDt) {
		this.grDt = grDt;
	}
	public Date getGrteStartDt() {
		return grteStartDt;
	}
	public void setGrteStartDt(Date grteStartDt) {
		this.grteStartDt = grteStartDt;
	}
	public Date getCustSaleDt() {
		return custSaleDt;
	}
	public void setCustSaleDt(Date custSaleDt) {
		this.custSaleDt = custSaleDt;
	}
	public String getStrNo() {
		return strNo;
	}
	public void setStrNo(String strNo) {
		this.strNo = strNo;
	}
	public String getStrYn() {
		return strYn;
	}
	public void setStrYn(String strYn) {
		this.strYn = strYn;
	}
	public String getErpDlrCd() {
		return erpDlrCd;
	}
	public void setErpDlrCd(String erpDlrCd) {
		this.erpDlrCd = erpDlrCd;
	}
	public String getErpVinNo() {
		return erpVinNo;
	}
	public void setErpVinNo(String erpVinNo) {
		this.erpVinNo = erpVinNo;
	}
	public String getErpVinNo1() {
		return erpVinNo1;
	}
	public void setErpVinNo1(String erpVinNo1) {
		this.erpVinNo1 = erpVinNo1;
	}
	public String getErpVinNo2() {
		return erpVinNo2;
	}
	public void setErpVinNo2(String erpVinNo2) {
		this.erpVinNo2 = erpVinNo2;
	}
	public String getErpCarStatCd() {
		return erpCarStatCd;
	}
	public void setErpCarStatCd(String erpCarStatCd) {
		this.erpCarStatCd = erpCarStatCd;
	}
	public Date getErpPltGiDt() {
		return erpPltGiDt;
	}
	public void setErpPltGiDt(Date erpPltGiDt) {
		this.erpPltGiDt = erpPltGiDt;
	}
	public Date getErpGrDt() {
		return erpGrDt;
	}
	public void setErpGrDt(Date erpGrDt) {
		this.erpGrDt = erpGrDt;
	}
	public Date getErpGrteStartDt() {
		return erpGrteStartDt;
	}
	public void setErpGrteStartDt(Date erpGrteStartDt) {
		this.erpGrteStartDt = erpGrteStartDt;
	}
	public Date getErpCustSaleDt() {
		return erpCustSaleDt;
	}
	public void setErpCustSaleDt(Date erpCustSaleDt) {
		this.erpCustSaleDt = erpCustSaleDt;
	}
	public String getErpStrNo() {
		return erpStrNo;
	}
	public void setErpStrNo(String erpStrNo) {
		this.erpStrNo = erpStrNo;
	}
	public String getErpStrYn() {
		return erpStrYn;
	}
	public void setErpStrYn(String erpStrYn) {
		this.erpStrYn = erpStrYn;
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
		return updtDt;
	}
	public void setUpdtDt(Date updtDt) {
		this.updtDt = updtDt;
	}
	public String getErpRegUsrId() {
		return erpRegUsrId;
	}
	public void setErpRegUsrId(String erpRegUsrId) {
		this.erpRegUsrId = erpRegUsrId;
	}
	public Date getErpRegDt() {
		return erpRegDt;
	}
	public void setErpRegDt(Date erpRegDt) {
		this.erpRegDt = erpRegDt;
	}
	public String getErpUpdtUsrId() {
		return erpUpdtUsrId;
	}
	public void setErpUpdtUsrId(String erpUpdtUsrId) {
		this.erpUpdtUsrId = erpUpdtUsrId;
	}
	public Date getErpUpdtDt() {
		return erpUpdtDt;
	}
	public void setErpUpdtDt(Date erpUpdtDt) {
		this.erpUpdtDt = erpUpdtDt;
	}
	public String getCheckResult() {
		return checkResult;
	}
	public void setCheckResult(String checkResult) {
		this.checkResult = checkResult;
	}
	public String getCheckReason() {
		return checkReason;
	}
	public void setCheckReason(String checkReason) {
		this.checkReason = checkReason;
	}
	public String getUpdateResult() {
		return updateResult;
	}
	public void setUpdateResult(String updateResult) {
		this.updateResult = updateResult;
	}
	public String getUpdateReason() {
		return updateReason;
	}
	public void setUpdateReason(String updateReason) {
		this.updateReason = updateReason;
	}
	public String getPltGiDtStr() {
		return pltGiDtStr;
	}
	public void setPltGiDtStr(String pltGiDtStr) {
		this.pltGiDtStr = pltGiDtStr;
	}
	public String getGrDtStr() {
		return grDtStr;
	}
	public void setGrDtStr(String grDtStr) {
		this.grDtStr = grDtStr;
	}
	public String getGrteStartDtStr() {
		return grteStartDtStr;
	}
	public void setGrteStartDtStr(String grteStartDtStr) {
		this.grteStartDtStr = grteStartDtStr;
	}
	public String getCustSaleDtStr() {
		return custSaleDtStr;
	}
	public void setCustSaleDtStr(String custSaleDtStr) {
		this.custSaleDtStr = custSaleDtStr;
	}
	public String getRegDtStr() {
		return regDtStr;
	}
	public void setRegDtStr(String regDtStr) {
		this.regDtStr = regDtStr;
	}
	public String getUpdtDtStr() {
		return updtDtStr;
	}
	public void setUpdtDtStr(String updtDtStr) {
		this.updtDtStr = updtDtStr;
	}
	public String getErpPltGiDtStr() {
		return erpPltGiDtStr;
	}
	public void setErpPltGiDtStr(String erpPltGiDtStr) {
		this.erpPltGiDtStr = erpPltGiDtStr;
	}
	public String getErpGrDtStr() {
		return erpGrDtStr;
	}
	public void setErpGrDtStr(String erpGrDtStr) {
		this.erpGrDtStr = erpGrDtStr;
	}
	public String getErpGrteStartDtStr() {
		return erpGrteStartDtStr;
	}
	public void setErpGrteStartDtStr(String erpGrteStartDtStr) {
		this.erpGrteStartDtStr = erpGrteStartDtStr;
	}
	public String getErpCustSaleDtStr() {
		return erpCustSaleDtStr;
	}
	public void setErpCustSaleDtStr(String erpCustSaleDtStr) {
		this.erpCustSaleDtStr = erpCustSaleDtStr;
	}
	public String getErpRegDtStr() {
		return erpRegDtStr;
	}
	public void setErpRegDtStr(String erpRegDtStr) {
		this.erpRegDtStr = erpRegDtStr;
	}
	public String getErpUpdtDtStr() {
		return erpUpdtDtStr;
	}
	public void setErpUpdtDtStr(String erpUpdtDtStr) {
		this.erpUpdtDtStr = erpUpdtDtStr;
	}
	
	
}