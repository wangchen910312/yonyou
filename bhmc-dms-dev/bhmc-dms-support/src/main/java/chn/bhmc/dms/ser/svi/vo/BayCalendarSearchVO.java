package chn.bhmc.dms.ser.svi.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BayCalendarSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 2. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 23.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public class BayCalendarSearchVO extends SearchVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1338281684841391085L;

    /**
     * 딜러번호
     */
    private String sDlrCd;

    /**
     * 년도
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sYear;

    /**
     * 예외시작일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sMngFromDt;

    /**
     * 예외종료일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sMngToDt;

    /**
     * 예외시작시간
     */
    private String sMngFromHm;

    /**
     * 예외종료시간
     */
    private String sMngToHm;

    /**
     * bayNo
     */
    private String sBayNo;

    /**
     * bayNm
     */
    private String sBayNm;
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
     * @return the sYear
     */
    public Date getsYear() {
        return sYear;
    }

    /**
     * @param sYear the sYear to set
     */
    public void setsYear(Date sYear) {
        this.sYear = sYear;
    }

    /**
     * @return the sBayNo
     */
    public String getsBayNo() {
        return sBayNo;
    }

    /**
     * @param sBayNo the sBayNo to set
     */
    public void setsBayNo(String sBayNo) {
        this.sBayNo = sBayNo;
    }

    /**
     * @return the sMngFromDt
     */
    public Date getsMngFromDt() {
        return sMngFromDt;
    }

    /**
     * @param sMngFromDt the sMngFromDt to set
     */
    public void setsMngFromDt(Date sMngFromDt) {
        this.sMngFromDt = sMngFromDt;
    }

    /**
     * @return the sMngToDt
     */
    public Date getsMngToDt() {
        return sMngToDt;
    }

    /**
     * @param sMngToDt the sMngToDt to set
     */
    public void setsMngToDt(Date sMngToDt) {
        this.sMngToDt = sMngToDt;
    }

    /**
     * @return the sMngFromHm
     */
    public String getsMngFromHm() {
        return sMngFromHm;
    }

    /**
     * @param sMngFromHm the sMngFromHm to set
     */
    public void setsMngFromHm(String sMngFromHm) {
        this.sMngFromHm = sMngFromHm;
    }

    /**
     * @return the sMngToHm
     */
    public String getsMngToHm() {
        return sMngToHm;
    }

    /**
     * @param sMngToHm the sMngToHm to set
     */
    public void setsMngToHm(String sMngToHm) {
        this.sMngToHm = sMngToHm;
    }

    /**
     * @return the sBayNm
     */
    public String getsBayNm() {
        return sBayNm;
    }

    /**
     * @param sBayNm the sBayNm to set
     */
    public void setsBayNm(String sBayNm) {
        this.sBayNm = sBayNm;
    }





}
