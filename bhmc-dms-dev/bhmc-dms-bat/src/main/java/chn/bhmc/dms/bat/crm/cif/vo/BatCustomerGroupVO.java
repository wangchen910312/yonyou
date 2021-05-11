package chn.bhmc.dms.bat.crm.cif.vo;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 *
 * @ClassName   : CustomerGroupVO.java
 * @Description : 고객그룹VO
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

public class BatCustomerGroupVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5026469590161529041L;

    private int grpSeq;             // 그룹시퀀스
    private String usrId;           // 사용자아이디

    @NotEmpty
    private String grpNm;           // 그룹명
    private int sortOrder;          // 정렬순서

    @NotEmpty
    private String delYn;           //삭제여부
    private String regUsrId;        // 등록자

    private String custNo;          // 고객번호
    private String custNm;          // 고객명 CUST_NM
    private String telNo;           // 전화번호 TEL_NO
    private String hpNo;            // 핸드폰번호 HP_NO
    private String mngScId;         // 담당 SC MNG_SC_ID
    private String groupCnt;        // 그룹에 속한 고객 카운트

    private String grpTp;           // 001:그룹, 002:태그, 003:개인

    private String dlrCd;
    private String pltCd;

    /**
     * @return the grpSeq
     */
    public int getGrpSeq() {
        return grpSeq;
    }
    /**
     * @param grpSeq the grpSeq to set
     */
    public void setGrpSeq(int grpSeq) {
        this.grpSeq = grpSeq;
    }
    /**
     * @return the userId
     */
    public String getUsrId() {
        return usrId;
    }
    /**
     * @param userId the userId to set
     */
    public void setUsrId(String usrId) {
        this.usrId = usrId;
    }


    /**
     * @return the grpNm
     */
    public String getGrpNm() {
        return grpNm;
    }
    /**
     * @param grpNm the grpNm to set
     */
    public void setGrpNm(String grpNm) {
        this.grpNm = grpNm;
    }

    /**
     * @return the sortOrder
     */
    public int getSortOrder() {
        return sortOrder;
    }
    /**
     * @param sortOrder the sortOrder to set
     */
    public void setSortOrder(int sortOrder) {
        this.sortOrder = sortOrder;
    }

    /**
     * @return the delYn
     */
    public String getDelYn() {
        return delYn;
    }
    /**
     * @param delYn the delYn to set
     */
    public void setDelYn(String delYn) {
        this.delYn = delYn;
    }
    /**
     * @return the regUsrId
     */
    public String getRegUsrId() {
        return regUsrId;
    }
    /**
     * @param regUsrId the regUsrId to set
     */
    public void setRegUsrId(String regUsrId) {
        this.regUsrId = regUsrId;
    }
    /**
     * @return the custNo
     */
    public String getCustNo() {
        return custNo;
    }
    /**
     * @param custNo the custNo to set
     */
    public void setCustNo(String custNo) {
        this.custNo = custNo;
    }
    /**
     * @return the custNm
     */
    public String getCustNm() {
        return custNm;
    }
    /**
     * @param custNm the custNm to set
     */
    public void setCustNm(String custNm) {
        this.custNm = custNm;
    }
    /**
     * @return the telNo
     */
    public String getTelNo() {
        return telNo;
    }
    /**
     * @param telNo the telNo to set
     */
    public void setTelNo(String telNo) {
        this.telNo = telNo;
    }
    /**
     * @return the hpNo
     */
    public String getHpNo() {
        return hpNo;
    }
    /**
     * @param hpNo the hpNo to set
     */
    public void setHpNo(String hpNo) {
        this.hpNo = hpNo;
    }
    /**
     * @return the mngScId
     */
    public String getMngScId() {
        return mngScId;
    }
    /**
     * @param mngScId the mngScId to set
     */
    public void setMngScId(String mngScId) {
        this.mngScId = mngScId;
    }

    /**
     * @return the sortOrder
     */
    public String getGroupCnt() {
        return groupCnt;
    }
    /**
     * @param sortOrder the sortOrder to set
     */
    public void setGroupCnt(String groupCnt) {
        this.groupCnt = groupCnt;
    }
    /**
     * @return the grpTp
     */
    public String getGrpTp() {
        return grpTp;
    }
    /**
     * @param grpTp the grpTp to set
     */
    public void setGrpTp(String grpTp) {
        this.grpTp = grpTp;
    }
    /**
     * @return the dlrCd
     */
    public String getDlrCd() {
        return dlrCd;
    }
    /**
     * @param dlrCd the dlrCd to set
     */
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }
    /**
     * @return the pltCd
     */
    public String getPltCd() {
        return pltCd;
    }
    /**
     * @param pltCd the pltCd to set
     */
    public void setPltCd(String pltCd) {
        this.pltCd = pltCd;
    }

}
