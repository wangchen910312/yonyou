package chn.bhmc.dms.ser.wac.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName : ClaimInvoiceRecSettlementVO.java
 * @Description : 索赔发票收款  结算单VO
 * @author lixinfei
 * @since 2021. 04. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *  since           author      description 
 * =========== ============= ===========================
 * 2021. 04. 12.  lixinfei      索赔发票收款 结算单VO
 * </pre>
 */
public class ClaimInvoiceRecSettlementSaveVO extends BaseVO{
    
    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = -4225466147005044977L;
    
    //索赔主单VO
    BaseSaveVO<ClaimInvoiceRecSettlementVO> claimInvoiceRecSettlementVO;

    
    public BaseSaveVO<ClaimInvoiceRecSettlementVO> getClaimInvoiceRecSettlementVO() {
        return claimInvoiceRecSettlementVO;
    }

    public void setClaimInvoiceRecSettlementVO(BaseSaveVO<ClaimInvoiceRecSettlementVO> claimInvoiceRecSettlementVO) {
        this.claimInvoiceRecSettlementVO = claimInvoiceRecSettlementVO;
    }

}
