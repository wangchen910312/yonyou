package chn.bhmc.dms.par.pmm.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * 부품기본정보 부품유형 정보 저장 VO
 *
 * @ClassName   : ItemMasterSaveVO.java
 * @Description : ItemMasterSaveVO Class
 * @author In Bo Shim
 * @since 2016. 8. 05.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 05.     In Bo Shim     최초 생성
 * </pre>
 */

public class ItemMasterSaveVO {

    /**
     * 부품마스터 기본정보 VO
     **/
    private ItemMasterVO saveVO;

    /**
     * 부품마스터 부품유형 목록 VO
     **/
    private BaseSaveVO<ItemGroupLevelVO> itemMasterGroupVOList;

    /**
     * @return the saveVO
     */
    public ItemMasterVO getSaveVO() {
        return saveVO;
    }

    /**
     * @param saveVO the saveVO to set
     */
    public void setSaveVO(ItemMasterVO saveVO) {
        this.saveVO = saveVO;
    }

    /**
     * @return the itemMasterGroupVOList
     */
    public BaseSaveVO<ItemGroupLevelVO> getItemMasterGroupVOList() {
        return itemMasterGroupVOList;
    }

    /**
     * @param itemMasterGroupVOList the itemMasterGroupVOList to set
     */
    public void setItemMasterGroupVOList(BaseSaveVO<ItemGroupLevelVO> itemMasterGroupVOList) {
        this.itemMasterGroupVOList = itemMasterGroupVOList;
    }
}
