package chn.bhmc.dms.cmm.nms.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : NotificationPolicySaveVO.java
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
    ,@ValidField(field="alrtPolicyGrpNm", mesgKey="global.lbl.alrtPolicyGrpNm")
    ,@ValidField(field="alrtPolicyId", mesgKey="global.lbl.alrtPolicyId")
    ,@ValidField(field="alrtPolicyNm", mesgKey="global.lbl.alrtPolicyIdNm")
    ,@ValidField(field="validStartDt", mesgKey="global.lbl.validStartDt")
    ,@ValidField(field="validEndDt", mesgKey="global.lbl.validEndDt")
})
public class NotificationPolicySaveVO extends BaseSaveVO<NotificationPolicyVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 3074986582813592734L;


}
