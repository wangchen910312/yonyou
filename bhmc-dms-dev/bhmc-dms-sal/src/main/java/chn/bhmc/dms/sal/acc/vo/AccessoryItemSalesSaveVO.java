package chn.bhmc.dms.sal.acc.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;



/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AccessoryItemSalesSaveVO
 * @Description : 용품판매정보 저장 VO
 * @author Kang Seok Han
 * @since 2017. 2. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2017. 2. 20.   Kang Seok Han    최초 생성
 * </pre>
 */

public class AccessoryItemSalesSaveVO extends BaseSaveVO<AccessoryItemSalesItemVO>{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1023602118356183049L;
    
    // 계약저장 시 true
    private boolean isContractSave = false;
    
    /**
     * 용품판매문서 정보
     */
    private AccessoryItemSalesVO accessoryItemSalesVO;

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
     * @return the isContractSave
     */
    public boolean isContractSave() {
        return isContractSave;
    }

    /**
     * @param isContractSave the isContractSave to set
     */
    public void setContractSave(boolean isContractSave) {
        this.isContractSave = isContractSave;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}
