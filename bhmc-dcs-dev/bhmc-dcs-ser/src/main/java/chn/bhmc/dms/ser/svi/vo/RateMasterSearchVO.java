package chn.bhmc.dms.ser.svi.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * 임률관리 조회 SearchVO
 * </pre>
 *
 * @ClassName   : RateMasterSearchVO.java
 * @Description : 임률관리 조회 SearchVO.
 * @author Yin Xueyuan
 * @since 2016. 1. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 25.     Yin Xueyuan     최초 생성
 * </pre>
 */

public class RateMasterSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6947437255468486983L;

    /**
     * 조회조건 - 딜러코드
     */
    private String sDlrCd;

    /**
     * 조회조건 - 임률코드
     */
    private String sRteCd;

    /**
     * 조회조건 - RO유형
     */
    private String sRoTp;

    /**
     * 조회조건 - 브랜드코드
     */
    private String sBrandCd;

    public String getsDlrCd() {
        return sDlrCd;
    }

    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }

    public String getsRteCd() {
        return sRteCd;
    }

    public void setsRteCd(String sRteCd) {
        this.sRteCd = sRteCd;
    }

    public String getsRoTp() {
        return sRoTp;
    }

    public void setsRoTp(String sRoTp) {
        this.sRoTp = sRoTp;
    }

    public String getsBrandCd() {
        return sBrandCd;
    }

    public void setsBrandCd(String sBrandCd) {
        this.sBrandCd = sBrandCd;
    }





}
