package chn.bhmc.dms.ser.svi.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CcdCodeManageSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Ki Hyun Kwon
 * @since 2016. 1. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 29.     Ki Hyun Kwon     최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="delYn", mesgKey="global.lbl.useYn")
})
public class CcdCodeManageSaveVO extends BaseSaveVO<CcdCodeManageVO>{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2203332861480747165L;

}
