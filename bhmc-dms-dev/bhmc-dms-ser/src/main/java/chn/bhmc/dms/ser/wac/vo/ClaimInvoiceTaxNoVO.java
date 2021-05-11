package chn.bhmc.dms.ser.wac.vo;


import chn.bhmc.dms.core.datatype.BaseVO;
/**
 * 
 *<p>Title:索赔发票纳税人识别号和抬头实体类</p>
 * @author yixd
 * @param
 * @return
 */
public class ClaimInvoiceTaxNoVO extends BaseVO{
   
	private static final long serialVersionUID = -3856057451369963225L;

	 /**
     * 纳税人识别号
     */
    private String taxNo;

    /**
     * 发票抬头
     */
    private String buyNm;

	public String getTaxNo() {
		return taxNo;
	}

	public void setTaxNo(String taxNo) {
		this.taxNo = taxNo;
	}

	public String getBuyNm() {
		return buyNm;
	}

	public void setBuyNm(String buyNm) {
		this.buyNm = buyNm;
	}
    
    

}