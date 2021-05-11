package chn.bhmc.dms.cmm.sci.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * 지역코드 조회 SearchVO
 *
 * @ClassName   : DistCodeSearchVO.java
 * @Description : DistCodeSearchVO Class
 * @author Kang Seok Han
 * @since 2016. 1. 4.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 4.     Kang Seok Han     최초 생성
 * </pre>
 */

public class DistCodeSearchVO extends SearchVO {


	/**
	 *
	 */
	private static final long serialVersionUID = 1707229461890670218L;

	/**
	 * 조회조건 - 지역코드
	 */
	private String sDistCd;

	/**
	 * 조회조건 - 지역명
	 */
	private String sDistNm;

	/**
     * 조회조건 - 사용여부
     */
    private String sUseYn;

    /**
     * 조회조건 - 판매지역여부
     */
    private String sSaleDistYn;

    /**
     * 조회조건 - 정비지역여부
     */
    private String sSerDistYn;

    /**
     * 조회조건 - 행정지역여부
     */
    private String sGobDistYn;

    /**
     * @return the sDistCd
     */
    public String getsDistCd() {
        return sDistCd;
    }

    /**
     * @param sDistCd the sDistCd to set
     */
    public void setsDistCd(String sDistCd) {
        this.sDistCd = sDistCd;
    }

    /**
     * @return the sDistNm
     */
    public String getsDistNm() {
        return sDistNm;
    }

    /**
     * @param sDistNm the sDistNm to set
     */
    public void setsDistNm(String sDistNm) {
        this.sDistNm = sDistNm;
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

    /**
     * @return the sSaleDistYn
     */
    public String getsSaleDistYn() {
        return sSaleDistYn;
    }

    /**
     * @param sSaleDistYn the sSaleDistYn to set
     */
    public void setsSaleDistYn(String sSaleDistYn) {
        this.sSaleDistYn = sSaleDistYn;
    }

    /**
     * @return the sSerDistYn
     */
    public String getsSerDistYn() {
        return sSerDistYn;
    }

    /**
     * @param sSerDistYn the sSerDistYn to set
     */
    public void setsSerDistYn(String sSerDistYn) {
        this.sSerDistYn = sSerDistYn;
    }

    /**
     * @return the sGobDistYn
     */
    public String getsGobDistYn() {
        return sGobDistYn;
    }

    /**
     * @param sGobDistYn the sGobDistYn to set
     */
    public void setsGobDistYn(String sGobDistYn) {
        this.sGobDistYn = sGobDistYn;
    }

}
