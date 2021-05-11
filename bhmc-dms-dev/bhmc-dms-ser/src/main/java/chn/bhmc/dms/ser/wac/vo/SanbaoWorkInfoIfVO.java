package chn.bhmc.dms.ser.wac.vo;

import com.fasterxml.jackson.annotation.JsonProperty;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SanbaoWorkInfoIfVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 9. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 17.     Kwon ki hyun     최초 생성
 * </pre>
 */

public class SanbaoWorkInfoIfVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -3887550527339259869L;

    @JsonProperty("DLR_CD")
    public String dlrCd; //딜러코드

    @JsonProperty("RO_DOC_NO")
    public String roDocNo;//ro 번호

    @JsonProperty("RO_START_DT")
    public String roStartDt;//ro 시작일자

    @JsonProperty("RO_END_DT")
    public String roEndDt;//ro 종료일자

    @JsonProperty("RO_WORK_HM")
    public int roWorkHm;//작업시간

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
