package chn.bhmc.dms.sal.cnt.vo;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ContractRePayInfoSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
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

public class ContractRePayInfoSaveVO {


    /**
     * 입/출금내역 추가목록
     */
    @Valid
    private List<ContractPayInfoVO> insertPayInfoList = new ArrayList<ContractPayInfoVO>();

    /**
     * 입/출금내역 수정목록
     */
    @Valid
    private List<ContractPayInfoVO> updatePayInfoList = new ArrayList<ContractPayInfoVO>();

    /**
     * 입/출금내역 삭제목록
     */
    private List<ContractPayInfoVO> deletePayInfoList = new ArrayList<ContractPayInfoVO>();

    /**
     * @return the insertPayInfoList
     */
    public List<ContractPayInfoVO> getInsertPayInfoList() {
        return insertPayInfoList;
    }

    /**
     * @param insertPayInfoList the insertPayInfoList to set
     */
    public void setInsertPayInfoList(List<ContractPayInfoVO> insertPayInfoList) {
        this.insertPayInfoList = insertPayInfoList;
    }

    /**
     * @return the updatePayInfoList
     */
    public List<ContractPayInfoVO> getUpdatePayInfoList() {
        return updatePayInfoList;
    }

    /**
     * @param updatePayInfoList the updatePayInfoList to set
     */
    public void setUpdatePayInfoList(List<ContractPayInfoVO> updatePayInfoList) {
        this.updatePayInfoList = updatePayInfoList;
    }

    /**
     * @return the deletePayInfoList
     */
    public List<ContractPayInfoVO> getDeletePayInfoList() {
        return deletePayInfoList;
    }

    /**
     * @param deletePayInfoList the deletePayInfoList to set
     */
    public void setDeletePayInfoList(List<ContractPayInfoVO> deletePayInfoList) {
        this.deletePayInfoList = deletePayInfoList;
    }


}
