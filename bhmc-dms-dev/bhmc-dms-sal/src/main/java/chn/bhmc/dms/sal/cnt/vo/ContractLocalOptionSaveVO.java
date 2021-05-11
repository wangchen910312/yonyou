package chn.bhmc.dms.sal.cnt.vo;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ContractLocalOptionSaveVO.java
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

public class ContractLocalOptionSaveVO {
    /**
     * 로컬옵션 추가목록
     */
    @Valid
    private List<ContractLocalOptionVO> insertOptionList = new ArrayList<ContractLocalOptionVO>();

    /**
     * 로컬옵션 수정목록
     */
    @Valid
    private List<ContractLocalOptionVO> updateOptionList = new ArrayList<ContractLocalOptionVO>();

    /**
     * 로컬옵션 삭제목록
     */
    private List<ContractLocalOptionVO> deleteOptionList = new ArrayList<ContractLocalOptionVO>();


    /**
     * @return the insertOptionList
     */
    public List<ContractLocalOptionVO> getInsertOptionList() {
        return insertOptionList;
    }

    /**
     * @param insertOptionList the insertOptionList to set
     */
    public void setInsertOptionList(List<ContractLocalOptionVO> insertOptionList) {
        this.insertOptionList = insertOptionList;
    }

    /**
     * @return the updateOptionList
     */
    public List<ContractLocalOptionVO> getUpdateOptionList() {
        return updateOptionList;
    }

    /**
     * @param updateOptionList the updateOptionList to set
     */
    public void setUpdateOptionList(List<ContractLocalOptionVO> updateOptionList) {
        this.updateOptionList = updateOptionList;
    }

    /**
     * @return the deleteOptionList
     */
    public List<ContractLocalOptionVO> getDeleteOptionList() {
        return deleteOptionList;
    }

    /**
     * @param deleteOptionList the deleteOptionList to set
     */
    public void setDeleteOptionList(List<ContractLocalOptionVO> deleteOptionList) {
        this.deleteOptionList = deleteOptionList;
    }
}
