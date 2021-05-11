package chn.bhmc.dms.ser.wac.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PwaItemVO.java
 * @Description : PWA 부품 VO
 * @author Kwon Ki Hyun
 * @since 2016. 2. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 26.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public class PwaPartVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = -8855811658161657073L;
    
    /**
     * 딜러코드
     */
    private String dlrCd;
    
    /**
     * PWA NO
     */
    private String pwaDocNo;
    
    /**
     * 부품SEQ
     */
    private int lineNo;
    
    /**
     * 부품코드
     */
    private String itemCd;
    
    /**
     * 부품명
     */
    private String itemNm;
    
    /**
     * 요청수량
     */
    private Double reqQty;
    
    /**
     * 판매단위코드
     */
    private String saleUnitCd;
    
    /**
     * 부품단가
     */
    private Double itemPrc;
    
    /**
     * 부품기본 금액
     */
    private Double salePrcAmt;
    
    /**
     * 부품금액
     */
    private Double itemAmt;
    
    /**
     * 부품 세금
     */
    private Double itemTax;
    
    /**
     * 부품 Markup
     */
    private Double itemMarkup;
    
    /**
     * 원인부품여부
     */
    private String cauItemYn;
    
    /**
     * NPN MAX AMT 
     **/
    private Double npnpMaxAmt; 
    
    /**
     * NPN Part YN
     */
    private String npnpYn; 
    
    /**
     * 税率 贾明 2019-3-25 为计算pwa申请配件项目 配件金额
     **/
    private  Double taxRate;

    public String getDlrCd() {
        return dlrCd;
    }

    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    public String getPwaDocNo() {
        return pwaDocNo;
    }

    public void setPwaDocNo(String pwaDocNo) {
        this.pwaDocNo = pwaDocNo;
    }

    public int getLineNo() {
        return lineNo;
    }

    public void setLineNo(int lineNo) {
        this.lineNo = lineNo;
    }

    public String getItemCd() {
        return itemCd;
    }

    public void setItemCd(String itemCd) {
        this.itemCd = itemCd;
    }

    public String getItemNm() {
        return itemNm;
    }

    public void setItemNm(String itemNm) {
        this.itemNm = itemNm;
    }

    public Double getReqQty() {
        return reqQty;
    }

    public void setReqQty(Double reqQty) {
        this.reqQty = reqQty;
    }

    public String getSaleUnitCd() {
        return saleUnitCd;
    }

    public void setSaleUnitCd(String saleUnitCd) {
        this.saleUnitCd = saleUnitCd;
    }

    public Double getItemPrc() {
        return itemPrc;
    }

    public void setItemPrc(Double itemPrc) {
        this.itemPrc = itemPrc;
    }

    public Double getSalePrcAmt() {
        return salePrcAmt;
    }

    public void setSalePrcAmt(Double salePrcAmt) {
        this.salePrcAmt = salePrcAmt;
    }

    public Double getItemAmt() {
        return itemAmt;
    }

    public void setItemAmt(Double itemAmt) {
        this.itemAmt = itemAmt;
    }

    public Double getItemTax() {
        return itemTax;
    }

    public void setItemTax(Double itemTax) {
        this.itemTax = itemTax;
    }

    public Double getItemMarkup() {
        return itemMarkup;
    }

    public void setItemMarkup(Double itemMarkup) {
        this.itemMarkup = itemMarkup;
    }

    public String getCauItemYn() {
        return cauItemYn;
    }

    public void setCauItemYn(String cauItemYn) {
        this.cauItemYn = cauItemYn;
    }

    public Double getNpnpMaxAmt() {
        return npnpMaxAmt;
    }

    public void setNpnpMaxAmt(Double npnpMaxAmt) {
        this.npnpMaxAmt = npnpMaxAmt;
    }

    public String getNpnpYn() {
        return npnpYn;
    }

    public void setNpnpYn(String npnpYn) {
        this.npnpYn = npnpYn;
    }

	public Double getTaxRate() {
		return taxRate;
	}

	public void setTaxRate(Double taxRate) {
		this.taxRate = taxRate;
	}
    

}
