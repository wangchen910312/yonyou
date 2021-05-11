package chn.bhmc.dms.mob.api.sales.vo;

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
 *  2016. 1. 29.     Kang Seok Han     최초 생성.
 *  2017. 2. 19.     Io Bo Shim        창고담당자ID 필드 추가.
 * </pre>
 */

public class StorageSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 616532691443894942L;

    /**
     * 딜러코드
     */
    private String sDlrCd;

    /**
     * 플랜크코드
     */
    private String sPltCd;

    /**
     * 창고코드
     */
    private String sStrgeCd;

    /**
     * 창고명
     */
    private String sStrgeNm;

    /**
     * 창고넷팅유무
     */
    private String sNetingUseYn;

    /**
     * 로케이션관리유무
     */
    private String sLocMngYn;

    /**
     * 용품창고검색유무
     */
    private String sStrgeSaleAccYn = "N";

    /**
     * 창고유형
     */
    private String sStrgeTp;

    /**
     * 창고담당자ID
     */
    private String sUsrId;

    /**
     * 창고담당자명
     */
    private String sUsrNm;

    /**
     * 창고관리자
     */
    private String sStrgeManager;

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
     * @return the sStrgeSaleAccYn
     */
    public String getsStrgeSaleAccYn() {
        return sStrgeSaleAccYn;
    }

    /**
     * @param sStrgeSaleAccYn the sStrgeSaleAccYn to set
     */
    public void setsStrgeSaleAccYn(String sStrgeSaleAccYn) {
        this.sStrgeSaleAccYn = sStrgeSaleAccYn;
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

    /**
     * @return the sUsrId
     */
    public String getsUsrId() {
        return sUsrId;
    }

    /**
     * @param sUsrId the sUsrId to set
     */
    public void setsUsrId(String sUsrId) {
        this.sUsrId = sUsrId;
    }

    /**
     * @return the sUsrNm
     */
    public String getsUsrNm() {
        return sUsrNm;
    }

    /**
     * @param sUsrNm the sUsrNm to set
     */
    public void setsUsrNm(String sUsrNm) {
        this.sUsrNm = sUsrNm;
    }

    /**
     * @return the sStrgeManager
     */
    public String getsStrgeManager() {
        return sStrgeManager;
    }

    /**
     * @param sStrgeManager the sStrgeManager to set
     */
    public void setsStrgeManager(String sStrgeManager) {
        this.sStrgeManager = sStrgeManager;
    }
}
