package chn.bhmc.dms.sal.cnt.vo;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ContractPromotionSaveVO.java
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

public class ContractPromotionSaveVO {

    /**
     * 프로모션 추가목록
     */
    @Valid
    private List<ContractPromotionVO> insertPromotionList = new ArrayList<ContractPromotionVO>();

    /**
     * 프로모션 수정목록
     */
    @Valid
    private List<ContractPromotionVO> updatePromotionList = new ArrayList<ContractPromotionVO>();

    /**
     * 프로모션 삭제목록
     */
    private List<ContractPromotionVO> deletePromotionList = new ArrayList<ContractPromotionVO>();


    /**
     * @return the insertPromotionList
     */
    public List<ContractPromotionVO> getInsertPromotionList() {
        return insertPromotionList;
    }

    /**
     * @param insertPromotionList the insertPromotionList to set
     */
    public void setInsertPromotionList(List<ContractPromotionVO> insertPromotionList) {
        this.insertPromotionList = insertPromotionList;
    }

    /**
     * @return the updatePromotionList
     */
    public List<ContractPromotionVO> getUpdatePromotionList() {
        return updatePromotionList;
    }

    /**
     * @param updatePromotionList the updatePromotionList to set
     */
    public void setUpdatePromotionList(List<ContractPromotionVO> updatePromotionList) {
        this.updatePromotionList = updatePromotionList;
    }

    /**
     * @return the deletePromotionList
     */
    public List<ContractPromotionVO> getDeletePromotionList() {
        return deletePromotionList;
    }

    /**
     * @param deletePromotionList the deletePromotionList to set
     */
    public void setDeletePromotionList(List<ContractPromotionVO> deletePromotionList) {
        this.deletePromotionList = deletePromotionList;
    }

}
