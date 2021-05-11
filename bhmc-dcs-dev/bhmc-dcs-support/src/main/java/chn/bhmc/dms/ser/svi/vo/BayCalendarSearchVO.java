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
     * bayNo
     */
    private String sBayNo;


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



}
