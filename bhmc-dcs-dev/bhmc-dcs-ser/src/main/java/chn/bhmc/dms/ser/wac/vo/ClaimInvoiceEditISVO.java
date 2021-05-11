package chn.bhmc.dms.ser.wac.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName : ClaimInvoiceEditISVO.java
 * @Description : 索赔发票编辑接口VO
 * @author lixinfei
 * @since 2021. 04. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *  since           author      description 
 * =========== ============= ===========================
 * 2021. 04. 12.  lixinfei      索赔发票编辑VO
 * </pre>
 */
public class ClaimInvoiceEditISVO extends BaseVO{
    
    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = -4229156815208484164L;

    /**
     * 经销商代码
     **/
    private String dlrCd; 
    
    /**
     * 发票ID（接口表SA_0502_2IS的主键，可以从SA_0502T表中获取）
     **/
    private String receiptId;

    /**
     * 更新时间字符串
     **/
    private String updatedate; 
    
    /**
     * 创建时间字符串
     **/
    private String createdate; 

    
    
    public String getDlrCd() {
        return dlrCd;
    }

    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    public String getReceiptId() {
        return receiptId;
    }

    public void setReceiptId(String receiptId) {
        this.receiptId = receiptId;
    }

    public String getCreatedate() {
        return createdate;
    }

    public void setCreatedate(String createdate) {
        this.createdate = createdate;
    }

    public String getUpdatedate() {
        return updatedate;
    }

    public void setUpdatedate(String updatedate) {
        this.updatedate = updatedate;
    }

    

}
