package chn.bhmc.dms.cmm.bbs.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Issue 정보 VO
 * </pre>
 *
 * @ClassName   : IssueBoardVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 29.     Kang Seok Han     최초 생성
 * </pre>
 */

public class IssueBoardVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1359449296932294324L;

    /**
     * Issue 게시판 구분
     * '01':Issue 관리
     * '02':변경요청사항관리
     */
    private String issueBoardTp;

    /**
     * Issue 번호
     */
    private int issueNo;

    /**
     * Issue 유형
     */
    private String issueTp;

    /**
     * Issue영역
     * 'CRM'
     * 'SER'
     * 'SAL'
     * 'PAR'
     * 'COM'
     * 'ETC'
     */
    private String issueArea;

    /**
     * Issue제목
     */
    private String issueTitle;

    /**
     * Issue내용
     */
    private String issueCont;

    /**
     * Issue등록자명
     */
    private String issueReqUsrNm;

    /**
     * Issue수신자명
     */
    private String issueRevUsrNm;

    /**
     * Issue처리자명
     */
    private String issueHdlUsrNm;

    /**
     * Issue발생일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date issueDt;

    /**
     * Issue 처리기한
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date issueDueDt;

    /**
     * Issue 처리상태
     * '01':'대기'
     * '02':'진행'
     * '03':'완료'
     */
    private String issueStatCd;

    /**
     * Issue 처리상태 변경일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date issueStatUpdtDt;

    /**
     * Issue처리일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date issueCloseDt;

    /**
     * 비고
     */
    private String notes;

    /**
     * Issue 검토결과
     */
    private String issueReview;

    /**
     * 첨부문서번호
     */
    private String fileDocNo;

    /**
     * 변경수용여부
     */
    private String acceptYn;

    /**
     * 현업확인일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date issueConfirmDt;

    /**
     * 확인자명
     */
    private String issueConfirmHdlUsrNm;

    /**
     * @return the issueBoardTp
     */
    public String getIssueBoardTp() {
        return issueBoardTp;
    }

    /**
     * @param issueBoardTp the issueBoardTp to set
     */
    public void setIssueBoardTp(String issueBoardTp) {
        this.issueBoardTp = issueBoardTp;
    }

    /**
     * @return the issueNo
     */
    public int getIssueNo() {
        return issueNo;
    }

    /**
     * @param issueNo the issueNo to set
     */
    public void setIssueNo(int issueNo) {
        this.issueNo = issueNo;
    }

    /**
     * @return the issueTp
     */
    public String getIssueTp() {
        return issueTp;
    }

    /**
     * @param issueTp the issueTp to set
     */
    public void setIssueTp(String issueTp) {
        this.issueTp = issueTp;
    }

    /**
     * @return the issueArea
     */
    public String getIssueArea() {
        return issueArea;
    }

    /**
     * @param issueArea the issueArea to set
     */
    public void setIssueArea(String issueArea) {
        this.issueArea = issueArea;
    }

    /**
     * @return the issueTitle
     */
    public String getIssueTitle() {
        return issueTitle;
    }

    /**
     * @param issueTitle the issueTitle to set
     */
    public void setIssueTitle(String issueTitle) {
        this.issueTitle = issueTitle;
    }

    /**
     * @return the issueCont
     */
    public String getIssueCont() {
        return issueCont;
    }

    /**
     * @param issueCont the issueCont to set
     */
    public void setIssueCont(String issueCont) {
        this.issueCont = issueCont;
    }

    /**
     * @return the issueReqUsrNm
     */
    public String getIssueReqUsrNm() {
        return issueReqUsrNm;
    }

    /**
     * @param issueReqUsrNm the issueReqUsrNm to set
     */
    public void setIssueReqUsrNm(String issueReqUsrNm) {
        this.issueReqUsrNm = issueReqUsrNm;
    }

    /**
     * @return the issueRevUsrNm
     */
    public String getIssueRevUsrNm() {
        return issueRevUsrNm;
    }

    /**
     * @param issueRevUsrNm the issueRevUsrNm to set
     */
    public void setIssueRevUsrNm(String issueRevUsrNm) {
        this.issueRevUsrNm = issueRevUsrNm;
    }

    /**
     * @return the issueHdlUsrNm
     */
    public String getIssueHdlUsrNm() {
        return issueHdlUsrNm;
    }

    /**
     * @param issueHdlUsrNm the issueHdlUsrNm to set
     */
    public void setIssueHdlUsrNm(String issueHdlUsrNm) {
        this.issueHdlUsrNm = issueHdlUsrNm;
    }

    /**
     * @return the issueDt
     */
    public Date getIssueDt() {
        return issueDt;
    }

    /**
     * @param issueDt the issueDt to set
     */
    public void setIssueDt(Date issueDt) {
        this.issueDt = issueDt;
    }

    /**
     * @return the issueDueDt
     */
    public Date getIssueDueDt() {
        return issueDueDt;
    }

    /**
     * @param issueDueDt the issueDueDt to set
     */
    public void setIssueDueDt(Date issueDueDt) {
        this.issueDueDt = issueDueDt;
    }

    /**
     * @return the issueStatCd
     */
    public String getIssueStatCd() {
        return issueStatCd;
    }

    /**
     * @param issueStatCd the issueStatCd to set
     */
    public void setIssueStatCd(String issueStatCd) {
        this.issueStatCd = issueStatCd;
    }

    /**
     * @return the issueStatUpdtDt
     */
    public Date getIssueStatUpdtDt() {
        return issueStatUpdtDt;
    }

    /**
     * @param issueStatUpdtDt the issueStatUpdtDt to set
     */
    public void setIssueStatUpdtDt(Date issueStatUpdtDt) {
        this.issueStatUpdtDt = issueStatUpdtDt;
    }

    /**
     * @return the issueCloseDt
     */
    public Date getIssueCloseDt() {
        return issueCloseDt;
    }

    /**
     * @param issueCloseDt the issueCloseDt to set
     */
    public void setIssueCloseDt(Date issueCloseDt) {
        this.issueCloseDt = issueCloseDt;
    }

    /**
     * @return the notes
     */
    public String getNotes() {
        return notes;
    }

    /**
     * @param notes the notes to set
     */
    public void setNotes(String notes) {
        this.notes = notes;
    }

    /**
     * @return the issueReview
     */
    public String getIssueReview() {
        return issueReview;
    }

    /**
     * @param issueReview the issueReview to set
     */
    public void setIssueReview(String issueReview) {
        this.issueReview = issueReview;
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
     * @return the acceptYn
     */
    public String getAcceptYn() {
        return acceptYn;
    }

    /**
     * @param acceptYn the acceptYn to set
     */
    public void setAcceptYn(String acceptYn) {
        this.acceptYn = acceptYn;
    }

    /**
     * @return the issueConfirmDt
     */
    public Date getIssueConfirmDt() {
        return issueConfirmDt;
    }

    /**
     * @param issueConfirmDt the issueConfirmDt to set
     */
    public void setIssueConfirmDt(Date issueConfirmDt) {
        this.issueConfirmDt = issueConfirmDt;
    }

    /**
     * @return the issueConfirmHdlUsrNm
     */
    public String getIssueConfirmHdlUsrNm() {
        return issueConfirmHdlUsrNm;
    }

    /**
     * @param issueConfirmHdlUsrNm the issueConfirmHdlUsrNm to set
     */
    public void setIssueConfirmHdlUsrNm(String issueConfirmHdlUsrNm) {
        this.issueConfirmHdlUsrNm = issueConfirmHdlUsrNm;
    }

}
