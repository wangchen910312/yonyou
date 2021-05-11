package chn.bhmc.dms.crm.css.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * 설문 템플릿 관리  VO
 *
 * @ClassName   : SurveySatisFactionSaveVO.java
 * @Description : SurveySatisFactionSaveVO Class
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
    @ValidField(field="subyTmplNm"       , mesgKey="crm.lbl.subyTmplNm")
    ,@ValidField(field="delYn"           , mesgKey="global.lbl.useYn")
})
public class SurveySatisFactionSaveVO extends BaseSaveVO<SurveySatisFactionVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1370684427218814408L;



}