package chn.bhmc.dms.ser.wac.vo;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName : ClaimInvoiceEditVO.java
 * @Description : 索赔发票编辑Map
 * @author lixinfei
 * @since 2021. 04. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *  since           author      description 
 * =========== ============= ===========================
 * 2021. 04. 12.  lixinfei      索赔发票编辑Map
 * </pre>
 */
public class ClaimInvoiceEditMap extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = -4029666890814458457L;
    
    /**
     * 存放待更新发票数组
     */
    private List<ClaimInvoiceEditVO> updatedList;

    public List<ClaimInvoiceEditVO> getUpdatedList() {
        return updatedList;
    }

    public void setUpdatedList(List<ClaimInvoiceEditVO> updatedList) {
        this.updatedList = updatedList;
    }
    
}
