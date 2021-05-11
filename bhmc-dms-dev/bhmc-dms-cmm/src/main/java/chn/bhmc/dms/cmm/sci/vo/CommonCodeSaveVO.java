package chn.bhmc.dms.cmm.sci.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CommonCodeSaveVO.java
 * @Description : 공통코드 저장용
 * @author Kang Seok Han
 * @since 2016. 1. 28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 28.     Kang Seok Han     최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="cmmCd", mesgKey="global.lbl.cmmCd")
    ,@ValidField(field="cmmGrpCd", mesgKey="global.lbl.cmmGrpCd")
    ,@ValidField(field="cmmCdNm", mesgKey="global.lbl.cmmCdNm")
    ,@ValidField(field="useYn", mesgKey="global.lbl.useYn")
    ,@ValidField(field="sortOrder", mesgKey="global.lbl.sortOrder")
})
public class CommonCodeSaveVO extends BaseSaveVO<CommonCodeVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6766567829277392502L;

}
