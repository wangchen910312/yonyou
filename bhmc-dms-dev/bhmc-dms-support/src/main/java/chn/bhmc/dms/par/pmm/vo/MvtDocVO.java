package chn.bhmc.dms.par.pmm.vo;
import java.io.Serializable;
import java.util.Date;

public class MvtDocVO implements Serializable {

	/**
	 * 수불관리 헤더정보 (DT_PT_0007)
	 */
	private static final long serialVersionUID = -3060705617821900935L;

	/**
     * 저장 성공실패 여부
     **/
    private boolean resultYn;

    /**
     * 딜러코드
     **/
	private String dlrCd;

	/**
     * 수불문서일자
     **/
	private String mvtDocYyMm;

	/**
     * 수불문서번호
     **/
	private String mvtDocNo;

	/**
     * 전표처리일자
     **/
	private Date stmtProcDt;

	/**
     * 시스템처리일자
     **/
	private Date sysProcDt;

	/**
     * 수불유형
     **/
	private String mvtTp;

	/**
     * 수불입출고유형
     **/
	private String mvtGiGrTp;

	/**
     * 사업장코드
     **/
	private String bizAreaCd;

	/**
     * 거래처코드
     **/
	private String bpCd;

	/**
     * 고객번호
     **/
	private String custNo;

	/**
     * 전표텍스트
     **/
	private String stmtTxt;

	/**
     * 등록자ID
     **/
	private String regUsrId;

	/**
     * 수정자ID
     **/
	private String updtUsrId;

	/**
     * 문서번호수
     **/
	private Double docNoCnt;

	/**
     * 품목수
     **/
	private Double itemCnt;

	/**
     * 품목수량
     **/
	private Double itemQty;

	/**
     * 품목금액
     **/
	private Double itemAmt;

	/**
     * 수불구매금액
     **/
    private Double mvtItemAmt;

    /**
     * @return the resultYn
     */
    public boolean isResultYn() {
        return resultYn;
    }
    /**
     * @param resultYn the resultYn to set
     */
    public void setResultYn(boolean resultYn) {
        this.resultYn = resultYn;
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
     * @return the mvtDocYyMm
     */
    public String getMvtDocYyMm() {
        return mvtDocYyMm;
    }
    /**
     * @param mvtDocYyMm the mvtDocYyMm to set
     */
    public void setMvtDocYyMm(String mvtDocYyMm) {
        this.mvtDocYyMm = mvtDocYyMm;
    }
    /**
     * @return the mvtDocNo
     */
    public String getMvtDocNo() {
        return mvtDocNo;
    }
    /**
     * @param mvtDocNo the mvtDocNo to set
     */
    public void setMvtDocNo(String mvtDocNo) {
        this.mvtDocNo = mvtDocNo;
    }
    /**
     * @return the stmtProcDt
     */
    public Date getStmtProcDt() {
        return stmtProcDt;
    }
    /**
     * @param stmtProcDt the stmtProcDt to set
     */
    public void setStmtProcDt(Date stmtProcDt) {
        this.stmtProcDt = stmtProcDt;
    }
    /**
     * @return the sysProcDt
     */
    public Date getSysProcDt() {
        return sysProcDt;
    }
    /**
     * @param sysProcDt the sysProcDt to set
     */
    public void setSysProcDt(Date sysProcDt) {
        this.sysProcDt = sysProcDt;
    }
    /**
     * @return the mvtTp
     */
    public String getMvtTp() {
        return mvtTp;
    }
    /**
     * @param mvtTp the mvtTp to set
     */
    public void setMvtTp(String mvtTp) {
        this.mvtTp = mvtTp;
    }
    /**
     * @return the mvtGiGrTp
     */
    public String getMvtGiGrTp() {
        return mvtGiGrTp;
    }
    /**
     * @param mvtGiGrTp the mvtGiGrTp to set
     */
    public void setMvtGiGrTp(String mvtGiGrTp) {
        this.mvtGiGrTp = mvtGiGrTp;
    }
    /**
     * @return the bizAreaCd
     */
    public String getBizAreaCd() {
        return bizAreaCd;
    }
    /**
     * @param bizAreaCd the bizAreaCd to set
     */
    public void setBizAreaCd(String bizAreaCd) {
        this.bizAreaCd = bizAreaCd;
    }
    /**
     * @return the bpCd
     */
    public String getBpCd() {
        return bpCd;
    }
    /**
     * @param bpCd the bpCd to set
     */
    public void setBpCd(String bpCd) {
        this.bpCd = bpCd;
    }
    /**
     * @return the custNo
     */
    public String getCustNo() {
        return custNo;
    }
    /**
     * @param custNo the custNo to set
     */
    public void setCustNo(String custNo) {
        this.custNo = custNo;
    }
    /**
     * @return the stmtTxt
     */
    public String getStmtTxt() {
        return stmtTxt;
    }
    /**
     * @param stmtTxt the stmtTxt to set
     */
    public void setStmtTxt(String stmtTxt) {
        this.stmtTxt = stmtTxt;
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
     * @return the docNoCnt
     */
    public Double getDocNoCnt() {
        return docNoCnt;
    }
    /**
     * @param docNoCnt the docNoCnt to set
     */
    public void setDocNoCnt(Double docNoCnt) {
        this.docNoCnt = docNoCnt;
    }
    /**
     * @return the itemCnt
     */
    public Double getItemCnt() {
        return itemCnt;
    }
    /**
     * @param itemCnt the itemCnt to set
     */
    public void setItemCnt(Double itemCnt) {
        this.itemCnt = itemCnt;
    }
    /**
     * @return the itemQty
     */
    public Double getItemQty() {
        return itemQty;
    }
    /**
     * @param itemQty the itemQty to set
     */
    public void setItemQty(Double itemQty) {
        this.itemQty = itemQty;
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
     * @return the mvtItemAmt
     */
    public Double getMvtItemAmt() {
        return mvtItemAmt;
    }
    /**
     * @param mvtItemAmt the mvtItemAmt to set
     */
    public void setMvtItemAmt(Double mvtItemAmt) {
        this.mvtItemAmt = mvtItemAmt;
    }
}
