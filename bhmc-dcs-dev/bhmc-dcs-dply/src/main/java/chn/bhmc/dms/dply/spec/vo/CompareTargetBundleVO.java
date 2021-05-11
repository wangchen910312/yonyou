package chn.bhmc.dms.dply.spec.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CompareTargetBundleVO.java
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

public class CompareTargetBundleVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -4579709866782571391L;

    private String stdDt         ;

    private String symbolicNm    ;

    private String bundleVerNo   ;

    private String bundleCont    ;

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
     * @param bundleCont the bundleCont to set
     */
    public void setBundleCont(String bundleCont) {
        this.bundleCont = bundleCont;
    }

    /**
     * @return the bundleCont
     */
    public String getBundleCont() {
        return bundleCont;
    }
}
