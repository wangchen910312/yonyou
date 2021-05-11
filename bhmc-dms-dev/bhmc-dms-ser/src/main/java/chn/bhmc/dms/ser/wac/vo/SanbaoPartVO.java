package chn.bhmc.dms.ser.wac.vo;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SanbaoPartVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 3. 21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 21.     Kwon Ki Hyun     최초 생성
 * </pre>
 */
@ValidDescriptor({
     @ValidField(field="vinNo", mesgKey="global.lbl.vinNo")
     ,@ValidField(field="parOrdNo", mesgKey="ser.lbl.parOrdNo")
     ,@ValidField(field="reqQty", mesgKey="ser.lbl.itemQty")
})
public class SanbaoPartVO extends BaseVO{
    
    
    
    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = -9148981350207862591L;

    /**
     * 딜러코드
     */
    private String dlrCd;
    
    /**
     * 문서번호 
     */
    private String docNo;
    
    /**
     * 차대번호
     */
    @NotEmpty
    private String vinNo;
    
    /**
     * 라인번호
     */
    private String lineNo;
    
    /**
     * 부품번호
     */
    @NotEmpty
    private String itemCd;
    
    /**
     * 부품명
     */
    private String itemNm;
    
    /**
     * 부품주문번호
     */
    @NotEmpty
    @Length(min=1, max=20)
    private String parOrdNo;
    
    /**
     * 부품수량
     */
    @Length(min=1, max=10)
    private Double reqQty;
    
    /**
     * 부품단위코드
     */
    private String saleUnitCd;
    
    /**
     * 부품단가
     */
    private Double salePrc;
    
    /**
     * 부품금액
     */
    private Double saleAmt;
    private String updtUserId;

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
     * @return the docNo
     */
    public String getDocNo() {
        return docNo;
    }

    /**
     * @param docNo the docNo to set
     */
    public void setDocNo(String docNo) {
        this.docNo = docNo;
    }

    /**
     * @return the vinNo
     */
    public String getVinNo() {
        return vinNo;
    }

    /**
     * @param vinNo the vinNo to set
     */
    public void setVinNo(String vinNo) {
        this.vinNo = vinNo;
    }

    /**
     * @return the lineNo
     */
    public String getLineNo() {
        return lineNo;
    }

    /**
     * @param lineNo the lineNo to set
     */
    public void setLineNo(String lineNo) {
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
     * @return the parOrdNo
     */
    public String getParOrdNo() {
        return parOrdNo;
    }

    /**
     * @param parOrdNo the parOrdNo to set
     */
    public void setParOrdNo(String parOrdNo) {
        this.parOrdNo = parOrdNo;
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
     * @return the salePrc
     */
    public Double getSalePrc() {
        return salePrc;
    }

    /**
     * @param salePrc the salePrc to set
     */
    public void setSalePrc(Double salePrc) {
        this.salePrc = salePrc;
    }

    /**
     * @return the saleAmt
     */
    public Double getSaleAmt() {
        return saleAmt;
    }

    /**
     * @param saleAmt the saleAmt to set
     */
    public void setSaleAmt(Double saleAmt) {
        this.saleAmt = saleAmt;
    }

    /**
     * @return the updtUserId
     */
    public String getUpdtUserId() {
        return updtUserId;
    }

    /**
     * @param updtUserId the updtUserId to set
     */
    public void setUpdtUserId(String updtUserId) {
        this.updtUserId = updtUserId;
    }
    
    
    
    

}
