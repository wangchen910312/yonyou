package chn.bhmc.dms.par.cpm.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * 선수금 헤더 VO
 *
 * @ClassName   : AdvanceReceivedInfoHeaderVO.java
 * @Description : AdvanceReceivedInfoHeaderVO Class
 * @author In Bo Shim
 * @since 2016. 5. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 23.     In Bo Shim     최초 생성
 * </pre>
 */

public class AdvanceReceivedInfoHeaderVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2088276507317979834L;

    /**
     * 딜러코드
     **/
    @NotEmpty
    private String dlrCd;

    /**
     * 잔액금액
     **/
    private Double balAmt = 0.0;

    /**
     * 예금금액
     **/
    private Double acAmt = 0.0;

    /**
     * 계산금액
     **/
    private Double calcAmt = 0.0;

    /**
     * 가용금액
     **/
    private Double useAmt = 0.0;

    /**
     * 수입일자
     **/
    private Date impDt;

    /**
     * 법인코드
     **/
    private String corpCd;

    /**
     * 배송지역코드
     **/
    private String dlDistCd;

    /**
     * 일반할인율
     **/
    private Double gnlDcRate;

    /**
     * 상업일반할인율
     **/
    private Double cmcGnlDcRate;

    /**
     * 상업할인율
     **/
    private Double cmcDcRate;

    /**
     * 상업긴급할인율
     **/
    private Double cmcEmgcDcRate;

    /**
     * 예치금액
     **/
    private Double dpstAmt = 0.0;

    /**
     * 제한금액
     **/
    private Double lmtAmt = 0.0;

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
     * @return the balAmt
     */
    public Double getBalAmt() {
        return balAmt;
    }

    /**
     * @param balAmt the balAmt to set
     */
    public void setBalAmt(Double balAmt) {
        this.balAmt = balAmt;
    }

    /**
     * @return the acAmt
     */
    public Double getAcAmt() {
        return acAmt;
    }

    /**
     * @param acAmt the acAmt to set
     */
    public void setAcAmt(Double acAmt) {
        this.acAmt = acAmt;
    }

    /**
     * @return the calcAmt
     */
    public Double getCalcAmt() {
        return calcAmt;
    }

    /**
     * @param calcAmt the calcAmt to set
     */
    public void setCalcAmt(Double calcAmt) {
        this.calcAmt = calcAmt;
    }

    /**
     * @return the useAmt
     */
    public Double getUseAmt() {
        return useAmt;
    }

    /**
     * @param useAmt the useAmt to set
     */
    public void setUseAmt(Double useAmt) {
        this.useAmt = useAmt;
    }

    /**
     * @return the impDt
     */
    public Date getImpDt() {
        return impDt;
    }

    /**
     * @param impDt the impDt to set
     */
    public void setImpDt(Date impDt) {
        this.impDt = impDt;
    }

    /**
     * @return the corpCd
     */
    public String getCorpCd() {
        return corpCd;
    }

    /**
     * @param corpCd the corpCd to set
     */
    public void setCorpCd(String corpCd) {
        this.corpCd = corpCd;
    }

    /**
     * @return the dlDistCd
     */
    public String getDlDistCd() {
        return dlDistCd;
    }

    /**
     * @param dlDistCd the dlDistCd to set
     */
    public void setDlDistCd(String dlDistCd) {
        this.dlDistCd = dlDistCd;
    }

    /**
     * @return the gnlDcRate
     */
    public Double getGnlDcRate() {
        return gnlDcRate;
    }

    /**
     * @param gnlDcRate the gnlDcRate to set
     */
    public void setGnlDcRate(Double gnlDcRate) {
        this.gnlDcRate = gnlDcRate;
    }

    /**
     * @return the cmcGnlDcRate
     */
    public Double getCmcGnlDcRate() {
        return cmcGnlDcRate;
    }

    /**
     * @param cmcGnlDcRate the cmcGnlDcRate to set
     */
    public void setCmcGnlDcRate(Double cmcGnlDcRate) {
        this.cmcGnlDcRate = cmcGnlDcRate;
    }

    /**
     * @return the cmcDcRate
     */
    public Double getCmcDcRate() {
        return cmcDcRate;
    }

    /**
     * @param cmcDcRate the cmcDcRate to set
     */
    public void setCmcDcRate(Double cmcDcRate) {
        this.cmcDcRate = cmcDcRate;
    }

    /**
     * @return the cmcEmgcDcRate
     */
    public Double getCmcEmgcDcRate() {
        return cmcEmgcDcRate;
    }

    /**
     * @param cmcEmgcDcRate the cmcEmgcDcRate to set
     */
    public void setCmcEmgcDcRate(Double cmcEmgcDcRate) {
        this.cmcEmgcDcRate = cmcEmgcDcRate;
    }

    /**
     * @return the dpstAmt
     */
    public Double getDpstAmt() {
        return dpstAmt;
    }

    /**
     * @param dpstAmt the dpstAmt to set
     */
    public void setDpstAmt(Double dpstAmt) {
        this.dpstAmt = dpstAmt;
    }

    /**
     * @return the lmtAmt
     */
    public Double getLmtAmt() {
        return lmtAmt;
    }

    /**
     * @param lmtAmt the lmtAmt to set
     */
    public void setLmtAmt(Double lmtAmt) {
        this.lmtAmt = lmtAmt;
    }

}
