package chn.bhmc.dms.sal.cnt.vo;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ContractReOptionSaveVO
 * @Description : 계약 - 부가비용
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

public class ContractReOptionSaveVO {

    /**
     * 부가비용 추가목록
     */
    @Valid
    private List<ContractReOptionVO> insertOptionList = new ArrayList<ContractReOptionVO>();

    /**
     * 부가비용 수정목록
     */
    @Valid
    private List<ContractReOptionVO> updateOptionList = new ArrayList<ContractReOptionVO>();

    /**
     * 부가비용 삭제목록
     */
    private List<ContractReOptionVO> deleteOptionList = new ArrayList<ContractReOptionVO>();

    /**
     * @return the insertOptionList
     */
    public List<ContractReOptionVO> getInsertOptionList() {
        return insertOptionList;
    }

    /**
     * @param insertOptionList the insertOptionList to set
     */
    public void setInsertOptionList(List<ContractReOptionVO> insertOptionList) {
        this.insertOptionList = insertOptionList;
    }

    /**
     * @return the updateOptionList
     */
    public List<ContractReOptionVO> getUpdateOptionList() {
        return updateOptionList;
    }

    /**
     * @param updateOptionList the updateOptionList to set
     */
    public void setUpdateOptionList(List<ContractReOptionVO> updateOptionList) {
        this.updateOptionList = updateOptionList;
    }

    /**
     * @return the deleteOptionList
     */
    public List<ContractReOptionVO> getDeleteOptionList() {
        return deleteOptionList;
    }

    /**
     * @param deleteOptionList the deleteOptionList to set
     */
    public void setDeleteOptionList(List<ContractReOptionVO> deleteOptionList) {
        this.deleteOptionList = deleteOptionList;
    }

}
