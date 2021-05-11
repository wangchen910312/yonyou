package chn.bhmc.dms.cmm.apr.vo;

import java.util.Date;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * 결재문서 결재선 VO
 * </pre>
 *
 * @ClassName   : SignLineVO.java
 * @Description : 결재문서 결재선 VO.
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
public class SignLineVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;

    /**
     * 결재문서 번호
     */
    @NotBlank
    private String signDocNo;

    /**
     * 결재양식 ID
     */
    private String signDocId;

    /**
     * 결재양식명
     */
    private String signDocNm;

    /**
     * 결재라인번호
     */
    @NotNull
    private int signDocLineNo;

    /**
     * 결재구분
     * '01':결재
     * '02':합의
     */
    private String signTp;

    /**
     * 결재자 사원번호
     */
    private String signEmpNo;

    /**
     * 결재자 ID
     */
    private String signUsrId;

    /**
     * 결재자명
     */
    private String signUsrNm;

    /**
     * 최종결재여부
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
     * 결재선 결재진행상태
     * 01 : 대기
     * 02 : 진행
     * 03 : 완료
     */
    @NotBlank
    private String signStatCd = "01";

    /**
     * 결재선 결재처리유형
     * 01 : 미결
     * 02 : 반려
     * 03 : 합의
     * 04 : 결재
     */
    @NotBlank
    private String signRsltCd = "01";

    /**
     * 결재 내용
     */
    @NotBlank
    private String signCont;

    /**
     * 결재일자
     */
    private Date signDt;

    /**
     * @return the signDocNo
     */
    public String getSignDocNo() {
        return signDocNo;
    }

    /**
     * @param signDocNo the signDocNo to set
     */
    public void setSignDocNo(String signDocNo) {
        this.signDocNo = signDocNo;
    }

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

    /**
     * @return the signStatCd
     */
    public String getSignStatCd() {
        return signStatCd;
    }

    /**
     * @param signStatCd the signStatCd to set
     */
    public void setSignStatCd(String signStatCd) {
        this.signStatCd = signStatCd;
    }

    /**
     * @return the signRsltCd
     */
    public String getSignRsltCd() {
        return signRsltCd;
    }

    /**
     * @param signRsltCd the signRsltCd to set
     */
    public void setSignRsltCd(String signRsltCd) {
        this.signRsltCd = signRsltCd;
    }

    /**
     * @return the signCont
     */
    public String getSignCont() {
        return signCont;
    }

    /**
     * @param signCont the signCont to set
     */
    public void setSignCont(String signCont) {
        this.signCont = signCont;
    }

    /**
     * @return the signDt
     */
    public Date getSignDt() {
        return signDt;
    }

    /**
     * @param signDt the signDt to set
     */
    public void setSignDt(Date signDt) {
        this.signDt = signDt;
    }
}