package chn.bhmc.dms.cmm.tmp.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * 메세지 템플릿 그룹 SaveVO
 * </pre>
 *
 * @ClassName   : MessageTemplateGroupSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 6. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 22.     Kang Seok Han     최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="mesgTmplGrpId", mesgKey="global.lbl.mesgTmplGrpId")
    ,@ValidField(field="mesgTmplGrpNm", mesgKey="global.lbl.mesgTmplGrpNm")
    ,@ValidField(field="useYn", mesgKey="global.lbl.useYn")
})
public class MessageTemplateGroupSaveVO extends BaseSaveVO<MessageTemplateGroupVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 3633605576081072682L;

}
