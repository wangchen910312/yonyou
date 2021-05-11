package chn.bhmc.dms.sal.fin.vo;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/*
* 支付状态查询
* 2019-07-02
* */
public class QueryTradeResult implements Serializable {

	private String dlrcd;

	public String getDlrcd() {
		return dlrcd;
	}

	public void setDlrcd(String dlrcd) {
		this.dlrcd = dlrcd;
	}

	List<QueryTrade> tradeIds;

	public List<QueryTrade> getTradeIds() {
		return tradeIds;
	}

	public void setTradeIds(List<QueryTrade> tradeIds) {
		this.tradeIds = tradeIds;
	}

	@Override
	public String toString() {
		return "QueryTradeResult{" + "tradeIds=" + tradeIds + '}';
	}
}
