package chn.bhmc.dms.sal.obt.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CmpCarRunMngSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim yewon
 * @since 2016. 4. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 22.      Kim yewon              최초 생성
 * </pre>
 */

public class VehicleObtainReqSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;

    private String sSaleDlrDistCd;                  //심사지역
    private String sDlrCd;                          //딜러코드
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStartReqDt;                       //신청일 - 시작일
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndReqDt;                         //신청일 - 종료일
    private String sReqStatCd;                      //상태
    private String sEvalRsltYn;                     //심사결과




    /**
     * @return the sStartReqDt
     */
    public Date getsStartReqDt() {
        return sStartReqDt;
    }
    /**
     * @param sStartReqDt the sStartReqDt to set
     */
    public void setsStartReqDt(Date sStartReqDt) {
        this.sStartReqDt = sStartReqDt;
    }
    /**
     * @return the sEndReqDt
     */
    public Date getsEndReqDt() {
        return sEndReqDt;
    }
    /**
     * @param sEndReqDt the sEndReqDt to set
     */
    public void setsEndReqDt(Date sEndReqDt) {
        this.sEndReqDt = sEndReqDt;
    }
    /**
     * @return the sSaleDlrDistCd
     */
    public String getsSaleDlrDistCd() {
        return sSaleDlrDistCd;
    }
    /**
     * @param sSaleDlrDistCd the sSaleDlrDistCd to set
     */
    public void setsSaleDlrDistCd(String sSaleDlrDistCd) {
        this.sSaleDlrDistCd = sSaleDlrDistCd;
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
     * @return the sReqStatCd
     */
    public String getsReqStatCd() {
        return sReqStatCd;
    }
    /**
     * @param sReqStatCd the sReqStatCd to set
     */
    public void setsReqStatCd(String sReqStatCd) {
        this.sReqStatCd = sReqStatCd;
    }
    /**
     * @return the sEvalRsltYn
     */
    public String getsEvalRsltYn() {
        return sEvalRsltYn;
    }
    /**
     * @param sEvalRsltYn the sEvalRsltYn to set
     */
    public void setsEvalRsltYn(String sEvalRsltYn) {
        this.sEvalRsltYn = sEvalRsltYn;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }


}
