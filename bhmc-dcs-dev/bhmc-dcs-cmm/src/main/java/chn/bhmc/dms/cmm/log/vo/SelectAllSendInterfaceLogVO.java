package chn.bhmc.dms.cmm.log.vo;

import java.util.Date;

import chn.bhmc.dms.core.datatype.BaseVO;

public class SelectAllSendInterfaceLogVO extends BaseVO {

	/**
	 * 
	 */
	private static final long serialVersionUID = -959250180318915403L;
	
	private String sendInterfaceId;
	
	private String interfaceCode;
	
	private String interfaceName;
	
	private String requestMessage;
	
	private String resultMessage;
	
	private String resultStatus;
	
	private String resendCount;
	
	private Date returnResultTime;
	
	private Date sendTime;

	public String getSendInterfaceId() {
		return sendInterfaceId;
	}

	public void setSendInterfaceId(String sendInterfaceId) {
		this.sendInterfaceId = sendInterfaceId;
	}

	public String getInterfaceCode() {
		return interfaceCode;
	}

	public void setInterfaceCode(String interfaceCode) {
		this.interfaceCode = interfaceCode;
	}

	public String getInterfaceName() {
		return interfaceName;
	}

	public void setInterfaceName(String interfaceName) {
		this.interfaceName = interfaceName;
	}

	public String getRequestMessage() {
		return requestMessage;
	}

	public void setRequestMessage(String requestMessage) {
		this.requestMessage = requestMessage;
	}

	public String getResultMessage() {
		return resultMessage;
	}

	public void setResultMessage(String resultMessage) {
		this.resultMessage = resultMessage;
	}

	public String getResultStatus() {
		return resultStatus;
	}

	public void setResultStatus(String resultStatus) {
		this.resultStatus = resultStatus;
	}

	public String getResendCount() {
		return resendCount;
	}

	public void setResendCount(String resendCount) {
		this.resendCount = resendCount;
	}

	public Date getReturnResultTime() {
		return returnResultTime;
	}

	public void setReturnResultTime(Date returnResultTime) {
		this.returnResultTime = returnResultTime;
	}

	public Date getSendTime() {
		return sendTime;
	}

	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}
	
}
