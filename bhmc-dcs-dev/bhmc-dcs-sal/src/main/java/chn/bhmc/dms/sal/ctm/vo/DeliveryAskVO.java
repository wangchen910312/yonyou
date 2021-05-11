package chn.bhmc.dms.sal.ctm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DeliveryAskVO
 * @Description : 출고요청관리 목록 VO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2016.03.08      Kim Jin Suk        최초 생성
 * </pre>
 */

public class DeliveryAskVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2200989445187943830L;

    private  String giStat;
    private  String giStatCd;       // 출고문서상태 (출고등록,완료,출고등록취소, 출고완료취소)
    private  String allocQueNo;     // 배정번호
    private  String vinNo;           // vin no
    private  String carlineCd;       // 차종
    private  String carlineNm;       //
    private  String modelCd;         // 모델
    private  String modelNm;         //
    private  String ocnCd;           // ocn
    private  String ocnNm;           //
    private  String extColorCd;     // 외장색
    private  String extColorNm;     //
    private  String intColorCd;     // 내장색
    private  String intColorNm;     //
    private  String dlrCd;           // 딜러코드
    private  String contractNo;      // 계약번호
    private  String contractCustNo; //
    private  String custNm;          // 고객명
    private  String contractTp;      // 계약유형
    private  String saleEmpNo;      // 판매사원
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date contractDt;      // 계약일
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date dlReqDt;         // 고객인도요청일
    private  String contractStatCd; // 계약상태
    private  String stockTp;       // 재고유형
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date allocDt;         // 배정일
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date giReqDt;       // 출고요청일
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date giDt;          // 출고확정일

    /**
     * @return the giStat
     */
    public String getGiStat() {
        return giStat;
    }

    /**
     * @param giStat the giStat to set
     */
    public void setGiStat(String giStat) {
        this.giStat = giStat;
    }

    /**
     * @return the giStatCd
     */
    public String getGiStatCd() {
        return giStatCd;
    }

    /**
     * @param giStatCd the giStatCd to set
     */
    public void setGiStatCd(String giStatCd) {
        this.giStatCd = giStatCd;
    }

    /**
     * @return the allocQueNo
     */
    public String getAllocQueNo() {
        return allocQueNo;
    }

    /**
     * @param allocQueNo the allocQueNo to set
     */
    public void setAllocQueNo(String allocQueNo) {
        this.allocQueNo = allocQueNo;
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
     * @return the contractTp
     */
    public String getContractTp() {
        return contractTp;
    }

    /**
     * @param contractTp the contractTp to set
     */
    public void setContractTp(String contractTp) {
        this.contractTp = contractTp;
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
     * @return the dlReqDt
     */
    public Date getDlReqDt() {
        return dlReqDt;
    }

    /**
     * @param dlReqDt the dlReqDt to set
     */
    public void setDlReqDt(Date dlReqDt) {
        this.dlReqDt = dlReqDt;
    }

    /**
     * @return the contractStatCd
     */
    public String getContractStatCd() {
        return contractStatCd;
    }

    /**
     * @param contractStatCd the contractStatCd to set
     */
    public void setContractStatCd(String contractStatCd) {
        this.contractStatCd = contractStatCd;
    }

    /**
     * @return the stockTp
     */
    public String getStockTp() {
        return stockTp;
    }

    /**
     * @param stockTp the stockTp to set
     */
    public void setStockTp(String stockTp) {
        this.stockTp = stockTp;
    }

    /**
     * @return the allocDt
     */
    public Date getAllocDt() {
        return allocDt;
    }

    /**
     * @param allocDt the allocDt to set
     */
    public void setAllocDt(Date allocDt) {
        this.allocDt = allocDt;
    }

    /**
     * @return the giStatDt
     */
    public Date getGiReqDt() {
        return giReqDt;
    }

    /**
     * @param giStatDt the giStatDt to set
     */
    public void setGiReqDt(Date giReqDt) {
        this.giReqDt = giReqDt;
    }

    /**
     * @return the giDt
     */
    public Date getGiDt() {
        return giDt;
    }

    /**
     * @param giDt the giDt to set
     */
    public void setGiDt(Date giDt) {
        this.giDt = giDt;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}
