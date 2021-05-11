package chn.bhmc.dms.par.pmm.vo;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * Vender Tel Search VO
 *
 * @ClassName   : VendorTelSearchVO.java
 * @Description : VendorTelSearchVO Class
 * @author In Bo Shim
 * @since 2016. 4. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 22.     In Bo Shim     최초 생성
 * </pre>
 */

public class VenderTelSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6167646607882385636L;

    /**
     * dlrCd
     */
    @NotEmpty
    private String sDlrCd;

    /**
     * bpCd
     */
    private String sBpCd;

    /**
     * lineNO
     */
    private int sLineNo = 0;

    /**
     * prsnNm
     */
    private String sPrsnNm;

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
     * @return the sBpCd
     */
    public String getsBpCd() {
        return sBpCd;
    }

    /**
     * @param sBpCd the sBpCd to set
     */
    public void setsBpCd(String sBpCd) {
        this.sBpCd = sBpCd;
    }

    /**
     * @return the sLineNo
     */
    public int getsLineNo() {
        return sLineNo;
    }

    /**
     * @param sLineNo the sLineNo to set
     */
    public void setsLineNo(int sLineNo) {
        this.sLineNo = sLineNo;
    }

    /**
     * @return the sPrsnNm
     */
    public String getsPrsnNm() {
        return sPrsnNm;
    }

    /**
     * @param sPrsnNm the sPrsnNm to set
     */
    public void setsPrsnNm(String sPrsnNm) {
        this.sPrsnNm = sPrsnNm;
    }
}
