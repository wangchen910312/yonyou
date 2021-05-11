package chn.bhmc.dms.crm.crq.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * 고객케어 대상자 목록 VO

 *
 * @ClassName   : CustomerCareExtrTargetSaveVO.java
 * @Description : CustomerCareExtrTargetSaveVO Class
 * @author in moon lee
 * @since 2016.08.13
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.08.13     in moon lee     최초 생성
 * </pre>
 */

@ValidDescriptor({

     @ValidField(field="dlrCd"      , mesgKey="crm.lbl.dlrCd")          // 딜러코드

    ,@ValidField(field="regUsrId"   , mesgKey="global.lbl.regUsrId")    // 등록자
    ,@ValidField(field="regDt"      , mesgKey="global.lbl.regDt")       // 등록일
    ,@ValidField(field="updtUsrId"  , mesgKey="global.lbl.updtUsrId")   // 수정자
    ,@ValidField(field="updtDt"     , mesgKey="global.lbl.updtDt")      // 수정일

})

public class CustomerCareExtrTargetSaveVO extends BaseSaveVO<CustomerCareExtrTargetVO>  {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2692724427792653950L;


}

