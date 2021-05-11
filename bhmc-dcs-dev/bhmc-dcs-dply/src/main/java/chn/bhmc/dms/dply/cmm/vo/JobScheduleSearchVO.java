package chn.bhmc.dms.dply.cmm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : JobScheduleSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Cheolman Man Oh
 * @since 2016. 4. 21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 21.     Cheolman Man Oh     최초 생성
 * </pre>
 */

public class JobScheduleSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2750302649005333884L;

    /**
     * 스케줄명
     */
    private String sScheduleNm               ;

    /**
     * 스케줄유형코드
     */
    private String sScheduleTpCd             ;

    /**
     * 등록시작일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStartRegDt;

    /**
     * 등록종료일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndRegDt;

    /**
     * @param sScheduleNm the sScheduleNm to set
     */
    public void setsScheduleNm(String sScheduleNm) {
        this.sScheduleNm = sScheduleNm;
    }

    /**
     * @return the sScheduleNm
     */
    public String getsScheduleNm() {
        return sScheduleNm;
    }

    /**
     * @param sScheduleTpCd the sScheduleTpCd to set
     */
    public void setsScheduleTpCd(String sScheduleTpCd) {
        this.sScheduleTpCd = sScheduleTpCd;
    }

    /**
     * @return the sScheduleTpCd
     */
    public String getsScheduleTpCd() {
        return sScheduleTpCd;
    }

    /**
     * @param sStartRegDt the sStartRegDt to set
     */
    public void setsStartRegDt(Date sStartRegDt) {
        this.sStartRegDt = sStartRegDt;
    }

    /**
     * @return the sStartRegDt
     */
    public Date getsStartRegDt() {
        return sStartRegDt;
    }

    /**
     * @param sEndRegDt the sEndRegDt to set
     */
    public void setsEndRegDt(Date sEndRegDt) {
        this.sEndRegDt = sEndRegDt;
    }

    /**
     * @return the sEndRegDt
     */
    public Date getsEndRegDt() {
        return sEndRegDt;
    }


}
