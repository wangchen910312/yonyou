package chn.bhmc.dms.ser.ro.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ServiceAccountSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 10. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 10. 22.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public class ServiceAccountSearchVO extends SearchVO{


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -7920490230391297124L;
    private String                  sDlrCd;             // 딜러코드
    private String                  sDateTp;            // M : 월 / D : 일
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   sRegDt;             // 등록시작일자
    //private  String                   sRegDt;             // 등록시작일자
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
     * @return the sDateTp
     */
    public String getsDateTp() {
        return sDateTp;
    }
    /**
     * @param sDateTp the sDateTp to set
     */
    public void setsDateTp(String sDateTp) {
        this.sDateTp = sDateTp;
    }
    /**
     * @return the sRegDt
     */
    public Date getsRegDt() {
        return sRegDt;
    }
    /**
     * @param sRegDt the sRegDt to set
     */
    public void setsRegDt(Date sRegDt) {
        this.sRegDt = sRegDt;
    }

}
