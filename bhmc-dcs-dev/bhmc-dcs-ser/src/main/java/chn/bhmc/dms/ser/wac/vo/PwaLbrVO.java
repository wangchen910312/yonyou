package chn.bhmc.dms.ser.wac.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PwaLbrVO.java
 * @Description : PWA 공임 VO
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

public class PwaLbrVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = 2210089230968239581L;
    
    /**
     * 딜러코드
     */
    private String dlrCd;
    
    /**
     * LINE NO
     */
    private int lineNo;
    
    /**
     * PWA 번호
     */
    private String pwaDocNo;
    /**
     * 공임번호
     */
    private String lbrCd;
    /**
     * 공임명
     */
    private String lbrNm;
    /**
     * 시간당금액
     */
    private Double lbrHm;
    /**
     * 단가
     */
    private Double lbrPrc;
    /**
     * 금액
     */
    private Double lbrAmt;
    
    /**
     * 보증 RATE
     */
    private Double lbrWart;
    
    /**
     * 페인트RATE
     */
    private Double lbrPaint;
    
    /**
     * 수량
     */
    private int lbrQty;
     
    
    private String cauLbrYn;
    
    private int seq; 
    
    
    /**
     * @return the cauLbrYn
     */
    public String getCauLbrYn() {
        return cauLbrYn;
    }
    /**
     * @param cauLbrYn the cauLbrYn to set
     */
    public void setCauLbrYn(String cauLbrYn) {
        this.cauLbrYn = cauLbrYn;
    }
    /**
     * @return the lbrQty
     */
    public int getLbrQty() {
        return lbrQty;
    }
    /**
     * @param lbrQty the lbrQty to set
     */
    public void setLbrQty(int lbrQty) {
        this.lbrQty = lbrQty;
    }
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
     * @return the lbrCd
     */
    public String getLbrCd() {
        return lbrCd;
    }
    
    /**
     * @return the lbrNm
     */
    public String getLbrNm() {
        return lbrNm;
    }
    /**
     * @param lbrNm the lbrNm to set
     */
    public void setLbrNm(String lbrNm) {
        this.lbrNm = lbrNm;
    }
    /**
     * @param lbrCd the lbrCd to set
     */
    public void setLbrCd(String lbrCd) {
        this.lbrCd = lbrCd;
    }

    /**
     * @return the lbrHm
     */
    public Double getLbrHm() {
        return lbrHm;
    }
    /**
     * @param lbrHm the lbrHm to set
     */
    public void setLbrHm(Double lbrHm) {
        this.lbrHm = lbrHm;
    }
    /**
     * @return the lbrPrc
     */
    public Double getLbrPrc() {
        return lbrPrc;
    }
    /**
     * @param lbrPrc the lbrPrc to set
     */
    public void setLbrPrc(Double lbrPrc) {
        this.lbrPrc = lbrPrc;
    }
    /**
     * @return the lbrAmt
     */
    public Double getLbrAmt() {
        return lbrAmt;
    }
    /**
     * @param lbrAmt the lbrAmt to set
     */
    public void setLbrAmt(Double lbrAmt) {
        this.lbrAmt = lbrAmt;
    }
    /**
     * @return the lbrWart
     */
    public Double getLbrWart() {
        return lbrWart;
    }
    /**
     * @param lbrWart the lbrWart to set
     */
    public void setLbrWart(Double lbrWart) {
        this.lbrWart = lbrWart;
    }
    /**
     * @return the lbrPaint
     */
    public Double getLbrPaint() {
        return lbrPaint;
    }
    /**
     * @param lbrPaint the lbrPaint to set
     */
    public void setLbrPaint(Double lbrPaint) {
        this.lbrPaint = lbrPaint;
    }
    
    public int getSeq() {
        return seq;
    }
    public void setSeq(int seq) {
        this.seq = seq;
    }
    

}
