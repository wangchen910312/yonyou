package chn.bhmc.dms.mob.api.sales.vo;

import java.util.ArrayList;
import java.util.List;

public class NotAssignedOrderSaveVO {

    /**
     * 추가목록
     */
    //@Valid
    private List<NotAssignedOrderVO> insertList = new ArrayList<NotAssignedOrderVO>();

    /**
     * 수정목록
     */
    private List<NotAssignedOrderVO> updateList = new ArrayList<NotAssignedOrderVO>();

    /**
     * 삭제목록
     */
    private List<NotAssignedOrderVO> deleteList = new ArrayList<NotAssignedOrderVO>();

    /**
     * @return the insertList
     */
    public List<NotAssignedOrderVO> getInsertList() {
        return insertList;
    }

    /**
     * @return the updateList
     */
    public List<NotAssignedOrderVO> getUpdateList() {
        return updateList;
    }

    /**
     * @return the deleteList
     */
    public List<NotAssignedOrderVO> getDeleteList() {
        return deleteList;
    }

    /**
     * @param insertList the insertList to set
     */
    public void setInsertList(List<NotAssignedOrderVO> insertList) {
        this.insertList = insertList;
    }

    /**
     * @param updateList the updateList to set
     */
    public void setUpdateList(List<NotAssignedOrderVO> updateList) {
        this.updateList = updateList;
    }

    /**
     * @param deleteList the deleteList to set
     */
    public void setDeleteList(List<NotAssignedOrderVO> deleteList) {
        this.deleteList = deleteList;
    }
}