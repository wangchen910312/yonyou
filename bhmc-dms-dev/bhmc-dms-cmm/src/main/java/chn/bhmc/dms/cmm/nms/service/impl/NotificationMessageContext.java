package chn.bhmc.dms.cmm.nms.service.impl;

import org.apache.velocity.VelocityContext;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : NotificationMessageCreator.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 9. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 10.     Kang Seok Han     최초 생성
 * </pre>
 */

public class NotificationMessageContext {
	
	/**
	 * 화면링크 파라메터
	 */
    private String actionParams;
    private String resvDt;
    private String appSeq;
    private String custNo;
    private VelocityContext velocityContext = new VelocityContext();
    
	public String getActionParams() {
		return actionParams;
	}
	public void setActionParams(String actionParams) {
		this.actionParams = actionParams;
	}
	public String getResvDt() {
		return resvDt;
	}
	public void setResvDt(String resvDt) {
		this.resvDt = resvDt;
	}
	public String getAppSeq() {
		return appSeq;
	}
	public void setAppSeq(String appSeq) {
		this.appSeq = appSeq;
	}
	public String getCustNo() {
		return custNo;
	}
	public void setCustNo(String custNo) {
		this.custNo = custNo;
	}
	public VelocityContext getVelocityContext() {
		return velocityContext;
	}
	public void setVelocityContext(VelocityContext velocityContext) {
		this.velocityContext = velocityContext;
	}
}
