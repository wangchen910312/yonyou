package chn.bhmc.dms.cmm.cmp.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : StorageSearchVO.java
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

public class StorageSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 616532691443894942L;

    private String sDlrCd;

    private String sPltCd;

    private String sStrgeCd;

    private String sStrgeNm;

    private String sNetingUseYn;

    private String sLocMngYn;

    private String sStrgeTp;

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
     * @return the sPltCd
     */
    public String getsPltCd() {
        return sPltCd;
    }

    /**
     * @param sPltCd the sPltCd to set
     */
    public void setsPltCd(String sPltCd) {
        this.sPltCd = sPltCd;
    }

    /**
     * @return the sStrgeCd
     */
    public String getsStrgeCd() {
        return sStrgeCd;
    }

    /**
     * @param sStrgeCd the sStrgeCd to set
     */
    public void setsStrgeCd(String sStrgeCd) {
        this.sStrgeCd = sStrgeCd;
    }

    /**
     * @return the sStrgeNm
     */
    public String getsStrgeNm() {
        return sStrgeNm;
    }

    /**
     * @param sStrgeNm the sStrgeNm to set
     */
    public void setsStrgeNm(String sStrgeNm) {
        this.sStrgeNm = sStrgeNm;
    }

    /**
     * @return the sNetingUseYn
     */
    public String getsNetingUseYn() {
        return sNetingUseYn;
    }

    /**
     * @param sNetingUseYn the sNetingUseYn to set
     */
    public void setsNetingUseYn(String sNetingUseYn) {
        this.sNetingUseYn = sNetingUseYn;
    }

    /**
     * @return the sLocMngYn
     */
    public String getsLocMngYn() {
        return sLocMngYn;
    }

    /**
     * @param sLocMngYn the sLocMngYn to set
     */
    public void setsLocMngYn(String sLocMngYn) {
        this.sLocMngYn = sLocMngYn;
    }

    /**
     * @return the sStrgeTp
     */
    public String getsStrgeTp() {
        return sStrgeTp;
    }

    /**
     * @param sStrgeTp the sStrgeTp to set
     */
    public void setsStrgeTp(String sStrgeTp) {
        this.sStrgeTp = sStrgeTp;
    }


}
