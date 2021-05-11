package chn.bhmc.dms.cmm.bbs.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * 이슈정보정보 조회 SearchVO
 * </pre>
 *
 * @ClassName   : IssueBoardSearchVO.java
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

public class IssueBoardSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 5143802370527758322L;

    /**
     * 이슈번호
     */
    private int sIssueNo;

    /**
     * Issue 게시판 구분
     * '01':Issue 관리
     * '02':변경요청사항관리
     */
    private String sIssueBoardTp;

    /**
     * 이슈유형
     */
    private String sIssueTp;

    /**
     * 이슈영역
     * 'CRM'
     * 'SER'
     * 'SAL'
     * 'PAR'
     * 'COM'
     * 'ETC'
     */
    private String sIssueArea;

    /**
     * 이슈영역
     * 'CRM'
     * 'SER'
     * 'SAL'
     * 'PAR'
     * 'COM'
     * 'ETC'
     */
    private String sIssueStatCd;

    /**
     * 이슈일자 조회시작일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStartIssueStatUpdtDt;

    /**
     * 이슈일자 조회종료일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndIssueStatUpdtDt;


    /**
     * 이슈등록자명
     */
    private String sIssueReqUsrNm;

    /**
     * 이슈수신자명
     */
    private String sIssueRevUsrNm;

    /**
     * 이슈처리자명
     */
    private String sIssueHdlUsrNm;

    /**
     * 이슈일자 조회시작일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStartIssueDt;

    /**
     * 이슈일자 조회종료일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndIssueDt;

    /**
     * 이슈처리기한 조회시작일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStartIssueDueDt;

    /**
     * 이슈처리기한 조회종료일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndIssueDueDt;

    /**
     * 이슈처리일자 조회시작일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStartIssueCloseDt;

    /**
     * 이슈처리일자 조회종료일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndIssueCloseDt;

    /**
     * 이슈제목
     */
    private String sIssueTitle;

    /**
     * 변경수용여부
     */
    private String sAcceptYn;

    /**
     * 현업확인일자 조회시작일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStartIssueConfirmDt;

    /**
     * 현업확인일자 조회종료일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndIssueConfirmDt;

    /**
     * 확인자명
     */
    private String sIssueConfirmHdlUsrNm;

    /**
     * 심각도
     */
    private String sSeverity;

    /**
     * 우선순위
     */
    private int sPriority;

    /**
     * @return the sIssueNo
     */
    public int getsIssueNo() {
        return sIssueNo;
    }

    /**
     * @param sIssueNo the sIssueNo to set
     */
    public void setsIssueNo(int sIssueNo) {
        this.sIssueNo = sIssueNo;
    }

    /**
     * @return the sIssueBoardTp
     */
    public String getsIssueBoardTp() {
        return sIssueBoardTp;
    }

    /**
     * @param sIssueBoardTp the sIssueBoardTp to set
     */
    public void setsIssueBoardTp(String sIssueBoardTp) {
        this.sIssueBoardTp = sIssueBoardTp;
    }

    /**
     * @return the sIssueTp
     */
    public String getsIssueTp() {
        return sIssueTp;
    }

    /**
     * @param sIssueTp the sIssueTp to set
     */
    public void setsIssueTp(String sIssueTp) {
        this.sIssueTp = sIssueTp;
    }

    /**
     * @return the sIssueArea
     */
    public String getsIssueArea() {
        return sIssueArea;
    }

    /**
     * @param sIssueArea the sIssueArea to set
     */
    public void setsIssueArea(String sIssueArea) {
        this.sIssueArea = sIssueArea;
    }

    /**
     * @return the sIssueStatCd
     */
    public String getsIssueStatCd() {
        return sIssueStatCd;
    }

    /**
     * @param sIssueStatCd the sIssueStatCd to set
     */
    public void setsIssueStatCd(String sIssueStatCd) {
        this.sIssueStatCd = sIssueStatCd;
    }

    /**
     * @return the sStartIssueStatUpdtDt
     */
    public Date getsStartIssueStatUpdtDt() {
        return sStartIssueStatUpdtDt;
    }

    /**
     * @param sStartIssueStatUpdtDt the sStartIssueStatUpdtDt to set
     */
    public void setsStartIssueStatUpdtDt(Date sStartIssueStatUpdtDt) {
        this.sStartIssueStatUpdtDt = sStartIssueStatUpdtDt;
    }

    /**
     * @return the sEndIssueStatUpdtDt
     */
    public Date getsEndIssueStatUpdtDt() {
        return sEndIssueStatUpdtDt;
    }

    /**
     * @param sEndIssueStatUpdtDt the sEndIssueStatUpdtDt to set
     */
    public void setsEndIssueStatUpdtDt(Date sEndIssueStatUpdtDt) {
        this.sEndIssueStatUpdtDt = sEndIssueStatUpdtDt;
    }

    /**
     * @return the sIssueReqUsrNm
     */
    public String getsIssueReqUsrNm() {
        return sIssueReqUsrNm;
    }

    /**
     * @param sIssueReqUsrNm the sIssueReqUsrNm to set
     */
    public void setsIssueReqUsrNm(String sIssueReqUsrNm) {
        this.sIssueReqUsrNm = sIssueReqUsrNm;
    }

    /**
     * @return the sIssueRevUsrNm
     */
    public String getsIssueRevUsrNm() {
        return sIssueRevUsrNm;
    }

    /**
     * @param sIssueRevUsrNm the sIssueRevUsrNm to set
     */
    public void setsIssueRevUsrNm(String sIssueRevUsrNm) {
        this.sIssueRevUsrNm = sIssueRevUsrNm;
    }

    /**
     * @return the sIssueHdlUsrNm
     */
    public String getsIssueHdlUsrNm() {
        return sIssueHdlUsrNm;
    }

    /**
     * @param sIssueHdlUsrNm the sIssueHdlUsrNm to set
     */
    public void setsIssueHdlUsrNm(String sIssueHdlUsrNm) {
        this.sIssueHdlUsrNm = sIssueHdlUsrNm;
    }

    /**
     * @return the sStartIssueDt
     */
    public Date getsStartIssueDt() {
        return sStartIssueDt;
    }

    /**
     * @param sStartIssueDt the sStartIssueDt to set
     */
    public void setsStartIssueDt(Date sStartIssueDt) {
        this.sStartIssueDt = sStartIssueDt;
    }

    /**
     * @return the sEndIssueDt
     */
    public Date getsEndIssueDt() {
        return sEndIssueDt;
    }

    /**
     * @param sEndIssueDt the sEndIssueDt to set
     */
    public void setsEndIssueDt(Date sEndIssueDt) {
        this.sEndIssueDt = sEndIssueDt;
    }

    /**
     * @return the sStartIssueDueDt
     */
    public Date getsStartIssueDueDt() {
        return sStartIssueDueDt;
    }

    /**
     * @param sStartIssueDueDt the sStartIssueDueDt to set
     */
    public void setsStartIssueDueDt(Date sStartIssueDueDt) {
        this.sStartIssueDueDt = sStartIssueDueDt;
    }

    /**
     * @return the sEndIssueDueDt
     */
    public Date getsEndIssueDueDt() {
        return sEndIssueDueDt;
    }

    /**
     * @param sEndIssueDueDt the sEndIssueDueDt to set
     */
    public void setsEndIssueDueDt(Date sEndIssueDueDt) {
        this.sEndIssueDueDt = sEndIssueDueDt;
    }

    /**
     * @return the sStartIssueCloseDt
     */
    public Date getsStartIssueCloseDt() {
        return sStartIssueCloseDt;
    }

    /**
     * @param sStartIssueCloseDt the sStartIssueCloseDt to set
     */
    public void setsStartIssueCloseDt(Date sStartIssueCloseDt) {
        this.sStartIssueCloseDt = sStartIssueCloseDt;
    }

    /**
     * @return the sEndIssueCloseDt
     */
    public Date getsEndIssueCloseDt() {
        return sEndIssueCloseDt;
    }

    /**
     * @param sEndIssueCloseDt the sEndIssueCloseDt to set
     */
    public void setsEndIssueCloseDt(Date sEndIssueCloseDt) {
        this.sEndIssueCloseDt = sEndIssueCloseDt;
    }

    /**
     * @return the sIssueTitle
     */
    public String getsIssueTitle() {
        return sIssueTitle;
    }

    /**
     * @param sIssueTitle the sIssueTitle to set
     */
    public void setsIssueTitle(String sIssueTitle) {
        this.sIssueTitle = sIssueTitle;
    }

    /**
     * @return the sAcceptYn
     */
    public String getsAcceptYn() {
        return sAcceptYn;
    }

    /**
     * @param sAcceptYn the sAcceptYn to set
     */
    public void setsAcceptYn(String sAcceptYn) {
        this.sAcceptYn = sAcceptYn;
    }

    /**
     * @return the sStartIssueConfirmDt
     */
    public Date getsStartIssueConfirmDt() {
        return sStartIssueConfirmDt;
    }

    /**
     * @param sStartIssueConfirmDt the sStartIssueConfirmDt to set
     */
    public void setsStartIssueConfirmDt(Date sStartIssueConfirmDt) {
        this.sStartIssueConfirmDt = sStartIssueConfirmDt;
    }

    /**
     * @return the sEndIssueConfirmDt
     */
    public Date getsEndIssueConfirmDt() {
        return sEndIssueConfirmDt;
    }

    /**
     * @param sEndIssueConfirmDt the sEndIssueConfirmDt to set
     */
    public void setsEndIssueConfirmDt(Date sEndIssueConfirmDt) {
        this.sEndIssueConfirmDt = sEndIssueConfirmDt;
    }

    /**
     * @return the sIssueConfirmHdlUsrNm
     */
    public String getsIssueConfirmHdlUsrNm() {
        return sIssueConfirmHdlUsrNm;
    }

    /**
     * @param sIssueConfirmHdlUsrNm the sIssueConfirmHdlUsrNm to set
     */
    public void setsIssueConfirmHdlUsrNm(String sIssueConfirmHdlUsrNm) {
        this.sIssueConfirmHdlUsrNm = sIssueConfirmHdlUsrNm;
    }

    /**
     * @return the sSeverity
     */
    public String getsSeverity() {
        return sSeverity;
    }

    /**
     * @param sSeverity the sSeverity to set
     */
    public void setsSeverity(String sSeverity) {
        this.sSeverity = sSeverity;
    }

    /**
     * @return the sPriority
     */
    public int getsPriority() {
        return sPriority;
    }

    /**
     * @param sPriority the sPriority to set
     */
    public void setsPriority(int sPriority) {
        this.sPriority = sPriority;
    }

}
