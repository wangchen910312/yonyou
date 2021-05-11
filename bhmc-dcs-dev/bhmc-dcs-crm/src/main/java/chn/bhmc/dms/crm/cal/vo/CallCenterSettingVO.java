package chn.bhmc.dms.crm.cal.vo;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * 콜센터설정 VO
 *
 * @ClassName   : CallCenterSettingVO.java
 * @Description : CallCenterSettingVO Class
 * @author in moon lee
 * @since 2016.05.05.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.05.05     in moon lee     최초 생성
 * </pre>
 */

@ValidDescriptor({

     @ValidField(field="dlrCd"              , mesgKey="global.lbl.dlrCd")               // 딜러코드
    ,@ValidField(field="regUsrId"           , mesgKey="global.lbl.regUsrId")            // 등록자
    ,@ValidField(field="regDt"              , mesgKey="global.lbl.regDt")               // 등록일
    ,@ValidField(field="updtUsrId"          , mesgKey="global.lbl.updtUsrId")           // 수정자
    ,@ValidField(field="updtDt"             , mesgKey="global.lbl.updtDt")              // 수정일


})

public class CallCenterSettingVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2902895359185678353L;


}