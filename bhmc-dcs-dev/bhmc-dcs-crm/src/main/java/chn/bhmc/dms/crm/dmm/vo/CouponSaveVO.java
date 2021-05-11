package chn.bhmc.dms.crm.dmm.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CouponSaveVO.java
 * @Description : 쿠폰 등록/수정/삭제 VO
 * @author Kim Hyun Ho
 * @since 2016. 6. 9.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 9.     Kim Hyun Ho     최초 생성
 * </pre>
 */

@ValidDescriptor({
    @ValidField(field="pkgSeq"    , mesgKey="crm.lbl.pkgSeq")
    ,@ValidField(field="cupnNm"    , mesgKey="crm.lbl.cupnNm")
    ,@ValidField(field="cupnCont"  , mesgKey="crm.lbl.cupnCont")
})
public class CouponSaveVO  extends BaseSaveVO<CouponVO>{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4368778415998527653L;

}
