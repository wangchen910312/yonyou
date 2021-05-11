package chn.bhmc.dms.bat.mgr.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchScheduleSaveVO.java
 * @Description : 배치스케쥴 일괄반영 SaveVO
 * @author Kang Seok Han
 * @since 2016. 2. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 23.     Kang Seok Han     최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="batOperId", mesgKey="global.lbl.batOperId")
    ,@ValidField(field="batOperNm", mesgKey="global.lbl.batOperNm")
    ,@ValidField(field="batTp", mesgKey="global.lbl.batTp")
    ,@ValidField(field="batPrgmNm", mesgKey="global.lbl.batPrgmNm")
    ,@ValidField(field="batParamVal", mesgKey="global.lbl.batParamVal")
    ,@ValidField(field="batEnabledYn", mesgKey="global.lbl.batEnabledYn")
    ,@ValidField(field="batScheduleId", mesgKey="global.lbl.batScheduleId")
    ,@ValidField(field="cronExpressionTxt", mesgKey="global.lbl.cronExpressionTxt")
    ,@ValidField(field="timezoneId", mesgKey="global.lbl.timezoneId")
})
public class BatchScheduleSaveVO extends BaseSaveVO<BatchScheduleVO> {


	/**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4342612774133956610L;

}
