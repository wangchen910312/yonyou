package chn.bhmc.dms.cmm.cmp.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * 직무정보 조회 SearchVO
 * </pre>
 *
 * @ClassName   : TaskSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 29.     Kang Seok Han     최초 생성
 * </pre>
 */

public class TaskSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6745952253111950151L;

    /**
     * 회사구분
     * '10':DCS(본사)
     * '20':DMS(딜러)
     */
    private String sCmpTp;

    /**
     * 직무코드
     */
    private String sTskCd;

    /**
     * 직무명
     */
    private String sTskNm;

    /**
     * 부서코드
     */
    private String sDeptCd;

    /**
     * @return the sCmpTp
     */
    public String getsCmpTp() {
        return sCmpTp;
    }

    /**
     * @param sCmpTp the sCmpTp to set
     */
    public void setsCmpTp(String sCmpTp) {
        this.sCmpTp = sCmpTp;
    }

    /**
     * @return the sTskCd
     */
    public String getsTskCd() {
        return sTskCd;
    }

    /**
     * @param sTskCd the sTskCd to set
     */
    public void setsTskCd(String sTskCd) {
        this.sTskCd = sTskCd;
    }

    /**
     * @return the sTskNm
     */
    public String getsTskNm() {
        return sTskNm;
    }

    /**
     * @param sTskNm the sTskNm to set
     */
    public void setsTskNm(String sTskNm) {
        this.sTskNm = sTskNm;
    }

    /**
     * @return the sDeptCd
     */
    public String getsDeptCd() {
        return sDeptCd;
    }

    /**
     * @param sDeptCd the sDeptCd to set
     */
    public void setsDeptCd(String sDeptCd) {
        this.sDeptCd = sDeptCd;
    }
}
