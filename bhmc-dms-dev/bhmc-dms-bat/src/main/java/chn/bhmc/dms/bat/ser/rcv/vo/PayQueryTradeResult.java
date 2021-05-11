package chn.bhmc.dms.bat.ser.rcv.vo;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/*
* 支付状态查询
* 2019-07-02
* */
public class PayQueryTradeResult implements Serializable {

	private String dlrcd;

	public String getDlrcd() {
		return dlrcd;
	}

	public void setDlrcd(String dlrcd) {
		this.dlrcd = dlrcd;
	}

	List<PayQueryTrade> tradeIds;

	public List<PayQueryTrade> getTradeIds() {
		return tradeIds;
	}

	public void setTradeIds(List<PayQueryTrade> tradeIds) {
		this.tradeIds = tradeIds;
	}

	@Override
	public String toString() {
		return "QueryTradeResult{" + "tradeIds=" + tradeIds + '}';
	}
}
