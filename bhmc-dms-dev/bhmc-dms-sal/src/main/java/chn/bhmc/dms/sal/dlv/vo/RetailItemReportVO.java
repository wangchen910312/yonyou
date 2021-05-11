package chn.bhmc.dms.sal.dlv.vo;

import java.util.Date;

import able.com.vo.SearchVO;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * 소매 명세 레포트
 * </pre>
 *
 * @ClassName   : RetailItemReportVO.java
 * @Description : 소매 명세 레포트
 * @author chibeom.song
 * @since 2016. 10. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.10.25.    chibeom.song     최초 생성
 * </pre>
 */

public class RetailItemReportVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2459231969397079891L;
    private String rnum;
    private String custNm;
    private String sVinNo;
    private String sCarlineCd;
    private String sModelCd;
    private String sEnginNo;
    private String sCertNo;
    private String sOrdTp;
    private String sCondition;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStartDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndDt;
    private String sContractTp;
    private String tacticsYn;
    private String vinNo;
    private String carlineCd;
    private String carlineNm;
    private String modelCd;
    private String modelNm;
    private String ocnCd;
    private String ocnNm;
    private String intColorCd;
    private String intColorNm;
    private String extColorCd;
    private String extColorNm;
    private String enginNo;
    private String certNo;
    private String ordTp;
    private String manufactYyMmDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date custSaleDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date pltGiDt;
    private int prncQty;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date workDate;
    private String kmopt;
    private String controlTp;
    private String incentiveMonth;
    private String saleEmp;
    private String retailDt;
    private String retailDtXls;
    private String saleEmpNm;

    private String bankNm;            //银行
    private double vinmBkcm;          //质押金额
    private String vinmBkwb;          //汇票号
    private String vinmRepayYn;       //是否还款
    /**
     * @return the saleEmpNm
     */
    public String getSaleEmpNm() {
        return saleEmpNm;
    }
    /**
     * @param saleEmpNm the saleEmpNm to set
     */
    public void setSaleEmpNm(String saleEmpNm) {
        this.saleEmpNm = saleEmpNm;
    }
    /**
     * @return the retailDtXls
     */
    public String getRetailDtXls() {
        return retailDtXls;
    }
    /**
     * @param retailDtXls the retailDtXls to set
     */
    public void setRetailDtXls(String retailDtXls) {
        this.retailDtXls = retailDtXls;
    }
    /**
     * @return the rnum
     */
    public String getRnum() {
        return rnum;
    }
    /**
     * @param rnum the rnum to set
     */
    public void setRnum(String rnum) {
        this.rnum = rnum;
    }
    /**
     * @return the custNm
     */
    public String getCustNm() {
        return custNm;
    }
    /**
     * @param custNm the custNm to set
     */
    public void setCustNm(String custNm) {
        this.custNm = custNm;
    }
    /**
     * @return the sVinNo
     */
    public String getsVinNo() {
        return sVinNo;
    }
    /**
     * @param sVinNo the sVinNo to set
     */
    public void setsVinNo(String sVinNo) {
        this.sVinNo = sVinNo;
    }
    /**
     * @return the sCarlineCd
     */
    public String getsCarlineCd() {
        return sCarlineCd;
    }
    /**
     * @param sCarlineCd the sCarlineCd to set
     */
    public void setsCarlineCd(String sCarlineCd) {
        this.sCarlineCd = sCarlineCd;
    }
    /**
     * @return the sModelCd
     */
    public String getsModelCd() {
        return sModelCd;
    }
    /**
     * @param sModelCd the sModelCd to set
     */
    public void setsModelCd(String sModelCd) {
        this.sModelCd = sModelCd;
    }
    /**
     * @return the sEnginNo
     */
    public String getsEnginNo() {
        return sEnginNo;
    }
    /**
     * @param sEnginNo the sEnginNo to set
     */
    public void setsEnginNo(String sEnginNo) {
        this.sEnginNo = sEnginNo;
    }
    /**
     * @return the sCertNo
     */
    public String getsCertNo() {
        return sCertNo;
    }
    /**
     * @param sCertNo the sCertNo to set
     */
    public void setsCertNo(String sCertNo) {
        this.sCertNo = sCertNo;
    }
    /**
     * @return the sOrdTp
     */
    public String getsOrdTp() {
        return sOrdTp;
    }
    /**
     * @param sOrdTp the sOrdTp to set
     */
    public void setsOrdTp(String sOrdTp) {
        this.sOrdTp = sOrdTp;
    }
    /**
     * @return the sCondition
     */
    public String getsCondition() {
        return sCondition;
    }
    /**
     * @param sCondition the sCondition to set
     */
    public void setsCondition(String sCondition) {
        this.sCondition = sCondition;
    }
    /**
     * @return the sStartDt
     */
    public Date getsStartDt() {
        return sStartDt;
    }
    /**
     * @param sStartDt the sStartDt to set
     */
    public void setsStartDt(Date sStartDt) {
        this.sStartDt = sStartDt;
    }
    /**
     * @return the sEndDt
     */
    public Date getsEndDt() {
        return sEndDt;
    }
    /**
     * @param sEndDt the sEndDt to set
     */
    public void setsEndDt(Date sEndDt) {
        this.sEndDt = sEndDt;
    }
    /**
     * @return the sContractTp
     */
    public String getsContractTp() {
        return sContractTp;
    }
    /**
     * @param sContractTp the sContractTp to set
     */
    public void setsContractTp(String sContractTp) {
        this.sContractTp = sContractTp;
    }
    /**
     * @return the tacticsYn
     */
    public String getTacticsYn() {
        return tacticsYn;
    }
    /**
     * @param tacticsYn the tacticsYn to set
     */
    public void setTacticsYn(String tacticsYn) {
        this.tacticsYn = tacticsYn;
    }
    /**
     * @return the vinNo
     */
    public String getVinNo() {
        return vinNo;
    }
    /**
     * @param vinNo the vinNo to set
     */
    public void setVinNo(String vinNo) {
        this.vinNo = vinNo;
    }
    /**
     * @return the carlineCd
     */
    public String getCarlineCd() {
        return carlineCd;
    }
    /**
     * @param carlineCd the carlineCd to set
     */
    public void setCarlineCd(String carlineCd) {
        this.carlineCd = carlineCd;
    }
    /**
     * @return the carlineNm
     */
    public String getCarlineNm() {
        return carlineNm;
    }
    /**
     * @param carlineNm the carlineNm to set
     */
    public void setCarlineNm(String carlineNm) {
        this.carlineNm = carlineNm;
    }
    /**
     * @return the modelCd
     */
    public String getModelCd() {
        return modelCd;
    }
    /**
     * @param modelCd the modelCd to set
     */
    public void setModelCd(String modelCd) {
        this.modelCd = modelCd;
    }
    /**
     * @return the modelNm
     */
    public String getModelNm() {
        return modelNm;
    }
    /**
     * @param modelNm the modelNm to set
     */
    public void setModelNm(String modelNm) {
        this.modelNm = modelNm;
    }
    /**
     * @return the ocnCd
     */
    public String getOcnCd() {
        return ocnCd;
    }
    /**
     * @param ocnCd the ocnCd to set
     */
    public void setOcnCd(String ocnCd) {
        this.ocnCd = ocnCd;
    }
    /**
     * @return the ocnNm
     */
    public String getOcnNm() {
        return ocnNm;
    }
    /**
     * @param ocnNm the ocnNm to set
     */
    public void setOcnNm(String ocnNm) {
        this.ocnNm = ocnNm;
    }
    /**
     * @return the intColorCd
     */
    public String getIntColorCd() {
        return intColorCd;
    }
    /**
     * @param intColorCd the intColorCd to set
     */
    public void setIntColorCd(String intColorCd) {
        this.intColorCd = intColorCd;
    }
    /**
     * @return the intColorNm
     */
    public String getIntColorNm() {
        return intColorNm;
    }
    /**
     * @param intColorNm the intColorNm to set
     */
    public void setIntColorNm(String intColorNm) {
        this.intColorNm = intColorNm;
    }
    /**
     * @return the extColorCd
     */
    public String getExtColorCd() {
        return extColorCd;
    }
    /**
     * @param extColorCd the extColorCd to set
     */
    public void setExtColorCd(String extColorCd) {
        this.extColorCd = extColorCd;
    }
    /**
     * @return the extColorNm
     */
    public String getExtColorNm() {
        return extColorNm;
    }
    /**
     * @param extColorNm the extColorNm to set
     */
    public void setExtColorNm(String extColorNm) {
        this.extColorNm = extColorNm;
    }
    /**
     * @return the enginNo
     */
    public String getEnginNo() {
        return enginNo;
    }
    /**
     * @param enginNo the enginNo to set
     */
    public void setEnginNo(String enginNo) {
        this.enginNo = enginNo;
    }
    /**
     * @return the certNo
     */
    public String getCertNo() {
        return certNo;
    }
    /**
     * @param certNo the certNo to set
     */
    public void setCertNo(String certNo) {
        this.certNo = certNo;
    }
    /**
     * @return the ordTp
     */
    public String getOrdTp() {
        return ordTp;
    }
    /**
     * @param ordTp the ordTp to set
     */
    public void setOrdTp(String ordTp) {
        this.ordTp = ordTp;
    }
    /**
     * @return the manufactYyMmDt
     */
    public String getManufactYyMmDt() {
        return manufactYyMmDt;
    }
    /**
     * @param manufactYyMmDt the manufactYyMmDt to set
     */
    public void setManufactYyMmDt(String manufactYyMmDt) {
        this.manufactYyMmDt = manufactYyMmDt;
    }
    /**
     * @return the custSaleDt
     */
    public Date getCustSaleDt() {
        return custSaleDt;
    }
    /**
     * @param custSaleDt the custSaleDt to set
     */
    public void setCustSaleDt(Date custSaleDt) {
        this.custSaleDt = custSaleDt;
    }
    /**
     * @return the pltGiDt
     */
    public Date getPltGiDt() {
        return pltGiDt;
    }
    /**
     * @param pltGiDt the pltGiDt to set
     */
    public void setPltGiDt(Date pltGiDt) {
        this.pltGiDt = pltGiDt;
    }
    /**
     * @return the prncQty
     */
    public int getPrncQty() {
        return prncQty;
    }
    /**
     * @param prncQty the prncQty to set
     */
    public void setPrncQty(int prncQty) {
        this.prncQty = prncQty;
    }
    /**
     * @return the workDate
     */
    public Date getWorkDate() {
        return workDate;
    }
    /**
     * @param workDate the workDate to set
     */
    public void setWorkDate(Date workDate) {
        this.workDate = workDate;
    }
    /**
     * @return the kmopt
     */
    public String getKmopt() {
        return kmopt;
    }
    /**
     * @param kmopt the kmopt to set
     */
    public void setKmopt(String kmopt) {
        this.kmopt = kmopt;
    }
    /**
     * @return the controlTp
     */
    public String getControlTp() {
        return controlTp;
    }
    /**
     * @param controlTp the controlTp to set
     */
    public void setControlTp(String controlTp) {
        this.controlTp = controlTp;
    }
    /**
     * @return the incentiveMonth
     */
    public String getIncentiveMonth() {
        return incentiveMonth;
    }
    /**
     * @param incentiveMonth the incentiveMonth to set
     */
    public void setIncentiveMonth(String incentiveMonth) {
        this.incentiveMonth = incentiveMonth;
    }
    /**
     * @return the saleEmp
     */
    public String getSaleEmp() {
        return saleEmp;
    }
    /**
     * @param saleEmp the saleEmp to set
     */
    public void setSaleEmp(String saleEmp) {
        this.saleEmp = saleEmp;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    /**
     * @return the retailDt
     */
    public String getRetailDt() {
        return retailDt;
    }
    /**
     * @param retailDt the retailDt to set
     */
    public void setRetailDt(String retailDt) {
        this.retailDt = retailDt;
    }
	public String getBankNm() {
		return bankNm;
	}
	public void setBankNm(String bankNm) {
		this.bankNm = bankNm;
	}
	public double getVinmBkcm() {
		return vinmBkcm;
	}
	public void setVinmBkcm(double vinmBkcm) {
		this.vinmBkcm = vinmBkcm;
	}
	public String getVinmBkwb() {
		return vinmBkwb;
	}
	public void setVinmBkwb(String vinmBkwb) {
		this.vinmBkwb = vinmBkwb;
	}
	public String getVinmRepayYn() {
		return vinmRepayYn;
	}
	public void setVinmRepayYn(String vinmRepayYn) {
		this.vinmRepayYn = vinmRepayYn;
	}
    
}