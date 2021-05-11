package chn.bhmc.dms.ser.wac.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName : ClaimInvoiceRecSettlementSearchVO.java
 * @Description : 索赔发票收款  结算单SearchVO
 * @author lixinfei
 * @since 2021. 04. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *  since           author      description 
 * =========== ============= ===========================
 * 2021. 04. 12.  lixinfei      索赔发票收款 结算单SearchVO
 * </pre>
 */
public class ClaimInvoiceRecSettlementSearchVO extends SearchVO{
    
    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = -4229966887008844167L;

    /**
     * SE_0960T DLR_CD经销商代码
     */
    private String sDlrCd;
    
    /**
     * SE_0930T INVC_NO结算报表号
     */
    private String sInvcNo;
    
    /**
     * SE_0960T PAYM_TP汇款状态  01(未汇款),02(已汇款),03(已收款)
     **/
    private String sPaymTp;
    
    /**
     * SE_0930T INVC_DT结算报表开始年月 
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sInvcStartDt;

    /**
     * SE_0930T INVC_DT结算报表结束年月 
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sInvcEndDt;
    
    
    public String getsDlrCd() {
        return sDlrCd;
    }

    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }

    public String getsInvcNo() {
        return sInvcNo;
    }

    public void setsInvcNo(String sInvcNo) {
        this.sInvcNo = sInvcNo;
    }

    public String getsPaymTp() {
        return sPaymTp;
    }

    public void setsPaymTp(String sPaymTp) {
        this.sPaymTp = sPaymTp;
    }

    public Date getsInvcStartDt() {
        return sInvcStartDt;
    }

    public void setsInvcStartDt(Date sInvcStartDt) {
        this.sInvcStartDt = sInvcStartDt;
    }

    public Date getsInvcEndDt() {
        return sInvcEndDt;
    }

    public void setsInvcEndDt(Date sInvcEndDt) {
        this.sInvcEndDt = sInvcEndDt;
    }

 

}
