package chn.bhmc.dms.sal.btc.vo;

import chn.bhmc.dms.core.datatype.BaseSearchVO;

public class VehicleSettlementOrderSearchVO extends BaseSearchVO {

	private static final long serialVersionUID = 7004150579309829417L;

    private String sUseYn;

	public String getsUseYn() {
		return sUseYn;
	}
	public void setsUseYn(String sUseYn) {
		this.sUseYn = sUseYn;
	}
}

