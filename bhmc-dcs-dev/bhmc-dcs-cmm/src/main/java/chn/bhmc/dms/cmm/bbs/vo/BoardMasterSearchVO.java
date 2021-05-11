package chn.bhmc.dms.cmm.bbs.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BoardMasterSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 4. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 12.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

public class BoardMasterSearchVO extends SearchVO {
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6107095774933339599L;

    private String  sBbsId;
    private String  sBbsNm;
    private String  sUseYn;
    private String  sRepTp;
    private String  sCmntUseYn;
    private int     sFileCnt         = 0;
    private int     sFileMaxSizeVal  = 0;
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
     * @return the sBbsNm
     */
    public String getsBbsNm() {
        return sBbsNm;
    }
    /**
     * @param sBbsNm the sBbsNm to set
     */
    public void setsBbsNm(String sBbsNm) {
        this.sBbsNm = sBbsNm;
    }
    /**
     * @return the sUseYn
     */
    public String getsUseYn() {
        return sUseYn;
    }
    /**
     * @param sUseYn the sUseYn to set
     */
    public void setsUseYn(String sUseYn) {
        this.sUseYn = sUseYn;
    }
    /**
     * @return the sRepTp
     */
    public String getsRepTp() {
        return sRepTp;
    }
    /**
     * @param sRepTp the sRepTp to set
     */
    public void setsRepTp(String sRepTp) {
        this.sRepTp = sRepTp;
    }
    /**
     * @return the sCmntUseYn
     */
    public String getsCmntUseYn() {
        return sCmntUseYn;
    }
    /**
     * @param sCmntUseYn the sCmntUseYn to set
     */
    public void setsCmntUseYn(String sCmntUseYn) {
        this.sCmntUseYn = sCmntUseYn;
    }
    /**
     * @return the sFileCnt
     */
    public int getsFileCnt() {
        return sFileCnt;
    }
    /**
     * @param sFileCnt the sFileCnt to set
     */
    public void setsFileCnt(int sFileCnt) {
        this.sFileCnt = sFileCnt;
    }
    /**
     * @return the sFileMaxSizeVal
     */
    public int getsFileMaxSizeVal() {
        return sFileMaxSizeVal;
    }
    /**
     * @param sFileMaxSizeVal the sFileMaxSizeVal to set
     */
    public void setsFileMaxSizeVal(int sFileMaxSizeVal) {
        this.sFileMaxSizeVal = sFileMaxSizeVal;
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
}