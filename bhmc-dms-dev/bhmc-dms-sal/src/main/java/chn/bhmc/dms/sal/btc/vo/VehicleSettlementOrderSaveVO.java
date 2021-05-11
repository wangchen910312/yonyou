package chn.bhmc.dms.sal.btc.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

@ValidDescriptor({
    @ValidField(field="calcAtcDstinCd", mesgKey="global.lbl.calcGb")
    ,@ValidField(field="taxAtcDstinCd", mesgKey="global.lbl.taxGb")
    ,@ValidField(field="calcId", mesgKey="KEY")
    ,@ValidField(field="calcAtcNm", mesgKey="global.lbl.item")
    ,@ValidField(field="fmulaCont", mesgKey="global.lbl.calculation")
    ,@ValidField(field="calcOrder", mesgKey="global.lbl.calcOrder")
    ,@ValidField(field="displayOrder", mesgKey="global.lbl.displayOrder")
    ,@ValidField(field="sboIfYn", mesgKey="sal.lbl.sboInterLock")
    ,@ValidField(field="dprecvYn", mesgKey="global.lbl.dprecvYn")
    ,@ValidField(field="displayYn", mesgKey="global.lbl.displayYn")
    ,@ValidField(field="useYn", mesgKey="global.lbl.useYn")
})
public class VehicleSettlementOrderSaveVO extends BaseSaveVO<VehicleSettlementOrderVO> {

	/**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2864274377715677856L;

}
