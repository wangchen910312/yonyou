package chn.bhmc.dms.ser.svi.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LaborCodeSearchVO.java
 * @Description : 공임코드 관리 조회 VO
 * @author Ki Hyun Kwon
 * @since 2016. 2. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 11.     Ki Hyun Kwon     최초 생성
 * </pre>
 */

public class LaborCodeSearchVO extends SearchVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6605971453687299490L;


    /**
     * 딜러코드
     */

    private String sDlrCd;

    /**
     * 공임코드
     */
    private String sLbrCd;

    /**
     * 공임명
     */
    private String sLbrNm;

    /**
     * 구분
     */
    private String sDstinCd;

    /**
     * LTS MODEL CODE
     */
    private String sLtsModelCd;

    /**
     * 브랜드 코드
     */
    private String sBrandCd;

    /**
     * 수리유형
     */
    private String sLbrTp;

    /**
     * 수리코드유형
     */
    private String sLbrCdTp;




    /**
     * @return the sDlrCd
     */
    public String getsDlrCd() {
        return sDlrCd;
    }
    /**
     * @param sDlrCd the sDlrCd to set
     */
    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }
    /**
     * @return the sLbrCd
     */
    public String getsLbrCd() {
        return sLbrCd;
    }
    /**
     * @param sLbrCd the sLbrCd to set
     */
    public void setsLbrCd(String sLbrCd) {
        this.sLbrCd = sLbrCd;
    }
    /**
     * @return the sLbrNm
     */
    public String getsLbrNm() {
        return sLbrNm;
    }
    /**
     * @param sLbrNm the sLbrNm to set
     */
    public void setsLbrNm(String sLbrNm) {
        this.sLbrNm = sLbrNm;
    }
    /**
     * @return the sDstinCd
     */
    public String getsDstinCd() {
        return sDstinCd;
    }
    /**
     * @param sDstinCd the sDstinCd to set
     */
    public void setsDstinCd(String sDstinCd) {
        this.sDstinCd = sDstinCd;
    }
    /**
     * @return the sLtsModelCd
     */
    public String getsLtsModelCd() {
        return sLtsModelCd;
    }
    /**
     * @param sLtsModelCd the sLtsModelCd to set
     */
    public void setsLtsModelCd(String sLtsModelCd) {
        this.sLtsModelCd = sLtsModelCd;
    }
    /**
     * @return the sBrandCd
     */
    public String getsBrandCd() {
        return sBrandCd;
    }
    /**
     * @param sBrandCd the sBrandCd to set
     */
    public void setsBrandCd(String sBrandCd) {
        this.sBrandCd = sBrandCd;
    }
    /**
     * @return the sLbrTp
     */
    public String getsLbrTp() {
        return sLbrTp;
    }
    /**
     * @param sLbrTp the sLbrTp to set
     */
    public void setsLbrTp(String sLbrTp) {
        this.sLbrTp = sLbrTp;
    }
    /**
     * @return the sLbrCdTp
     */
    public String getsLbrCdTp() {
        return sLbrCdTp;
    }
    /**
     * @param sLbrCdTp the sLbrCdTp to set
     */
    public void setsLbrCdTp(String sLbrCdTp) {
        this.sLbrCdTp = sLbrCdTp;
    }



}
