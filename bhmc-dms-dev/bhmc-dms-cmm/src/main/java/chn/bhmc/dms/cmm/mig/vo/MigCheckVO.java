package chn.bhmc.dms.cmm.mig.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MigCheckVO
 * @Description : 클래스 설명을 기술합니다.
 * @author Lee In Moon
 * @since 2017.08.08.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017.08.08.     Lee In Moon     최초 생성
 * </pre>
 */

public class MigCheckVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2424508841330851197L;
    private int seq;
    private String dlrCd;
    private String chkNm;
    private String chkTp;
    private String tblNm;
    private String colNm;
    private String chkRsltTp;
    private String errCd;
    private String msg;
    private int cnt;
    /**
     * @return the seq
     */
    public int getSeq() {
        return seq;
    }
    /**
     * @param seq the seq to set
     */
    public void setSeq(int seq) {
        this.seq = seq;
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
     * @return the chkNm
     */
    public String getChkNm() {
        return chkNm;
    }
    /**
     * @param chkNm the chkNm to set
     */
    public void setChkNm(String chkNm) {
        this.chkNm = chkNm;
    }
    /**
     * @return the chkTp
     */
    public String getChkTp() {
        return chkTp;
    }
    /**
     * @param chkTp the chkTp to set
     */
    public void setChkTp(String chkTp) {
        this.chkTp = chkTp;
    }
    /**
     * @return the tblNm
     */
    public String getTblNm() {
        return tblNm;
    }
    /**
     * @param tblNm the tblNm to set
     */
    public void setTblNm(String tblNm) {
        this.tblNm = tblNm;
    }
    /**
     * @return the colNm
     */
    public String getColNm() {
        return colNm;
    }
    /**
     * @param colNm the colNm to set
     */
    public void setColNm(String colNm) {
        this.colNm = colNm;
    }
    /**
     * @return the chkRsltTp
     */
    public String getChkRsltTp() {
        return chkRsltTp;
    }
    /**
     * @param chkRsltTp the chkRsltTp to set
     */
    public void setChkRsltTp(String chkRsltTp) {
        this.chkRsltTp = chkRsltTp;
    }
    /**
     * @return the errCd
     */
    public String getErrCd() {
        return errCd;
    }
    /**
     * @param errCd the errCd to set
     */
    public void setErrCd(String errCd) {
        this.errCd = errCd;
    }
    /**
     * @return the msg
     */
    public String getMsg() {
        return msg;
    }
    /**
     * @param msg the msg to set
     */
    public void setMsg(String msg) {
        this.msg = msg;
    }
    /**
     * @return the cnt
     */
    public int getCnt() {
        return cnt;
    }
    /**
     * @param cnt the cnt to set
     */
    public void setCnt(int cnt) {
        this.cnt = cnt;
    }

}