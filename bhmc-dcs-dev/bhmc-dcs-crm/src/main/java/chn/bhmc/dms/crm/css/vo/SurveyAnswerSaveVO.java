package chn.bhmc.dms.crm.css.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * 설문 템플릿 관리  VO
 *
 * @ClassName   : SurveyAnswerSaveVO.java
 * @Description : SurveyAnswerSaveVO Class
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
    @ValidField(field="answCont"          ,mesgKey="crm.lbl.answCont")
    ,@ValidField(field="answScoreVal"     , mesgKey="crm.lbl.answScoreVal")
    ,@ValidField(field="sortOrder"        , mesgKey="global.lbl.sortOrder")
})

public class SurveyAnswerSaveVO extends BaseSaveVO<SurveyAnswerVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 8278159616031902935L;



}