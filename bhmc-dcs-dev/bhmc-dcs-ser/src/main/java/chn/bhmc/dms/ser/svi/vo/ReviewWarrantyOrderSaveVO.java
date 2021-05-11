package chn.bhmc.dms.ser.svi.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : WarrantyOrderVO.java
 * @Description : 保修工单审核搜索VO
 * @author lixinfei
 * @since 2021. 4. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2021. 4. 1.    lixinfei     		保修工单审核搜索VO
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="id", mesgKey="")
    ,@ValidField(field="reqNo", mesgKey="")
    ,@ValidField(field="dlrCd", mesgKey="")
    ,@ValidField(field="approveStatCd", mesgKey="")
    ,@ValidField(field="approveDesc", mesgKey="")
    ,@ValidField(field="regUserId", mesgKey="")
    ,@ValidField(field="regDt", mesgKey="")
})
public class ReviewWarrantyOrderSaveVO extends BaseSaveVO<ReviewWarrantyOrderVO>{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -8906698084578280476L;
	
	

}
