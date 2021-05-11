package chn.bhmc.dms.sal.cmp.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CmpCarRunMngVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author kim yewon
 * @since 2016. 4. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 19.       Kim yewon             최초 생성
 *
 * </pre>
 */

public class CmpCarRunMngVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;

    private String vinNo;                               //VIN NO
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date useStartDt;                            //사용시작일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date useEndDt;                              //사용종료일자
    private String carRegNo;                            //차량등록번호
    private String carlineCd;                           //차종코드
    private String carlineNm;                           //차종명
    private String modelCd;                             //모델코드
    private String modelNm;                             //모델명
    private String ocnCd;                               //OCN코드
    private String ocnNm;                               //OCN명
    private String usrId;                               //사용자
    private String usrNm;                               //사용자명
    private String useStartKmVal;                       //사용시작km값
    private String useEndKmVal;                         //사용종료km값
    private String cmpCarDstinCd;                       //회사차구분코드
    private String remark;                              //비고
    private String regUsrId;                            //등록자ID
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;                                 //등록일자
    private String updtUsrId;                           //수정자ID
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt;                                //수정일자
    private String gb;                                  //구분자
    private String chkUseEndKm;                         //종료km 체크





    /**
     * @return the chkUseEndKm
     */
    public String getChkUseEndKm() {
        return chkUseEndKm;
    }
    /**
     * @param chkUseEndKm the chkUseEndKm to set
     */
    public void setChkUseEndKm(String chkUseEndKm) {
        this.chkUseEndKm = chkUseEndKm;
    }
    /**
     * @return the usrNm
     */
    public String getUsrNm() {
        return usrNm;
    }
    /**
     * @param usrNm the usrNm to set
     */
    public void setUsrNm(String usrNm) {
        this.usrNm = usrNm;
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
     * @return the useStartDt
     */
    public Date getUseStartDt() {
        return useStartDt;
    }
    /**
     * @param useStartDt the useStartDt to set
     */
    public void setUseStartDt(Date useStartDt) {
        this.useStartDt = useStartDt;
    }
    /**
     * @return the useEndDt
     */
    public Date getUseEndDt() {
        return useEndDt;
    }
    /**
     * @param useEndDt the useEndDt to set
     */
    public void setUseEndDt(Date useEndDt) {
        this.useEndDt = useEndDt;
    }
    /**
     * @return the carRegNo
     */
    public String getCarRegNo() {
        return carRegNo;
    }
    /**
     * @param carRegNo the carRegNo to set
     */
    public void setCarRegNo(String carRegNo) {
        this.carRegNo = carRegNo;
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
     * @return the usrId
     */
    public String getUsrId() {
        return usrId;
    }
    /**
     * @param usrId the usrId to set
     */
    public void setUsrId(String usrId) {
        this.usrId = usrId;
    }
    /**
     * @return the useStartKmVal
     */
    public String getUseStartKmVal() {
        return useStartKmVal;
    }
    /**
     * @param useStartKmVal the useStartKmVal to set
     */
    public void setUseStartKmVal(String useStartKmVal) {
        this.useStartKmVal = useStartKmVal;
    }
    /**
     * @return the useEndKmVal
     */
    public String getUseEndKmVal() {
        return useEndKmVal;
    }
    /**
     * @param useEndKmVal the useEndKmVal to set
     */
    public void setUseEndKmVal(String useEndKmVal) {
        this.useEndKmVal = useEndKmVal;
    }
    /**
     * @return the cmpCarDstinCd
     */
    public String getCmpCarDstinCd() {
        return cmpCarDstinCd;
    }
    /**
     * @param cmpCarDstinCd the cmpCarDstinCd to set
     */
    public void setCmpCarDstinCd(String cmpCarDstinCd) {
        this.cmpCarDstinCd = cmpCarDstinCd;
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
