package chn.bhmc.dms.cmm.bbs.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BoardMasterSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 4. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 12.     Byoung Chul Jeon     최초 생성
 * </pre>
 */
@ValidDescriptor({
     @ValidField(field="bbsNm", mesgKey="<spring:message code='cmm.lbl.bbsNm' />")
    ,@ValidField(field="useYn", mesgKey="<spring:message code='global.lbl.useYn' />")
    ,@ValidField(field="cmntUseYn", mesgKey="<spring:message code='cmm.lbl.cmntUseYn' />")
    ,@ValidField(field="regUsrId", mesgKey="<spring:message code='global.lbl.wrtrNm' />")
    ,@ValidField(field="regDt", mesgKey="<spring:message code='global.lbl.wrtrDt' />")
})
public class BoardMasterSaveVO extends BaseSaveVO<BoardMasterVO> {
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6199157957066387470L;
}