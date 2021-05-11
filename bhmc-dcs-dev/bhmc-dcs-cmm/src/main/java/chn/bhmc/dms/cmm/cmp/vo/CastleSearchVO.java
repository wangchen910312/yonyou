package chn.bhmc.dms.cmm.cmp.vo;

import org.hibernate.validator.constraints.Length;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * 성정보정보 조회 SearchVO
 * </pre>
 *
 * @ClassName   : CastleSearchVO.java
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

public class CastleSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1978051699934586816L;

    /**
     * 성정보코드
     */
    private String sCstlCd;

    /**
     * 성정보명
     */
    private String sCstlNm;

    /**
     * 성 코드
     */
    @Length(min=2, max=2)
    private String sSungCd;

    /**
     * 사무소정보코드
     */
    private String sOffCd;

    /**
     * @return the sCstlCd
     */
    public String getsCstlCd() {
        return sCstlCd;
    }

    /**
     * @param sCstlCd the sCstlCd to set
     */
    public void setsCstlCd(String sCstlCd) {
        this.sCstlCd = sCstlCd;
    }

    /**
     * @return the sCstlNm
     */
    public String getsCstlNm() {
        return sCstlNm;
    }

    /**
     * @param sCstlNm the sCstlNm to set
     */
    public void setsCstlNm(String sCstlNm) {
        this.sCstlNm = sCstlNm;
    }

    /**
     * @return the sSungCd
     */
    public String getsSungCd() {
        return sSungCd;
    }

    /**
     * @param sSungCd the sSungCd to set
     */
    public void setsSungCd(String sSungCd) {
        this.sSungCd = sSungCd;
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

}
