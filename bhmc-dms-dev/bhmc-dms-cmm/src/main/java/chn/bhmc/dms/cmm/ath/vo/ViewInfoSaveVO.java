package chn.bhmc.dms.cmm.ath.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ViewInfoSaveVO.java
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
    @ValidField(field="sysCd", mesgKey="global.lbl.sysCd")
    ,@ValidField(field="viewId", mesgKey="global.lbl.viewId")
    ,@ValidField(field="viewNm", mesgKey="global.lbl.viewNm")
    ,@ValidField(field="viewInfoCont", mesgKey="global.lbl.viewInfoCont")
    ,@ValidField(field="viewUrl", mesgKey="global.lbl.viewUrl")
    ,@ValidField(field="viewTp", mesgKey="global.lbl.viewTp")
    ,@ValidField(field="mesgKey", mesgKey="global.lbl.mesgKey")
    ,@ValidField(field="sortOrder", mesgKey="global.lbl.sortOrder")
    ,@ValidField(field="displayYn", mesgKey="global.lbl.displayYn")
    ,@ValidField(field="tCd", mesgKey="global.lbl.tCd")
    ,@ValidField(field="iconNm", mesgKey="global.lbl.iconNm")
    ,@ValidField(field="parentViewId", mesgKey="global.lbl.parentViewId")
    ,@ValidField(field="webMobileDstinCd", mesgKey="global.lbl.webMobileDstinCd")
})
public class ViewInfoSaveVO extends BaseSaveVO<ViewInfoVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6766567829277392502L;

}
