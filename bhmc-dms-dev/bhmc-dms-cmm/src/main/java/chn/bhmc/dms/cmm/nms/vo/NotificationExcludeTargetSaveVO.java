package chn.bhmc.dms.cmm.nms.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : NotificationExcludeTargetSaveVO.java
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
    ,@ValidField(field="usrId", mesgKey="global.lbl.usrId")
})
public class NotificationExcludeTargetSaveVO extends BaseSaveVO<NotificationExcludeTargetVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4909760523090202678L;

}
