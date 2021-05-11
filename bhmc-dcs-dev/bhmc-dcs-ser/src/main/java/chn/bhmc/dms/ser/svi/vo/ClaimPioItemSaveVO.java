package chn.bhmc.dms.ser.svi.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ClaimPioItemSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 9. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 1.     Kwon ki hyun     최초 생성
 * </pre>
 */

public class ClaimPioItemSaveVO extends BaseSaveVO<ClaimPioItemVO> {


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6409123044897593088L;

    private ClaimPioItemVO claimPioItemVO;

    /**
     * @return the claimPioItemVO
     */
    public ClaimPioItemVO getClaimPioItemVO() {
        return claimPioItemVO;
    }

    /**
     * @param claimPioItemVO the claimPioItemVO to set
     */
    public void setClaimPioItemVO(ClaimPioItemVO claimPioItemVO) {
        this.claimPioItemVO = claimPioItemVO;
    }

}
