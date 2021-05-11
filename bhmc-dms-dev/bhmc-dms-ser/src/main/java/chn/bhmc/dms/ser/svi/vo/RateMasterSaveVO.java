package chn.bhmc.dms.ser.svi.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RateMasterSaveVO.java
 * @Description :  임률코드 화면 수정/저장/삭제 VO
 * @author Yin Xueyuan
 * @since 2016. 2. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 24.     Yin Xueyuan     최초 생성
 * </pre>
 */

@ValidDescriptor({
     @ValidField(field="dlrCd", mesgKey="global.lbl.dlrCd")
    ,@ValidField(field="rteCd", mesgKey="global.lbl.rateCd")
    ,@ValidField(field="roTp", mesgKey="ser.lbl.roTp")
})
public class RateMasterSaveVO extends BaseSaveVO<RateMasterVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2707248915291341204L;


}
