package chn.bhmc.dms.bat.crm.cif.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 *
 * @ClassName   : CustomerGroupSearchVO.java
 * @Description : 고객그룹 SearchVO
 * @author Kyo Jin Lee
 * @since 2016. 1. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 20.     Kyo Jin Lee     최초 생성
 * </pre>
 */

public class BatCustomerGroupSearchVO extends SearchVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5026469590161529041L;

    /**
     * 그룹시퀀스
     */
    private int sGrpSeq;

    /**
     * 사용자아이디
     */
    private String sUsrId;

    /**
     * 그룹명
     */
    private String sGrpNm;

    /**
     * 정렬순서
     */
    private int sSortOrder;

    /**
     * 삭제여부
     */
    private String sDelYn;

    /**
     * 등록자
     */
    private String sRegUsrId;

    private String sGrpTp;

    private String sDlrCd;
    private String sPltCd;

    /**
     * @return the sGrpSeq
     */
    public int getsGrpSeq() {
        return sGrpSeq;
    }

    /**
     * @param sGrpSeq the sGrpSeq to set
     */
    public void setsGrpSeq(int sGrpSeq) {
        this.sGrpSeq = sGrpSeq;
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
     * @return the sGrpNm
     */
    public String getsGrpNm() {
        return sGrpNm;
    }

    /**
     * @param sGrpNm the sGrpNm to set
     */
    public void setsGrpNm(String sGrpNm) {
        this.sGrpNm = sGrpNm;
    }

    /**
     * @return the sSortOrder
     */
    public int getsSortOrder() {
        return sSortOrder;
    }

    /**
     * @param sSortOrder the sSortOrder to set
     */
    public void setsSortOrder(int sSortOrder) {
        this.sSortOrder = sSortOrder;
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
     * @return the sRegUsrId
     */
    public String getsRegUsrId() {
        return sRegUsrId;
    }

    /**
     * @param sRegUsrId the sRegUsrId to set
     */
    public void setsRegUsrId(String sRegUsrId) {
        this.sRegUsrId = sRegUsrId;
    }

    /**
     * @return the sGrpTp
     */
    public String getsGrpTp() {
        return sGrpTp;
    }

    /**
     * @param sGrpTp the sGrpTp to set
     */
    public void setsGrpTp(String sGrpTp) {
        this.sGrpTp = sGrpTp;
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



}
