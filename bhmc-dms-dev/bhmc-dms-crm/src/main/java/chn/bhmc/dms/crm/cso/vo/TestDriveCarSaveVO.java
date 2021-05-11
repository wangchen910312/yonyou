package chn.bhmc.dms.crm.cso.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * 시승 차량 VO

 *
 * @ClassName   : TestDriveCarSaveVO.java
 * @Description : TestDriveCarSaveVO Class
 * @author in moon lee
 * @since 2016.05.11
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.05.11     in moon lee     최초 생성
 * </pre>
 */

@ValidDescriptor({

     @ValidField(field="dlrCd"      , mesgKey="crm.lbl.dlrCd")          // 딜러코드
    ,@ValidField(field="pltCd"      , mesgKey="crm.lbl.pltCd")          // 센터코드
    ,@ValidField(field="tdrvVinNo"  , mesgKey="crm.lbl.tdrvVinNo")      // 시승차대번호
    ,@ValidField(field="useYn"      , mesgKey="crm.lbl.useYn")          // 사용여부
    ,@ValidField(field="tdrvCont"   , mesgKey="crm.lbl.tdrvCont")       // 사용중지상세
    ,@ValidField(field="regUsrId"   , mesgKey="global.lbl.regUsrId")    // 등록자
    ,@ValidField(field="regDt"      , mesgKey="global.lbl.regDt")       // 등록일
    ,@ValidField(field="updtUsrId"  , mesgKey="global.lbl.updtUsrId")   // 수정자
    ,@ValidField(field="updtDt"     , mesgKey="global.lbl.updtDt")      // 수정일

})

public class TestDriveCarSaveVO extends BaseSaveVO<TestDriveCarVO>  {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -4726793674798020114L;


}

