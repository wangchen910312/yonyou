package chn.bhmc.dms.sal.ond.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

import chn.bhmc.dms.core.datatype.BaseSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LogisticsTpAddrReqSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author HG
 * @since 2017. 3. 3.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 3. 3.     HG                  최초 생성
 * </pre>
 */

public class LogisticsTpAddrReqSearchVO extends BaseSearchVO{
    
    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = -6784170501152779100L;

    private String sEvalRsltCd;
    
    private String sCompanyNm;
    
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStartReqDt;
    
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndReqDt;
    

    public String getsEvalRsltCd() {
        return sEvalRsltCd;
    }

    public void setsEvalRsltCd(String sEvalRsltCd) {
        this.sEvalRsltCd = sEvalRsltCd;
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
