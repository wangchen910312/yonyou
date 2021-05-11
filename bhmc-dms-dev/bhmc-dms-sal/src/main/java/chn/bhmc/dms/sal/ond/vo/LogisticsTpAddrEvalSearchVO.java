package chn.bhmc.dms.sal.ond.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseSearchVO;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LogisticsTpAddrEvalSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2017. 3. 8.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 3. 8.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public class LogisticsTpAddrEvalSearchVO extends BaseSearchVO{
    
    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = -8708230056922542487L;

    private String sRadio;
    
    private String sJunSangCd;
    
    private String sCompanyNm;
    
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStartReqDt;
    
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndReqDt;

    public String getsRadio() {
        return sRadio;
    }

    public void setsRadio(String sRadio) {
        this.sRadio = sRadio;
    }

    public String getsJunSangCd() {
        return sJunSangCd;
    }

    public void setsJunSangCd(String sJunSangCd) {
        this.sJunSangCd = sJunSangCd;
    }

    public String getsCompanyNm() {
        return sCompanyNm;
    }

    public void setsCompanyNm(String sCompanyNm) {
        this.sCompanyNm = sCompanyNm;
    }

    public Date getsStartReqDt() {
        return sStartReqDt;
    }

    public void setsStartReqDt(Date sStartReqDt) {
        this.sStartReqDt = sStartReqDt;
    }

    public Date getsEndReqDt() {
        return sEndReqDt;
    }

    public void setsEndReqDt(Date sEndReqDt) {
        this.sEndReqDt = sEndReqDt;
    }
    
    

}
