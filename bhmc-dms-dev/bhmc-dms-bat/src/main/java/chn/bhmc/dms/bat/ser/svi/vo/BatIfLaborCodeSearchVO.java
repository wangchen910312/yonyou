package chn.bhmc.dms.bat.ser.svi.vo;

import java.util.Date;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatIfLaborCodeSearchVO.java
 * @Description : 공임코드 관리 조회 VO
 * @author YIN XUEYUAN
 * @since 2016. 5. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 24.     YIN XUEYUAN     최초 생성
 * </pre>
 */

public class BatIfLaborCodeSearchVO extends SearchVO{

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
     * Vin No
     */
    private String sVinNo;


     /**
     * 유효시작일자
     */
    private Date sValidStartDt;


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
    public Date getsValidStartDt() {
        return sValidStartDt;
    }
    public void setsValidStartDt(Date sValidStartDt) {
        this.sValidStartDt = sValidStartDt;
    }
    public String getsVinNo() {
        return sVinNo;
    }
    public void setsVinNo(String sVinNo) {
        this.sVinNo = sVinNo;
    }


}
