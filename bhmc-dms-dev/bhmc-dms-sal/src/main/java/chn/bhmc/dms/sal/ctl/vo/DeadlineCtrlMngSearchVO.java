package chn.bhmc.dms.sal.ctl.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DeadlineCtrlMngSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim yewon
 * @since 2016. 4. 28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 28.      Kim yewon              최초 생성
 * </pre>
 */

public class DeadlineCtrlMngSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;


    private String sCtrlYyMmDt;                          //통제년월
    private String sCtrlGrpCd;                           //통제그룹
    private String sCtrlTargCd;                          //통제대상
    private String sCtrlSeq;                             //통제일련번호
    private String sCtrlDlrCd;                           //통제딜러코드





    /**
     * @return the sCtrlSeq
     */
    public String getsCtrlSeq() {
        return sCtrlSeq;
    }
    /**
     * @param sCtrlSeq the sCtrlSeq to set
     */
    public void setsCtrlSeq(String sCtrlSeq) {
        this.sCtrlSeq = sCtrlSeq;
    }

    /**
     * @return the sCtrlDlrCd
     */
    public String getsCtrlDlrCd() {
        return sCtrlDlrCd;
    }
    /**
     * @param sCtrlDlrCd the sCtrlDlrCd to set
     */
    public void setsCtrlDlrCd(String sCtrlDlrCd) {
        this.sCtrlDlrCd = sCtrlDlrCd;
    }
    /**
     * @return the sCtrlYyMmDt
     */
    public String getsCtrlYyMmDt() {
        return sCtrlYyMmDt;
    }
    /**
     * @param sCtrlYyMmDt the sCtrlYyMmDt to set
     */
    public void setsCtrlYyMmDt(String sCtrlYyMmDt) {
        this.sCtrlYyMmDt = sCtrlYyMmDt;
    }
    /**
     * @return the sCtrlGrpCd
     */
    public String getsCtrlGrpCd() {
        return sCtrlGrpCd;
    }
    /**
     * @param sCtrlGrpCd the sCtrlGrpCd to set
     */
    public void setsCtrlGrpCd(String sCtrlGrpCd) {
        this.sCtrlGrpCd = sCtrlGrpCd;
    }
    /**
     * @return the sCtrlTargCd
     */
    public String getsCtrlTargCd() {
        return sCtrlTargCd;
    }
    /**
     * @param sCtrlTargCd the sCtrlTargCd to set
     */
    public void setsCtrlTargCd(String sCtrlTargCd) {
        this.sCtrlTargCd = sCtrlTargCd;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }


}
