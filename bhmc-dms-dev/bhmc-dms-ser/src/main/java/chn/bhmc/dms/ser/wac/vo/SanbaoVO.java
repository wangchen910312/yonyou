package chn.bhmc.dms.ser.wac.vo;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SanbaoVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 3. 21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 21.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public class SanbaoVO extends BaseVO{



    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 9124705163346227392L;

    /**
     * 딜러코드
     */
    private String dlrCd;

    /**
     * 차대번호
     */
    private String vinNo;

    /**
     * 문서번호
     */
    private String docNo;

    /**
     * 상태코드
     */
    private String statCd;

    /**
     * 엔진번호
     */
    private String enginNo;

    /**
     * 차량소유자ID
     */
    private String carOwnerId;

    /**
     * 차량소유자명
     */
    private String carOwnerNm;

    /**
     * 판정일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date judgDt;

    /**
     * 판정자 ID
     */
    private String judgId;

    /**
     * 판정자명
     */
    private String judgNm;

    /**
     * 주행거리
     */
    private Double runDistVal;

    /**
     * 전화번호
     */
    private String telNo;

    /**
     * 보증시작일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date wartStartDt;

    /**
     * 생산일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date creDt;

    /**
     * 긴급사유내용
     */
    @Length(min=2, max=600)
    private String emgcReasonCont;

    /**
     * 딜러처리의견내용
     */
    @Length(min=2, max=600)
    private String dlrProcOpnCont;

    /**
     * 첨부파일키명
     */
    private String fileKeyNm;

    /**
     * 딜러결재 요청일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date dlrSignReqDt;

    /**
     * 승인번호
     */
    private String approveNo;

    /**
     * BMP처리내용
     */
    @Length(min=2, max=600)
    private String bmpProcCont;

    /**
     * 작성일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date wrtrDt;

    /**
     * 품목확인일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date itemChkDt;

    /**
     * commend flag(삭제 : D , 요청 : Q , 요청취소 : C)
     */
    private String sFlag;

    /**
     * 작성자
     */
    private String wrtrNm;

    /**
     * 지연일
     */
    private String delayDay;

    private String ifResltYn;

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
     * @return the docNo
     */
    public String getDocNo() {
        return docNo;
    }

    /**
     * @param docNo the docNo to set
     */
    public void setDocNo(String docNo) {
        this.docNo = docNo;
    }

    /**
     * @return the statCd
     */
    public String getStatCd() {
        return statCd;
    }

    /**
     * @param statCd the statCd to set
     */
    public void setStatCd(String statCd) {
        this.statCd = statCd;
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
     * @return the carOwnerId
     */
    public String getCarOwnerId() {
        return carOwnerId;
    }

    /**
     * @param carOwnerId the carOwnerId to set
     */
    public void setCarOwnerId(String carOwnerId) {
        this.carOwnerId = carOwnerId;
    }

    /**
     * @return the carOwnerNm
     */
    public String getCarOwnerNm() {
        return carOwnerNm;
    }

    /**
     * @param carOwnerNm the carOwnerNm to set
     */
    public void setCarOwnerNm(String carOwnerNm) {
        this.carOwnerNm = carOwnerNm;
    }

    /**
     * @return the judgDt
     */
    public Date getJudgDt() {
        return judgDt;
    }

    /**
     * @param judgDt the judgDt to set
     */
    public void setJudgDt(Date judgDt) {
        this.judgDt = judgDt;
    }

    /**
     * @return the judgId
     */
    public String getJudgId() {
        return judgId;
    }

    /**
     * @param judgId the judgId to set
     */
    public void setJudgId(String judgId) {
        this.judgId = judgId;
    }

    /**
     * @return the judgNm
     */
    public String getJudgNm() {
        return judgNm;
    }

    /**
     * @param judgNm the judgNm to set
     */
    public void setJudgNm(String judgNm) {
        this.judgNm = judgNm;
    }

    /**
     * @return the runDistVal
     */
    public Double getRunDistVal() {
        return runDistVal;
    }

    /**
     * @param runDistVal the runDistVal to set
     */
    public void setRunDistVal(Double runDistVal) {
        this.runDistVal = runDistVal;
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
     * @return the wartStartDt
     */
    public Date getWartStartDt() {
        return wartStartDt;
    }

    /**
     * @param wartStartDt the wartStartDt to set
     */
    public void setWartStartDt(Date wartStartDt) {
        this.wartStartDt = wartStartDt;
    }

    /**
     * @return the creDt
     */
    public Date getCreDt() {
        return creDt;
    }

    /**
     * @param creDt the creDt to set
     */
    public void setCreDt(Date creDt) {
        this.creDt = creDt;
    }

    /**
     * @return the emgcReasonCont
     */
    public String getEmgcReasonCont() {
        return emgcReasonCont;
    }

    /**
     * @param emgcReasonCont the emgcReasonCont to set
     */
    public void setEmgcReasonCont(String emgcReasonCont) {
        this.emgcReasonCont = emgcReasonCont;
    }

    /**
     * @return the dlrProcOpnCont
     */
    public String getDlrProcOpnCont() {
        return dlrProcOpnCont;
    }

    /**
     * @param dlrProcOpnCont the dlrProcOpnCont to set
     */
    public void setDlrProcOpnCont(String dlrProcOpnCont) {
        this.dlrProcOpnCont = dlrProcOpnCont;
    }

    /**
     * @return the fileKeyNm
     */
    public String getFileKeyNm() {
        return fileKeyNm;
    }

    /**
     * @param fileKeyNm the fileKeyNm to set
     */
    public void setFileKeyNm(String fileKeyNm) {
        this.fileKeyNm = fileKeyNm;
    }

    /**
     * @return the dlrSignReqDt
     */
    public Date getDlrSignReqDt() {
        return dlrSignReqDt;
    }

    /**
     * @param dlrSignReqDt the dlrSignReqDt to set
     */
    public void setDlrSignReqDt(Date dlrSignReqDt) {
        this.dlrSignReqDt = dlrSignReqDt;
    }

    /**
     * @return the approveNo
     */
    public String getApproveNo() {
        return approveNo;
    }

    /**
     * @param approveNo the approveNo to set
     */
    public void setApproveNo(String approveNo) {
        this.approveNo = approveNo;
    }

    /**
     * @return the bmpProcCont
     */
    public String getBmpProcCont() {
        return bmpProcCont;
    }

    /**
     * @param bmpProcCont the bmpProcCont to set
     */
    public void setBmpProcCont(String bmpProcCont) {
        this.bmpProcCont = bmpProcCont;
    }

    /**
     * @return the wrtrDt
     */
    public Date getWrtrDt() {
        return wrtrDt;
    }

    /**
     * @param wrtrDt the wrtrDt to set
     */
    public void setWrtrDt(Date wrtrDt) {
        this.wrtrDt = wrtrDt;
    }

    /**
     * @return the itemChkDt
     */
    public Date getItemChkDt() {
        return itemChkDt;
    }

    /**
     * @param itemChkDt the itemChkDt to set
     */
    public void setItemChkDt(Date itemChkDt) {
        this.itemChkDt = itemChkDt;
    }

    /**
     * @return the sFlag
     */
    public String getsFlag() {
        return sFlag;
    }

    /**
     * @param sFlag the sFlag to set
     */
    public void setsFlag(String sFlag) {
        this.sFlag = sFlag;
    }

    /**
     * @return the wrtrNm
     */
    public String getWrtrNm() {
        return wrtrNm;
    }

    /**
     * @param wrtrNm the wrtrNm to set
     */
    public void setWrtrNm(String wrtrNm) {
        this.wrtrNm = wrtrNm;
    }

    /**
     * @return the delayDay
     */
    public String getDelayDay() {
        return delayDay;
    }

    /**
     * @param delayDay the delayDay to set
     */
    public void setDelayDay(String delayDay) {
        this.delayDay = delayDay;
    }

    /**
     * @return the ifResltYn
     */
    public String getIfResltYn() {
        return ifResltYn;
    }

    /**
     * @param ifResltYn the ifResltYn to set
     */
    public void setIfResltYn(String ifResltYn) {
        this.ifResltYn = ifResltYn;
    }






}

