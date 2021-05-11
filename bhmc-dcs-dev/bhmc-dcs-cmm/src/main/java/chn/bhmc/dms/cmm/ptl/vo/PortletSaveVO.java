package chn.bhmc.dms.cmm.ptl.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * 포틀릿 일괄저장 VO
 * </pre>
 *
 * @ClassName   : PortletSaveVO.java
 * @Description : 포틀릿 일괄저장 VO
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
    @ValidField(field="portletId", mesgKey="global.lbl.portletId")
    ,@ValidField(field="portletNm", mesgKey="global.lbl.portletNm")
    ,@ValidField(field="portletUrl", mesgKey="global.lbl.portletUrl")
    ,@ValidField(field="viewId", mesgKey="global.lbl.viewId")
    ,@ValidField(field="mesgKey", mesgKey="global.lbl.mesgKey")
})
public class PortletSaveVO extends BaseSaveVO<PortletVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -4406929004068020185L;


}
