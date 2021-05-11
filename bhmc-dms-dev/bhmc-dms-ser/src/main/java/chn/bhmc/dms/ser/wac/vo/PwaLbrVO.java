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

    /**
     * 주작업 여부
     */
    private String cauLbrYn;

    /**
     * 공임 구분코드
     */
    private String dstinCd;

    /**
     * 정비유형
     */
    private String lbrTp;

    /**
     * 공임코드유형
     */
    private String lbrCdTp;

    /**
     * 보조작업 연관 여부
     */
    private String relCauLbrYn;

    private String cauItemCd;

    private String cauItemNm;

    private String cauCd;

    private String cauNm;

    private String phenCd;

    private String phenNm;

    public String getDlrCd() {
        return dlrCd;
    }

    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    public int getLineNo() {
        return lineNo;
    }

    public void setLineNo(int lineNo) {
        this.lineNo = lineNo;
    }

    public String getPwaDocNo() {
        return pwaDocNo;
    }

    public void setPwaDocNo(String pwaDocNo) {
        this.pwaDocNo = pwaDocNo;
    }

    public String getLbrCd() {
        return lbrCd;
    }

    public void setLbrCd(String lbrCd) {
        this.lbrCd = lbrCd;
    }

    public String getLbrNm() {
        return lbrNm;
    }

    public void setLbrNm(String lbrNm) {
        this.lbrNm = lbrNm;
    }

    public Double getLbrHm() {
        return lbrHm;
    }

    public void setLbrHm(Double lbrHm) {
        this.lbrHm = lbrHm;
    }

    public Double getLbrPrc() {
        return lbrPrc;
    }

    public void setLbrPrc(Double lbrPrc) {
        this.lbrPrc = lbrPrc;
    }

    public Double getLbrAmt() {
        return lbrAmt;
    }

    public void setLbrAmt(Double lbrAmt) {
        this.lbrAmt = lbrAmt;
    }

    public Double getLbrWart() {
        return lbrWart;
    }

    public void setLbrWart(Double lbrWart) {
        this.lbrWart = lbrWart;
    }

    public Double getLbrPaint() {
        return lbrPaint;
    }

    public void setLbrPaint(Double lbrPaint) {
        this.lbrPaint = lbrPaint;
    }

    public int getLbrQty() {
        return lbrQty;
    }

    public void setLbrQty(int lbrQty) {
        this.lbrQty = lbrQty;
    }

    public String getCauLbrYn() {
        return cauLbrYn;
    }

    public void setCauLbrYn(String cauLbrYn) {
        this.cauLbrYn = cauLbrYn;
    }

    public String getRelCauLbrYn() {
        return relCauLbrYn;
    }

    public void setRelCauLbrYn(String relCauLbrYn) {
        this.relCauLbrYn = relCauLbrYn;
    }

    public String getDstinCd() {
        return dstinCd;
    }

    public void setDstinCd(String dstinCd) {
        this.dstinCd = dstinCd;
    }

    /**
     * @return the lbrTp
     */
    public String getLbrTp() {
        return lbrTp;
    }

    /**
     * @param lbrTp the lbrTp to set
     */
    public void setLbrTp(String lbrTp) {
        this.lbrTp = lbrTp;
    }

    /**
     * @return the lbrCdTp
     */
    public String getLbrCdTp() {
        return lbrCdTp;
    }

    /**
     * @param lbrCdTp the lbrCdTp to set
     */
    public void setLbrCdTp(String lbrCdTp) {
        this.lbrCdTp = lbrCdTp;
    }

    /**
     * @return the cauItemCd
     */
    public String getCauItemCd() {
        return cauItemCd;
    }

    /**
     * @param cauItemCd the cauItemCd to set
     */
    public void setCauItemCd(String cauItemCd) {
        this.cauItemCd = cauItemCd;
    }

    /**
     * @return the cauItemNm
     */
    public String getCauItemNm() {
        return cauItemNm;
    }

    /**
     * @param cauItemNm the cauItemNm to set
     */
    public void setCauItemNm(String cauItemNm) {
        this.cauItemNm = cauItemNm;
    }

    /**
     * @return the cauCd
     */
    public String getCauCd() {
        return cauCd;
    }

    /**
     * @param cauCd the cauCd to set
     */
    public void setCauCd(String cauCd) {
        this.cauCd = cauCd;
    }

    /**
     * @return the cauNm
     */
    public String getCauNm() {
        return cauNm;
    }

    /**
     * @param cauNm the cauNm to set
     */
    public void setCauNm(String cauNm) {
        this.cauNm = cauNm;
    }

    /**
     * @return the phenCd
     */
    public String getPhenCd() {
        return phenCd;
    }

    /**
     * @param phenCd the phenCd to set
     */
    public void setPhenCd(String phenCd) {
        this.phenCd = phenCd;
    }

    /**
     * @return the phenNm
     */
    public String getPhenNm() {
        return phenNm;
    }

    /**
     * @param phenNm the phenNm to set
     */
    public void setPhenNm(String phenNm) {
        this.phenNm = phenNm;
    }

}
