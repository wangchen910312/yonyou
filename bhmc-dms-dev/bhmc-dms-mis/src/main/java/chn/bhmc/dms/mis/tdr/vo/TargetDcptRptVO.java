package chn.bhmc.dms.mis.tdr.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * 목표분해 보고서
 * </pre>
 *
 * @ClassName   : TargetDcptRptVO.java
 * @Description : 목표분해 보고서
 * @author chibeom.song
 * @since 2016. 9. 21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 21.   chibeom.song     최초 생성
 * </pre>
 */

public class TargetDcptRptVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6534031744201367732L;

    private String sDcptRptDate;
    private String sTimeRptProcess;
    private String sMonitorRptDate;

    /**
     * @return the sDcptRptDate
     */
    public String getsDcptRptDate() {
        return sDcptRptDate;
    }
    /**
     * @param sDcptRptDate the sDcptRptDate to set
     */
    public void setsDcptRptDate(String sDcptRptDate) {
        this.sDcptRptDate = sDcptRptDate;
    }
    /**
     * @return the sTimeRptProcess
     */
    public String getsTimeRptProcess() {
        return sTimeRptProcess;
    }
    /**
     * @param sTimeRptProcess the sTimeRptProcess to set
     */
    public void setsTimeRptProcess(String sTimeRptProcess) {
        this.sTimeRptProcess = sTimeRptProcess;
    }
    /**
     * @return the sMonitorRptDate
     */
    public String getsMonitorRptDate() {
        return sMonitorRptDate;
    }
    /**
     * @param sMonitorRptDate the sMonitorRptDate to set
     */
    public void setsMonitorRptDate(String sMonitorRptDate) {
        this.sMonitorRptDate = sMonitorRptDate;
    }

}
