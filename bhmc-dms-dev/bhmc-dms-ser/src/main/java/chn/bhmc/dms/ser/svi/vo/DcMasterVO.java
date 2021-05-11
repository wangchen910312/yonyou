package chn.bhmc.dms.ser.svi.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * 할인관리 VO
 * </pre>
 *
 * @ClassName   : DcMasterVO.java
 * @Description : 할인관리  VO.
 * @author Yin Xueyuan
 * @since 2016. 2. 16.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 16.     Yin Xueyuan     최초 생성
 * </pre>
 */

public class DcMasterVO extends BaseVO {



    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -4707345214059376157L;

    /**
     * 딜러코드
     */
    private String  dlrCd;

    /**
     * 할인코드
     */
    private String dcCd;

    /**
     * 할인유형
     */
    @NotEmpty
    private String dcTp;


    /**
     * 할인명
     */
    @NotEmpty
    private String dcNm;

    /**
     * 공임할인율
     */
    private String lbrDcRate;

    /**
     * 공임할인금액
     */
    private String lbrDcAmt;

    /**
     * 부품할인율
     */
    private String parDcRate;

    /**
     * 부품할인금액
     */
    private String parDcAmt;

    /**
     * 외주할인율
     */
    private String subDcRate;

    /**
     * 외주할인금액
     */
    private String subDcAmt;

    /**
     * 총할인율
     */
    private String totDcRate;

    /**
     * 총할인금액
     */
    private String totDcAmt;

    /**
     * 할인적용시작일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date dcApplyStartDt;

    /**
     * 할인적용종료일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date dcApplyEndDt;

    /**
     * 할인순위값
     */
    private String dcScoreVal;

    /**
     * 할인사용여부
     */
    private String dcUseYn;

    /**
     * 할인구분코드
     */
    private String dcDstinCd;

    /**
     * 할인권한유형
     */
    private String dcPermTp;

    private String prefixId;

    private int totCnt;

    private int useCnt;

    private int avlbCnt;

    private int dcSeq;

    /**
     * 할인구분(SER : 정비, CRM : 고객)
     */
    private String dcDivision;

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
     * @return the dcCd
     */
    public String getDcCd() {
        return dcCd;
    }

    /**
     * @param dcCd the dcCd to set
     */
    public void setDcCd(String dcCd) {
        this.dcCd = dcCd;
    }

    /**
     * @return the dcTp
     */
    public String getDcTp() {
        return dcTp;
    }

    /**
     * @param dcTp the dcTp to set
     */
    public void setDcTp(String dcTp) {
        this.dcTp = dcTp;
    }

    /**
     * @return the dcNm
     */
    public String getDcNm() {
        return dcNm;
    }

    /**
     * @param dcNm the dcNm to set
     */
    public void setDcNm(String dcNm) {
        this.dcNm = dcNm;
    }

    /**
     * @return the lbrDcRate
     */
    public String getLbrDcRate() {
        return lbrDcRate;
    }

    /**
     * @param lbrDcRate the lbrDcRate to set
     */
    public void setLbrDcRate(String lbrDcRate) {
        this.lbrDcRate = lbrDcRate;
    }

    /**
     * @return the lbrDcAmt
     */
    public String getLbrDcAmt() {
        return lbrDcAmt;
    }

    /**
     * @param lbrDcAmt the lbrDcAmt to set
     */
    public void setLbrDcAmt(String lbrDcAmt) {
        this.lbrDcAmt = lbrDcAmt;
    }

    /**
     * @return the parDcRate
     */
    public String getParDcRate() {
        return parDcRate;
    }

    /**
     * @param parDcRate the parDcRate to set
     */
    public void setParDcRate(String parDcRate) {
        this.parDcRate = parDcRate;
    }

    /**
     * @return the parDcAmt
     */
    public String getParDcAmt() {
        return parDcAmt;
    }

    /**
     * @param parDcAmt the parDcAmt to set
     */
    public void setParDcAmt(String parDcAmt) {
        this.parDcAmt = parDcAmt;
    }

    /**
     * @return the subDcRate
     */
    public String getSubDcRate() {
        return subDcRate;
    }

    /**
     * @param subDcRate the subDcRate to set
     */
    public void setSubDcRate(String subDcRate) {
        this.subDcRate = subDcRate;
    }

    /**
     * @return the subDcAmt
     */
    public String getSubDcAmt() {
        return subDcAmt;
    }

    /**
     * @param subDcAmt the subDcAmt to set
     */
    public void setSubDcAmt(String subDcAmt) {
        this.subDcAmt = subDcAmt;
    }

    /**
     * @return the totDcRate
     */
    public String getTotDcRate() {
        return totDcRate;
    }

    /**
     * @param totDcRate the totDcRate to set
     */
    public void setTotDcRate(String totDcRate) {
        this.totDcRate = totDcRate;
    }

    /**
     * @return the totDcAmt
     */
    public String getTotDcAmt() {
        return totDcAmt;
    }

    /**
     * @param totDcAmt the totDcAmt to set
     */
    public void setTotDcAmt(String totDcAmt) {
        this.totDcAmt = totDcAmt;
    }

    /**
     * @return the dcApplyStartDt
     */
    public Date getDcApplyStartDt() {
        return dcApplyStartDt;
    }

    /**
     * @param dcApplyStartDt the dcApplyStartDt to set
     */
    public void setDcApplyStartDt(Date dcApplyStartDt) {
        this.dcApplyStartDt = dcApplyStartDt;
    }

    /**
     * @return the dcApplyEndDt
     */
    public Date getDcApplyEndDt() {
        return dcApplyEndDt;
    }

    /**
     * @param dcApplyEndDt the dcApplyEndDt to set
     */
    public void setDcApplyEndDt(Date dcApplyEndDt) {
        this.dcApplyEndDt = dcApplyEndDt;
    }

    /**
     * @return the dcScoreVal
     */
    public String getDcScoreVal() {
        return dcScoreVal;
    }

    /**
     * @param dcScoreVal the dcScoreVal to set
     */
    public void setDcScoreVal(String dcScoreVal) {
        this.dcScoreVal = dcScoreVal;
    }

    /**
     * @return the dcUseYn
     */
    public String getDcUseYn() {
        return dcUseYn;
    }

    /**
     * @param dcUseYn the dcUseYn to set
     */
    public void setDcUseYn(String dcUseYn) {
        this.dcUseYn = dcUseYn;
    }

    /**
     * @return the dcDstinCd
     */
    public String getDcDstinCd() {
        return dcDstinCd;
    }

    /**
     * @param dcDstinCd the dcDstinCd to set
     */
    public void setDcDstinCd(String dcDstinCd) {
        this.dcDstinCd = dcDstinCd;
    }

    /**
     * @return the dcPermTp
     */
    public String getDcPermTp() {
        return dcPermTp;
    }

    /**
     * @param dcPermTp the dcPermTp to set
     */
    public void setDcPermTp(String dcPermTp) {
        this.dcPermTp = dcPermTp;
    }

    /**
     * @return the totCnt
     */
    public int getTotCnt() {
        return totCnt;
    }

    /**
     * @param totCnt the totCnt to set
     */
    public void setTotCnt(int totCnt) {
        this.totCnt = totCnt;
    }

    /**
     * @return the useCnt
     */
    public int getUseCnt() {
        return useCnt;
    }

    /**
     * @param useCnt the useCnt to set
     */
    public void setUseCnt(int useCnt) {
        this.useCnt = useCnt;
    }

    /**
     * @return the avlbCnt
     */
    public int getAvlbCnt() {
        return avlbCnt;
    }

    /**
     * @param avlbCnt the avlbCnt to set
     */
    public void setAvlbCnt(int avlbCnt) {
        this.avlbCnt = avlbCnt;
    }

    /**
     * @return the prefixId
     */
    public String getPrefixId() {
        return prefixId;
    }

    /**
     * @param prefixId the prefixId to set
     */
    public void setPrefixId(String prefixId) {
        this.prefixId = prefixId;
    }

    /**
     * @return the dcSeq
     */
    public int getDcSeq() {
        return dcSeq;
    }

    /**
     * @param dcSeq the dcSeq to set
     */
    public void setDcSeq(int dcSeq) {
        this.dcSeq = dcSeq;
    }

    /**
     * @return the dcDivision
     */
    public String getDcDivision() {
        return dcDivision;
    }

    /**
     * @param dcDivision the dcDivision to set
     */
    public void setDcDivision(String dcDivision) {
        this.dcDivision = dcDivision;
    }

}
