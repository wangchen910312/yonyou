package chn.bhmc.dms.mob.api.main.vo;

import java.util.Date;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : NotificationMessageVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 5. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 11.     Kang Seok Han     최초 생성
 * </pre>
 */

public class MainNotificationMessageVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2544080991439072433L;
    
    /**
     * 딜러코드
     */
    private String dlrCd;
    
    /**
     * 메세지ID
     */
    private String mesgId;
    
    /**
     * 메세지내용
     */
    private String mesgCont;
    
    /**
     * 메세지유형
     */
    private String mesgTp;
    
    /**
     * 메세지생성일자
     */
    private Date mesgCreDt;
    
    /**
     * 수신자ID
     */
    private String receiveUsrId;
    
    /**
     * 수신자 핸드폰 번호
     */
    private String receiveUsrHpNo;
    
    /**
     * 전송여부
     */
    private String sendYn;
    
    /**
     * 전송일자
     */
    private Date sendDt;
    
    /**
     * 수신여부
     */
    private String receiveYn;
    
    /**
     * 수신일자
     */
    private Date receiveDt;
    
    /**
     * 알림정책그룹ID
     */
    private String alrtPolicyGrpId;
    
    /**
     * 알림정책ID
     */
    private String alrtPolicyId;
    
    /**
     * 웹화면
     */
    private String actionUrlWeb;
    
    /**
     * 모바일화면
     */
    private String actionUrlMob;
    
    /**
     * 화면url 파라메터
     */
    private String actionParams;

    public MainNotificationMessageVO(){

    }

    public MainNotificationMessageVO(String dlrCd, String mesgId, String mesgCont, String mesgTp, String receiveUsrId, String receiveUsrHpNo){
        this(dlrCd, mesgId, mesgCont, mesgTp, receiveUsrId, receiveUsrHpNo, null, null, null);
    }

    public MainNotificationMessageVO(String dlrCd, String mesgId, String mesgCont, String mesgTp, String receiveUsrId, String receiveUsrHpNo, String actionUrlWeb, String actionUrlMob, String actionParams){
        this(dlrCd, mesgId, mesgCont, mesgTp, receiveUsrId, receiveUsrHpNo,  null, null, null, null, null);
    }

    public MainNotificationMessageVO(String dlrCd, String mesgId, String mesgCont, String mesgTp, String receiveUsrId, String receiveUsrHpNo, String actionUrlWeb, String actionUrlMob, String actionParams, String alrtPolicyGrpId, String alrtPolicyId){
        this.dlrCd = dlrCd;
        this.mesgId = mesgId;
        this.mesgCont = mesgCont;
        this.mesgTp = mesgTp;
        this.receiveUsrId = receiveUsrId;
        this.receiveUsrHpNo = receiveUsrHpNo;
        this.actionUrlWeb = actionUrlWeb;
        this.actionUrlMob = actionUrlMob;
        this.actionParams = actionParams;
        this.alrtPolicyGrpId = alrtPolicyGrpId;
        this.alrtPolicyId = alrtPolicyId;
    }

	public String getDlrCd() {
		return dlrCd;
	}

	public void setDlrCd(String dlrCd) {
		this.dlrCd = dlrCd;
	}

	public String getMesgId() {
		return mesgId;
	}

	public void setMesgId(String mesgId) {
		this.mesgId = mesgId;
	}

	public String getMesgCont() {
		return mesgCont;
	}

	public void setMesgCont(String mesgCont) {
		this.mesgCont = mesgCont;
	}

	public String getMesgTp() {
		return mesgTp;
	}

	public void setMesgTp(String mesgTp) {
		this.mesgTp = mesgTp;
	}

	public Date getMesgCreDt() {
		return mesgCreDt;
	}

	public void setMesgCreDt(Date mesgCreDt) {
		this.mesgCreDt = mesgCreDt;
	}

	public String getReceiveUsrId() {
		return receiveUsrId;
	}

	public void setReceiveUsrId(String receiveUsrId) {
		this.receiveUsrId = receiveUsrId;
	}

	public String getReceiveUsrHpNo() {
		return receiveUsrHpNo;
	}

	public void setReceiveUsrHpNo(String receiveUsrHpNo) {
		this.receiveUsrHpNo = receiveUsrHpNo;
	}

	public String getSendYn() {
		return sendYn;
	}

	public void setSendYn(String sendYn) {
		this.sendYn = sendYn;
	}

	public Date getSendDt() {
		return sendDt;
	}

	public void setSendDt(Date sendDt) {
		this.sendDt = sendDt;
	}

	public String getReceiveYn() {
		return receiveYn;
	}

	public void setReceiveYn(String receiveYn) {
		this.receiveYn = receiveYn;
	}

	public Date getReceiveDt() {
		return receiveDt;
	}

	public void setReceiveDt(Date receiveDt) {
		this.receiveDt = receiveDt;
	}

	public String getAlrtPolicyGrpId() {
		return alrtPolicyGrpId;
	}

	public void setAlrtPolicyGrpId(String alrtPolicyGrpId) {
		this.alrtPolicyGrpId = alrtPolicyGrpId;
	}

	public String getAlrtPolicyId() {
		return alrtPolicyId;
	}

	public void setAlrtPolicyId(String alrtPolicyId) {
		this.alrtPolicyId = alrtPolicyId;
	}

	public String getActionUrlWeb() {
		return actionUrlWeb;
	}

	public void setActionUrlWeb(String actionUrlWeb) {
		this.actionUrlWeb = actionUrlWeb;
	}

	public String getActionUrlMob() {
		return actionUrlMob;
	}

	public void setActionUrlMob(String actionUrlMob) {
		this.actionUrlMob = actionUrlMob;
	}

	public String getActionParams() {
		return actionParams;
	}

	public void setActionParams(String actionParams) {
		this.actionParams = actionParams;
	}
}
