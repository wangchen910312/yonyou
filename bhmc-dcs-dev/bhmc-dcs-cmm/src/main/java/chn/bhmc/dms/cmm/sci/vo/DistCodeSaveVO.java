package chn.bhmc.dms.cmm.sci.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DistCodeSaveVO.java
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
    @ValidField(field="distCd", mesgKey="global.lbl.distCd")
    ,@ValidField(field="distNm", mesgKey="global.lbl.distNm")
    ,@ValidField(field="useYn", mesgKey="global.lbl.useYn")
    ,@ValidField(field="saleDistYn", mesgKey="global.lbl.saleDistYn")
    ,@ValidField(field="serDistYn", mesgKey="global.lbl.serDistYn")
    ,@ValidField(field="gobDistYn", mesgKey="global.lbl.gobDistYn")
})
public class DistCodeSaveVO extends BaseSaveVO<DistCodeVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5924116440471542932L;

}
