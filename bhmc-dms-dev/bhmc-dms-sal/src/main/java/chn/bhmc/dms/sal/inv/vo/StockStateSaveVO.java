package chn.bhmc.dms.sal.inv.vo;

import java.util.ArrayList;
import java.util.List;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : StockStateSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Jin Suk Kim
 * @since 2016. 3. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 24.     Jin Suk Kim     최초 생성
 * </pre>
 */

public class StockStateSaveVO {

    /**
     * 추가목록
     */
    //@Valid
    private List<StockStateVO> insertList = new ArrayList<StockStateVO>();

    /**
     * 수정목록
     */
    private List<StockStateVO> updateList = new ArrayList<StockStateVO>();

    /**
     * 삭제목록
     */
    private List<StockStateVO> deleteList = new ArrayList<StockStateVO>();

    /**
     * @return the insertList
     */
    public List<StockStateVO> getInsertList() {
        return insertList;
    }

    /**
     * @param insertList the insertList to set
     */
    public void setInsertList(List<StockStateVO> insertList) {
        this.insertList = insertList;
    }

    /**
     * @return the updateList
     */
    public List<StockStateVO> getUpdateList() {
        return updateList;
    }

    /**
     * @param updateList the updateList to set
     */
    public void setUpdateList(List<StockStateVO> updateList) {
        this.updateList = updateList;
    }

    /**
     * @return the deleteList
     */
    public List<StockStateVO> getDeleteList() {
        return deleteList;
    }

    /**
     * @param deleteList the deleteList to set
     */
    public void setDeleteList(List<StockStateVO> deleteList) {
        this.deleteList = deleteList;
    }

}
