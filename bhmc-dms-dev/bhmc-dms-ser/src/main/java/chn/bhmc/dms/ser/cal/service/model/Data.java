package chn.bhmc.dms.ser.cal.service.model;

import java.io.Serializable;
import java.util.List;

public class Data implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3853687583830940695L;

	// 订单
	private String tradeId;

	// 返回代码 S:下单成功E:查询失败
	private String gateReturnType;

	// 返回消息描述
	private String gateReturnMessage;

	// 二维码URL
	private String gotoUrl;

	// 订单状态
	private String orderStatus;

	// 订单金额
	private String orderAmount;

	// 实收金额
	private String payAmount;

	// 优惠券信息
	private List<CouponList> couponList;
	
	public String getOrderAmount() {
		return orderAmount;
	}

	public void setOrderAmount(String orderAmount) {
		this.orderAmount = orderAmount;
	}

	public String getPayAmount() {
		return payAmount;
	}

	public void setPayAmount(String payAmount) {
		this.payAmount = payAmount;
	}

	public List<CouponList> getCouponList() {
		return couponList;
	}

	public void setCouponList(List<CouponList> couponList) {
		this.couponList = couponList;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getTradeId() {
		return tradeId;
	}

	public void setTradeId(String tradeId) {
		this.tradeId = tradeId;
	}

	public String getGateReturnType() {
		return gateReturnType;
	}

	public void setGateReturnType(String gateReturnType) {
		this.gateReturnType = gateReturnType;
	}

	public String getGateReturnMessage() {
		return gateReturnMessage;
	}

	public void setGateReturnMessage(String gateReturnMessage) {
		this.gateReturnMessage = gateReturnMessage;
	}

	public String getGotoUrl() {
		return gotoUrl;
	}

	public void setGotoUrl(String gotoUrl) {
		this.gotoUrl = gotoUrl;
	}

}
