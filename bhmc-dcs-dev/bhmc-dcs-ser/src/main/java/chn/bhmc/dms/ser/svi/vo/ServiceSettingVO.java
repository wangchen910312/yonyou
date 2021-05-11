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




}
