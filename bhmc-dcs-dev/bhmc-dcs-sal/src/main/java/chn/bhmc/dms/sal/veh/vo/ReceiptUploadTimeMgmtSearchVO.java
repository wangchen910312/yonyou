package chn.bhmc.dms.sal.veh.vo;

import java.util.Date;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * 기준정보 > 영수증업로드시간대관리
 * </pre>
 *
 * @ClassName   : ReceiptUploadTimeMgmtSearchVO.java
 * @Description : 기준정보 > 영수증업로드시간대관리
 * @author chibeom.song
 * @since 2017. 2. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 26.     chibeom.song     최초 생성
 * </pre>
 */

public class ReceiptUploadTimeMgmtSearchVO extends SearchVO {
    
    private static final long serialVersionUID = -6023274259297438078L;
    
    // 검색조건
    private String sSaleDt;
    private String sReceiptTp;
    private String sDlrCd;
    private String langCd;
    
    // 내용
    private String rSeq;
    private String outYyyymm;
    private String receiptTp;
    private String upStdt;
    private String upEddt;
    private String controlSc;
    private String controlChk;
    private String dlrCd;
    private String dlrNm;
    private String useYn;
    private String regUsrId;
    private Date regDt;
    private String updtUsrId;
    private Date updtDt;
    
    /**
     * @return the sSaleDt
     */
    public String getsSaleDt() {
        return sSaleDt;
    }
    /**
     * @param sSaleDt the sSaleDt to set
     */
    public void setsSaleDt(String sSaleDt) {
        this.sSaleDt = sSaleDt;
    }
    /**
     * @return the sReceiptTp
     */
    public String getsReceiptTp() {
        return sReceiptTp;
    }
    /**
     * @param sReceiptTp the sReceiptTp to set
     */
    public void setsReceiptTp(String sReceiptTp) {
        this.sReceiptTp = sReceiptTp;
    }
    /**
     * @return the sDlrCd
     */
    public String getsDlrCd() {
        return sDlrCd;
    }
    /**
     * @param sDlrCd the sDlrCd to set
     */
    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }
    /**
     * @return the langCd
     */
    public String getLangCd() {
        return langCd;
    }
    /**
     * @param langCd the langCd to set
     */
    public void setLangCd(String langCd) {
        this.langCd = langCd;
    }
    /**
     * @return the rSeq
     */
    public String getrSeq() {
        return rSeq;
    }
    /**
     * @param rSeq the rSeq to set
     */
    public void setrSeq(String rSeq) {
        this.rSeq = rSeq;
    }
    /**
     * @return the outYyyymm
     */
    public String getOutYyyymm() {
        return outYyyymm;
    }
    /**
     * @param outYyyymm the outYyyymm to set
     */
    public void setOutYyyymm(String outYyyymm) {
        this.outYyyymm = outYyyymm;
    }
    /**
     * @return the receiptTp
     */
    public String getReceiptTp() {
        return receiptTp;
    }
    /**
     * @param receiptTp the receiptTp to set
     */
    public void setReceiptTp(String receiptTp) {
        this.receiptTp = receiptTp;
    }
    /**
     * @return the upStdt
     */
    public String getUpStdt() {
        return upStdt;
    }
    /**
     * @param upStdt the upStdt to set
     */
    public void setUpStdt(String upStdt) {
        this.upStdt = upStdt;
    }
    /**
     * @return the upEddt
     */
    public String getUpEddt() {
        return upEddt;
    }
    /**
     * @param upEddt the upEddt to set
     */
    public void setUpEddt(String upEddt) {
        this.upEddt = upEddt;
    }
    /**
     * @return the controlSc
     */
    public String getControlSc() {
        return controlSc;
    }
    /**
     * @param controlSc the controlSc to set
     */
    public void setControlSc(String controlSc) {
        this.controlSc = controlSc;
    }
    /**
     * @return the controlChk
     */
    public String getControlChk() {
        return controlChk;
    }
    /**
     * @param controlChk the controlChk to set
     */
    public void setControlChk(String controlChk) {
        this.controlChk = controlChk;
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
     * @return the dlrNm
     */
    public String getDlrNm() {
        return dlrNm;
    }
    /**
     * @param dlrNm the dlrNm to set
     */
    public void setDlrNm(String dlrNm) {
        this.dlrNm = dlrNm;
    }
    /**
     * @return the useYn
     */
    public String getUseYn() {
        return useYn;
    }
    /**
     * @param useYn the useYn to set
     */
    public void setUseYn(String useYn) {
        this.useYn = useYn;
    }
    /**
     * @return the regUsrId
     */
    public String getRegUsrId() {
        return regUsrId;
    }
    /**
     * @param regUsrId the regUsrId to set
     */
    public void setRegUsrId(String regUsrId) {
        this.regUsrId = regUsrId;
    }
    /**
     * @return the regDt
     */
    public Date getRegDt() {
        return regDt;
    }
    /**
     * @param regDt the regDt to set
     */
    public void setRegDt(Date regDt) {
        this.regDt = regDt;
    }
    /**
     * @return the updtUsrId
     */
    public String getUpdtUsrId() {
        return updtUsrId;
    }
    /**
     * @param updtUsrId the updtUsrId to set
     */
    public void setUpdtUsrId(String updtUsrId) {
        this.updtUsrId = updtUsrId;
    }
    /**
     * @return the updtDt
     */
    public Date getUpdtDt() {
        return updtDt;
    }
    /**
     * @param updtDt the updtDt to set
     */
    public void setUpdtDt(Date updtDt) {
        this.updtDt = updtDt;
    }
}
