package chn.bhmc.dms.ser.cmm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VehOfReseveInfoSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 4. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 20.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public class VehOfReseveInfoSearchVO extends SearchVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4843846446400512295L;

    /**
     * 차대번호
     */
    public String sVinNo;

    /**
     * 딜러번호
     */
    public String sDlrCd;

    /**
     * 예약번호
     */
    public String sResvDocNo;

    /**
     * 예약상태
     */
    public String sResvStatCd;

    /**
     * RO 상태
     */
    public String sRoStatCd;

    public String sPreFixId;

    /**
     * 정비예약 시작일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    public Date sSerResvStartDt;

    /**
     * @return the sVinNo
     */
    public String getsVinNo() {
        return sVinNo;
    }

    /**
     * @param sVinNo the sVinNo to set
     */
    public void setsVinNo(String sVinNo) {
        this.sVinNo = sVinNo;
    }

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
     * @return the sResvDocNo
     */
    public String getsResvDocNo() {
        return sResvDocNo;
    }

    /**
     * @param sResvDocNo the sResvDocNo to set
     */
    public void setsResvDocNo(String sResvDocNo) {
        this.sResvDocNo = sResvDocNo;
    }

    /**
     * @return the sResvStatCd
     */
    public String getsResvStatCd() {
        return sResvStatCd;
    }

    /**
     * @param sResvStatCd the sResvStatCd to set
     */
    public void setsResvStatCd(String sResvStatCd) {
        this.sResvStatCd = sResvStatCd;
    }

    /**
     * @return the sRoStatCd
     */
    public String getsRoStatCd() {
        return sRoStatCd;
    }

    /**
     * @param sRoStatCd the sRoStatCd to set
     */
    public void setsRoStatCd(String sRoStatCd) {
        this.sRoStatCd = sRoStatCd;
    }

    /**
     * @return the sSerResvStartDt
     */
    public Date getsSerResvStartDt() {
        return sSerResvStartDt;
    }

    /**
     * @param sSerResvStartDt the sSerResvStartDt to set
     */
    public void setsSerResvStartDt(Date sSerResvStartDt) {
        this.sSerResvStartDt = sSerResvStartDt;
    }

    /**
     * @return the sPreFixId
     */
    public String getsPreFixId() {
        return sPreFixId;
    }

    /**
     * @param sPreFixId the sPreFixId to set
     */
    public void setsPreFixId(String sPreFixId) {
        this.sPreFixId = sPreFixId;
    }

}
