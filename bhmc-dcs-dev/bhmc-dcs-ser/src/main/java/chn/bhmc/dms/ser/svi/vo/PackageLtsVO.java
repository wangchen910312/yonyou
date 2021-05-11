package chn.bhmc.dms.ser.svi.vo;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * 작업Package 공임 VO
 * </pre>
 *
 * @ClassName   : PackageLtsVO.java
 * @Description : 작업Package 공임 VO.
 * @author Yin Xueyuan
 * @since 2016. 2. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 17.     Yin Xueyuan     최초 생성
 * </pre>
 */

public class PackageLtsVO extends BaseVO {


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5137654610907884139L;

    /**
     * 딜러코드
     */
    @NotEmpty
    private String dlrCd;

    /**
     * package 품목코드
     */
    @NotEmpty
    private String pkgItemCd;

    /**
     *  라인번호
     */
    private String lineNo;

    /**
     *  공임코드
     */
    private String lbrCd;

    /**
     *  정비코드명
     */
    private String lbrNm;

    /**
     *  공임수량
     */
    private double lbrQty;

    /**
     *  공임단위
     */
    private String lbrUnitCd;
    /**
     *  공임단가
     */
    private double lbrPrc;

    /**
     *  공임금액
     */
    private double lbrAmt;

    /**
     *  공임단가 유형
     */
    private String lbrPrcTp;

    /**
     * 공임시간
     */
    private Double lbrHm;

    private Double lbrRate01; /** 일반  **/

    private Double lbrRate02; /** 보증  **/

    private Double lbrRate03; /** 보험  **/

    private Double lbrRate04; /** 내부  **/

    private Double lbrRate05; /** 판금페인트  **/

    public String getDlrCd() {
        return dlrCd;
    }

    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    public String getPkgItemCd() {
        return pkgItemCd;
    }

    public void setPkgItemCd(String pkgItemCd) {
        this.pkgItemCd = pkgItemCd;
    }

    public String getLineNo() {
        return lineNo;
    }

    public void setLineNo(String lineNo) {
        this.lineNo = lineNo;
    }

    public String getLbrCd() {
        return lbrCd;
    }

    public void setLbrCd(String lbrCd) {
        this.lbrCd = lbrCd;
    }

    public String getLbrNm() {
        return lbrNm;
    }

    public void setLbrNm(String lbrNm) {
        this.lbrNm = lbrNm;
    }

    public double getLbrQty() {
        return lbrQty;
    }

    public void setLbrQty(double lbrQty) {
        this.lbrQty = lbrQty;
    }

    public String getLbrUnitCd() {
        return lbrUnitCd;
    }

    public void setLbrUnitCd(String lbrUnitCd) {
        this.lbrUnitCd = lbrUnitCd;
    }

    public double getLbrPrc() {
        return lbrPrc;
    }

    public void setLbrPrc(double lbrPrc) {
        this.lbrPrc = lbrPrc;
    }

    public double getLbrAmt() {
        return lbrAmt;
    }

    public void setLbrAmt(double lbrAmt) {
        this.lbrAmt = lbrAmt;
    }

    public String getLbrPrcTp() {
        return lbrPrcTp;
    }

    public void setLbrPrcTp(String lbrPrcTp) {
        this.lbrPrcTp = lbrPrcTp;
    }

    /**
     * @return the lbrRate01
     */
    public Double getLbrRate01() {
        return lbrRate01;
    }

    /**
     * @param lbrRate01 the lbrRate01 to set
     */
    public void setLbrRate01(Double lbrRate01) {
        this.lbrRate01 = lbrRate01;
    }

    /**
     * @return the lbrRate02
     */
    public Double getLbrRate02() {
        return lbrRate02;
    }

    /**
     * @param lbrRate02 the lbrRate02 to set
     */
    public void setLbrRate02(Double lbrRate02) {
        this.lbrRate02 = lbrRate02;
    }

    /**
     * @return the lbrRate03
     */
    public Double getLbrRate03() {
        return lbrRate03;
    }

    /**
     * @param lbrRate03 the lbrRate03 to set
     */
    public void setLbrRate03(Double lbrRate03) {
        this.lbrRate03 = lbrRate03;
    }

    /**
     * @return the lbrRate04
     */
    public Double getLbrRate04() {
        return lbrRate04;
    }

    /**
     * @param lbrRate04 the lbrRate04 to set
     */
    public void setLbrRate04(Double lbrRate04) {
        this.lbrRate04 = lbrRate04;
    }

    /**
     * @return the lbrRate05
     */
    public Double getLbrRate05() {
        return lbrRate05;
    }

    /**
     * @param lbrRate05 the lbrRate05 to set
     */
    public void setLbrRate05(Double lbrRate05) {
        this.lbrRate05 = lbrRate05;
    }

    /**
     * @return the lbrHm
     */
    public Double getLbrHm() {
        return lbrHm;
    }

    /**
     * @param lbrHm the lbrHm to set
     */
    public void setLbrHm(Double lbrHm) {
        this.lbrHm = lbrHm;
    }

}
