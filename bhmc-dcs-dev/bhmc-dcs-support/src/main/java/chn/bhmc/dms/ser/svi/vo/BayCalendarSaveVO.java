package chn.bhmc.dms.ser.svi.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BayCalendarSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 2. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 23.     Kwon Ki Hyun     최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="dlrCd", mesgKey="global.lbl.dlrCd")
    ,@ValidField(field="bayNo", mesgKey="global.lbl.bayNo")
    ,@ValidField(field="excpStartHm", mesgKey="global.lbl.excpStartHm")
    ,@ValidField(field="excpEndHm", mesgKey="global.lbl.excpEndHm")
    ,@ValidField(field="remark", mesgKey="global.lbl.remark")
})
public class BayCalendarSaveVO extends BaseSaveVO<BayCalendarVO>{

    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = -7750538272194046833L;
    
    

}
