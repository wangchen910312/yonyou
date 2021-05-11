/**
 * Copyright 2018-2020 yonyou.com.
 * All rights reserved.
 */
package chn.bhmc.dms.ser.cal.service.model;

import java.io.Serializable;
import java.util.Map;

/**
 * TODO
 * @Author:zhaoq
 * @version $id:ResponseData.java,v0.1  2019年1月25日 上午10:35:55 zhaoq Exp$
 */
public class ResponseData implements Serializable {

	/** serialVersionUID */
	private static final long serialVersionUID = 4831821207336225651L;

	/** code 响应代码 , 91200-请求成功，其它为不成功 */
	private Integer				code;

	/** message 响应消息，对应code的描述信息 */
	private String				message;

	/** content 返回内容对象 */
	private Object				data;
	
	public ResponseData() {

	}

	public ResponseData(Integer responseCode, String responseMessage) {

		this.code = responseCode;
		this.message = responseMessage;
	}

	public ResponseData(Integer responseCode, String responseMessage, Map<String, Object> data) {

		this(responseCode, responseMessage);
		this.data = data;
	}

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

	/**
	 * @return the data
	 */
	public Object getData() {
	
		return data;
	}
	
	/**
	 * @param data the data to set
	 */
	public void setData(Object data) {
	
		this.data = data;
	}

}
