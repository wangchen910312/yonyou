package chn.bhmc.dms.cmm.log.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * 查询所有接收接口日志信息 SaveVO
 * </pre>
 *
 * @ClassName   : ReceiveInterfaceLogSearchVO.java
 * @Description : 查询所有接收接口日志信息 SaveVO
 * @author chen shengan
 * @since 2021. 4. 28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2021. 4. 28.     chen shengan        查询所有接收接口日志信息
 * </pre>
 */
public class ReceiveInterfaceLogSearchVO extends SearchVO {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2995908065471209599L;
	
	private String interfaceCode;
	
	private String interfaceName;
	
	private String receiveTimeStart;
	
	private String receiveTimeEnd;
	
	private String receiveInterfaceLogId;
	
	private String sendInterfaceId;

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

	public String getReceiveTimeStart() {
		return receiveTimeStart;
	}

	public void setReceiveTimeStart(String receiveTimeStart) {
		this.receiveTimeStart = receiveTimeStart;
	}

	public String getReceiveTimeEnd() {
		return receiveTimeEnd;
	}

	public void setReceiveTimeEnd(String receiveTimeEnd) {
		this.receiveTimeEnd = receiveTimeEnd;
	}

	public String getReceiveInterfaceLogId() {
		return receiveInterfaceLogId;
	}

	public void setReceiveInterfaceLogId(String receiveInterfaceLogId) {
		this.receiveInterfaceLogId = receiveInterfaceLogId;
	}
	
}
