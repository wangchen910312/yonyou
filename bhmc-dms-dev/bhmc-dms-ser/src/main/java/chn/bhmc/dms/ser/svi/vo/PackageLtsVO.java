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
     * 패키지 문서번호
     */
    private int pkgDocNo;

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
     *  공임단가 유형
     */
    private String lbrTp;

    /**
     * 공임시간
     */
    private Double lbrHm;

    private Double lbrRate;

    /**
     * 공임 구분
     */
    private String dstinCd;

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
     * @return the lbrRate
     */
    public Double getLbrRate() {
        return lbrRate;
    }

    /**
     * @param lbrRate the lbrRate to set
     */
    public void setLbrRate(Double lbrRate) {
        this.lbrRate = lbrRate;
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

    /**
     * @return the pkgDocNo
     */
    public int getPkgDocNo() {
        return pkgDocNo;
    }

    /**
     * @param pkgDocNo the pkgDocNo to set
     */
    public void setPkgDocNo(int pkgDocNo) {
        this.pkgDocNo = pkgDocNo;
    }

    /**
     * @return the dstinCd
     */
    public String getDstinCd() {
        return dstinCd;
    }

    /**
     * @param dstinCd the dstinCd to set
     */
    public void setDstinCd(String dstinCd) {
        this.dstinCd = dstinCd;
    }

    /**
     * @return the lbrTp
     */
    public String getLbrTp() {
        return lbrTp;
    }

    /**
     * @param lbrTp the lbrTp to set
     */
    public void setLbrTp(String lbrTp) {
        this.lbrTp = lbrTp;
    }



}
