package chn.bhmc.dms.cmm.cmp.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * 사업부정보 일괄등록 VO
 * </pre>
 *
 * @ClassName   : DivisionSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 2. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 29.     Kang Seok Han     최초 생성
 * </pre>
 */

@ValidDescriptor({
    @ValidField(field="diviCd", mesgKey="global.lbl.diviCd")
    ,@ValidField(field="diviNm", mesgKey="global.lbl.diviNm")
})
public class DivisionSaveVO extends BaseSaveVO<DivisionVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1534014298149605025L;

}
