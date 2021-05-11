package chn.bhmc.dms.sal.ond.vo;

import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CallCarMasterSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Choi Kyung Yong
 * @since 2017. 3. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 3. 7.     Choi Kyung Yong     최초 생성
 * </pre>
 */

@ValidDescriptor({
    @ValidField(field="dlrCd", mesgKey="global.lbl.dlrCd")
    ,@ValidField(field="carlineCd", mesgKey="global.lbl.carlineCd")
    ,@ValidField(field="modelCd", mesgKey="global.lbl.modelCd")
    ,@ValidField(field="ocnCd", mesgKey="global.lbl.ocnCode")
    ,@ValidField(field="extColorCd", mesgKey="global.lbl.extColorCd")
    ,@ValidField(field="intColorCd", mesgKey="global.lbl.intColorCd")
    ,@ValidField(field="useYn", mesgKey="global.lbl.useYn")
})
public class CallCarMasterSaveVO extends BaseSaveVO<CallCarMasterVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -476886714434982564L;

}
