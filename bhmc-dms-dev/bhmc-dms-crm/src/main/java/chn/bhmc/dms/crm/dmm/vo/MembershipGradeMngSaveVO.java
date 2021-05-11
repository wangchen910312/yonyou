package chn.bhmc.dms.crm.dmm.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipGradeMngSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim Hyun Ho
 * @since 2016. 4. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 19.     Kim Hyun Ho     최초 생성
 * </pre>
 */

@ValidDescriptor({
    @ValidField(field="gradeSeq"       , mesgKey="global.lbl.gradeSeq")
    ,@ValidField(field="gradeNm"        , mesgKey="global.lbl.gradeNm")
    ,@ValidField(field="vsitStartCnt"   , mesgKey="global.lbl.vsitStartCnt")
    ,@ValidField(field="vsitEndCnt"     , mesgKey="global.lbl.vsitEndCnt")
    ,@ValidField(field="vsitTermCd"     , mesgKey="global.lbl.vsitTermCd")
    ,@ValidField(field="purcStartCnt"   , mesgKey="global.lbl.purcStartCnt")
    ,@ValidField(field="purcEndCnt"     , mesgKey="global.lbl.purcEndCnt")
    ,@ValidField(field="purcTermCd"     , mesgKey="global.lbl.purcTermCd")
    ,@ValidField(field="purcStartAmt"   , mesgKey="global.lbl.purcStartAmt")
    ,@ValidField(field="purcEndAmt"     , mesgKey="global.lbl.purcEndAmt")
    ,@ValidField(field="purcTermAmtCd"  , mesgKey="global.lbl.purcTermAmtCd")
    ,@ValidField(field="rchgStartAmt"   , mesgKey="global.lbl.rchgStartAmt")
    ,@ValidField(field="rchgEndAmt"     , mesgKey="global.lbl.rchgEndAmt")
    ,@ValidField(field="accuRate"       , mesgKey="global.lbl.accuRate")
    })
public class MembershipGradeMngSaveVO extends BaseSaveVO<MembershipGradeMngVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 7939986432702179518L;

    private MembershipGradeMngVO membershipGradeMngVO;

    /**
     * @return the membershipGradeMngVO
     */
    public MembershipGradeMngVO getMembershipGradeMngVO() {
        return membershipGradeMngVO;
    }

    /**
     * @param membershipGradeMngVO the membershipGradeMngVO to set
     */
    public void setMembershipGradeMngVO(MembershipGradeMngVO membershipGradeMngVO) {
        this.membershipGradeMngVO = membershipGradeMngVO;
    }



}
