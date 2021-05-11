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
public class PreRepairOrderSaveVO extends TabInfoSaveVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2203335642180747165L;

    private PreRepairOrderVO preRepairOrderVO;

    /**
     * @return the preRepairOrderVO
     */
    public PreRepairOrderVO getPreRepairOrderVO() {
        return preRepairOrderVO;
    }

    /**
     * @param preRepairOrderVO the preRepairOrderVO to set
     */
    public void setPreRepairOrderVO(PreRepairOrderVO preRepairOrderVO) {
        this.preRepairOrderVO = preRepairOrderVO;
    }

}