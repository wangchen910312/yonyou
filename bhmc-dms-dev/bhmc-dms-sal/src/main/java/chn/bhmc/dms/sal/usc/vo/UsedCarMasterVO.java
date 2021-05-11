package chn.bhmc.dms.sal.usc.vo;


import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : UsedCarMasterVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 6. 2.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 2.      Kim yewon              최초 생성
 * </pre>
 */


@ValidDescriptor({
  @ValidField(field = "carId", mesgKey = "sal.lbl.carId")
})
public class UsedCarMasterVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;


    private String carId;                           //CAR ID
    private String carNm;                           //차량명
    private String carStatCd;                       //차량상태
    private String vinNo;                           //VIN NO
    private String manufactYyMmDt;                  //제작년월
    private String strgeCd;                         //창고
    private String locCd;                           //위치
    private String locNm;                           //위치명
    private int carRunDistVal;                      //주행거리
    private String carDispQty;                      //배기량
    private String corpCarDstinCd;                  //자사차량여부
    private String dlrCd;                           //딜러
    private String saleTp;                          //판매유형
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date custSaleDt;                        //고객판매일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date custSaleCancDt;                    //고객판매취소일자
    private String contractNo;                      //계약번호
    private String purcPathNm;                      //매입경로

    private String carBrandCd;                      //차량브랜드코드
    private String carBrandNm;                      //차량브랜드명
    private String openYn;                          //공개여부
    private String remark;                          //비고
    private String saleStatCd;                      //TEMP1 판매상태
    private String carlineCd;                       //차종코드
    private String carlineNm;                       //차종
    private String modelCd;                         //모델코드
    private String modelNm;                         //모델
    private String ocnCd;                           //ocn코드
    private String ocnNm;                           //ocn
    private String extColorCd;                      //외장색코드
    private String extColorNm;                      //외장색
    private String intColorCd;                      //내장색코드
    private String intColorNm;                      //내장색

    //차량수유자,운전자
    private int seq;                                //순번
    private String custNo;                          //고객번호
    private String custNm;                          //고객명
    private String useYn;                           //사용여부
    private String mdriverYn;                       //주운전자여부
    private String regUsrId;                        //등록자
    private String updtUsrId;                       //수정자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;                             //등록일
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt;                            //수정일

    private String licenseno;
    private double salAmt;
    private double balAmt;
    private String amtRtnYn;
    private double saleAmt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date amtRtnDt;

    private String subsidyReqYn;
    private String indexReqYn;
    private String interviewResYn;
    private double purcAmt;
    private double calAmt;
    private double lastAmt; //판매가격
    private String platNo;
    private String purcNo;



    /**
     * @return the lastAmt
     */
    public double getLastAmt() {
        return lastAmt;
    }
    /**
     * @param lastAmt the lastAmt to set
     */
    public void setLastAmt(double lastAmt) {
        this.lastAmt = lastAmt;
    }
    /**
     * @return the saleStatCd
     */
    public String getSaleStatCd() {
        return saleStatCd;
    }
    /**
     * @param saleStatCd the saleStatCd to set
     */
    public void setSaleStatCd(String saleStatCd) {
        this.saleStatCd = saleStatCd;
    }
    /**
     * @return the regDt
     */
    public Date getRegDt() {
        return regDt;
    }
    /**
     * @param regDt the regDt to set
     */
    public void setRegDt(Date regDt) {
        this.regDt = regDt;
    }
    /**
     * @return the updtDt
     */
    public Date getUpdtDt() {
        return updtDt;
    }
    /**
     * @param updtDt the updtDt to set
     */
    public void setUpdtDt(Date updtDt) {
        this.updtDt = updtDt;
    }
    /**
     * @return the regUsrId
     */
    public String getRegUsrId() {
        return regUsrId;
    }
    /**
     * @param regUsrId the regUsrId to set
     */
    public void setRegUsrId(String regUsrId) {
        this.regUsrId = regUsrId;
    }
    /**
     * @return the updtUsrId
     */
    public String getUpdtUsrId() {
        return updtUsrId;
    }
    /**
     * @param updtUsrId the updtUsrId to set
     */
    public void setUpdtUsrId(String updtUsrId) {
        this.updtUsrId = updtUsrId;
    }
    /**
     * @return the carId
     */
    public String getCarId() {
        return carId;
    }
    /**
     * @param carId the carId to set
     */
    public void setCarId(String carId) {
        this.carId = carId;
    }
    /**
     * @return the carNm
     */
    public String getCarNm() {
        return carNm;
    }
    /**
     * @param carNm the carNm to set
     */
    public void setCarNm(String carNm) {
        this.carNm = carNm;
    }
    /**
     * @return the carStatCd
     */
    public String getCarStatCd() {
        return carStatCd;
    }
    /**
     * @param carStatCd the carStatCd to set
     */
    public void setCarStatCd(String carStatCd) {
        this.carStatCd = carStatCd;
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
     * @return the strgeCd
     */
    public String getStrgeCd() {
        return strgeCd;
    }
    /**
     * @param strgeCd the strgeCd to set
     */
    public void setStrgeCd(String strgeCd) {
        this.strgeCd = strgeCd;
    }
    /**
     * @return the locCd
     */
    public String getLocCd() {
        return locCd;
    }
    /**
     * @param locCd the locCd to set
     */
    public void setLocCd(String locCd) {
        this.locCd = locCd;
    }
    /**
     * @return the locNm
     */
    public String getLocNm() {
        return locNm;
    }
    /**
     * @param locNm the locNm to set
     */
    public void setLocNm(String locNm) {
        this.locNm = locNm;
    }
    /**
     * @return the carRunDistVal
     */
    public int getCarRunDistVal() {
        return carRunDistVal;
    }
    /**
     * @param carRunDistVal the carRunDistVal to set
     */
    public void setCarRunDistVal(int carRunDistVal) {
        this.carRunDistVal = carRunDistVal;
    }
    /**
     * @return the carDispQty
     */
    public String getCarDispQty() {
        return carDispQty;
    }
    /**
     * @param carDispQty the carDispQty to set
     */
    public void setCarDispQty(String carDispQty) {
        this.carDispQty = carDispQty;
    }
    /**
     * @return the corpCarDstinCd
     */
    public String getCorpCarDstinCd() {
        return corpCarDstinCd;
    }
    /**
     * @param corpCarDstinCd the corpCarDstinCd to set
     */
    public void setCorpCarDstinCd(String corpCarDstinCd) {
        this.corpCarDstinCd = corpCarDstinCd;
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
     * @return the saleTp
     */
    public String getSaleTp() {
        return saleTp;
    }
    /**
     * @param saleTp the saleTp to set
     */
    public void setSaleTp(String saleTp) {
        this.saleTp = saleTp;
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
     * @return the custSaleCancDt
     */
    public Date getCustSaleCancDt() {
        return custSaleCancDt;
    }
    /**
     * @param custSaleCancDt the custSaleCancDt to set
     */
    public void setCustSaleCancDt(Date custSaleCancDt) {
        this.custSaleCancDt = custSaleCancDt;
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
     * @return the purcPathNm
     */
    public String getPurcPathNm() {
        return purcPathNm;
    }
    /**
     * @param purcPathNm the purcPathNm to set
     */
    public void setPurcPathNm(String purcPathNm) {
        this.purcPathNm = purcPathNm;
    }
    /**
     * @return the carBrandCd
     */
    public String getCarBrandCd() {
        return carBrandCd;
    }
    /**
     * @param carBrandCd the carBrandCd to set
     */
    public void setCarBrandCd(String carBrandCd) {
        this.carBrandCd = carBrandCd;
    }
    /**
     * @return the carBrandNm
     */
    public String getCarBrandNm() {
        return carBrandNm;
    }
    /**
     * @param carBrandNm the carBrandNm to set
     */
    public void setCarBrandNm(String carBrandNm) {
        this.carBrandNm = carBrandNm;
    }
    /**
     * @return the openYn
     */
    public String getOpenYn() {
        return openYn;
    }
    /**
     * @param openYn the openYn to set
     */
    public void setOpenYn(String openYn) {
        this.openYn = openYn;
    }
    /**
     * @return the remark
     */
    public String getRemark() {
        return remark;
    }
    /**
     * @param remark the remark to set
     */
    public void setRemark(String remark) {
        this.remark = remark;
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
     * @return the seq
     */
    public int getSeq() {
        return seq;
    }
    /**
     * @param seq the seq to set
     */
    public void setSeq(int seq) {
        this.seq = seq;
    }
    /**
     * @return the custNo
     */
    public String getCustNo() {
        return custNo;
    }
    /**
     * @param custNo the custNo to set
     */
    public void setCustNo(String custNo) {
        this.custNo = custNo;
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
     * @return the useYn
     */
    public String getUseYn() {
        return useYn;
    }
    /**
     * @param useYn the useYn to set
     */
    public void setUseYn(String useYn) {
        this.useYn = useYn;
    }
    /**
     * @return the mdriverYn
     */
    public String getMdriverYn() {
        return mdriverYn;
    }
    /**
     * @param mdriverYn the mdriverYn to set
     */
    public void setMdriverYn(String mdriverYn) {
        this.mdriverYn = mdriverYn;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    /**
     * @return the licenseno
     */
    public String getLicenseno() {
        return licenseno;
    }
    /**
     * @return the salAmt
     */
    public double getSalAmt() {
        return salAmt;
    }
    /**
     * @return the balAmt
     */
    public double getBalAmt() {
        return balAmt;
    }
    /**
     * @param licenseno the licenseno to set
     */
    public void setLicenseno(String licenseno) {
        this.licenseno = licenseno;
    }
    /**
     * @param salAmt the salAmt to set
     */
    public void setSalAmt(double salAmt) {
        this.salAmt = salAmt;
    }
    /**
     * @param balAmt the balAmt to set
     */
    public void setBalAmt(double balAmt) {
        this.balAmt = balAmt;
    }
    /**
     * @return the amtRtnYn
     */
    public String getAmtRtnYn() {
        return amtRtnYn;
    }
    /**
     * @return the saleAmt
     */
    public double getSaleAmt() {
        return saleAmt;
    }
    /**
     * @return the amtRtnDt
     */
    public Date getAmtRtnDt() {
        return amtRtnDt;
    }
    /**
     * @return the subsidyReqYn
     */
    public String getSubsidyReqYn() {
        return subsidyReqYn;
    }
    /**
     * @return the indexReqYn
     */
    public String getIndexReqYn() {
        return indexReqYn;
    }
    /**
     * @return the interviewResYn
     */
    public String getInterviewResYn() {
        return interviewResYn;
    }
    /**
     * @param amtRtnYn the amtRtnYn to set
     */
    public void setAmtRtnYn(String amtRtnYn) {
        this.amtRtnYn = amtRtnYn;
    }
    /**
     * @param saleAmt the saleAmt to set
     */
    public void setSaleAmt(double saleAmt) {
        this.saleAmt = saleAmt;
    }
    /**
     * @param amtRtnDt the amtRtnDt to set
     */
    public void setAmtRtnDt(Date amtRtnDt) {
        this.amtRtnDt = amtRtnDt;
    }
    /**
     * @param subsidyReqYn the subsidyReqYn to set
     */
    public void setSubsidyReqYn(String subsidyReqYn) {
        this.subsidyReqYn = subsidyReqYn;
    }
    /**
     * @param indexReqYn the indexReqYn to set
     */
    public void setIndexReqYn(String indexReqYn) {
        this.indexReqYn = indexReqYn;
    }
    /**
     * @param interviewResYn the interviewResYn to set
     */
    public void setInterviewResYn(String interviewResYn) {
        this.interviewResYn = interviewResYn;
    }
    /**
     * @return the calAmt
     */
    public double getCalAmt() {
        return calAmt;
    }
    /**
     * @param calAmt the calAmt to set
     */
    public void setCalAmt(double calAmt) {
        this.calAmt = calAmt;
    }
    /**
     * @return the purcAmt
     */
    public double getPurcAmt() {
        return purcAmt;
    }
    /**
     * @param purcAmt the purcAmt to set
     */
    public void setPurcAmt(double purcAmt) {
        this.purcAmt = purcAmt;
    }
    /**
     * @return the platNo
     */
    public String getPlatNo() {
        return platNo;
    }
    /**
     * @param platNo the platNo to set
     */
    public void setPlatNo(String platNo) {
        this.platNo = platNo;
    }
    /**
     * @return the purcNo
     */
    public String getPurcNo() {
        return purcNo;
    }
    /**
     * @param purcNo the purcNo to set
     */
    public void setPurcNo(String purcNo) {
        this.purcNo = purcNo;
    }

}
