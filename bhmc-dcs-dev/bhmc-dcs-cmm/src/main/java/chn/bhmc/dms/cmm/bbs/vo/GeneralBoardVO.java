package chn.bhmc.dms.cmm.bbs.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : GeneralBoard.java
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

public class GeneralBoardVO extends BaseVO {
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6171496097952742619L;

    private String  flag;
    private String  bbsId;
    private String  nttId;
    private String  nttCatCd;
    private String  nttTitleNm;
    private String  nttCont;
    private String  nttRootId;
    private String  nttRefId;
    private int     repLvlVal;
    private int     repSortOrderVal;
    private String  fileDocNo;
    private String  usrNm;

    /**
     * @return the flag
     */
    public String getFlag() {
        return flag;
    }
    /**
     * @param flag the flag to set
     */
    public void setFlag(String flag) {
        this.flag = flag;
    }
    /**
     * @return the bbsId
     */
    public String getBbsId() {
        return bbsId;
    }
    /**
     * @param bbsId the bbsId to set
     */
    public void setBbsId(String bbsId) {
        this.bbsId = bbsId;
    }
    /**
     * @return the nttId
     */
    public String getNttId() {
        return nttId;
    }
    /**
     * @param nttId the nttId to set
     */
    public void setNttId(String nttId) {
        this.nttId = nttId;
    }
    /**
     * @return the nttTitleNm
     */
    public String getNttTitleNm() {
        return nttTitleNm;
    }
    /**
     * @param nttTitleNm the nttTitleNm to set
     */
    public void setNttTitleNm(String nttTitleNm) {
        this.nttTitleNm = nttTitleNm;
    }
    /**
     * @return the nttCont
     */
    public String getNttCont() {
        return nttCont;
    }
    /**
     * @param nttCont the nttCont to set
     */
    public void setNttCont(String nttCont) {
        this.nttCont = nttCont;
    }
    /**
     * @return the nttRootId
     */
    public String getNttRootId() {
        return nttRootId;
    }
    /**
     * @param nttRootId the nttRootId to set
     */
    public void setNttRootId(String nttRootId) {
        this.nttRootId = nttRootId;
    }
    /**
     * @return the nttRefId
     */
    public String getNttRefId() {
        return nttRefId;
    }
    /**
     * @param nttRefId the nttRefId to set
     */
    public void setNttRefId(String nttRefId) {
        this.nttRefId = nttRefId;
    }
    /**
     * @return the repLvlVal
     */
    public int getRepLvlVal() {
        return repLvlVal;
    }
    /**
     * @param repLvlVal the repLvlVal to set
     */
    public void setRepLvlVal(int repLvlVal) {
        this.repLvlVal = repLvlVal;
    }
    /**
     * @return the repSortOrderVal
     */
    public int getRepSortOrderVal() {
        return repSortOrderVal;
    }
    /**
     * @param repSortOrderVal the repSortOrderVal to set
     */
    public void setRepSortOrderVal(int repSortOrderVal) {
        this.repSortOrderVal = repSortOrderVal;
    }
    /**
     * @return the fileDocNo
     */
    public String getFileDocNo() {
        return fileDocNo;
    }
    /**
     * @param fileDocNo the fileDocNo to set
     */
    public void setFileDocNo(String fileDocNo) {
        this.fileDocNo = fileDocNo;
    }
    /**
     * @return the usrId
     */
    public String getUsrNm() {
        return usrNm;
    }
    /**
     * @param usrId the usrId to set
     */
    public void setUsrNm(String usrNm) {
        this.usrNm = usrNm;
    }
    /**
     * @param nttCatCd the nttCatCd to set
     */
    public void setNttCatCd(String nttCatCd) {
        this.nttCatCd = nttCatCd;
    }
    /**
     * @return the nttCatCd
     */
    public String getNttCatCd() {
        return nttCatCd;
    }
}