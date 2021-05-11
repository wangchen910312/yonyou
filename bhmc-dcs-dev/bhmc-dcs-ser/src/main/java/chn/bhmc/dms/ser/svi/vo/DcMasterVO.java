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

    public String getDlrCd() {
        return dlrCd;
    }

    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    public String getDcCd() {
        return dcCd;
    }

    public void setDcCd(String dcCd) {
        this.dcCd = dcCd;
    }

    public String getDcTp() {
        return dcTp;
    }

    public void setDcTp(String dcTp) {
        this.dcTp = dcTp;
    }

    public String getLbrDcRate() {
        return lbrDcRate;
    }

    public void setLbrDcRate(String lbrDcRate) {
        this.lbrDcRate = lbrDcRate;
    }

    public String getLbrDcAmt() {
        return lbrDcAmt;
    }

    public void setLbrDcAmt(String lbrDcAmt) {
        this.lbrDcAmt = lbrDcAmt;
    }

    public String getParDcRate() {
        return parDcRate;
    }

    public void setParDcRate(String parDcRate) {
        this.parDcRate = parDcRate;
    }

    public String getParDcAmt() {
        return parDcAmt;
    }

    public void setParDcAmt(String parDcAmt) {
        this.parDcAmt = parDcAmt;
    }

    public String getSubDcRate() {
        return subDcRate;
    }

    public void setSubDcRate(String subDcRate) {
        this.subDcRate = subDcRate;
    }

    public String getSubDcAmt() {
        return subDcAmt;
    }

    public void setSubDcAmt(String subDcAmt) {
        this.subDcAmt = subDcAmt;
    }

    public String getTotDcRate() {
        return totDcRate;
    }

    public void setTotDcRate(String totDcRate) {
        this.totDcRate = totDcRate;
    }

    public String getTotDcAmt() {
        return totDcAmt;
    }

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

    public String getDcScoreVal() {
        return dcScoreVal;
    }

    public void setDcScoreVal(String dcScoreVal) {
        this.dcScoreVal = dcScoreVal;
    }

    public String getDcUseYn() {
        return dcUseYn;
    }

    public void setDcUseYn(String dcUseYn) {
        this.dcUseYn = dcUseYn;
    }

    public String getDcNm() {
        return dcNm;
    }

    public void setDcNm(String dcNm) {
        this.dcNm = dcNm;
    }



}
