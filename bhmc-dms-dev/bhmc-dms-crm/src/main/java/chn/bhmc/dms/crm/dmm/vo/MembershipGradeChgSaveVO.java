package chn.bhmc.dms.crm.dmm.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipGradeChgSaveVO.java
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
    @ValidField(field="aftGradeCd"   , mesgKey="crm.lbl.aftGradeCd")
    ,@ValidField(field="membershipNo"   , mesgKey="crm.lbl.membershipNo")
    })
public class MembershipGradeChgSaveVO extends BaseSaveVO<MembershipGradeChgVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -324875362271740896L;

    /**
     * 멤버십 등급변경 일련번호
     **/
    private  int membershipGradeChgSeq;

    /**
     * @return the membershipGradeChgSeq
     */
    public int getMembershipGradeChgSeq() {
        return membershipGradeChgSeq;
    }

    /**
     * @param membershipGradeChgSeq the membershipGradeChgSeq to set
     */
    public void setMembershipGradeChgSeq(int membershipGradeChgSeq) {
        this.membershipGradeChgSeq = membershipGradeChgSeq;
    }



}
