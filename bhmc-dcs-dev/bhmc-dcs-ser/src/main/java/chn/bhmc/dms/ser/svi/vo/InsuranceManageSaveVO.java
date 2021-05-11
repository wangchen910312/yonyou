package chn.bhmc.dms.ser.svi.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : InsuranceManageSaveVO.java
 * @Description : 보험관리 화면 수정/저장/삭제 VO
 * @author Ki Hyun Kwon
 * @since 2016. 2. 3.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 3.     Ki Hyun Kwon     최초 생성
 * </pre>
 */

@ValidDescriptor({
     @ValidField(field="dlrCd",       mesgKey="global.lbl.dlrCd")
    ,@ValidField(field="incCmpCd",    mesgKey="ser.lbl.incCmpCd")
    ,@ValidField(field="incCmpNm",    mesgKey="ser.lbl.incCmpNm")
    ,@ValidField(field="incCmpTelNo", mesgKey="ser.lbl.incCmpTelNo")
    ,@ValidField(field="incDeptNm",   mesgKey="ser.lbl.incDeptNm")
    ,@ValidField(field="incUsrNm",    mesgKey="ser.lbl.incUsrNm")
})
public class InsuranceManageSaveVO extends BaseSaveVO<InsuranceManageVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -4252689341045131544L;

}
