package chn.bhmc.dms.cmm.cmp.vo;

import java.io.Serializable;
import java.util.Date;

import chn.bhmc.dms.core.datatype.SearchVO;

public class TmpDmsErpOrderDetailVO extends SearchVO implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private String dlrCd;
	private String salesNo;
	private String prty;
	private String orty;
	private String aldy;
	private String ordYymm;
	private String ordWeek;
	private Date asdy;
	private Date acdy;
	private Date ocdy;
	private String vinNo1;
	private String vinNo2;
	private String regUsrId;
	private Date regDt;
	private String updtUsrId;
	private Date updtDt;
	private String asdyStr;
	private String acdyStr;
	private String ocdyStr;
	private String regDtStr;
	private String updtDtStr;
	
	private String erpDlrCd;
	private String erpSalesNo;
	private String erpPrty;
	private String erpOrty;
	private String erpAldy;
	private String erpOrdYymm;
	private String erpOrdWeek;
	private Date erpAsdy;
	private Date erpAcdy;
	private Date erpOcdy;
	private String erpVinNo1;
	private String erpVinNo2;
	private String erpRegUsrId;
	private Date erpRegDt;
	private String erpUpdtUsrId;
	private Date erpUpdtDt;
	private String erpAsdyStr;
	private String erpAcdyStr;
	private String erpOcdyStr;
	private String erpRegDtStr;
	private String erpUpdtDtStr;
	
	private String checkResult;
	private String checkReason;
	private String updateResult;
	private String updateReason;
	
	public String getDlrCd() {
		return dlrCd;
	}
	public void setDlrCd(String dlrCd) {
		this.dlrCd = dlrCd;
	}
	public String getSalesNo() {
		return salesNo;
	}
	public void setSalesNo(String salesNo) {
		this.salesNo = salesNo;
	}
	public String getPrty() {
		return prty;
	}
	public void setPrty(String prty) {
		this.prty = prty;
	}
	public String getOrty() {
		return orty;
	}
	public void setOrty(String orty) {
		this.orty = orty;
	}
	public String getAldy() {
		return aldy;
	}
	public void setAldy(String aldy) {
		this.aldy = aldy;
	}
	public String getOrdYymm() {
		return ordYymm;
	}
	public void setOrdYymm(String ordYymm) {
		this.ordYymm = ordYymm;
	}
	public String getOrdWeek() {
		return ordWeek;
	}
	public void setOrdWeek(String ordWeek) {
		this.ordWeek = ordWeek;
	}
	public Date getAsdy() {
		return asdy;
	}
	public void setAsdy(Date asdy) {
		this.asdy = asdy;
	}
	public Date getAcdy() {
		return acdy;
	}
	public void setAcdy(Date acdy) {
		this.acdy = acdy;
	}
	public Date getOcdy() {
		return ocdy;
	}
	public void setOcdy(Date ocdy) {
		this.ocdy = ocdy;
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
	public String getAsdyStr() {
		return asdyStr;
	}
	public void setAsdyStr(String asdyStr) {
		this.asdyStr = asdyStr;
	}
	public String getAcdyStr() {
		return acdyStr;
	}
	public void setAcdyStr(String acdyStr) {
		this.acdyStr = acdyStr;
	}
	public String getOcdyStr() {
		return ocdyStr;
	}
	public void setOcdyStr(String ocdyStr) {
		this.ocdyStr = ocdyStr;
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
	public String getErpDlrCd() {
		return erpDlrCd;
	}
	public void setErpDlrCd(String erpDlrCd) {
		this.erpDlrCd = erpDlrCd;
	}
	public String getErpSalesNo() {
		return erpSalesNo;
	}
	public void setErpSalesNo(String erpSalesNo) {
		this.erpSalesNo = erpSalesNo;
	}
	public String getErpPrty() {
		return erpPrty;
	}
	public void setErpPrty(String erpPrty) {
		this.erpPrty = erpPrty;
	}
	public String getErpOrty() {
		return erpOrty;
	}
	public void setErpOrty(String erpOrty) {
		this.erpOrty = erpOrty;
	}
	public String getErpAldy() {
		return erpAldy;
	}
	public void setErpAldy(String erpAldy) {
		this.erpAldy = erpAldy;
	}
	public String getErpOrdYymm() {
		return erpOrdYymm;
	}
	public void setErpOrdYymm(String erpOrdYymm) {
		this.erpOrdYymm = erpOrdYymm;
	}
	public String getErpOrdWeek() {
		return erpOrdWeek;
	}
	public void setErpOrdWeek(String erpOrdWeek) {
		this.erpOrdWeek = erpOrdWeek;
	}
	public Date getErpAsdy() {
		return erpAsdy;
	}
	public void setErpAsdy(Date erpAsdy) {
		this.erpAsdy = erpAsdy;
	}
	public Date getErpAcdy() {
		return erpAcdy;
	}
	public void setErpAcdy(Date erpAcdy) {
		this.erpAcdy = erpAcdy;
	}
	public Date getErpOcdy() {
		return erpOcdy;
	}
	public void setErpOcdy(Date erpOcdy) {
		this.erpOcdy = erpOcdy;
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
	public String getErpAsdyStr() {
		return erpAsdyStr;
	}
	public void setErpAsdyStr(String erpAsdyStr) {
		this.erpAsdyStr = erpAsdyStr;
	}
	public String getErpAcdyStr() {
		return erpAcdyStr;
	}
	public void setErpAcdyStr(String erpAcdyStr) {
		this.erpAcdyStr = erpAcdyStr;
	}
	public String getErpOcdyStr() {
		return erpOcdyStr;
	}
	public void setErpOcdyStr(String erpOcdyStr) {
		this.erpOcdyStr = erpOcdyStr;
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
	
}