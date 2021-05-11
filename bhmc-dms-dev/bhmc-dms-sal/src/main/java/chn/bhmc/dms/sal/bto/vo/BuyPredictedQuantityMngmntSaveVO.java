package chn.bhmc.dms.sal.bto.vo;

import java.util.ArrayList;
import java.util.List;

public class BuyPredictedQuantityMngmntSaveVO {

    /**
     * 추가목록
     */
    //@Valid
    private List<BuyPredictedQuantityMngmntVO> insertList = new ArrayList<BuyPredictedQuantityMngmntVO>();

    /**
     * 수정목록
     */
    private List<BuyPredictedQuantityMngmntVO> updateList = new ArrayList<BuyPredictedQuantityMngmntVO>();

    /**
     * 삭제목록
     */
    private List<BuyPredictedQuantityMngmntVO> deleteList = new ArrayList<BuyPredictedQuantityMngmntVO>();

    /**
     * @return the insertList
     */
    public List<BuyPredictedQuantityMngmntVO> getInsertList() {
        return insertList;
    }

    /**
     * @return the updateList
     */
    public List<BuyPredictedQuantityMngmntVO> getUpdateList() {
        return updateList;
    }

    /**
     * @return the deleteList
     */
    public List<BuyPredictedQuantityMngmntVO> getDeleteList() {
        return deleteList;
    }

    /**
     * @param insertList the insertList to set
     */
    public void setInsertList(List<BuyPredictedQuantityMngmntVO> insertList) {
        this.insertList = insertList;
    }

    /**
     * @param updateList the updateList to set
     */
    public void setUpdateList(List<BuyPredictedQuantityMngmntVO> updateList) {
        this.updateList = updateList;
    }

    /**
     * @param deleteList the deleteList to set
     */
    public void setDeleteList(List<BuyPredictedQuantityMngmntVO> deleteList) {
        this.deleteList = deleteList;
    }
}