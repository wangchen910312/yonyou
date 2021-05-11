package chn.bhmc.dms.dply.dms.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BundleDeployHistorySearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 5. 4.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 4.     Kang Seok Han     최초 생성
 * </pre>
 */

public class BundleDeployHistorySearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 9208483442843544941L;

    private String sSymbolicNm      ;

    private String sBundleVerNo     ;

    private String sDlrCd           ;

    /**
     * @param sSymbolicNm the sSymbolicNm to set
     */
    public void setsSymbolicNm(String sSymbolicNm) {
        this.sSymbolicNm = sSymbolicNm;
    }

    /**
     * @return the sSymbolicNm
     */
    public String getsSymbolicNm() {
        return sSymbolicNm;
    }

    /**
     * @param sBundleVerNo the sBundleVerNo to set
     */
    public void setsBundleVerNo(String sBundleVerNo) {
        this.sBundleVerNo = sBundleVerNo;
    }

    /**
     * @return the sBundleVerNo
     */
    public String getsBundleVerNo() {
        return sBundleVerNo;
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


}
