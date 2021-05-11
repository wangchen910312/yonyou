package chn.bhmc.dms.sal.acu.vo;

import java.util.ArrayList;
import java.util.List;



/**
 * @ClassName   : ContBeforeMngSaveVO
 * @Description : 멀티 계약 삭제,취소 VO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2016.10.14.    Kim Jin Suk        최초 생성
 * </pre>
 */

public class ContBeforeMngSaveVO {

    // 계약 - 삭제
    private List<ContBeforeMngVO> deleteList = new ArrayList<ContBeforeMngVO>();

    // 계약 - 취소
    private List<ContBeforeMngVO> cancelList = new ArrayList<ContBeforeMngVO>();

    /**
     * @return the deleteList
     */
    public List<ContBeforeMngVO> getDeleteList() {
        return deleteList;
    }
    /**
     * @param deleteList the deleteList to set
     */
    public void setDeleteList(List<ContBeforeMngVO> deleteList) {
        this.deleteList = deleteList;
    }

    /**
     * @return the cancelList
     */
    public List<ContBeforeMngVO> getCancelList() {
        return cancelList;
    }
    /**
     * @param cancelList the cancelList to set
     */
    public void setCancelList(List<ContBeforeMngVO> cancelList) {
        this.cancelList = cancelList;
    }
}
