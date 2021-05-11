package chn.bhmc.dms.sal.inv.vo;

import java.io.Serializable;
import java.util.ArrayList;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : StockOpenSaveVO
 * @Description : 재고관리 - 공개재고 선택
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

public class StockOpenSaveVO implements Serializable {

    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = -6606441057882125547L;

    ArrayList<StockMntVO> insertCarList = new ArrayList<StockMntVO>();
    ArrayList<StockOpenVO> insertList   = new ArrayList<StockOpenVO>();
    
    private String chked = "";
    ArrayList<StockOpenVO> deleteList = new ArrayList<StockOpenVO>(); 
    
    /**
     * @return the insertCarList
     */
    public ArrayList<StockMntVO> getInsertCarList() {
        return insertCarList;
    }
    /**
     * @param insertCarList the insertCarList to set
     */
    public void setInsertCarList(ArrayList<StockMntVO> insertCarList) {
        this.insertCarList = insertCarList;
    }
    /**
     * @return the insertList
     */
    public ArrayList<StockOpenVO> getInsertList() {
        return insertList;
    }
    /**
     * @param insertList the insertList to set
     */
    public void setInsertList(ArrayList<StockOpenVO> insertList) {
        this.insertList = insertList;
    }
    /**
     * @return the chked
     */
    public String getChked() {
        return chked;
    }
    /**
     * @param chked the chked to set
     */
    public void setChked(String chked) {
        this.chked = chked;
    }
    /**
     * @return the deleteList
     */
    public ArrayList<StockOpenVO> getDeleteList() {
        return deleteList;
    }
    /**
     * @param deleteList the deleteList to set
     */
    public void setDeleteList(ArrayList<StockOpenVO> deleteList) {
        this.deleteList = deleteList;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    
}