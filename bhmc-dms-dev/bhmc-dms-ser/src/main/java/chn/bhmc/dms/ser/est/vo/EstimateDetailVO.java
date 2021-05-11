package chn.bhmc.dms.ser.est.vo;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : EstimateDetailVO.java
 * @Description : 정산디테일 VO
 * @author KyungMok Kim
 * @since 2016. 3. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 19.    KyungMok Kim     최초 생성
 * </pre>
 */

public class EstimateDetailVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -7325468465134403418L;

    /**
    * 딜러코드
    **/
    private String dlrCd;

    /**
    * RO번호
    **/
    private String roDocNo;

    /**
    * 견적문서번호
    **/
    private String estDocNo;

    /**
    * 견적하위문서번호
    **/
    private String estSubDocNo;

    /**
    * 지불유형
    **/
    @NotEmpty
    private String paymTp;

    /**
     * 지불자코드
     **/
    private String paymCd;

    /**
    * 지불자명
    **/
    @NotEmpty
    private String paymUsrNm;

    /**
    * 지불기간
    **/
    private String paymPrid;

    /**
    * 지불방법
    **/
    private String paymMthCd;

    /**
    * 지불금액
    **/
    private Double paymAmt;

    /**
    * 지불비고
    **/
    private String paymRemark;

    /**
     * 영수증유형
     **/
    private String rcptTp;

    /**
     * 절사금액
     **/
    private Double wonUnitCutAmt;

    /**
     * 제로절사금액
     **/
    private Double demicPointCutAmt;

    /**
     * 할인권한코드
     **/
    private String dcPermCd;

    /**
     * 할인율
     **/
    private Double dcRate;

    /**
     * 할인금액
     **/
    private Double dcAmt;

    /**
     * 예치금액
     **/
    private Double balAmt;

    /**
     * 선수금액
     **/
    private Double preAmt;

    /**
     * 정산금액
     **/
    private Double calcAmt;

    /**
     * 할인권한명
     **/
    private String dcPermNm;

    /**
     * 쿠폰번호
     **/
    private String cupnNo;

    /**
     * 쿠폰가격
     **/
    private Double cupnAmt;


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
     * @return the estDocNo
     */
    public String getEstDocNo() {
        return estDocNo;
    }

    /**
     * @param estDocNo the estDocNo to set
     */
    public void setEstDocNo(String estDocNo) {
        this.estDocNo = estDocNo;
    }

    /**
     * @return the estSubDocNo
     */
    public String getEstSubDocNo() {
        return estSubDocNo;
    }

    /**
     * @param estSubDocNo the estSubDocNo to set
     */
    public void setEstSubDocNo(String estSubDocNo) {
        this.estSubDocNo = estSubDocNo;
    }

    /**
     * @return the paymTp
     */
    public String getPaymTp() {
        return paymTp;
    }

    /**
     * @param paymTp the paymTp to set
     */
    public void setPaymTp(String paymTp) {
        this.paymTp = paymTp;
    }

    /**
     * @return the paymCd
     */
    public String getPaymCd() {
        return paymCd;
    }

    /**
     * @param paymCd the paymCd to set
     */
    public void setPaymCd(String paymCd) {
        this.paymCd = paymCd;
    }

    /**
     * @return the paymUsrNm
     */
    public String getPaymUsrNm() {
        return paymUsrNm;
    }

    /**
     * @param paymUsrNm the paymUsrNm to set
     */
    public void setPaymUsrNm(String paymUsrNm) {
        this.paymUsrNm = paymUsrNm;
    }

    /**
     * @return the paymPrid
     */
    public String getPaymPrid() {
        return paymPrid;
    }

    /**
     * @param paymPrid the paymPrid to set
     */
    public void setPaymPrid(String paymPrid) {
        this.paymPrid = paymPrid;
    }

    /**
     * @return the paymMthCd
     */
    public String getPaymMthCd() {
        return paymMthCd;
    }

    /**
     * @param paymMthCd the paymMthCd to set
     */
    public void setPaymMthCd(String paymMthCd) {
        this.paymMthCd = paymMthCd;
    }

    /**
     * @return the paymAmt
     */
    public Double getPaymAmt() {
        return paymAmt;
    }

    /**
     * @param paymAmt the paymAmt to set
     */
    public void setPaymAmt(Double paymAmt) {
        this.paymAmt = paymAmt;
    }

    /**
     * @return the paymRemark
     */
    public String getPaymRemark() {
        return paymRemark;
    }

    /**
     * @param paymRemark the paymRemark to set
     */
    public void setPaymRemark(String paymRemark) {
        this.paymRemark = paymRemark;
    }

    /**
     * @return the rcptTp
     */
    public String getRcptTp() {
        return rcptTp;
    }

    /**
     * @param rcptTp the rcptTp to set
     */
    public void setRcptTp(String rcptTp) {
        this.rcptTp = rcptTp;
    }

    /**
     * @return the wonUnitCutAmt
     */
    public Double getWonUnitCutAmt() {
        return wonUnitCutAmt;
    }

    /**
     * @param wonUnitCutAmt the wonUnitCutAmt to set
     */
    public void setWonUnitCutAmt(Double wonUnitCutAmt) {
        this.wonUnitCutAmt = wonUnitCutAmt;
    }

    /**
     * @return the demicPointCutAmt
     */
    public Double getDemicPointCutAmt() {
        return demicPointCutAmt;
    }

    /**
     * @param demicPointCutAmt the demicPointCutAmt to set
     */
    public void setDemicPointCutAmt(Double demicPointCutAmt) {
        this.demicPointCutAmt = demicPointCutAmt;
    }

    /**
     * @return the dcPermCd
     */
    public String getDcPermCd() {
        return dcPermCd;
    }

    /**
     * @param dcPermCd the dcPermCd to set
     */
    public void setDcPermCd(String dcPermCd) {
        this.dcPermCd = dcPermCd;
    }

    /**
     * @return the dcRate
     */
    public Double getDcRate() {
        return dcRate;
    }

    /**
     * @param dcRate the dcRate to set
     */
    public void setDcRate(Double dcRate) {
        this.dcRate = dcRate;
    }

    /**
     * @return the dcAmt
     */
    public Double getDcAmt() {
        return dcAmt;
    }

    /**
     * @param dcAmt the dcAmt to set
     */
    public void setDcAmt(Double dcAmt) {
        this.dcAmt = dcAmt;
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
     * @return the preAmt
     */
    public Double getPreAmt() {
        return preAmt;
    }

    /**
     * @param preAmt the preAmt to set
     */
    public void setPreAmt(Double preAmt) {
        this.preAmt = preAmt;
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
     * @return the dcPermNm
     */
    public String getDcPermNm() {
        return dcPermNm;
    }

    /**
     * @param dcPermNm the dcPermNm to set
     */
    public void setDcPermNm(String dcPermNm) {
        this.dcPermNm = dcPermNm;
    }

    /**
     * @return the cupnNo
     */
    public String getCupnNo() {
        return cupnNo;
    }

    /**
     * @param cupnNo the cupnNo to set
     */
    public void setCupnNo(String cupnNo) {
        this.cupnNo = cupnNo;
    }

    /**
     * @return the cupnAmt
     */
    public Double getCupnAmt() {
        return cupnAmt;
    }

    /**
     * @param cupnAmt the cupnAmt to set
     */
    public void setCupnAmt(Double cupnAmt) {
        this.cupnAmt = cupnAmt;
    }
}