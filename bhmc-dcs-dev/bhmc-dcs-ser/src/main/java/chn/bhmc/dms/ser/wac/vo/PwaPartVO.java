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
    
    private int seq; 
   

    /**
     * @return the itemTax
     */
    public Double getItemTax() {
        return itemTax;
    }

    /**
     * @param itemTax the itemTax to set
     */
    public void setItemTax(Double itemTax) {
        this.itemTax = itemTax;
    }

    /**
     * @return the itemMarkup
     */
    public Double getItemMarkup() {
        return itemMarkup;
    }

    /**
     * @param itemMarkup the itemMarkup to set
     */
    public void setItemMarkup(Double itemMarkup) {
        this.itemMarkup = itemMarkup;
    }



    /**
     * 원인부품여부
     */
    private String cauItemYn;
     
   
    /**
     * @return the dlrCd
     */
    public String getDlrCd() {
        return dlrCd;
    }

    /**
     * @param dlrCd the dlrCd to set
     */
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    /**
     * @return the pwaDocNo
     */
    public String getPwaDocNo() {
        return pwaDocNo;
    }

    /**
     * @param pwaDocNo the pwaDocNo to set
     */
    public void setPwaDocNo(String pwaDocNo) {
        this.pwaDocNo = pwaDocNo;
    }

    /**
     * @return the lineNo
     */
    public int getLineNo() {
        return lineNo;
    }

    /**
     * @param lineNo the lineNo to set
     */
    public void setLineNo(int lineNo) {
        this.lineNo = lineNo;
    }

    /**
     * @return the itemCd
     */
    public String getItemCd() {
        return itemCd;
    }

    /**
     * @param itemCd the itemCd to set
     */
    public void setItemCd(String itemCd) {
        this.itemCd = itemCd;
    }

    /**
     * @return the itemNm
     */
    public String getItemNm() {
        return itemNm;
    }

    /**
     * @param itemNm the itemNm to set
     */
    public void setItemNm(String itemNm) {
        this.itemNm = itemNm;
    }

    /**
     * @return the reqQty
     */
    public Double getReqQty() {
        return reqQty;
    }

    /**
     * @param reqQty the reqQty to set
     */
    public void setReqQty(Double reqQty) {
        this.reqQty = reqQty;
    }

    /**
     * @return the saleUnitCd
     */
    public String getSaleUnitCd() {
        return saleUnitCd;
    }

    /**
     * @param saleUnitCd the saleUnitCd to set
     */
    public void setSaleUnitCd(String saleUnitCd) {
        this.saleUnitCd = saleUnitCd;
    }

    /**
     * @return the itemPrc
     */
    public Double getItemPrc() {
        return itemPrc;
    }

    /**
     * @param itemPrc the itemPrc to set
     */
    public void setItemPrc(Double itemPrc) {
        this.itemPrc = itemPrc;
    }

    /**
     * @return the itemAmt
     */
    public Double getItemAmt() {
        return itemAmt;
    }

    /**
     * @param itemAmt the itemAmt to set
     */
    public void setItemAmt(Double itemAmt) {
        this.itemAmt = itemAmt;
    }

    /**
     * @return the cauItemYn
     */
    public String getCauItemYn() {
        return cauItemYn;
    }

    /**
     * @param cauItemYn the cauItemYn to set
     */
    public void setCauItemYn(String cauItemYn) {
        this.cauItemYn = cauItemYn;
    }

    public int getSeq() {
        return seq;
    }

    public void setSeq(int seq) {
        this.seq = seq;
    }
    

}
