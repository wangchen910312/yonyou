package chn.bhmc.dms.mob.api.part.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : UnitInfoSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 2. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 17.     Kang Seok Han     최초 생성
 * </pre>
 */

public class UnitInfoSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 9127470108819165187L;

    /**
     * 단위코드
     */
    private String sUnitCd;

    /**
     * 단위유형
     */
    private String sUnitTp;

    /**
     * 단위명
     */
    private String sUnitNm;

    /**
     * 기준단위여부
     */
    private String sUnitStdYn;

    /**
     * 단위 사용여부
     */
    private String sUseYn;

    /**
     * @return the sUnitCd
     */
    public String getsUnitCd() {
        return sUnitCd;
    }

    /**
     * @param sUnitCd the sUnitCd to set
     */
    public void setsUnitCd(String sUnitCd) {
        this.sUnitCd = sUnitCd;
    }

    /**
     * @return the sUnitTp
     */
    public String getsUnitTp() {
        return sUnitTp;
    }

    /**
     * @param sUnitTp the sUnitTp to set
     */
    public void setsUnitTp(String sUnitTp) {
        this.sUnitTp = sUnitTp;
    }

    /**
     * @return the sUnitNm
     */
    public String getsUnitNm() {
        return sUnitNm;
    }

    /**
     * @param sUnitNm the sUnitNm to set
     */
    public void setsUnitNm(String sUnitNm) {
        this.sUnitNm = sUnitNm;
    }

    /**
     * @return the sUnitStdYn
     */
    public String getsUnitStdYn() {
        return sUnitStdYn;
    }

    /**
     * @param sUnitStdYn the sUnitStdYn to set
     */
    public void setsUnitStdYn(String sUnitStdYn) {
        this.sUnitStdYn = sUnitStdYn;
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
