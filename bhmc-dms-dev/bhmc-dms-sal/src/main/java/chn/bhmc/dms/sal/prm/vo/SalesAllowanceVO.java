package chn.bhmc.dms.sal.prm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SalesAllowanceVO
 * @Description : Sales Allowance 조회 VO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2016.04.26      Kim Jin Suk        최초 생성
 * </pre>
 */

public class SalesAllowanceVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5660964959880204267L;

    private String dlrCd;
    private String promotionCd;
    private String promotionNm;
    private float imsBudnRate;   // 제조사부담율
    private float dlrBudnRate;   // 딜러부담율
    private long cntCount;
    private long carTotAmt;
    private long dcAmt;
    private long imsAmt;
    private String shYyMm;

    private String contractNo;
    private String contractCustNo;
    private String custCd;
    private String custNm;
    private String saleEmpNo;
    private String carlineCd;
    private String carlineNm;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date contractDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date realDlDt;
    /**
     * @return the dlrCd
     */
    public String getDlrCd() {
        return dlrCd;
    }
    /**
     * @param dlrCd the dlrCd to set
     */
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }
    /**
     * @return the promotionCd
     */
    public String getPromotionCd() {
        return promotionCd;
    }
    /**
     * @param promotionCd the promotionCd to set
     */
    public void setPromotionCd(String promotionCd) {
        this.promotionCd = promotionCd;
    }
    /**
     * @return the promotionNm
     */
    public String getPromotionNm() {
        return promotionNm;
    }
    /**
     * @param promotionNm the promotionNm to set
     */
    public void setPromotionNm(String promotionNm) {
        this.promotionNm = promotionNm;
    }
    /**
     * @return the imsBudnRate
     */
    public float getImsBudnRate() {
        return imsBudnRate;
    }
    /**
     * @param imsBudnRate the imsBudnRate to set
     */
    public void setImsBudnRate(float imsBudnRate) {
        this.imsBudnRate = imsBudnRate;
    }
    /**
     * @return the dlrBudnRate
     */
    public float getDlrBudnRate() {
        return dlrBudnRate;
    }
    /**
     * @param dlrBudnRate the dlrBudnRate to set
     */
    public void setDlrBudnRate(float dlrBudnRate) {
        this.dlrBudnRate = dlrBudnRate;
    }
    /**
     * @return the cntCount
     */
    public long getCntCount() {
        return cntCount;
    }
    /**
     * @param cntCount the cntCount to set
     */
    public void setCntCount(long cntCount) {
        this.cntCount = cntCount;
    }
    /**
     * @return the carTotAmt
     */
    public long getCarTotAmt() {
        return carTotAmt;
    }
    /**
     * @param carTotAmt the carTotAmt to set
     */
    public void setCarTotAmt(long carTotAmt) {
        this.carTotAmt = carTotAmt;
    }
    /**
     * @return the dcAmt
     */
    public long getDcAmt() {
        return dcAmt;
    }
    /**
     * @param dcAmt the dcAmt to set
     */
    public void setDcAmt(long dcAmt) {
        this.dcAmt = dcAmt;
    }
    /**
     * @return the imsAmt
     */
    public long getImsAmt() {
        return imsAmt;
    }
    /**
     * @param imsAmt the imsAmt to set
     */
    public void setImsAmt(long imsAmt) {
        this.imsAmt = imsAmt;
    }
    /**
     * @return the shYyMm
     */
    public String getShYyMm() {
        return shYyMm;
    }
    /**
     * @param shYyMm the shYyMm to set
     */
    public void setShYyMm(String shYyMm) {
        this.shYyMm = shYyMm;
    }
    /**
     * @return the contractNo
     */
    public String getContractNo() {
        return contractNo;
    }
    /**
     * @param contractNo the contractNo to set
     */
    public void setContractNo(String contractNo) {
        this.contractNo = contractNo;
    }
    /**
     * @return the contractCustNo
     */
    public String getContractCustNo() {
        return contractCustNo;
    }
    /**
     * @param contractCustNo the contractCustNo to set
     */
    public void setContractCustNo(String contractCustNo) {
        this.contractCustNo = contractCustNo;
    }
    /**
     * @return the custCd
     */
    public String getCustCd() {
        return custCd;
    }
    /**
     * @param custCd the custCd to set
     */
    public void setCustCd(String custCd) {
        this.custCd = custCd;
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
     * @return the saleEmpNo
     */
    public String getSaleEmpNo() {
        return saleEmpNo;
    }
    /**
     * @param saleEmpNo the saleEmpNo to set
     */
    public void setSaleEmpNo(String saleEmpNo) {
        this.saleEmpNo = saleEmpNo;
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
     * @return the contractDt
     */
    public Date getContractDt() {
        return contractDt;
    }
    /**
     * @param contractDt the contractDt to set
     */
    public void setContractDt(Date contractDt) {
        this.contractDt = contractDt;
    }
    /**
     * @return the realDlDt
     */
    public Date getRealDlDt() {
        return realDlDt;
    }
    /**
     * @param realDlDt the realDlDt to set
     */
    public void setRealDlDt(Date realDlDt) {
        this.realDlDt = realDlDt;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}
