package chn.bhmc.dms.sal.veh.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * 기준정보 > 2급딜러 관리
 * </pre>
 *
 * @ClassName   : Slv2DlrOrgSearchVO.java
 * @Description : 기준정보 > 2급딜러 관리
 * @author chibeom.song
 * @since 2017. 2. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 24.   chibeom.song     최초 생성
 * </pre>
 */

public class Slv2DlrOrgSearchVO extends SearchVO {

    private static final long serialVersionUID = 2924692645434750515L;

    private String langCd;

    // 검색조건
    private String sSdlrTp;
    private String sSdlrCd;
    private String sTaxpayerIdCd;
    private String sDlrCd;

    /**
     * @return the langCd
     */
    public String getLangCd() {
        return langCd;
    }
    /**
     * @param langCd the langCd to set
     */
    public void setLangCd(String langCd) {
        this.langCd = langCd;
    }
    /**
     * @return the sSdlrTp
     */
    public String getsSdlrTp() {
        return sSdlrTp;
    }
    /**
     * @param sSdlrTp the sSdlrTp to set
     */
    public void setsSdlrTp(String sSdlrTp) {
        this.sSdlrTp = sSdlrTp;
    }
    /**
     * @return the sSdlrCd
     */
    public String getsSdlrCd() {
        return sSdlrCd;
    }
    /**
     * @param sSdlrCd the sSdlrCd to set
     */
    public void setsSdlrCd(String sSdlrCd) {
        this.sSdlrCd = sSdlrCd;
    }
    /**
     * @return the sTaxpayerIdCd
     */
    public String getsTaxpayerIdCd() {
        return sTaxpayerIdCd;
    }
    /**
     * @param sTaxpayerIdCd the sTaxpayerIdCd to set
     */
    public void setsTaxpayerIdCd(String sTaxpayerIdCd) {
        this.sTaxpayerIdCd = sTaxpayerIdCd;
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

}
