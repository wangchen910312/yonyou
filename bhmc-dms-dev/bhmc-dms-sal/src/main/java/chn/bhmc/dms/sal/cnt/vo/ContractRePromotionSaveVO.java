package chn.bhmc.dms.sal.cnt.vo;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ContractRePromotionSaveVO
 * @Description : 계약 - 프로모션(법인/딜러)
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

public class ContractRePromotionSaveVO {

    /**
     * 법인 프로모션 추가목록
     */
    @Valid
    private List<ContractPromotionVO> insertCorpPromotionList = new ArrayList<ContractPromotionVO>();

    /**
     * 법인 프로모션 수정목록
     */
    @Valid
    private List<ContractPromotionVO> updateCorpPromotionList = new ArrayList<ContractPromotionVO>();

    /**
     * 법인 프로모션 삭제목록
     */
    @Valid
    private List<ContractPromotionVO> deleteCorpPromotionList = new ArrayList<ContractPromotionVO>();

    /**
     * 딜러 프로모션 추가목록
     */
    @Valid
    private List<ContractPromotionVO> insertDlrPromotionList = new ArrayList<ContractPromotionVO>();

    /**
     * 딜러 프로모션 수정목록
     */
    @Valid
    private List<ContractPromotionVO> updateDlrPromotionList = new ArrayList<ContractPromotionVO>();

    /**
     * 딜러 프로모션 삭제목록
     */
    @Valid
    private List<ContractPromotionVO> deleteDlrPromotionList = new ArrayList<ContractPromotionVO>();

    /**
     * @return the insertCorpPromotionList
     */
    public List<ContractPromotionVO> getInsertCorpPromotionList() {
        return insertCorpPromotionList;
    }

    /**
     * @param insertCorpPromotionList the insertCorpPromotionList to set
     */
    public void setInsertCorpPromotionList(List<ContractPromotionVO> insertCorpPromotionList) {
        this.insertCorpPromotionList = insertCorpPromotionList;
    }

    /**
     * @return the updateCorpPromotionList
     */
    public List<ContractPromotionVO> getUpdateCorpPromotionList() {
        return updateCorpPromotionList;
    }

    /**
     * @param updateCorpPromotionList the updateCorpPromotionList to set
     */
    public void setUpdateCorpPromotionList(List<ContractPromotionVO> updateCorpPromotionList) {
        this.updateCorpPromotionList = updateCorpPromotionList;
    }

    /**
     * @return the deleteCorpPromotionList
     */
    public List<ContractPromotionVO> getDeleteCorpPromotionList() {
        return deleteCorpPromotionList;
    }

    /**
     * @param deleteCorpPromotionList the deleteCorpPromotionList to set
     */
    public void setDeleteCorpPromotionList(List<ContractPromotionVO> deleteCorpPromotionList) {
        this.deleteCorpPromotionList = deleteCorpPromotionList;
    }

    /**
     * @return the insertDlrPromotionList
     */
    public List<ContractPromotionVO> getInsertDlrPromotionList() {
        return insertDlrPromotionList;
    }

    /**
     * @param insertDlrPromotionList the insertDlrPromotionList to set
     */
    public void setInsertDlrPromotionList(List<ContractPromotionVO> insertDlrPromotionList) {
        this.insertDlrPromotionList = insertDlrPromotionList;
    }

    /**
     * @return the updateDlrPromotionList
     */
    public List<ContractPromotionVO> getUpdateDlrPromotionList() {
        return updateDlrPromotionList;
    }

    /**
     * @param updateDlrPromotionList the updateDlrPromotionList to set
     */
    public void setUpdateDlrPromotionList(List<ContractPromotionVO> updateDlrPromotionList) {
        this.updateDlrPromotionList = updateDlrPromotionList;
    }

    /**
     * @return the deleteDlrPromotionList
     */
    public List<ContractPromotionVO> getDeleteDlrPromotionList() {
        return deleteDlrPromotionList;
    }

    /**
     * @param deleteDlrPromotionList the deleteDlrPromotionList to set
     */
    public void setDeleteDlrPromotionList(List<ContractPromotionVO> deleteDlrPromotionList) {
        this.deleteDlrPromotionList = deleteDlrPromotionList;
    }

}
