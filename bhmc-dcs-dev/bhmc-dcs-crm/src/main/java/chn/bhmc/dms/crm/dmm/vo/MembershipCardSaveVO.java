package chn.bhmc.dms.crm.dmm.vo;

import java.util.ArrayList;
import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipCardSaveVO.java
 * @Description : 멤버십 카드 일괄등록, 수정, 삭제 VO
 * @author Kim Hyun Ho
 * @since 2016. 4. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 7.     Kim Hyun Ho     최초 생성
 * </pre>
 */

@ValidDescriptor({
    @ValidField(field="membershipSeq", mesgKey="CR_0802T.lbl.membershipSeq")
    ,@ValidField(field="cardTpCd"     , mesgKey="global.lbl.cardTpCd")
    ,@ValidField(field="cardNo"       , mesgKey="global.lbl.cardNo")
    ,@ValidField(field="cardUseDt"    , mesgKey="global.lbl.cardUseDt")
    ,@ValidField(field="cardFormCd"   , mesgKey="global.lbl.cardFormCd")
    })
public class MembershipCardSaveVO extends BaseSaveVO<MembershipCardVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -8432761734339355636L;

    public List<MembershipCardVO> membershipCardUploadList = new ArrayList<MembershipCardVO>();

    /**
     * @return the membershipCardUploadList
     */
    public List<MembershipCardVO> getMembershipCardUploadList() {
        return membershipCardUploadList;
    }

    /**
     * @param membershipCardUploadList the membershipCardUploadList to set
     */
    public void setMembershipCardUploadList(List<MembershipCardVO> membershipCardUploadList) {
        this.membershipCardUploadList = membershipCardUploadList;
    }


}
