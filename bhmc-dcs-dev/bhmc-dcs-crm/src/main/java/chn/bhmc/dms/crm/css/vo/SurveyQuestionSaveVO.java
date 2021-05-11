package chn.bhmc.dms.crm.css.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * 설문 템플릿 관리  VO
 *
 * @ClassName   : SurveyQuestionSaveVO.java
 * @Description : SurveyQuestionSaveVO Class
 * @author hyun ho kim
 * @since 2016. 3. 4.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 4.     hyun ho kim     최초 생성
 * </pre>
 */

@ValidDescriptor({
    @ValidField(field="qestCont"    ,      mesgKey="crm.lbl.qestCont")
    ,@ValidField(field="qestWgtVal"  ,      mesgKey="crm.lbl.qestWgtVal")
    ,@ValidField(field="qestTpCd"    ,      mesgKey="crm.lbl.qestTpCd")
    ,@ValidField(field="sortOrder"   ,      mesgKey="global.lbl.sortOrder")
})

public class SurveyQuestionSaveVO extends BaseSaveVO<SurveyQuestionVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6738738674358215615L;


}