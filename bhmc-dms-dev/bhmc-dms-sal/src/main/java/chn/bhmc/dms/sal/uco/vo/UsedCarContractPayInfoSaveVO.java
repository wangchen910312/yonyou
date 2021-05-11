package chn.bhmc.dms.sal.uco.vo;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : UsedCarContractPayInfoSaveVO
 * @Description : 중고차 - 입출금관리저장/수정/삭제
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

public class UsedCarContractPayInfoSaveVO {


    /**
     * 입/출금내역 추가목록
     */
    @Valid
    private List<UsedCarContractPayInfoVO> insertPayInfoList = new ArrayList<UsedCarContractPayInfoVO>();

    /**
     * 입/출금내역 수정목록
     */
    @Valid
    private List<UsedCarContractPayInfoVO> updatePayInfoList = new ArrayList<UsedCarContractPayInfoVO>();

    /**
     * 입/출금내역 삭제목록
     */
    private List<UsedCarContractPayInfoVO> deletePayInfoList = new ArrayList<UsedCarContractPayInfoVO>();

    /**
     * @return the insertPayInfoList
     */
    public List<UsedCarContractPayInfoVO> getInsertPayInfoList() {
        return insertPayInfoList;
    }

    /**
     * @param insertPayInfoList the insertPayInfoList to set
     */
    public void setInsertPayInfoList(List<UsedCarContractPayInfoVO> insertPayInfoList) {
        this.insertPayInfoList = insertPayInfoList;
    }

    /**
     * @return the updatePayInfoList
     */
    public List<UsedCarContractPayInfoVO> getUpdatePayInfoList() {
        return updatePayInfoList;
    }

    /**
     * @param updatePayInfoList the updatePayInfoList to set
     */
    public void setUpdatePayInfoList(List<UsedCarContractPayInfoVO> updatePayInfoList) {
        this.updatePayInfoList = updatePayInfoList;
    }

    /**
     * @return the deletePayInfoList
     */
    public List<UsedCarContractPayInfoVO> getDeletePayInfoList() {
        return deletePayInfoList;
    }

    /**
     * @param deletePayInfoList the deletePayInfoList to set
     */
    public void setDeletePayInfoList(List<UsedCarContractPayInfoVO> deletePayInfoList) {
        this.deletePayInfoList = deletePayInfoList;
    }
}
