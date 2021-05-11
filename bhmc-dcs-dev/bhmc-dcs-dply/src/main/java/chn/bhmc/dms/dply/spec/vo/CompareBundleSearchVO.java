package chn.bhmc.dms.dply.spec.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CompareBundleSummarySearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Cheol Man Oh
 * @since 2016. 5. 31.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 31.     Cheol Man Oh     최초 생성
 * </pre>
 */

public class CompareBundleSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5982783250832021427L;

    private String sStdDt;

    private String sDlrCd;

    private String sCompareResult;

    private String sCompareDt;

    /**
     * @param sStdDt the sStdDt to set
     */
    public void setsStdDt(String sStdDt) {
        this.sStdDt = sStdDt;
    }

    /**
     * @return the sStdDt
     */
    public String getsStdDt() {
        return sStdDt;
    }

    /**
     * @param sDlrCd the sDlrCd to set
     */
    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }

    /**
     * @return the sDlrCd
     */
    public String getsDlrCd() {
        return sDlrCd;
    }

    /**
     * @param sCompareResult the sCompareResult to set
     */
    public void setsCompareResult(String sCompareResult) {
        this.sCompareResult = sCompareResult;
    }

    /**
     * @return the sCompareResult
     */
    public String getsCompareResult() {
        return sCompareResult;
    }

    /**
     * @param sCompareDt the sCompareDt to set
     */
    public void setsCompareDt(String sCompareDt) {
        this.sCompareDt = sCompareDt;
    }

    /**
     * @return the sCompareDt
     */
    public String getsCompareDt() {
        return sCompareDt;
    }

}
