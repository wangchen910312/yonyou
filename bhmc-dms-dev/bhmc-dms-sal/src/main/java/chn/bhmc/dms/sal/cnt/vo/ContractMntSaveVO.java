package chn.bhmc.dms.sal.cnt.vo;

import java.util.ArrayList;
import java.util.List;



/**
 * @ClassName   : ContractMntDeleteVO
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

public class ContractMntSaveVO {

    // 계약 - 삭제
    private List<ContractReVO> deleteList = new ArrayList<ContractReVO>();

    // 계약 - 취소
    private List<ContractReVO> cancelList = new ArrayList<ContractReVO>();

    /**
     * @return the deleteList
     */
    public List<ContractReVO> getDeleteList() {
        return deleteList;
    }
    /**
     * @param deleteList the deleteList to set
     */
    public void setDeleteList(List<ContractReVO> deleteList) {
        this.deleteList = deleteList;
    }

    /**
     * @return the cancelList
     */
    public List<ContractReVO> getCancelList() {
        return cancelList;
    }
    /**
     * @param cancelList the cancelList to set
     */
    public void setCancelList(List<ContractReVO> cancelList) {
        this.cancelList = cancelList;
    }
}
