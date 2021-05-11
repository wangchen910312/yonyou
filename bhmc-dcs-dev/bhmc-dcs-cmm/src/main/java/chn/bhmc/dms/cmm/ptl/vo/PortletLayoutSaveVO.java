package chn.bhmc.dms.cmm.ptl.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * 포틀릿 레이아웃 일괄저장 VO
 * </pre>
 *
 * @ClassName   : PortletLayoutSaveVO.java
 * @Description : 포틀릿 레이아웃 일괄저장 VO
 * @author Kang Seok Han
 * @since 2016. 4. 9.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 9.     Kang Seok Han     최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="portletLayoutId", mesgKey="global.lbl.portletLayoutId")
    ,@ValidField(field="portletLayoutNm", mesgKey="global.lbl.portletLayoutNm")
    ,@ValidField(field="portletLayoutUrl", mesgKey="global.lbl.portletLayoutUrl")
    ,@ValidField(field="defaultYn", mesgKey="global.lbl.defaultYn")
    ,@ValidField(field="columnCnt", mesgKey="global.lbl.columnCnt")
    ,@ValidField(field="rowCnt", mesgKey="global.lbl.rowCnt")
})
public class PortletLayoutSaveVO extends BaseSaveVO<PortletLayoutVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -3422615181830905479L;

}
