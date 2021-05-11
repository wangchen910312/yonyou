package chn.bhmc.dms.sal.uco.vo;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : UsedCarContractOptionSaveVO
 * @Description : 중고차 - 계약 - 부가비용
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

public class UsedCarContractOptionSaveVO {

    /**
     * 부가비용 추가목록
     */
    @Valid
    private List<UsedCarContractOptionVO> insertOptionList = new ArrayList<UsedCarContractOptionVO>();

    /**
     * 부가비용 수정목록
     */
    @Valid
    private List<UsedCarContractOptionVO> updateOptionList = new ArrayList<UsedCarContractOptionVO>();

    /**
     * 부가비용 삭제목록
     */
    private List<UsedCarContractOptionVO> deleteOptionList = new ArrayList<UsedCarContractOptionVO>();

    /**
     * @return the insertOptionList
     */
    public List<UsedCarContractOptionVO> getInsertOptionList() {
        return insertOptionList;
    }

    /**
     * @param insertOptionList the insertOptionList to set
     */
    public void setInsertOptionList(List<UsedCarContractOptionVO> insertOptionList) {
        this.insertOptionList = insertOptionList;
    }

    /**
     * @return the updateOptionList
     */
    public List<UsedCarContractOptionVO> getUpdateOptionList() {
        return updateOptionList;
    }

    /**
     * @param updateOptionList the updateOptionList to set
     */
    public void setUpdateOptionList(List<UsedCarContractOptionVO> updateOptionList) {
        this.updateOptionList = updateOptionList;
    }

    /**
     * @return the deleteOptionList
     */
    public List<UsedCarContractOptionVO> getDeleteOptionList() {
        return deleteOptionList;
    }

    /**
     * @param deleteOptionList the deleteOptionList to set
     */
    public void setDeleteOptionList(List<UsedCarContractOptionVO> deleteOptionList) {
        this.deleteOptionList = deleteOptionList;
    }

}
