package chn.bhmc.dms.ser.ro.vo;

import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.ser.cmm.vo.TabInfoSaveVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RepairOrderSaveVO.java
 * @Description : RO save VO
 * @author KyungMok Kim
 * @since 2016. 3. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 14.    KyungMok Kim     최초 생성
 * </pre>
 */

@ValidDescriptor({

})
public class RepairOrderSaveVO extends TabInfoSaveVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2203335642180747165L;

    RepairOrderVO repairOrderReceiptVO;

    //判断是否需要发送索赔app申请
    private String custConfirmYn;

    /**
     * @return the repairOrderReceiptVO
     */
    public RepairOrderVO getRepairOrderVO() {
        return repairOrderReceiptVO;
    }

    /**
     * @param repairOrderReceiptVO the repairOrderReceiptVO to set
     */
    public void setRepairOrderVO(RepairOrderVO repairOrderReceiptVO) {
        this.repairOrderReceiptVO = repairOrderReceiptVO;
    }

	public String getCustConfirmYn() {
		return custConfirmYn;
	}

	public void setCustConfirmYn(String custConfirmYn) {
		this.custConfirmYn = custConfirmYn;
	}
    
    

}