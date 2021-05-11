package chn.bhmc.dms.ser.svi.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * 서비스설정 VO
 * </pre>
 *
 * @ClassName   : ServiceSettingsVO.java
 * @Description : 서비스설정 VO.
 * @author Yin Xueyuan
 * @since 2016. 7. 07.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 07.     Yin Xueyuan     최초 생성
 * </pre>
 */

public class ServiceSettingVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 5800841956681934408L;

    /**
     * 딜러코드
     */
    private String dlrCd;

    /**
     * 보드기준설정코드
     */
    private String boardStdPrefCd;

    /**
     * 예약가용시작시간
     */
    private String resvAvlbStartHm;

    /**
     * 예약가용완료시간
     */
    private String resvAvlbEndHm;

    /**
     * 예약준수시간코드
     */
    private String resvKeepHmCd;

    /**
     * 예약미준수시간코드
     */
    private String resvNkeepHmCd;

    /**
     * 예약간격코드
     */
    private String resvIvalCd;

    /**
     * 다음보양 기준 월 코드
     */
    private String nextFreeHmCd;

    /**
     * 다음보양 주행거리 기준코드
     */
    private String nextFreeRunDistValCd;

    /**
     * 콜센터 전화
     */
    private String callCenTelNo;

    /**
     * 구급센터 전화
     */
    private String emgcCenTelNo;

    /**
     * 정비딜러 전화
     */
    private String serDlrTelNo;

    /**
     * 정비딜러 주소1명
     */
    private String serDlrAddr1Nm;

    /**
     * 정비예약알람
     */
    private String serResvAlarm;

    /**
     * 부품예약알람
     */
    private String partResvAlarm;

    /**
     * 사전점검알람
     */
    private String preChkAlarm;

    /**
     * 정비위탁알람
     */
    private String roAlarm;

    /**
     * 정비견적알람
     */
    private String estAlarm;

    /**
     * 서비스정산알람
     */
    private String calcAlarm;

    /**
     * 프린트지역유형
     */
    private String printAreaTp;

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
     * @return the boardStdPrefCd
     */
    public String getBoardStdPrefCd() {
        return boardStdPrefCd;
    }

    /**
     * @param boardStdPrefCd the boardStdPrefCd to set
     */
    public void setBoardStdPrefCd(String boardStdPrefCd) {
        this.boardStdPrefCd = boardStdPrefCd;
    }

    /**
     * @return the resvAvlbStartHm
     */
    public String getResvAvlbStartHm() {
        return resvAvlbStartHm;
    }

    /**
     * @param resvAvlbStartHm the resvAvlbStartHm to set
     */
    public void setResvAvlbStartHm(String resvAvlbStartHm) {
        this.resvAvlbStartHm = resvAvlbStartHm;
    }

    /**
     * @return the resvAvlbEndHm
     */
    public String getResvAvlbEndHm() {
        return resvAvlbEndHm;
    }

    /**
     * @param resvAvlbEndHm the resvAvlbEndHm to set
     */
    public void setResvAvlbEndHm(String resvAvlbEndHm) {
        this.resvAvlbEndHm = resvAvlbEndHm;
    }

    /**
     * @return the resvKeepHmCd
     */
    public String getResvKeepHmCd() {
        return resvKeepHmCd;
    }

    /**
     * @param resvKeepHmCd the resvKeepHmCd to set
     */
    public void setResvKeepHmCd(String resvKeepHmCd) {
        this.resvKeepHmCd = resvKeepHmCd;
    }

    /**
     * @return the resvNkeepHmCd
     */
    public String getResvNkeepHmCd() {
        return resvNkeepHmCd;
    }

    /**
     * @param resvNkeepHmCd the resvNkeepHmCd to set
     */
    public void setResvNkeepHmCd(String resvNkeepHmCd) {
        this.resvNkeepHmCd = resvNkeepHmCd;
    }

    /**
     * @return the resvIvalCd
     */
    public String getResvIvalCd() {
        return resvIvalCd;
    }

    /**
     * @param resvIvalCd the resvIvalCd to set
     */
    public void setResvIvalCd(String resvIvalCd) {
        this.resvIvalCd = resvIvalCd;
    }

    /**
     * @return the nextFreeHmCd
     */
    public String getNextFreeHmCd() {
        return nextFreeHmCd;
    }

    /**
     * @param nextFreeHmCd the nextFreeHmCd to set
     */
    public void setNextFreeHmCd(String nextFreeHmCd) {
        this.nextFreeHmCd = nextFreeHmCd;
    }

    /**
     * @return the nextFreeRunDistValCd
     */
    public String getNextFreeRunDistValCd() {
        return nextFreeRunDistValCd;
    }

    /**
     * @param nextFreeRunDistValCd the nextFreeRunDistValCd to set
     */
    public void setNextFreeRunDistValCd(String nextFreeRunDistValCd) {
        this.nextFreeRunDistValCd = nextFreeRunDistValCd;
    }

    /**
     * @param callCenTelNo the callCenTelNo to set
     */
    public void setCallCenTelNo(String callCenTelNo) {
        this.callCenTelNo = callCenTelNo;
    }

    /**
     * @return the callCenTelNo
     */
    public String getCallCenTelNo() {
        return callCenTelNo;
    }

    /**
     * @param emgcCenTelNo the emgcCenTelNo to set
     */
    public void setEmgcCenTelNo(String emgcCenTelNo) {
        this.emgcCenTelNo = emgcCenTelNo;
    }

    /**
     * @return the emgcCenTelNo
     */
    public String getEmgcCenTelNo() {
        return emgcCenTelNo;
    }

    /**
     * @param serDlrTelNo the serDlrTelNo to set
     */
    public void setSerDlrTelNo(String serDlrTelNo) {
        this.serDlrTelNo = serDlrTelNo;
    }

    /**
     * @return the serDlrTelNo
     */
    public String getSerDlrTelNo() {
        return serDlrTelNo;
    }

    /**
     * @param serDlrAddr1Nm the serDlrAddr1Nm to set
     */
    public void setSerDlrAddr1Nm(String serDlrAddr1Nm) {
        this.serDlrAddr1Nm = serDlrAddr1Nm;
    }

    /**
     * @return the serDlrAddr1Nm
     */
    public String getSerDlrAddr1Nm() {
        return serDlrAddr1Nm;
    }

    /**
     * @param serResvAlarm the serResvAlarm to set
     */
    public void setSerResvAlarm(String serResvAlarm) {
        this.serResvAlarm = serResvAlarm;
    }

    /**
     * @return the serResvAlarm
     */
    public String getSerResvAlarm() {
        return serResvAlarm;
    }

    /**
     * @param partResvAlarm the partResvAlarm to set
     */
    public void setPartResvAlarm(String partResvAlarm) {
        this.partResvAlarm = partResvAlarm;
    }

    /**
     * @return the partResvAlarm
     */
    public String getPartResvAlarm() {
        return partResvAlarm;
    }

    /**
     * @param preChkAlarm the preChkAlarm to set
     */
    public void setPreChkAlarm(String preChkAlarm) {
        this.preChkAlarm = preChkAlarm;
    }

    /**
     * @return the preChkAlarm
     */
    public String getPreChkAlarm() {
        return preChkAlarm;
    }

    /**
     * @param roAlarm the roAlarm to set
     */
    public void setRoAlarm(String roAlarm) {
        this.roAlarm = roAlarm;
    }

    /**
     * @return the roAlarm
     */
    public String getRoAlarm() {
        return roAlarm;
    }

    /**
     * @param estAlarm the estAlarm to set
     */
    public void setEstAlarm(String estAlarm) {
        this.estAlarm = estAlarm;
    }

    /**
     * @return the estAlarm
     */
    public String getEstAlarm() {
        return estAlarm;
    }

    /**
     * @param calcAlarm the calcAlarm to set
     */
    public void setCalcAlarm(String calcAlarm) {
        this.calcAlarm = calcAlarm;
    }

    /**
     * @return the calcAlarm
     */
    public String getCalcAlarm() {
        return calcAlarm;
    }

    /**
     * @param printAreaTp the printAreaTp to set
     */
    public void setPrintAreaTp(String printAreaTp) {
        this.printAreaTp = printAreaTp;
    }

    /**
     * @return the printAreaTp
     */
    public String getPrintAreaTp() {
        return printAreaTp;
    }


}
