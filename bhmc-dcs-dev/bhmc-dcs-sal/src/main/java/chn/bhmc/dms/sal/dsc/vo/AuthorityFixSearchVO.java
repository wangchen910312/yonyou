package chn.bhmc.dms.sal.dsc.vo;

import chn.bhmc.dms.core.datatype.SearchVO;


/**
 *
 * @ClassName   : SalesAllowanceSearchVO
 * @Description : 일상업무 권한 관리(권한설정) 목록
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.04.27      Kim Jin Suk      최초 생성
 * </pre>
 */

public class AuthorityFixSearchVO extends SearchVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2520299623258931455L;

    private String sDlrCd;
    private String sPstnCd;
    private String sUsrNm;
    private String sUsrId;

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
     * @return the sPstnCd
     */
    public String getsPstnCd() {
        return sPstnCd;
    }
    /**
     * @param sPstnCd the sPstnCd to set
     */
    public void setsPstnCd(String sPstnCd) {
        this.sPstnCd = sPstnCd;
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
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}
