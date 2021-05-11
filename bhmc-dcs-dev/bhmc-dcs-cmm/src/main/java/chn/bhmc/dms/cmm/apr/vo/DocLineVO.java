package chn.bhmc.dms.cmm.apr.vo;

import org.hibernate.validator.constraints.NotBlank;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * 결재양식 결재선 VO
 * </pre>
 *
 * @ClassName   : DocLineVO.java
 * @Description : 결재양식 결재선 VO
 * @author Kang Seok Han
 * @since 2016. 1. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 18.     Kang Seok Han     최초 생성
 * </pre>
 */
public class DocLineVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;

    /**
     * 결재양식 ID
     */
    @NotBlank
    private String signDocId;

    /**
     * 결재양식명
     */
    private String signDocNm ;

    /**
     * 결재라인번호
     */
    private int signDocLineNo ;

    /**
     * 결재유형
     * '01':결재
     * '02':합의
     */
    private String signTp ;

    /**
     * 결재자 사원번호
     */
    private String signEmpNo ;

    /**
     * 결재자 ID
     */
    private String signUsrId ;

    /**
     * 결재자명
     */
    private String signUsrNm ;

    /**
     * 최종결재 여부
     */
    private String lastSignYn;

    /**
     * 결재자 부서코드
     */
    private String signDeptCd;

    /**
     * 결재자 직위코드
     */
    private String signPsitCd;

    /**
     * @return the signDocId
     */
    public String getSignDocId() {
        return signDocId;
    }

    /**
     * @param signDocId the signDocId to set
     */
    public void setSignDocId(String signDocId) {
        this.signDocId = signDocId;
    }

    /**
     * @return the signDocNm
     */
    public String getSignDocNm() {
        return signDocNm;
    }

    /**
     * @param signDocNm the signDocNm to set
     */
    public void setSignDocNm(String signDocNm) {
        this.signDocNm = signDocNm;
    }

    /**
     * @return the signDocLineNo
     */
    public int getSignDocLineNo() {
        return signDocLineNo;
    }

    /**
     * @param signDocLineNo the signDocLineNo to set
     */
    public void setSignDocLineNo(int signDocLineNo) {
        this.signDocLineNo = signDocLineNo;
    }

    /**
     * @return the signTp
     */
    public String getSignTp() {
        return signTp;
    }

    /**
     * @param signTp the signTp to set
     */
    public void setSignTp(String signTp) {
        this.signTp = signTp;
    }

    /**
     * @return the signEmpNo
     */
    public String getSignEmpNo() {
        return signEmpNo;
    }

    /**
     * @param signEmpNo the signEmpNo to set
     */
    public void setSignEmpNo(String signEmpNo) {
        this.signEmpNo = signEmpNo;
    }

    /**
     * @return the signUsrId
     */
    public String getSignUsrId() {
        return signUsrId;
    }

    /**
     * @param signUsrId the signUsrId to set
     */
    public void setSignUsrId(String signUsrId) {
        this.signUsrId = signUsrId;
    }

    /**
     * @return the signUsrNm
     */
    public String getSignUsrNm() {
        return signUsrNm;
    }

    /**
     * @param signUsrNm the signUsrNm to set
     */
    public void setSignUsrNm(String signUsrNm) {
        this.signUsrNm = signUsrNm;
    }

    /**
     * @return the lastSignYn
     */
    public String getLastSignYn() {
        return lastSignYn;
    }

    /**
     * @param lastSignYn the lastSignYn to set
     */
    public void setLastSignYn(String lastSignYn) {
        this.lastSignYn = lastSignYn;
    }

    /**
     * @return the signDeptCd
     */
    public String getSignDeptCd() {
        return signDeptCd;
    }

    /**
     * @param signDeptCd the signDeptCd to set
     */
    public void setSignDeptCd(String signDeptCd) {
        this.signDeptCd = signDeptCd;
    }

    /**
     * @return the signPsitCd
     */
    public String getSignPsitCd() {
        return signPsitCd;
    }

    /**
     * @param signPsitCd the signPsitCd to set
     */
    public void setSignPsitCd(String signPsitCd) {
        this.signPsitCd = signPsitCd;
    }
}