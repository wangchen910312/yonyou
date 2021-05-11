package chn.bhmc.dms.sal.acc.vo;

import java.io.Serializable;
import java.util.List;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : InvcListVO.java
 * @Description : InvcListVO.java
 * @author Ju Won Lee
 * @since 2016. 2. 3.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 3.     Ju Won Lee     최초 생성
 * </pre>
 */


public class AccessoryItemSalesListVO extends BaseVO implements Serializable{


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6540217638370198311L;

    private  AccessoryItemSalesVO          accessoryItemSalesVO;

    private  List<AccessoryItemSalesItemVO> accessoryItemSalesItemList;

    /**
     * @return the accessoryItemSalesVO
     */
    public AccessoryItemSalesVO getAccessoryItemSalesVO() {
        return accessoryItemSalesVO;
    }

    /**
     * @param accessoryItemSalesVO the accessoryItemSalesVO to set
     */
    public void setAccessoryItemSalesVO(AccessoryItemSalesVO accessoryItemSalesVO) {
        this.accessoryItemSalesVO = accessoryItemSalesVO;
    }

    /**
     * @return the accessoryItemSalesItemList
     */
    public List<AccessoryItemSalesItemVO> getAccessoryItemSalesItemList() {
        return accessoryItemSalesItemList;
    }

    /**
     * @param accessoryItemSalesItemList the accessoryItemSalesItemList to set
     */
    public void setAccessoryItemSalesItemList(List<AccessoryItemSalesItemVO> accessoryItemSalesItemList) {
        this.accessoryItemSalesItemList = accessoryItemSalesItemList;
    }

}
