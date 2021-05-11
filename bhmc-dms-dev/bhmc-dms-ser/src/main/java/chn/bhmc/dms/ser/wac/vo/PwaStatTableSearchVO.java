package chn.bhmc.dms.ser.wac.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PwaStatTableSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 5. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 17.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public class PwaStatTableSearchVO extends SearchVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 5999009452722434535L;

    /**
     * 딜러코드
     */
    private String sDlrCd;

    /**
     * PWA 시작일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sPwaFromDt;

    /**
     * PWA 종료일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sPwaToDt;

    /**
     * PWA 번호
     */
    private String sPwaDocNo;

    /**
     * PWA 상태코드
     */
    private String sPwaStatCd;

    /**
     * VIN 번호
     */
    private String sVinNo;

    private String langCd;        // 언어코드





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
     * @return the sPwaFromDt
     */
    public Date getsPwaFromDt() {
        return sPwaFromDt;
    }

    /**
     * @param sPwaFromDt the sPwaFromDt to set
     */
    public void setsPwaFromDt(Date sPwaFromDt) {
        this.sPwaFromDt = sPwaFromDt;
    }

    /**
     * @return the sPwaToDt
     */
    public Date getsPwaToDt() {
        return sPwaToDt;
    }

    /**
     * @param sPwaToDt the sPwaToDt to set
     */
    public void setsPwaToDt(Date sPwaToDt) {
        this.sPwaToDt = sPwaToDt;
    }

    /**
     * @return the sPwaDocNo
     */
    public String getsPwaDocNo() {
        return sPwaDocNo;
    }

    /**
     * @param sPwaDocNo the sPwaDocNo to set
     */
    public void setsPwaDocNo(String sPwaDocNo) {
        this.sPwaDocNo = sPwaDocNo;
    }

    /**
     * @return the sPwaStatCd
     */
    public String getsPwaStatCd() {
        return sPwaStatCd;
    }

    /**
     * @param sPwaStatCd the sPwaStatCd to set
     */
    public void setsPwaStatCd(String sPwaStatCd) {
        this.sPwaStatCd = sPwaStatCd;
    }

    /**
     * @return the langCd
     */
    public String getLangCd() {
        return langCd;
    }

    /**
     * @param langCd the langCd to set
     */
    public void setLangCd(String langCd) {
        this.langCd = langCd;
    }

    /**
     * @param sVinNo the sVinNo to set
     */
    public void setsVinNo(String sVinNo) {
        this.sVinNo = sVinNo;
    }

    /**
     * @return the sVinNo
     */
    public String getsVinNo() {
        return sVinNo;
    }
}