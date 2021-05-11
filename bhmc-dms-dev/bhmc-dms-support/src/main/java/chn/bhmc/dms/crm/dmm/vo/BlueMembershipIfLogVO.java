package chn.bhmc.dms.crm.dmm.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName : BlueMembershipIfLogVO
 * @Description : 블루멤버십 IF LOG VO
 * @author Lee In Moon
 * @since 2017.03.03.
 * @version 1.0
 * @see
 * @Modification Information
 *
 *               <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017.03.03.     Lee In Moon     최초 생성
 * </pre>
 */

public class BlueMembershipIfLogVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -8817130645475573968L;

    private String dlrCd;
    private int bmIfLogSeq;
    private String bmIfId;
    private String bmIfParam;
    private String bmIfResult;
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
     * @return the bmIfId
     */
    public String getBmIfId() {
        return bmIfId;
    }
    /**
     * @param bmIfId the bmIfId to set
     */
    public void setBmIfId(String bmIfId) {
        this.bmIfId = bmIfId;
    }
    /**
     * @return the bmIfLogSeq
     */
    public int getBmIfLogSeq() {
        return bmIfLogSeq;
    }
    /**
     * @param bmIfLogSeq the bmIfLogSeq to set
     */
    public void setBmIfLogSeq(int bmIfLogSeq) {
        this.bmIfLogSeq = bmIfLogSeq;
    }
    /**
     * @return the bmIfParam
     */
    public String getBmIfParam() {
        return bmIfParam;
    }
    /**
     * @param bmIfParam the bmIfParam to set
     */
    public void setBmIfParam(String bmIfParam) {
        this.bmIfParam = bmIfParam;
    }
    /**
     * @return the bmIfResult
     */
    public String getBmIfResult() {
        return bmIfResult;
    }
    /**
     * @param bmIfResult the bmIfResult to set
     */
    public void setBmIfResult(String bmIfResult) {
        this.bmIfResult = bmIfResult;
    }
    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "BlueMembershipIfLogVO [dlrCd=" + dlrCd + ", bmIfLogSeq=" + bmIfLogSeq + ", bmIfId=" + bmIfId
                + ", bmIfParam=" + bmIfParam + ", bmIfResult=" + bmIfResult + "]";
    }
    
}
