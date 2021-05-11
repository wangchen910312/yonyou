package chn.bhmc.dms.sal.fin.vo;

import java.io.Serializable;

/*
* 取消支付
* 2019-07-02
* */
public class CancelOrder implements Serializable {

	// 付款流水号 String(50) 非空 下单完成返回的订单号
	private String tradeId;

	// 渠道号 String(10) 非空 常量(服务平台分配的渠道编号)
	private String channel;

	// 签名 String(100) 非空 参数Md5加密生成的签名，见1.1.2
	private String sign;

	// 发生时间 Long 非空 取值：new Date().getTime() eg: 1432710115000
	private Long occurtime;

	private String dlrcd;

	public String getDlrcd() {
		return dlrcd;
	}

	public void setDlrcd(String dlrcd) {
		this.dlrcd = dlrcd;
	}

	public String getTradeId() {
		return tradeId;
	}

	public void setTradeId(String tradeId) {
		this.tradeId = tradeId;
	}

	public String getChannel() {
		return channel;
	}

	public void setChannel(String channel) {
		this.channel = channel;
	}

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	public Long getOccurtime() {
		return occurtime;
	}

	public void setOccurtime(Long occurtime) {
		this.occurtime = occurtime;
	}

	@Override
	public String toString() {
		return "CancelOrder{" + "tradeId='" + tradeId + '\'' + ", channel='" + channel + '\'' + ", sign='" + sign + '\''
				+ ", occurtime=" + occurtime + '}';
	}
}
