package chn.bhmc.dms.ser.wac.vo;

import com.fasterxml.jackson.annotation.JsonProperty;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SanbaoClaimInfoVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 8. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 1.     Kwon ki hyun     최초 생성
 * </pre>
 */

public class SanbaoClaimInfoIfVO extends BaseVO{



    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -28500092506914103L;

    //DLR_CD
    @JsonProperty("DLR_CD")
    public String DlrCd; //딜러코드

    //RO_DOC_NO
    @JsonProperty("RO_DOC_NO")
    public String roDocNo;//ro번호

    //CLAIM_DOC_NO
    @JsonProperty("CLAIM_DOC_NO")
    public String claimDocNo;//클레임번호

    //CLAIM_TP
    @JsonProperty("CLAIM_TP")
    public String claimTp;//클레임유형

    //RUN_DIST_VAL
    @JsonProperty("RUN_DIST_VAL")
    public int runDistVal;//주행거리

    //CAU_ITEM_CD
    @JsonProperty("CAU_ITEM_CD")
    public String cauItemCd;//원인부품코드

    //CAU_ITEM_NM
    @JsonProperty("CAU_ITEM_NM")
    public String cauItemNm;//원인부품명

    //CAU_CD
    @JsonProperty("CAU_CD")
    public String cauCd; //원인코드

    //CAU_NM
    @JsonProperty("CAU_NM")
    public String cauNm;//원인코드명

    //PHEN_CD
    @JsonProperty("PHEN_CD")
    public String phenCd;//현상코드

    //PHEN_NM
    @JsonProperty("PHEN_NM")
    public String phenNm;//현상코드명

    //RO_START_DT
    @JsonProperty("RO_START_DT")
    public String roStartDt;//ro 시작일

    //RO_END_DT
    @JsonProperty("RO_END_DT")
    public String roEndDt;//ro 종료일

    //RO_WORK_HM
    @JsonProperty("RO_WORK_HM")
    public int roWorkHm;//작업시간

    /**
     * @return the dlrCd
     */
    public String getDlrCd() {
        return DlrCd;
    }

    /**
     * @param dlrCd the dlrCd to set
     */
    public void setDlrCd(String dlrCd) {
        DlrCd = dlrCd;
    }

    /**
     * @return the roDocNo
     */
    public String getRoDocNo() {
        return roDocNo;
    }

    /**
     * @param roDocNo the roDocNo to set
     */
    public void setRoDocNo(String roDocNo) {
        this.roDocNo = roDocNo;
    }

    /**
     * @return the claimDocNo
     */
    public String getClaimDocNo() {
        return claimDocNo;
    }

    /**
     * @param claimDocNo the claimDocNo to set
     */
    public void setClaimDocNo(String claimDocNo) {
        this.claimDocNo = claimDocNo;
    }

    /**
     * @return the claimTp
     */
    public String getClaimTp() {
        return claimTp;
    }

    /**
     * @param claimTp the claimTp to set
     */
    public void setClaimTp(String claimTp) {
        this.claimTp = claimTp;
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
     * @return the cauItemCd
     */
    public String getCauItemCd() {
        return cauItemCd;
    }

    /**
     * @param cauItemCd the cauItemCd to set
     */
    public void setCauItemCd(String cauItemCd) {
        this.cauItemCd = cauItemCd;
    }

    /**
     * @return the cauItemNm
     */
    public String getCauItemNm() {
        return cauItemNm;
    }

    /**
     * @param cauItemNm the cauItemNm to set
     */
    public void setCauItemNm(String cauItemNm) {
        this.cauItemNm = cauItemNm;
    }

    /**
     * @return the cauCd
     */
    public String getCauCd() {
        return cauCd;
    }

    /**
     * @param cauCd the cauCd to set
     */
    public void setCauCd(String cauCd) {
        this.cauCd = cauCd;
    }

    /**
     * @return the cauNm
     */
    public String getCauNm() {
        return cauNm;
    }

    /**
     * @param cauNm the cauNm to set
     */
    public void setCauNm(String cauNm) {
        this.cauNm = cauNm;
    }

    /**
     * @return the phenCd
     */
    public String getPhenCd() {
        return phenCd;
    }

    /**
     * @param phenCd the phenCd to set
     */
    public void setPhenCd(String phenCd) {
        this.phenCd = phenCd;
    }

    /**
     * @return the phenNm
     */
    public String getPhenNm() {
        return phenNm;
    }

    /**
     * @param phenNm the phenNm to set
     */
    public void setPhenNm(String phenNm) {
        this.phenNm = phenNm;
    }


    /**
     * @return the roStartDt
     */
    public String getRoStartDt() {
        return roStartDt;
    }

    /**
     * @param roStartDt the roStartDt to set
     */
    public void setRoStartDt(String roStartDt) {
        this.roStartDt = roStartDt;
    }

    /**
     * @return the roEndDt
     */
    public String getRoEndDt() {
        return roEndDt;
    }

    /**
     * @param roEndDt the roEndDt to set
     */
    public void setRoEndDt(String roEndDt) {
        this.roEndDt = roEndDt;
    }

    /**
     * @return the roWorkHm
     */
    public int getRoWorkHm() {
        return roWorkHm;
    }

    /**
     * @param roWorkHm the roWorkHm to set
     */
    public void setRoWorkHm(int roWorkHm) {
        this.roWorkHm = roWorkHm;
    }



}
