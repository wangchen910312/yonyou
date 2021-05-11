package chn.bhmc.dms.bat.sal.cr.vo;
import chn.bhmc.dms.core.datatype.BaseVO;

public class BatchCrConRemVO extends BaseVO {
	
	/**
     * Statements
     * (long)serialVersionUID
     */
	private static final long serialVersionUID = -3467595098609441803L;
	
	private String  saleEmpNo;//销售顾问
	 private String saleEmpNm;//销售顾问姓名
	 private String contractStatCd;//20 代表 已签
	 private String dlReqDt;//预定成时间
	 private String contractNo;//合同号码
	 private String carlineNm;//车种
	 private String fscNm; //车款
	 private String dlrCd;
	 private String vinNo; //车辆识别码
	 
	/**
	 * 
	 * @return the serialversionuid
	 */
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	/**
	 * 
	 * @return
	 */
	public String getSaleEmpNo() {
		return saleEmpNo;
	}
	
	/**
	 * 
	 * @param saleEmpNo
	 */
	public void setSaleEmpNo(String saleEmpNo) {
		this.saleEmpNo = saleEmpNo;
	}
	
	/**
	 * 
	 * @return
	 */
	public String getSaleEmpNm() {
		return saleEmpNm;
	}
	
	/**
	 * 
	 * @param saleEmpNm
	 */
	public void setSaleEmpNm(String saleEmpNm) {
		this.saleEmpNm = saleEmpNm;
	}
	
	/**
	 * 
	 * @return
	 */
	public String getContractStatCd() {
		return contractStatCd;
	}
	
	/**
	 * 
	 * @param contractStatCd
	 */
	public void setContractStatCd(String contractStatCd) {
		this.contractStatCd = contractStatCd;
	}
	
	/**
	 * 
	 * @return
	 */
	public String getDlReqDt() {
		return dlReqDt;
	}
	
	/**
	 * 
	 * @param dlReqDt
	 */
	public void setDlReqDt(String dlReqDt) {
		this.dlReqDt = dlReqDt;
	}
	
	/**
	 * 
	 * @return
	 */
	public String getContractNo() {
		return contractNo;
	}
	
	/**
	 * 
	 * @param contractNo
	 */
	public void setContractNo(String contractNo) {
		this.contractNo = contractNo;
	}
	
	/**
	 * 
	 * @return
	 */
	public String getCarlineNm() {
		return carlineNm;
	}
	
	/**
	 * 
	 * @param carlineNm
	 */
	public void setCarlineNm(String carlineNm) {
		this.carlineNm = carlineNm;
	}
	
	/**
	 * 
	 * @return
	 */
	public String getFscNm() {
		return fscNm;
	}
	
	/**
	 * 
	 * @param fscNm
	 */
	public void setFscNm(String fscNm) {
		this.fscNm = fscNm;
	}
	
	/**
	 * 
	 * @return
	 */
	public String getDlrCd() {
		return dlrCd;
	}
	
	/**
	 * 
	 * @param dlrCd
	 */
	public void setDlrCd(String dlrCd) {
		this.dlrCd = dlrCd;
	}

	public String getVinNo() {
		return vinNo;
	}

	public void setVinNo(String vinNo) {
		this.vinNo = vinNo;
	}
	
	 
	 
	 
	 
	 
}
