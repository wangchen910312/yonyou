package chn.bhmc.dms.cmm.sci.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : UserDefinedSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 5. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 18.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

public class UserDefinedSearchVO extends SearchVO {
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2527059730437611949L;

    private String  sUsrDefReqDocId;
    private String  sUsrDefReqDocNm;
    private String  sDlrCd;
    private int     sAtcNo;
    private String  sDiviCd;
    private String  sOfficeCd;
    private String  sStartDt;
    private String  sEndDt;

    /**
     * @return the sUsrDefReqDocId
     */
    public String getsUsrDefReqDocId() {
        return sUsrDefReqDocId;
    }
    /**
     * @param sUsrDefReqDocId the sUsrDefReqDocId to set
     */
    public void setsUsrDefReqDocId(String sUsrDefReqDocId) {
        this.sUsrDefReqDocId = sUsrDefReqDocId;
    }
    /**
     * @return the sUsrDefReqDocNm
     */
    public String getsUsrDefReqDocNm() {
        return sUsrDefReqDocNm;
    }
    /**
     * @param sUsrDefReqDocNm the sUsrDefReqDocNm to set
     */
    public void setsUsrDefReqDocNm(String sUsrDefReqDocNm) {
        this.sUsrDefReqDocNm = sUsrDefReqDocNm;
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
     * @return the sAtcNo
     */
    public int getsAtcNo() {
        return sAtcNo;
    }
    /**
     * @param sAtcNo the sAtcNo to set
     */
    public void setsAtcNo(int sAtcNo) {
        this.sAtcNo = sAtcNo;
    }
    /**
     * @return the sDiviCd
     */
    public String getsDiviCd() {
        return sDiviCd;
    }
    /**
     * @param sDiviCd the sDiviCd to set
     */
    public void setsDiviCd(String sDiviCd) {
        this.sDiviCd = sDiviCd;
    }
    /**
     * @return the sOfficeCd
     */
    public String getsOfficeCd() {
        return sOfficeCd;
    }
    /**
     * @param sOfficeCd the sOfficeCd to set
     */
    public void setsOfficeCd(String sOfficeCd) {
        this.sOfficeCd = sOfficeCd;
    }
    /**
     * @return the sStartDt
     */
    public String getsStartDt() {
        return sStartDt;
    }
    /**
     * @param sStartDt the sStartDt to set
     */
    public void setsStartDt(String sStartDt) {
        this.sStartDt = sStartDt;
    }
    /**
     * @return the sEndDt
     */
    public String getsEndDt() {
        return sEndDt;
    }
    /**
     * @param sEndDt the sEndDt to set
     */
    public void setsEndDt(String sEndDt) {
        this.sEndDt = sEndDt;
    }
}