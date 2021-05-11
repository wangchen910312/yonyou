package chn.bhmc.dms.sal.ctl.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DeadlineCtrlMngSaveVO.java
 * @Description : 마감시간관리 저장용
 * @author Kim yewon
 * @since 2016. 4. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 29.     Kim yewon     최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="ctrlYyMmDt", mesgKey="sal.lbl.controllYyMm")
    ,@ValidField(field="ctrlGrpCd", mesgKey="sal.lbl.controllGroup")
    ,@ValidField(field="ctrlTargCd", mesgKey="sal.lbl.controllTarget")
    ,@ValidField(field="dlrCtrlRangeCd", mesgKey="sal.lbl.dealerCtrlRange")
    ,@ValidField(field="ctrlYn", mesgKey="sal.lbl.ctrlYn")
})
public class DeadlineCtrlMngSaveVO extends BaseSaveVO<DeadlineCtrlMngVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6766567829277392502L;

}
