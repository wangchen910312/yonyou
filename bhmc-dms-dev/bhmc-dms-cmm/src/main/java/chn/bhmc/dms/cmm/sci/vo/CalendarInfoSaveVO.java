package chn.bhmc.dms.cmm.sci.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CalendarSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 4. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 18.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

@ValidDescriptor({
    @ValidField(field="langCd", mesgKey="global.lbl.langCd")
   ,@ValidField(field="calendarNm", mesgKey="cmm.lbl.calendarNm")
   ,@ValidField(field="calendarTp", mesgKey="cmm.lbl.calendarTp")
   ,@ValidField(field="startDt", mesgKey="cmm.lbl.startDt")
   ,@ValidField(field="endDt", mesgKey="cmm.lbl.endDt")
})
public class CalendarInfoSaveVO extends BaseSaveVO<CalendarInfoVO> {
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6849950561723219010L;
}