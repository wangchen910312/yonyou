package chn.bhmc.dms.cmm.cmp.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * 사무소정보 조회 SearchVO
 * </pre>
 *
 * @ClassName   : OfficeSearchVO.java
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

public class OfficeSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -8416587486167398626L;

    /**
     * 사업부코드
     */
    private String sDiviCd;

    /**
     * 사업부명
     */
    private String sDiviNm;

    /**
     * 사무소코드
     */
    private String sOffCd;

    /**
     * 사무소명
     */
    private String sOffNm;

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

    /**
     * @return the sOffCd
     */
    public String getsOffCd() {
        return sOffCd;
    }

    /**
     * @param sOffCd the sOffCd to set
     */
    public void setsOffCd(String sOffCd) {
        this.sOffCd = sOffCd;
    }

    /**
     * @return the sOffNm
     */
    public String getsOffNm() {
        return sOffNm;
    }

    /**
     * @param sOffNm the sOffNm to set
     */
    public void setsOffNm(String sOffNm) {
        this.sOffNm = sOffNm;
    }
}
