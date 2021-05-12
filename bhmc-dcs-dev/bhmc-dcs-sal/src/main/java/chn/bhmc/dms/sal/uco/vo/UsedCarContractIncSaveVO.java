package chn.bhmc.dms.sal.uco.vo;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ContractReIncSaveVO
 * @Description : 계약 - 보험내역
 * @author Jin Suk Kim
 * @since 2016. 2. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 18.     Jin Suk Kim     최초 생성
 * </pre>
 */

public class UsedCarContractIncSaveVO {


    /**
     * 보험내역 추가목록
     */
    @Valid
    private List<UsedCarContractIncVO> insertIncList = new ArrayList<UsedCarContractIncVO>();

    /**
     * 보험내역 수정목록
     */
    @Valid
    private List<UsedCarContractIncVO> updateIncList = new ArrayList<UsedCarContractIncVO>();

    /**
     * 보험내역 삭제목록
     */
    private List<UsedCarContractIncVO> deleteIncList = new ArrayList<UsedCarContractIncVO>();

    /**
     * @return the insertIncList
     */
    public List<UsedCarContractIncVO> getInsertIncList() {
        return insertIncList;
    }

    /**
     * @param insertIncList the insertIncList to set
     */
    public void setInsertIncList(List<UsedCarContractIncVO> insertIncList) {
        this.insertIncList = insertIncList;
    }

    /**
     * @return the updateIncList
     */
    public List<UsedCarContractIncVO> getUpdateIncList() {
        return updateIncList;
    }

    /**
     * @param updateIncList the updateIncList to set
     */
    public void setUpdateIncList(List<UsedCarContractIncVO> updateIncList) {
        this.updateIncList = updateIncList;
    }

    /**
     * @return the deleteIncList
     */
    public List<UsedCarContractIncVO> getDeleteIncList() {
        return deleteIncList;
    }

    /**
     * @param deleteIncList the deleteIncList to set
     */
    public void setDeleteIncList(List<UsedCarContractIncVO> deleteIncList) {
        this.deleteIncList = deleteIncList;
    }

}