package chn.bhmc.dms.cmm.cmp.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PlantSaveVO.java
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
    @ValidField(field="pltCd", mesgKey="global.lbl.pltCd")
    ,@ValidField(field="dlrCd", mesgKey="global.lbl.dlrCd")
    ,@ValidField(field="pltNm", mesgKey="global.lbl.pltNm")
    ,@ValidField(field="calendarId", mesgKey="global.lbl.calendarId")
    ,@ValidField(field="fstStartDt", mesgKey="global.lbl.fstStartDt")
    ,@ValidField(field="endDdlnDt", mesgKey="global.lbl.endDdlnDt")
})
public class PlantSaveVO extends BaseSaveVO<PlantVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4235652251402874848L;

}
