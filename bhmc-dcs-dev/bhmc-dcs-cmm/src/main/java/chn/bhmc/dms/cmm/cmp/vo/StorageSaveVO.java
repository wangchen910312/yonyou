package chn.bhmc.dms.cmm.cmp.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : StorageSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 2. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 29.     Kang Seok Han     최초 생성
 * </pre>
 */

@ValidDescriptor({
    @ValidField(field="dlrCd", mesgKey="global.lbl.dlrCd")
    ,@ValidField(field="pltCd", mesgKey="global.lbl.pltCd")
    ,@ValidField(field="strgeCd", mesgKey="global.lbl.strgeCd")
    ,@ValidField(field="netingUseYn", mesgKey="global.lbl.netingUseYn")
    ,@ValidField(field="locMngYn", mesgKey="global.lbl.locMngYn")
    ,@ValidField(field="strgeTp", mesgKey="global.lbl.strgeTp")
})
public class StorageSaveVO extends BaseSaveVO<StorageVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4235652251402874848L;

}
