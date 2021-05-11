package chn.bhmc.dms.par.pcm.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ReceiveEtcVO.java
 * @Description : ReceiveEtcVO.class
 * @author Ju Won Lee
 * @since 2016. 2. 3.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 3.     Ju Won Lee     최초 생성
 * </pre>
 */

public class ReceiveEtcInitProcedureVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6874915890492180589L;
    private String inDlrCd;
    private String inDocNo;
    private String inUsrId;
    private String inCallMode;
    private String inPrCallId;
    private String inDebugMod;
    private int returnVal;
    /**
     * @return the inDlrCd
     */
    public String getInDlrCd() {
        return inDlrCd;
    }
    /**
     * @param inDlrCd the inDlrCd to set
     */
    public void setInDlrCd(String inDlrCd) {
        this.inDlrCd = inDlrCd;
    }
    /**
     * @return the inDocNo
     */
    public String getInDocNo() {
        return inDocNo;
    }
    /**
     * @param inDocNo the inDocNo to set
     */
    public void setInDocNo(String inDocNo) {
        this.inDocNo = inDocNo;
    }
    /**
     * @return the inUsrId
     */
    public String getInUsrId() {
        return inUsrId;
    }
    /**
     * @param inUsrId the inUsrId to set
     */
    public void setInUsrId(String inUsrId) {
        this.inUsrId = inUsrId;
    }
    /**
     * @return the inCallMode
     */
    public String getInCallMode() {
        return inCallMode;
    }
    /**
     * @param inCallMode the inCallMode to set
     */
    public void setInCallMode(String inCallMode) {
        this.inCallMode = inCallMode;
    }
    /**
     * @return the inPrCallId
     */
    public String getInPrCallId() {
        return inPrCallId;
    }
    /**
     * @param inPrCallId the inPrCallId to set
     */
    public void setInPrCallId(String inPrCallId) {
        this.inPrCallId = inPrCallId;
    }
    /**
     * @return the inDebugMod
     */
    public String getInDebugMod() {
        return inDebugMod;
    }
    /**
     * @param inDebugMod the inDebugMod to set
     */
    public void setInDebugMod(String inDebugMod) {
        this.inDebugMod = inDebugMod;
    }
    /**
     * @return the returnVal
     */
    public int getReturnVal() {
        return returnVal;
    }
    /**
     * @param returnVal the returnVal to set
     */
    public void setReturnVal(int returnVal) {
        this.returnVal = returnVal;
    }




}
