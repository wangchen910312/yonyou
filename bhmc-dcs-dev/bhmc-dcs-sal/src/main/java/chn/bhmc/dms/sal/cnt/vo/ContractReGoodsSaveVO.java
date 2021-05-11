package chn.bhmc.dms.sal.cnt.vo;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ContractReGoodsSaveVO
 * @Description : 계약 - 용품
 * @author Jin Suk Kim
 * @since 2016. 6. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 17.     Jin Suk Kim     최초 생성
 * </pre>
 */

public class ContractReGoodsSaveVO {

    /**
     * 용품 추가목록
     */
    @Valid
    private List<ContractReGoodsVO> insertGoodsList = new ArrayList<ContractReGoodsVO>();

    /**
     * 용품 수정목록
     */
    @Valid
    private List<ContractReGoodsVO> updateGoodsList = new ArrayList<ContractReGoodsVO>();

    /**
     * 용품 삭제목록
     */
    private List<ContractReGoodsVO> deleteGoodsList = new ArrayList<ContractReGoodsVO>();

    /**
     * @return the insertGoodsList
     */
    public List<ContractReGoodsVO> getInsertGoodsList() {
        return insertGoodsList;
    }

    /**
     * @param insertGoodsList the insertGoodsList to set
     */
    public void setInsertGoodsList(List<ContractReGoodsVO> insertGoodsList) {
        this.insertGoodsList = insertGoodsList;
    }

    /**
     * @return the updateGoodsList
     */
    public List<ContractReGoodsVO> getUpdateGoodsList() {
        return updateGoodsList;
    }

    /**
     * @param updateGoodsList the updateGoodsList to set
     */
    public void setUpdateGoodsList(List<ContractReGoodsVO> updateGoodsList) {
        this.updateGoodsList = updateGoodsList;
    }

    /**
     * @return the deleteGoodsList
     */
    public List<ContractReGoodsVO> getDeleteGoodsList() {
        return deleteGoodsList;
    }

    /**
     * @param deleteGoodsList the deleteGoodsList to set
     */
    public void setDeleteGoodsList(List<ContractReGoodsVO> deleteGoodsList) {
        this.deleteGoodsList = deleteGoodsList;
    }

}
