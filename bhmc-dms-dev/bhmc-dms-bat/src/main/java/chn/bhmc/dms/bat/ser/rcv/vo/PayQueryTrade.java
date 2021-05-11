package chn.bhmc.dms.bat.ser.rcv.vo;


import java.io.Serializable;
import java.util.List;
import java.util.Map;

/*
* 支付状态查询
* 2019-07-02
* */
public class PayQueryTrade implements Serializable {

    private String tradeId;

    public String getTradeId() {
        return tradeId;
    }

    public void setTradeId(String tradeId) {
        this.tradeId = tradeId;
    }

    @Override
    public String toString() {
        return "QueryTrade{" +
                "tradeId='" + tradeId + '\'' +
                '}';
    }
}
