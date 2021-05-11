package chn.bhmc.dms.par.pmm.vo;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * 공급률 검색 VO
 *
 * @ClassName   : SupplyRuleSearchVO.java
 * @Description : SupplyRuleSearchVO Class
 * @author Bo In Shim
 * @since 2016. 9. 09.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 09.     Bo In Shim     최초 생성
 * </pre>
 */

public class SupplyRuleSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6416993950710191989L;

    /**
     * sDlrCd
     */
    @NotEmpty
    private String sDlrCd;

    /**
     * sPltCd
     */
    @NotEmpty
    private String sPltCd;

    /**
     * sAbcInd
     */
    @NotEmpty
    private String sAbcInd;

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
     * @return the sAbcInd
     */
    public String getsAbcInd() {
        return sAbcInd;
    }

    /**
     * @param sAbcInd the sAbcInd to set
     */
    public void setsAbcInd(String sAbcInd) {
        this.sAbcInd = sAbcInd;
    }
}
