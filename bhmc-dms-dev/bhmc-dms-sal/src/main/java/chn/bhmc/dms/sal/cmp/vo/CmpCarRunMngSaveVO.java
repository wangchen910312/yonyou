package chn.bhmc.dms.sal.cmp.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CmpCarRunMngVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author kim yewon
 * @since 2016. 4. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 19.       Kim yewon             최초 생성
 *
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="cpnCarTp", mesgKey="global.lbl.cmpCarDstinCd")
    ,@ValidField(field="vinNo", mesgKey="global.lbl.vinNo")
    ,@ValidField(field="startDt", mesgKey="sal.lbl.orgStartDt")
    ,@ValidField(field="endDt", mesgKey="global.lbl.fincEndDt")
})
public class CmpCarRunMngSaveVO extends BaseSaveVO<CmpCarRunMngVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1296703255697589196L;

}