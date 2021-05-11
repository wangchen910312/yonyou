package chn.bhmc.dms.cmm.nms.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : NotificationTargetSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 5. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 25.     Kang Seok Han     최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="alrtPolicyGrpId", mesgKey="global.lbl.alrtPolicyGrpId")
    ,@ValidField(field="alrtPolicyId", mesgKey="global.lbl.alrtPolicyId")
    ,@ValidField(field="refTp", mesgKey="global.lbl.refTp")
    ,@ValidField(field="refId", mesgKey="global.lbl.refId")
})
public class NotificationTargetSaveVO extends BaseSaveVO<NotificationTargetVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 9220981365392962764L;

}
