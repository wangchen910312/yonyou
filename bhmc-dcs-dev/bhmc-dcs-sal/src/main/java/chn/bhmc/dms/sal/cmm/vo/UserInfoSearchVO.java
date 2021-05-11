package chn.bhmc.dms.sal.cmm.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CommonCodeSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 18.     Kang Seok Han     최초 생성
 * </pre>
 */

public class UserInfoSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -7016572963264586485L;

    private String sLangCd;         // 언어코드
    private String sEnabledYn;      // 활성여부
    private String sDelYn;          // 삭제여부
    private String sSaleYn;         // 판매업무여부
    private String sDlrCd;
    private String sDutyCd;

    /**
     * @return the sLangCd
     */
    public String getsLangCd() {
        return sLangCd;
    }
    /**
     * @param sLangCd the sLangCd to set
     */
    public void setsLangCd(String sLangCd) {
        this.sLangCd = sLangCd;
    }
    /**
     * @return the sEnabledYn
     */
    public String getsEnabledYn() {
        return sEnabledYn;
    }
    /**
     * @param sEnabledYn the sEnabledYn to set
     */
    public void setsEnabledYn(String sEnabledYn) {
        this.sEnabledYn = sEnabledYn;
    }
    /**
     * @return the sDelYn
     */
    public String getsDelYn() {
        return sDelYn;
    }
    /**
     * @param sDelYn the sDelYn to set
     */
    public void setsDelYn(String sDelYn) {
        this.sDelYn = sDelYn;
    }
    /**
     * @return the sSaleYn
     */
    public String getsSaleYn() {
        return sSaleYn;
    }
    /**
     * @param sSaleYn the sSaleYn to set
     */
    public void setsSaleYn(String sSaleYn) {
        this.sSaleYn = sSaleYn;
    }
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
     * @return the sDutyCd
     */
    public String getsDutyCd() {
        return sDutyCd;
    }
    /**
     * @param sDutyCd the sDutyCd to set
     */
    public void setsDutyCd(String sDutyCd) {
        this.sDutyCd = sDutyCd;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}
