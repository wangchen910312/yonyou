package chn.bhmc.dms.cmm.apr.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * 결재양식 결재선 일괄저장 VO
 * </pre>
 *
 * @ClassName   : DocLineSaveVO.java
 * @Description : 결재양식 결재선 일괄저장 VO
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
public class DocLineSaveVO extends BaseSaveVO<DocLineVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6766567829277392502L;
}
