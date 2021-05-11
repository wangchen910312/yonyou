package chn.bhmc.dms.ser.ro.vo;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;

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
public class RepairOrderSaveVO extends BaseSaveVO<Object>{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2203335642180747165L;

    RepairOrderVO repairOrderReceiptVO;

    List<RepairOrderPartVO> repairOrderPartSaveVO;

    List<RepairOrderLaborVO> repairOrderLaborSaveVO;

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

    /**
     * @return the repairOrderPartSaveVO
     */
    public List<RepairOrderPartVO> getRepairOrderPartSaveVO() {
        return repairOrderPartSaveVO;
    }

    /**
     * @param repairOrderPartSaveVO the repairOrderPartSaveVO to set
     */
    public void setRepairOrderPartSaveVO(List<RepairOrderPartVO> repairOrderPartSaveVO) {
        this.repairOrderPartSaveVO = repairOrderPartSaveVO;
    }

    /**
     * @return the repairOrderLaborSaveVO
     */
    public List<RepairOrderLaborVO> getRepairOrderLaborSaveVO() {
        return repairOrderLaborSaveVO;
    }

    /**
     * @param repairOrderLaborSaveVO the repairOrderLaborSaveVO to set
     */
    public void setRepairOrderLaborSaveVO(List<RepairOrderLaborVO> repairOrderLaborSaveVO) {
        this.repairOrderLaborSaveVO = repairOrderLaborSaveVO;
    }

}