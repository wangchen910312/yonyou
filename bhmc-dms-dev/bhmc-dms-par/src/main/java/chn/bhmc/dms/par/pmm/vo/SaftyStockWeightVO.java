package chn.bhmc.dms.par.pmm.vo;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * SaftyStockWeightVO
 *
 * @ClassName   : SaftyStockWeightVO.java
 * @Description : SaftyStockWeightVO Class
 * @author In Bo Shim
 * @since 2016. 5. 03.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 03.     In Bo Shim     최초 생성
 * </pre>
 */

public class SaftyStockWeightVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 3608415031263871870L;

    /**
     * dlrCd
     **/
    @NotEmpty
    private String dlrCd;

    /**
     * pltCd
     **/
    @NotEmpty
    private String pltCd;

    /**
     * dmndPridTp
     **/
    private String dmndPridTp = "";

    /**
     * dmndPrid
     **/
    private Double dmndPrid = 0.0;

    /**
     * lineNo
     **/
    private int lineNo = 0;

    /**
     * totalRate
     **/
    private Double totalRate;

    /**
     * rate1
     **/
    private Double rate1;

    /**
     * rate2
     **/
    private Double rate2;

    /**
     * rate3
     **/
    private Double rate3;

    /**
     * rate4
     **/
    private Double rate4;

    /**
     * rate5
     **/
    private Double rate5;

    /**
     * rate6
     **/
    private Double rate6;

    /**
     * rate7
     **/
    private Double rate7;

    /**
     * rate8
     **/
    private Double rate8;

    /**
     * rate9
     **/
    private Double rate9;

    /**
     * rate10
     **/
    private Double rate10;

    /**
     * rate11
     **/
    private Double rate11;

    /**
     * rate12
     **/
    private Double rate12;

    /**
     * rate13
     **/
    private Double rate13;

    /**
     * rate14
     **/
    private Double rate14;

    /**
     * rate15
     **/
    private Double rate15;

    /**
     * rate16
     **/
    private Double rate16;

    /**
     * rate17
     **/
    private Double rate17;

    /**
     * rate18
     **/
    private Double rate18;

    /**
     * rate19
     **/
    private Double rate19;

    /**
     * rate20
     **/
    private Double rate20;

    /**
     * rate21
     **/
    private Double rate21;

    /**
     * rate22
     **/
    private Double rate22;

    /**
     * rate23
     **/
    private Double rate23;

    /**
     * rate24
     **/
    private Double rate24;

    /**
     * useYn
     **/
    @NotEmpty
    private String useYn;

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
     * @return the pltCd
     */
    public String getPltCd() {
        return pltCd;
    }

    /**
     * @param pltCd the pltCd to set
     */
    public void setPltCd(String pltCd) {
        this.pltCd = pltCd;
    }

    /**
     * @return the dmndPridTp
     */
    public String getDmndPridTp() {
        return dmndPridTp;
    }

    /**
     * @param dmndPridTp the dmndPridTp to set
     */
    public void setDmndPridTp(String dmndPridTp) {
        this.dmndPridTp = dmndPridTp;
    }

    /**
     * @return the dmndPrid
     */
    public Double getDmndPrid() {
        return dmndPrid;
    }

    /**
     * @param dmndPrid the dmndPrid to set
     */
    public void setDmndPrid(Double dmndPrid) {
        this.dmndPrid = dmndPrid;
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
     * @return the totalRate
     */
    public Double getTotalRate() {
        return totalRate;
    }

    /**
     * @param totalRate the totalRate to set
     */
    public void setTotalRate(Double totalRate) {
        this.totalRate = totalRate;
    }

    /**
     * @return the rate1
     */
    public Double getRate1() {
        return rate1;
    }

    /**
     * @param rate1 the rate1 to set
     */
    public void setRate1(Double rate1) {
        this.rate1 = rate1;
    }

    /**
     * @return the rate2
     */
    public Double getRate2() {
        return rate2;
    }

    /**
     * @param rate2 the rate2 to set
     */
    public void setRate2(Double rate2) {
        this.rate2 = rate2;
    }

    /**
     * @return the rate3
     */
    public Double getRate3() {
        return rate3;
    }

    /**
     * @param rate3 the rate3 to set
     */
    public void setRate3(Double rate3) {
        this.rate3 = rate3;
    }

    /**
     * @return the rate4
     */
    public Double getRate4() {
        return rate4;
    }

    /**
     * @param rate4 the rate4 to set
     */
    public void setRate4(Double rate4) {
        this.rate4 = rate4;
    }

    /**
     * @return the rate5
     */
    public Double getRate5() {
        return rate5;
    }

    /**
     * @param rate5 the rate5 to set
     */
    public void setRate5(Double rate5) {
        this.rate5 = rate5;
    }

    /**
     * @return the rate6
     */
    public Double getRate6() {
        return rate6;
    }

    /**
     * @param rate6 the rate6 to set
     */
    public void setRate6(Double rate6) {
        this.rate6 = rate6;
    }

    /**
     * @return the rate7
     */
    public Double getRate7() {
        return rate7;
    }

    /**
     * @param rate7 the rate7 to set
     */
    public void setRate7(Double rate7) {
        this.rate7 = rate7;
    }

    /**
     * @return the rate8
     */
    public Double getRate8() {
        return rate8;
    }

    /**
     * @param rate8 the rate8 to set
     */
    public void setRate8(Double rate8) {
        this.rate8 = rate8;
    }

    /**
     * @return the rate9
     */
    public Double getRate9() {
        return rate9;
    }

    /**
     * @param rate9 the rate9 to set
     */
    public void setRate9(Double rate9) {
        this.rate9 = rate9;
    }

    /**
     * @return the rate10
     */
    public Double getRate10() {
        return rate10;
    }

    /**
     * @param rate10 the rate10 to set
     */
    public void setRate10(Double rate10) {
        this.rate10 = rate10;
    }

    /**
     * @return the rate11
     */
    public Double getRate11() {
        return rate11;
    }

    /**
     * @param rate11 the rate11 to set
     */
    public void setRate11(Double rate11) {
        this.rate11 = rate11;
    }

    /**
     * @return the rate12
     */
    public Double getRate12() {
        return rate12;
    }

    /**
     * @param rate12 the rate12 to set
     */
    public void setRate12(Double rate12) {
        this.rate12 = rate12;
    }

    /**
     * @return the rate13
     */
    public Double getRate13() {
        return rate13;
    }

    /**
     * @param rate13 the rate13 to set
     */
    public void setRate13(Double rate13) {
        this.rate13 = rate13;
    }

    /**
     * @return the rate14
     */
    public Double getRate14() {
        return rate14;
    }

    /**
     * @param rate14 the rate14 to set
     */
    public void setRate14(Double rate14) {
        this.rate14 = rate14;
    }

    /**
     * @return the rate15
     */
    public Double getRate15() {
        return rate15;
    }

    /**
     * @param rate15 the rate15 to set
     */
    public void setRate15(Double rate15) {
        this.rate15 = rate15;
    }

    /**
     * @return the rate16
     */
    public Double getRate16() {
        return rate16;
    }

    /**
     * @param rate16 the rate16 to set
     */
    public void setRate16(Double rate16) {
        this.rate16 = rate16;
    }

    /**
     * @return the rate17
     */
    public Double getRate17() {
        return rate17;
    }

    /**
     * @param rate17 the rate17 to set
     */
    public void setRate17(Double rate17) {
        this.rate17 = rate17;
    }

    /**
     * @return the rate18
     */
    public Double getRate18() {
        return rate18;
    }

    /**
     * @param rate18 the rate18 to set
     */
    public void setRate18(Double rate18) {
        this.rate18 = rate18;
    }

    /**
     * @return the rate19
     */
    public Double getRate19() {
        return rate19;
    }

    /**
     * @param rate19 the rate19 to set
     */
    public void setRate19(Double rate19) {
        this.rate19 = rate19;
    }

    /**
     * @return the rate20
     */
    public Double getRate20() {
        return rate20;
    }

    /**
     * @param rate20 the rate20 to set
     */
    public void setRate20(Double rate20) {
        this.rate20 = rate20;
    }

    /**
     * @return the rate21
     */
    public Double getRate21() {
        return rate21;
    }

    /**
     * @param rate21 the rate21 to set
     */
    public void setRate21(Double rate21) {
        this.rate21 = rate21;
    }

    /**
     * @return the rate22
     */
    public Double getRate22() {
        return rate22;
    }

    /**
     * @param rate22 the rate22 to set
     */
    public void setRate22(Double rate22) {
        this.rate22 = rate22;
    }

    /**
     * @return the rate23
     */
    public Double getRate23() {
        return rate23;
    }

    /**
     * @param rate23 the rate23 to set
     */
    public void setRate23(Double rate23) {
        this.rate23 = rate23;
    }

    /**
     * @return the rate24
     */
    public Double getRate24() {
        return rate24;
    }

    /**
     * @param rate24 the rate24 to set
     */
    public void setRate24(Double rate24) {
        this.rate24 = rate24;
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
}
