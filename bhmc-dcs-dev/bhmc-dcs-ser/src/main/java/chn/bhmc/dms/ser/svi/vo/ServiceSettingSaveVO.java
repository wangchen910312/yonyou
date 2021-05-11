package chn.bhmc.dms.ser.svi.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SubBpMasterSaveVO.java
 * @Description :  서비스 설정 화면 수정/저장/삭제 VO
 * @author Yin Xueyuan
 * @since 2016. 7. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 7.     Yin Xueyuan     최초 생성
 * </pre>
 */

@ValidDescriptor({
     @ValidField(field="dlrCd", mesgKey="global.lbl.dlrCd")
    ,@ValidField(field="subBpCd", mesgKey="global.lbl.subBpCd")
    ,@ValidField(field="subBpNm", mesgKey="global.lbl.subBpNm")
})
public class ServiceSettingSaveVO extends BaseSaveVO<SubBpMasterVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -4252689341045131544L;

}
