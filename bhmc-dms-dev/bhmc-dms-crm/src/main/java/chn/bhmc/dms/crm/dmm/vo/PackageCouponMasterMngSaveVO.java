package chn.bhmc.dms.crm.dmm.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PackageCouponMasterMngVO.java
 * @Description : 패키지쿠폰 Master 관리 VO
 * @author Kim Hyun Ho
 * @since 2016. 6. 8.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 8.     Kim Hyun Ho     최초 생성
 * </pre>
 */

    @ValidDescriptor({
        @ValidField(field="dlrCd"     , mesgKey="crm.lbl.dlrCd")
        ,@ValidField(field="pkgSeq"    , mesgKey="crm.lbl.pkgSeq")
        ,@ValidField(field="pkgNm"     , mesgKey="crm.lbl.pkgNm")
        ,@ValidField(field="pkgAmt"    , mesgKey="crm.lbl.pkgAmt")
        ,@ValidField(field="useYn"   , mesgKey="global.lbl.useYn")
        ,@ValidField(field="startDt"   , mesgKey="crm.lbl.startDt")
        ,@ValidField(field="endDt"   , mesgKey="crm.lbl.endDt")
    })
public class PackageCouponMasterMngSaveVO extends BaseSaveVO<PackageCouponMasterMngVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 3837443219774668186L;


}
