package chn.bhmc.dms.sal.orm.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

@ValidDescriptor({
    @ValidField(field="ordTp", mesgKey="global.lbl.orderType")

})
public class BtoCreateOrderSaveVO extends BaseSaveVO<BtoCreateOrderVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2885526332586726233L;


}
