package chn.bhmc.dms.cmm.cmp.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * 사업부정보 조회 SearchVO
 * </pre>
 *
 * @ClassName   : DivisionSearchVO.java
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

public class DivisionSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6745952253111950159L;

    /**
     * 사업부코드
     */
    private String sDiviCd;

    /**
     * 사업부명
     */
    private String sDiviNm;

    /**
     * @return the sDiviCd
     */
    public String getsDiviCd() {
        return sDiviCd;
    }

    /**
     * @param sDiviCd the sDiviCd to set
     */
    public void setsDiviCd(String sDiviCd) {
        this.sDiviCd = sDiviCd;
    }

    /**
     * @return the sDiviNm
     */
    public String getsDiviNm() {
        return sDiviNm;
    }

    /**
     * @param sDiviNm the sDiviNm to set
     */
    public void setsDiviNm(String sDiviNm) {
        this.sDiviNm = sDiviNm;
    }

}
