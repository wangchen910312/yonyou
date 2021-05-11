package chn.bhmc.dms.cmm.cmp.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * 부서정보 조회 SearchVO
 * </pre>
 *
 * @ClassName   : DepartmentSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 11. 28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 11. 28.     Kang Seok Han     최초 생성
 * </pre>
 */

public class DepartmentSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2522453086939206518L;

    /**
     * 회사구분
     * 10:딜러
     * 20:법인
     */
    private String sCmpTp;

    /**
     * 부서코드
     */
    private String sDeptCd;

    /**
     * 부서명
     */
    private String sDeptNm;

    /**
     * 사용여부
     */
    private String sUseYn;

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

    /**
     * @return the sDeptNm
     */
    public String getsDeptNm() {
        return sDeptNm;
    }

    /**
     * @param sDeptNm the sDeptNm to set
     */
    public void setsDeptNm(String sDeptNm) {
        this.sDeptNm = sDeptNm;
    }

    /**
     * @return the sUseYn
     */
    public String getsUseYn() {
        return sUseYn;
    }

    /**
     * @param sUseYn the sUseYn to set
     */
    public void setsUseYn(String sUseYn) {
        this.sUseYn = sUseYn;
    }
}
