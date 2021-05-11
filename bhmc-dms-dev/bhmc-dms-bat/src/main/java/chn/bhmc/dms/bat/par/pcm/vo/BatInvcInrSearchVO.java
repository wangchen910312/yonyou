package chn.bhmc.dms.bat.par.pcm.vo;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * BatchInvoiceInterface Search VO
 *
 * @ClassName   : BatInvcInrSearchVO.java
 * @Description : BatInvcInrSearchVO Class
 * @author In Bo Shim
 * @since 2016. 5. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 17.     In Bo Shim     최초 생성
 * </pre>
 */

public class BatInvcInrSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1283592252431482113L;

    /**
     * dealer code
     **/
    @NotEmpty
    private String sInrDlrCd;

    /**
     * invoice no
     **/
    @NotEmpty
    private String sInrInvNo;

    /**
     * 배치상태코드
     **/
    private String sBatStatCd;

    /**
     * @return the sInrDlrCd
     */
    public String getsInrDlrCd() {
        return sInrDlrCd;
    }

    /**
     * @param sInrDlrCd the sInrDlrCd to set
     */
    public void setsInrDlrCd(String sInrDlrCd) {
        this.sInrDlrCd = sInrDlrCd;
    }

    /**
     * @return the sInrInvNo
     */
    public String getsInrInvNo() {
        return sInrInvNo;
    }

    /**
     * @param sInrInvNo the sInrInvNo to set
     */
    public void setsInrInvNo(String sInrInvNo) {
        this.sInrInvNo = sInrInvNo;
    }

    /**
     * @return the sBatStatCd
     */
    public String getsBatStatCd() {
        return sBatStatCd;
    }

    /**
     * @param sBatStatCd the sBatStatCd to set
     */
    public void setsBatStatCd(String sBatStatCd) {
        this.sBatStatCd = sBatStatCd;
    }
}
