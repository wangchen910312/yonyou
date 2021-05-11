package chn.bhmc.dms.cmm.sci.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : HolidaySaveVO.java
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
    @ValidField(field="calendarId", mesgKey="cmm.lbl.calendarId")
   ,@ValidField(field="hdayInfoTxt", mesgKey="cmm.lbl.holidayNm")
})
public class HolidaySaveVO extends BaseSaveVO<HolidayVO> {
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2706223959915957815L;
}