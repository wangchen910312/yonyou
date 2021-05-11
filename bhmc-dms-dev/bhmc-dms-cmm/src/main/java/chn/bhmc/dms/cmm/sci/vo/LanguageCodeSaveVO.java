package chn.bhmc.dms.cmm.sci.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LanguageCodeSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 2. 4.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 4.     Kang Seok Han     최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="langCd", mesgKey="global.lbl.langCd")
    ,@ValidField(field="langNm", mesgKey="global.lbl.langNm")
    ,@ValidField(field="enabledYn", mesgKey="global.lbl.enabledYn")
})
public class LanguageCodeSaveVO extends BaseSaveVO<LanguageCodeVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -4581744272763396477L;

}
