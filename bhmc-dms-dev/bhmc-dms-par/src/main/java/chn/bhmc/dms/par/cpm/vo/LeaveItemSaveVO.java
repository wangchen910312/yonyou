package chn.bhmc.dms.par.cpm.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * 방치품 저장 VO
 *
 * @ClassName   : LeaveItemSaveVO.java
 * @Description : LeaveItemSaveVO Class
 * @author In Bo Shim
 * @since 2016. 5. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 24.     In Bo Shim     최초 생성
 * </pre>
 */

public class LeaveItemSaveVO {

    /**
     * 방치품 품목 목록 VO
     **/
    private BaseSaveVO<LeaveItemVO> leaveItemListVO;

    /**
     * @return the leaveItemListVO
     */
    public BaseSaveVO<LeaveItemVO> getLeaveItemListVO() {
        return leaveItemListVO;
    }

    /**
     * @param leaveItemListVO the leaveItemListVO to set
     */
    public void setLeaveItemListVO(BaseSaveVO<LeaveItemVO> leaveItemListVO) {
        this.leaveItemListVO = leaveItemListVO;
    }
}
