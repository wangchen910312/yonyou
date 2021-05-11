package chn.bhmc.dms.ser.cal.vo;

import java.util.List;

import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipJoinVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipPointHisVO;
import chn.bhmc.dms.ser.cmm.vo.TabInfoSaveVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CalculateSaveVO.java
 * @Description : 정산 save VO
 * @author KyungMok Kim
 * @since 2016. 3. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 14.    KyungMok Kim     최초 생성
 * </pre>
 */

@ValidDescriptor({

})
public class CalculateSaveVO extends TabInfoSaveVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2203335657130747165L;

    CalculateVO calculateVO;

    // 블루멤버쉽
    BlueMembershipJoinVO blueMembershipJoinVO;

    // 딜러멤버쉽
    MembershipPointHisVO membershipPointHisVO;

    // 적립카드(선불카드)
    MembershipPointHisVO cardPointHisVO;

    
    List<CalculateDetailVO> calculateDetailSaveVO;

    
    List<CalculateVO> caluclateListVO;
    
	//卡券信息
    CalculateVO fmsCardNoJoinVO;

    
    
    /**
     * @return the fmsCardNoJoinVO
     */
    public CalculateVO getFmsCardNoJoinVO() {
		return fmsCardNoJoinVO;
	}

	public void setFmsCardNoJoinVO(CalculateVO fmsCardNoJoinVO) {
		this.fmsCardNoJoinVO = fmsCardNoJoinVO;
	}
    
    
    /**
     * @return the calculateReceiptVO
     */
    public CalculateVO getCalculateVO() {
        return calculateVO;
    }

    /**
     * @param calculateReceiptVO the calculateReceiptVO to set
     */
    public void setCalculateVO(CalculateVO calculateVO) {
        this.calculateVO = calculateVO;
    }

    /**
     * @return the blueMembershipJoinVO
     */
    public BlueMembershipJoinVO getBlueMembershipJoinVO() {
        return blueMembershipJoinVO;
    }

    /**
     * @param blueMembershipJoinVO the blueMembershipJoinVO to set
     */
    public void setBlueMembershipJoinVO(BlueMembershipJoinVO blueMembershipJoinVO) {
        this.blueMembershipJoinVO = blueMembershipJoinVO;
    }

    /**
     * @return the membershipPointHisVO
     */
    public MembershipPointHisVO getMembershipPointHisVO() {
        return membershipPointHisVO;
    }

    /**
     * @param membershipPointHisVO the membershipPointHisVO to set
     */
    public void setMembershipPointHisVO(MembershipPointHisVO membershipPointHisVO) {
        this.membershipPointHisVO = membershipPointHisVO;
    }

    /**
     * @return the calculateDetailSaveVO
     */
    public List<CalculateDetailVO> getCalculateDetailSaveVO() {
        return calculateDetailSaveVO;
    }

    /**
     * @param calculateDetailSaveVO the calculateDetailSaveVO to set
     */
    public void setCalculateDetailSaveVO(List<CalculateDetailVO> calculateDetailSaveVO) {
        this.calculateDetailSaveVO = calculateDetailSaveVO;
    }

    /**
     * @return the caluclateListVO
     */
    public List<CalculateVO> getCaluclateListVO() {
        return caluclateListVO;
    }

    /**
     * @param caluclateListVO the caluclateListVO to set
     */
    public void setCaluclateListVO(List<CalculateVO> caluclateListVO) {
        this.caluclateListVO = caluclateListVO;
    }

    /**
     * @return the cardPointHisVO
     */
    public MembershipPointHisVO getCardPointHisVO() {
        return cardPointHisVO;
    }

    /**
     * @param cardPointHisVO the cardPointHisVO to set
     */
    public void setCardPointHisVO(MembershipPointHisVO cardPointHisVO) {
        this.cardPointHisVO = cardPointHisVO;
    }

}