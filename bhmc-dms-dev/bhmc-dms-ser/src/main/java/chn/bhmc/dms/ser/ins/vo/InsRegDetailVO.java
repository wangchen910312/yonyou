package chn.bhmc.dms.ser.ins.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName  : InsDetailVO.java
 * @Description : 보험관리 상세 VO
 * @author Kwon ki hyun
 * @since 2016. 8. 5.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since author     description
 *  ===========    =============    ===========================
 *  2016. 8. 5.     Kwon ki hyun     최초 생성
 * </pre>
 */

public class InsRegDetailVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -8498446113226233041L;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * 보험문서번호
     **/
    private String incDocNo;

    /**
     * 라인번호
     **/
    private int lineNo;

    /**
     * 상업보험코드
     **/
    private String cmcIncTpCd;

    /**
     * 상업보험유형명
     **/
    private String cmcIncTpNm;

    /**
     * 상업보험유형
     **/
    private String cmcIncTp;

    /**
     * 변경금액율
     **/
    private Double chgAmtRate;

    /**
     * 보험금액
     **/
    private Double incAmt;

    /**
     * 보험비용합계금액
     **/
    private Double incCostSumAmt;

    /**
     * 보험할인율
     **/
    private Double incDcRate;

    /**
     * 보험수수료금액
     **/
    private Double incFeeAmt;

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
     * @return the incDocNo
     */
    public String getIncDocNo() {
        return incDocNo;
    }

    /**
     * @param incDocNo the incDocNo to set
     */
    public void setIncDocNo(String incDocNo) {
        this.incDocNo = incDocNo;
    }

    /**
     * @return the lineNo
     */
    public int getLineNo() {
        return lineNo;
    }

    /**
     * @param lineNo the lineNo to set
     */
    public void setLineNo(int lineNo) {
        this.lineNo = lineNo;
    }

    /**
     * @return the cmcIncTpCd
     */
    public String getCmcIncTpCd() {
        return cmcIncTpCd;
    }

    /**
     * @param cmcIncTpCd the cmcIncTpCd to set
     */
    public void setCmcIncTpCd(String cmcIncTpCd) {
        this.cmcIncTpCd = cmcIncTpCd;
    }

    /**
     * @return the cmcIncTpNm
     */
    public String getCmcIncTpNm() {
        return cmcIncTpNm;
    }

    /**
     * @param cmcIncTpNm the cmcIncTpNm to set
     */
    public void setCmcIncTpNm(String cmcIncTpNm) {
        this.cmcIncTpNm = cmcIncTpNm;
    }

    /**
     * @return the cmcIncTp
     */
    public String getCmcIncTp() {
        return cmcIncTp;
    }

    /**
     * @param cmcIncTp the cmcIncTp to set
     */
    public void setCmcIncTp(String cmcIncTp) {
        this.cmcIncTp = cmcIncTp;
    }

    /**
     * @return the chgAmtRate
     */
    public Double getChgAmtRate() {
        return chgAmtRate;
    }

    /**
     * @param chgAmtRate the chgAmtRate to set
     */
    public void setChgAmtRate(Double chgAmtRate) {
        this.chgAmtRate = chgAmtRate;
    }

    /**
     * @return the incAmt
     */
    public Double getIncAmt() {
        return incAmt;
    }

    /**
     * @param incAmt the incAmt to set
     */
    public void setIncAmt(Double incAmt) {
        this.incAmt = incAmt;
    }

    /**
     * @return the incCostSumAmt
     */
    public Double getIncCostSumAmt() {
        return incCostSumAmt;
    }

    /**
     * @param incCostSumAmt the incCostSumAmt to set
     */
    public void setIncCostSumAmt(Double incCostSumAmt) {
        this.incCostSumAmt = incCostSumAmt;
    }

    /**
     * @return the incDcRate
     */
    public Double getIncDcRate() {
        return incDcRate;
    }

    /**
     * @param incDcRate the incDcRate to set
     */
    public void setIncDcRate(Double incDcRate) {
        this.incDcRate = incDcRate;
    }

    /**
     * @return the incFeeAmt
     */
    public Double getIncFeeAmt() {
        return incFeeAmt;
    }

    /**
     * @param incFeeAmt the incFeeAmt to set
     */
    public void setIncFeeAmt(Double incFeeAmt) {
        this.incFeeAmt = incFeeAmt;
    }



}
