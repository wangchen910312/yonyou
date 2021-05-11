package chn.bhmc.dms.crm.css.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * 만족도 조사 관리  VO
 *
 * @ClassName   : SatisFactionManageSaveVO.java
 * @Description : SatisFactionManageSaveVO Class
 * @author hyun ho kim
 * @since 2016. 3. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 14.     hyun ho kim     최초 생성
 * </pre>
 */

@ValidDescriptor({
    @ValidField(field="stsfIvstNm"      , mesgKey="crm.lbl.stsfIvstNm")
    ,@ValidField(field="stsfIvstMthCd"   , mesgKey="crm.lbl.stsfIvstMthCd")
    ,@ValidField(field="stsfIvstExpdCd"  , mesgKey="crm.lbl.stsfIvstExpdCd")
    /*,@ValidField(field="subyTmplSeq"     , mesgKey="crm.lbl.subyTmplSeq")*/
    ,@ValidField(field="rcpeExtrSeq"     , mesgKey="crm.lbl.rcpeExtrSeq")
    ,@ValidField(field="startDt"         , mesgKey="global.lbl.startDt")
    ,@ValidField(field="endDt"           , mesgKey="global.lbl.endDt")
    ,@ValidField(field="useYn"           , mesgKey="global.lbl.useYn")
    ,@ValidField(field="custTargYn"      , mesgKey="global.lbl.custTargYn")
})

public class SatisFactionManageSaveVO extends BaseSaveVO<SatisFactionManageVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -3533509032613322921L;

}