package chn.bhmc.dms.cmm.bbs.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : GeneralBoardSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 4. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 14.     Kang Seok Han     최초 생성
 * </pre>
 */

public class GeneralBoardSearchVO extends SearchVO {
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 3137693936684897186L;

    private String  sBbsId;
    private String  sNttId;
    private String  sNttCatCd;
    private String  sNttTitleNm;
    private String  sNttCont;
    private String  sNttRootId;
    private String  sNttRefId;
    private int     sRepLvlVal;
    private int     sRepSortOrderVal;
    private String  sFileDocNo;
    private String  sUsrNm;

    /**
     * @return the sBbsId
     */
    public String getsBbsId() {
        return sBbsId;
    }
    /**
     * @param sBbsId the sBbsId to set
     */
    public void setsBbsId(String sBbsId) {
        this.sBbsId = sBbsId;
    }
    /**
     * @return the sNttId
     */
    public String getsNttId() {
        return sNttId;
    }
    /**
     * @param sNttId the sNttId to set
     */
    public void setsNttId(String sNttId) {
        this.sNttId = sNttId;
    }
    /**
     * @return the sNttTitleNm
     */
    public String getsNttTitleNm() {
        return sNttTitleNm;
    }
    /**
     * @param sNttTitleNm the sNttTitleNm to set
     */
    public void setsNttTitleNm(String sNttTitleNm) {
        this.sNttTitleNm = sNttTitleNm;
    }
    /**
     * @return the sNttCont
     */
    public String getsNttCont() {
        return sNttCont;
    }
    /**
     * @param sNttCont the sNttCont to set
     */
    public void setsNttCont(String sNttCont) {
        this.sNttCont = sNttCont;
    }
    /**
     * @return the sNttRootId
     */
    public String getsNttRootId() {
        return sNttRootId;
    }
    /**
     * @param sNttRootId the sNttRootId to set
     */
    public void setsNttRootId(String sNttRootId) {
        this.sNttRootId = sNttRootId;
    }
    /**
     * @return the sNttRefId
     */
    public String getsNttRefId() {
        return sNttRefId;
    }
    /**
     * @param sNttRefId the sNttRefId to set
     */
    public void setsNttRefId(String sNttRefId) {
        this.sNttRefId = sNttRefId;
    }
    /**
     * @return the sRepLvlVal
     */
    public int getsRepLvlVal() {
        return sRepLvlVal;
    }
    /**
     * @param sRepLvlVal the sRepLvlVal to set
     */
    public void setsRepLvlVal(int sRepLvlVal) {
        this.sRepLvlVal = sRepLvlVal;
    }
    /**
     * @return the sRepSortOrderVal
     */
    public int getsRepSortOrderVal() {
        return sRepSortOrderVal;
    }
    /**
     * @param sRepSortOrderVal the sRepSortOrderVal to set
     */
    public void setsRepSortOrderVal(int sRepSortOrderVal) {
        this.sRepSortOrderVal = sRepSortOrderVal;
    }
    /**
     * @return the sFileDocNo
     */
    public String getsFileDocNo() {
        return sFileDocNo;
    }
    /**
     * @param sFileDocNo the sFileDocNo to set
     */
    public void setsFileDocNo(String sFileDocNo) {
        this.sFileDocNo = sFileDocNo;
    }
    /**
     * @return the sUsrId
     */
    public String getsUsrNm() {
        return sUsrNm;
    }
    /**
     * @param sUsrId the sUsrId to set
     */
    public void setsUsrNm(String sUsrNm) {
        this.sUsrNm = sUsrNm;
    }
    /**
     * @param sNttCatCd the sNttCatCd to set
     */
    public void setsNttCatCd(String sNttCatCd) {
        this.sNttCatCd = sNttCatCd;
    }
    /**
     * @return the sNttCatCd
     */
    public String getsNttCatCd() {
        return sNttCatCd;
    }
}