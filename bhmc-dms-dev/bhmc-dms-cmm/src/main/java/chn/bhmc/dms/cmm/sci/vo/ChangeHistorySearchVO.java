package chn.bhmc.dms.cmm.sci.vo;

import java.io.Serializable;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ChangeHistorySearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 5. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 12.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

public class ChangeHistorySearchVO extends SearchVO implements Serializable {
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5011969050344807368L;

    private String  sFlag;
    private String  sChgHisSeq;
    private String  sSysDstinCd;
    private String  sChgTp;
    private String  sChgStartDt;
    private String  sChgEndDt;
    private String  sChgUsrNm;
    /**
     * @return the sFlag
     */
    public String getsFlag() {
        return sFlag;
    }
    /**
     * @param sFlag the sFlag to set
     */
    public void setsFlag(String sFlag) {
        this.sFlag = sFlag;
    }
    /**
     * @return the sChgHisSeq
     */
    public String getsChgHisSeq() {
        return sChgHisSeq;
    }
    /**
     * @param sChgHisSeq the sChgHisSeq to set
     */
    public void setsChgHisSeq(String sChgHisSeq) {
        this.sChgHisSeq = sChgHisSeq;
    }
    /**
     * @return the sSysDstinCd
     */
    public String getsSysDstinCd() {
        return sSysDstinCd;
    }
    /**
     * @param sSysDstinCd the sSysDstinCd to set
     */
    public void setsSysDstinCd(String sSysDstinCd) {
        this.sSysDstinCd = sSysDstinCd;
    }
    /**
     * @return the sChgTp
     */
    public String getsChgTp() {
        return sChgTp;
    }
    /**
     * @param sChgTp the sChgTp to set
     */
    public void setsChgTp(String sChgTp) {
        this.sChgTp = sChgTp;
    }
    /**
     * @return the sChgStartDt
     */
    public String getsChgStartDt() {
        return sChgStartDt;
    }
    /**
     * @param sChgStartDt the sChgStartDt to set
     */
    public void setsChgStartDt(String sChgStartDt) {
        this.sChgStartDt = sChgStartDt;
    }
    /**
     * @return the sChgEndDt
     */
    public String getsChgEndDt() {
        return sChgEndDt;
    }
    /**
     * @param sChgEndDt the sChgEndDt to set
     */
    public void setsChgEndDt(String sChgEndDt) {
        this.sChgEndDt = sChgEndDt;
    }
    /**
     * @return the sChgUsrNm
     */
    public String getsChgUsrNm() {
        return sChgUsrNm;
    }
    /**
     * @param sChgUsrNm the sChgUsrNm to set
     */
    public void setsChgUsrNm(String sChgUsrNm) {
        this.sChgUsrNm = sChgUsrNm;
    }
}