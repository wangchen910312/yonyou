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
    @ValidField(field="todoPolicyId", mesgKey="global.lbl.todoPolicyId")
    ,@ValidField(field="todoPolicyNm", mesgKey="global.lbl.todoPolicyNm")
    ,@ValidField(field="autoChkYn", mesgKey="global.lbl.autoChkYn")
    ,@ValidField(field="actionTargetTp", mesgKey="global.lbl.actionTargetTp")
    ,@ValidField(field="actionUrlWeb", mesgKey="global.lbl.actionUrlWeb")
    ,@ValidField(field="actionUrlMob", mesgKey="global.lbl.actionUrlMob")
})
public class TodoPolicySaveVO extends BaseSaveVO<TodoPolicyVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2412045442890696312L;


}
