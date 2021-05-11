package chn.bhmc.dms.dply.spec.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CompareResultVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Cheol Man Oh
 * @since 2016. 6. 2.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 2.     Cheol Man Oh     최초 생성
 * </pre>
 */

public class CompareResultVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6552070030199470948L;

    private String stdDt          ;

    private String compareDt      ;

    private String dlrCd          ;

    private String symbolicNm     ;

    private String bundleVerNo    ;

    private String compareRsltCd  ;

    private String dmsBundleVerNo ;

    private String dmsBundleStatCont ;

    /**
     * @param stdDt the stdDt to set
     */
    public void setStdDt(String stdDt) {
        this.stdDt = stdDt;
    }

    /**
     * @return the stdDt
     */
    public String getStdDt() {
        return stdDt;
    }

    /**
     * @param compareDt the compareDt to set
     */
    public void setCompareDt(String compareDt) {
        this.compareDt = compareDt;
    }

    /**
     * @return the compareDt
     */
    public String getCompareDt() {
        return compareDt;
    }

    /**
     * @param dlrCd the dlrCd to set
     */
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    /**
     * @return the dlrCd
     */
    public String getDlrCd() {
        return dlrCd;
    }

    /**
     * @param symbolicNm the symbolicNm to set
     */
    public void setSymbolicNm(String symbolicNm) {
        this.symbolicNm = symbolicNm;
    }

    /**
     * @return the symbolicNm
     */
    public String getSymbolicNm() {
        return symbolicNm;
    }

    /**
     * @param bundleVerNo the bundleVerNo to set
     */
    public void setBundleVerNo(String bundleVerNo) {
        this.bundleVerNo = bundleVerNo;
    }

    /**
     * @return the bundleVerNo
     */
    public String getBundleVerNo() {
        return bundleVerNo;
    }

    /**
     * @param compareRsltCd the compareRsltCd to set
     */
    public void setCompareRsltCd(String compareRsltCd) {
        this.compareRsltCd = compareRsltCd;
    }

    /**
     * @return the compareRsltCd
     */
    public String getCompareRsltCd() {
        return compareRsltCd;
    }

    /**
     * @param dmsBundleVerNo the dmsBundleVerNo to set
     */
    public void setDmsBundleVerNo(String dmsBundleVerNo) {
        this.dmsBundleVerNo = dmsBundleVerNo;
    }

    /**
     * @return the dmsBundleVerNo
     */
    public String getDmsBundleVerNo() {
        return dmsBundleVerNo;
    }

    /**
     * @param dmsBundleStatCont the dmsBundleStatCont to set
     */
    public void setDmsBundleStatCont(String dmsBundleStatCont) {
        this.dmsBundleStatCont = dmsBundleStatCont;
    }

    /**
     * @return the dmsBundleStatCont
     */
    public String getDmsBundleStatCont() {
        return dmsBundleStatCont;
    }

}
