package chn.bhmc.dms.cmm.mig.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MigCheckSearchVO
 * @Description : 클래스 설명을 기술합니다.
 * @author Lee In Moon
 * @since 2017.08.28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017.08.28.     Lee In Moon     최초 생성
 * </pre>
 */

public class MigCheckSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -3479799379838325086L;
    /**
     * Statements
     * (long)serialVersionUID
     */

    private String sDlrCd;
    private String sChkNm;
    private String sChkTp;
    private String sTblNm;
    private String sColNm;
    private String sChkRsltTp;
    private String sErrCd;
    private String sMsg;
    private int sCnt;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRegStartDt;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRegEndDt;

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
     * @return the sChkNm
     */
    public String getsChkNm() {
        return sChkNm;
    }

    /**
     * @param sChkNm the sChkNm to set
     */
    public void setsChkNm(String sChkNm) {
        this.sChkNm = sChkNm;
    }

    /**
     * @return the sChkTp
     */
    public String getsChkTp() {
        return sChkTp;
    }

    /**
     * @param sChkTp the sChkTp to set
     */
    public void setsChkTp(String sChkTp) {
        this.sChkTp = sChkTp;
    }

    /**
     * @return the sTblNm
     */
    public String getsTblNm() {
        return sTblNm;
    }

    /**
     * @param sTblNm the sTblNm to set
     */
    public void setsTblNm(String sTblNm) {
        this.sTblNm = sTblNm;
    }

    /**
     * @return the sColNm
     */
    public String getsColNm() {
        return sColNm;
    }

    /**
     * @param sColNm the sColNm to set
     */
    public void setsColNm(String sColNm) {
        this.sColNm = sColNm;
    }

    /**
     * @return the sChkRsltTp
     */
    public String getsChkRsltTp() {
        return sChkRsltTp;
    }

    /**
     * @param sChkRsltTp the sChkRsltTp to set
     */
    public void setsChkRsltTp(String sChkRsltTp) {
        this.sChkRsltTp = sChkRsltTp;
    }

    /**
     * @return the sErrCd
     */
    public String getsErrCd() {
        return sErrCd;
    }

    /**
     * @param sErrCd the sErrCd to set
     */
    public void setsErrCd(String sErrCd) {
        this.sErrCd = sErrCd;
    }

    /**
     * @return the sMsg
     */
    public String getsMsg() {
        return sMsg;
    }

    /**
     * @param sMsg the sMsg to set
     */
    public void setsMsg(String sMsg) {
        this.sMsg = sMsg;
    }

    /**
     * @return the sCnt
     */
    public int getsCnt() {
        return sCnt;
    }

    /**
     * @param sCnt the sCnt to set
     */
    public void setsCnt(int sCnt) {
        this.sCnt = sCnt;
    }

    /**
     * @return the sRegStartDt
     */
    public Date getsRegStartDt() {
        return sRegStartDt;
    }

    /**
     * @param sRegStartDt the sRegStartDt to set
     */
    public void setsRegStartDt(Date sRegStartDt) {
        this.sRegStartDt = sRegStartDt;
    }

    /**
     * @return the sRegEndDt
     */
    public Date getsRegEndDt() {
        return sRegEndDt;
    }

    /**
     * @param sRegEndDt the sRegEndDt to set
     */
    public void setsRegEndDt(Date sRegEndDt) {
        this.sRegEndDt = sRegEndDt;
    }

}