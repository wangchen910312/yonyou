package chn.bhmc.dms.ser.wac.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

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
 * @ClassName  : SanbaoTechVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 5. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *   since     author description
 * ===========  =============  ===========================
 * 2016. 5. 10.   Kwon Ki Hyun   최초 생성
 * </pre>
 */

@ValidDescriptor({
    @ValidField(field="vinNo", mesgKey="ser.lbl.vinNo")
    ,@ValidField(field="emgcReasonCont", mesgKey="ser.lbl.emgcReasonCont")
    ,@ValidField(field="dlrProcOpnCont", mesgKey="ser.lbl.dlrProcOpnCnt")
})
public class SanbaoTechVO extends BaseVO{



     /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -511088404256615190L;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * 차대번호
     **/
    @NotEmpty
    private String vinNo;

    /**
     * 문서번호
     **/
    private String docNo;

    /**
     * 상태코드
     **/
    @NotEmpty
    private String statCd;

    /**
     * 엔진번호
     **/
    private String enginNo;

    /**
     * 차량소유자ID
     **/
    private String carOwnerId;

    /**
     * 차량소유자명
     **/
    private String carOwnerNm;

    /**
     * 판정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date judgDt;

    /**
     * 판정명
     **/
    private String judgNm;

    /**
     * 판정ID
     **/
    private String judgId;

    /**
     * 주행거리값
     **/
    private int runDistVal;

    /**
     * 전화번호
     **/
    private String telNo;

    /**
     * 보증시작일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date wartStartDt;

    /**
     * 생산일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date creDt;

    /**
     * 문제고장코드
     **/
    private String pblmErrCd;

    /**
     * 긴급경계코드
     **/
    private String emgcAlrtCd;

    /**
     * 의견유형
     **/
    private String opnTp;

    /**
     * 긴급사유내용
     **/
    @NotEmpty
    private String emgcReasonCont;

    /**
     * 딜러처리의견내용
     **/
    @NotEmpty
    private String dlrProcOpnCont;

    /**
     * 첨부파일키명
     **/
    private String fileKeyNm;

    /**
     * 딜러결재요청일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date dlrSignReqDt;

    /**
     * 승인번호
     **/
    private String approveNo;

    /**
     * BMP처리내용
     **/
    private String bmpProcCont;

    /**
     * 작성일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date wrtrDt;

    /**
     * 사용여부
     **/
    private String useYn;

    /**
     * 브랜드코드
     **/
    private String brandCd;

    /**
     * 지연일
     */
    private String delayDay;

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
     * @return the runDistVal
     */
    public int getRunDistVal() {
        return runDistVal;
    }

    /**
     * @param runDistVal the runDistVal to set
     */
    public void setRunDistVal(int runDistVal) {
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
     * @return the pblmErrCd
     */
    public String getPblmErrCd() {
        return pblmErrCd;
    }

    /**
     * @param pblmErrCd the pblmErrCd to set
     */
    public void setPblmErrCd(String pblmErrCd) {
        this.pblmErrCd = pblmErrCd;
    }

    /**
     * @return the emgcAlrtCd
     */
    public String getEmgcAlrtCd() {
        return emgcAlrtCd;
    }

    /**
     * @param emgcAlrtCd the emgcAlrtCd to set
     */
    public void setEmgcAlrtCd(String emgcAlrtCd) {
        this.emgcAlrtCd = emgcAlrtCd;
    }

    /**
     * @return the opnTp
     */
    public String getOpnTp() {
        return opnTp;
    }

    /**
     * @param opnTp the opnTp to set
     */
    public void setOpnTp(String opnTp) {
        this.opnTp = opnTp;
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
     * @return the brandCd
     */
    public String getBrandCd() {
        return brandCd;
    }

    /**
     * @param brandCd the brandCd to set
     */
    public void setBrandCd(String brandCd) {
        this.brandCd = brandCd;
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




}
