package chn.bhmc.dms.cmm.apr.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SecuredResourceSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
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
    @ValidField(field="aprDocId", mesgKey="cmm.lbl.aprDocId")
    ,@ValidField(field="aprDocNm", mesgKey="cmm.lbl.aprDocNm")
    ,@ValidField(field="useYn", mesgKey="cmm.lbl.useYn")
})
public class SignSaveVO extends BaseSaveVO<SignVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6766567829277392502L;



}
