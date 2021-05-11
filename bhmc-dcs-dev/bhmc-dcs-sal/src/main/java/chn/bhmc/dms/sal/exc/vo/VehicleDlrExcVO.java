package chn.bhmc.dms.sal.exc.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VehicleDlrExcVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author kim yewon
 * @since 2016. 4. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 27.     Kim yewon             최초 생성
 *
 * </pre>
 */

public class VehicleDlrExcVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;

    //@JsonDeserialize(using=JsonDateDeserializer.class)

    private String exchNo;                                  //교환번호
    private String dlrCd;                                   //딜러코드
    private String dlrNm;                                   //딜러명
    private String obtDlrCd;                                //교환딜러코드
    private String obtDlrNm;                                //교환딜러명
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date reqDt;                                     //요청일자
    private String reqStatCd;                               //요청상태코드
    private String saleDlrDistCd;                           //판매딜러지역코드
    private String saleDlrDistNm;                           //판매딜러지역명
    private String reqUsrId;                                //요청자ID
    private String reqUsrNm;                                //요청자명
    private String telNo;                                   //전화번호
    private String carlineCd;                               //차종코드
    private String carlineNm;                               //차종명
    private String modelCd;                                 //모델코드
    private String modelNm;                                 //모델명
    private String ocnCd;                                   //OCN코드
    private String ocnNm;                                   //OCN명
    private String extColorCd;                              //외장색코드
    private String extColorNm;                              //외장색명
    private String intColorCd;                              //내장색코드
    private String intColorNm;                              //내장색명
    private String evalRsltYn;                              //심사결과
    private String pevalId;                                 //심사자ID
    private String pevalNm;                                 //심사자명
    private String telNo1;                                  //전화번호1
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date evalDt;                                    //심사일자
    private String vinNo;                                   //VIN NO
    private String enginSerialNo;                           //엔진시리얼번호
    private String remark;                                  //비고
    private String regUsrId;                                //등록자ID
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;                                     //등록일
    private String updtUsrId;                               //수정자ID
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt;                                    //수정일

    private String gb;                                      //저장 구분자



    /**
     * @return the obtDlrNm
     */
    public String getObtDlrNm() {
        return obtDlrNm;
    }
    /**
     * @param obtDlrNm the obtDlrNm to set
     */
    public void setObtDlrNm(String obtDlrNm) {
        this.obtDlrNm = obtDlrNm;
    }
    /**
     * @return the dlrNm
     */
    public String getDlrNm() {
        return dlrNm;
    }
    /**
     * @param dlrNm the dlrNm to set
     */
    public void setDlrNm(String dlrNm) {
        this.dlrNm = dlrNm;
    }
    /**
     * @return the gb
     */
    public String getGb() {
        return gb;
    }
    /**
     * @param gb the gb to set
     */
    public void setGb(String gb) {
        this.gb = gb;
    }
    /**
     * @return the exchNo
     */
    public String getExchNo() {
        return exchNo;
    }
    /**
     * @param exchNo the exchNo to set
     */
    public void setExchNo(String exchNo) {
        this.exchNo = exchNo;
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
     * @return the obtDlrCd
     */
    public String getObtDlrCd() {
        return obtDlrCd;
    }
    /**
     * @param obtDlrCd the obtDlrCd to set
     */
    public void setObtDlrCd(String obtDlrCd) {
        this.obtDlrCd = obtDlrCd;
    }
    /**
     * @return the reqDt
     */
    public Date getReqDt() {
        return reqDt;
    }
    /**
     * @param reqDt the reqDt to set
     */
    public void setReqDt(Date reqDt) {
        this.reqDt = reqDt;
    }
    /**
     * @return the reqStatCd
     */
    public String getReqStatCd() {
        return reqStatCd;
    }
    /**
     * @param reqStatCd the reqStatCd to set
     */
    public void setReqStatCd(String reqStatCd) {
        this.reqStatCd = reqStatCd;
    }
    /**
     * @return the saleDlrDistCd
     */
    public String getSaleDlrDistCd() {
        return saleDlrDistCd;
    }
    /**
     * @param saleDlrDistCd the saleDlrDistCd to set
     */
    public void setSaleDlrDistCd(String saleDlrDistCd) {
        this.saleDlrDistCd = saleDlrDistCd;
    }
    /**
     * @return the saleDlrDistNm
     */
    public String getSaleDlrDistNm() {
        return saleDlrDistNm;
    }
    /**
     * @param saleDlrDistNm the saleDlrDistNm to set
     */
    public void setSaleDlrDistNm(String saleDlrDistNm) {
        this.saleDlrDistNm = saleDlrDistNm;
    }
    /**
     * @return the reqUsrId
     */
    public String getReqUsrId() {
        return reqUsrId;
    }
    /**
     * @param reqUsrId the reqUsrId to set
     */
    public void setReqUsrId(String reqUsrId) {
        this.reqUsrId = reqUsrId;
    }
    /**
     * @return the reqUsrNm
     */
    public String getReqUsrNm() {
        return reqUsrNm;
    }
    /**
     * @param reqUsrNm the reqUsrNm to set
     */
    public void setReqUsrNm(String reqUsrNm) {
        this.reqUsrNm = reqUsrNm;
    }
    /**
     * @return the telNo
     */
    public String getTelNo() {
        return telNo;
    }
    /**
     * @param telNo the telNo to set
     */
    public void setTelNo(String telNo) {
        this.telNo = telNo;
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
     * @return the evalRsltYn
     */
    public String getEvalRsltYn() {
        return evalRsltYn;
    }
    /**
     * @param evalRsltYn the evalRsltYn to set
     */
    public void setEvalRsltYn(String evalRsltYn) {
        this.evalRsltYn = evalRsltYn;
    }
    /**
     * @return the pevalId
     */
    public String getPevalId() {
        return pevalId;
    }
    /**
     * @param pevalId the pevalId to set
     */
    public void setPevalId(String pevalId) {
        this.pevalId = pevalId;
    }
    /**
     * @return the pevalNm
     */
    public String getPevalNm() {
        return pevalNm;
    }
    /**
     * @param pevalNm the pevalNm to set
     */
    public void setPevalNm(String pevalNm) {
        this.pevalNm = pevalNm;
    }
    /**
     * @return the telNo1
     */
    public String getTelNo1() {
        return telNo1;
    }
    /**
     * @param telNo1 the telNo1 to set
     */
    public void setTelNo1(String telNo1) {
        this.telNo1 = telNo1;
    }
    /**
     * @return the evalDt
     */
    public Date getEvalDt() {
        return evalDt;
    }
    /**
     * @param evalDt the evalDt to set
     */
    public void setEvalDt(Date evalDt) {
        this.evalDt = evalDt;
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
     * @return the enginSerialNo
     */
    public String getEnginSerialNo() {
        return enginSerialNo;
    }
    /**
     * @param enginSerialNo the enginSerialNo to set
     */
    public void setEnginSerialNo(String enginSerialNo) {
        this.enginSerialNo = enginSerialNo;
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
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }



}
