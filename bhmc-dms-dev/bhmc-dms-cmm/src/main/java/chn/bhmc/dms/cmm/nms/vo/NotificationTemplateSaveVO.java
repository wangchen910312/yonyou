package chn.bhmc.dms.cmm.nms.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : NotificationTemplateSaveVO.java
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
    ,@ValidField(field="mesgTmplTp", mesgKey="global.lbl.mesgTmplTp")
    ,@ValidField(field="mesgTmplId", mesgKey="global.lbl.mesgTmplId")
})
public class NotificationTemplateSaveVO extends BaseSaveVO<NotificationTemplateVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 3656156980543608408L;


}
