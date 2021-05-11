package chn.bhmc.dms.cmm.log.vo;

import java.util.Date;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * 接收接口日志信息 VO
 * </pre>
 *
 * @ClassName   : SelectAllReceiveInterfaceLogVO.java
 * @Description : 接收接口日志信息 VO
 * @author chen shengan
 * @since 2021. 4. 28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2021. 4. 28.     chen shengan        接收接口日志信息
 * </pre>
 */
public class SelectAllReceiveInterfaceLogVO extends BaseVO {

	/**
	 * 
	 */
	private static final long serialVersionUID = -959250180318915403L;
	
	private String receiveInterfaceLogId;
	
	private String interfaceCode;
	
	private String interfaceName;
	
	private String receiveMessage;
	
	private String resultMessage;
	
	private String resultStatus;
	
	private Date receiveTime;

	public String getReceiveInterfaceLogId() {
		return receiveInterfaceLogId;
	}

	public void setReceiveInterfaceLogId(String receiveInterfaceLogId) {
		this.receiveInterfaceLogId = receiveInterfaceLogId;
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

	public String getReceiveMessage() {
		return receiveMessage;
	}

	public void setReceiveMessage(String receiveMessage) {
		this.receiveMessage = receiveMessage;
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

	public Date getReceiveTime() {
		return receiveTime;
	}

	public void setReceiveTime(Date receiveTime) {
		this.receiveTime = receiveTime;
	}

	public SelectAllReceiveInterfaceLogVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SelectAllReceiveInterfaceLogVO(String receiveInterfaceLogId, String interfaceCode, String interfaceName,
			String receiveMessage, String resultMessage, String resultStatus, Date receiveTime) {
		super();
		this.receiveInterfaceLogId = receiveInterfaceLogId;
		this.interfaceCode = interfaceCode;
		this.interfaceName = interfaceName;
		this.receiveMessage = receiveMessage;
		this.resultMessage = resultMessage;
		this.resultStatus = resultStatus;
		this.receiveTime = receiveTime;
	}
	
	

}
