/**
 * Copyright 2018-2020 yonyou.com.
 * All rights reserved.
 */
package chn.bhmc.dms.bat.ser.rcv.vo;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * TODO
 * @Author:wushibin
 * @version
 */
public class PayResponseDataForPayQuery implements Serializable {


	/**
	 * 
	 */
	private static final long serialVersionUID = 2608052357722665971L;

	/** code 响应代码 , 91200-请求成功，其它为不成功 */
	private Integer				code;

	/** message 响应消息，对应code的描述信息 */
	private String				message;

	/** content 返回内容对象 */
	private List<PayData>				data;
	
	public PayResponseDataForPayQuery() {

	}

	public PayResponseDataForPayQuery(Integer responseCode, String responseMessage) {

		this.code = responseCode;
		this.message = responseMessage;
	}

	/*public ResponseDataForPayQuery(Integer responseCode, String responseMessage, Map<String, Object> data) {

		this(responseCode, responseMessage);
		this.data = data;
	}*/

	/**
	 * @return the code
	 */
	public Integer getCode() {

		return code;
	}

	/**
	 * @param code the code to set
	 */
	public void setCode(Integer code) {

		this.code = code;
	}

	/**
	 * @return the message
	 */
	public String getMessage() {

		return message;
	}

	/**
	 * @param message the message to set
	 */
	public void setMessage(String message) {

		this.message = message;
	}

	public List<PayData> getData() {
		return data;
	}

	public void setData(List<PayData> data) {
		this.data = data;
	}

	
}
