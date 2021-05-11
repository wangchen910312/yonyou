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
 * @ClassName   : SanbaoReturnSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 7. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 27.     Kwon ki hyun     최초 생성
 * </pre>
 */

public class SanbaoReturnSearchVO extends SearchVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 8794990003146391147L;

    /**
     * 요청구분유형
     */
    private String sReqDstinTp;

    /**
     * 반품구분
     */
    private String sReturnDstinTp;

    /**
     * 딜러코드
     */
    private String sDlrCd;

    /**
     * 차대번호
     */
    private String sVinNo;

    /**
     * 라인번호
     */
    private int sLineNo;

    /**
     * 상태코드
     */
    private String sReturnStatCd;

    /**
     * 화면 ID
     */
    private String sPreFixId;

    /**
     * 시작일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sFromDt;

    /**
     * 조회일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sToDt;

    /**
     * @return the sReqDstinTp
     */
    public String getsReqDstinTp() {
        return sReqDstinTp;
    }

    /**
     * @param sReqDstinTp the sReqDstinTp to set
     */
    public void setsReqDstinTp(String sReqDstinTp) {
        this.sReqDstinTp = sReqDstinTp;
    }

    /**
     * @return the sReturnDstinTp
     */
    public String getsReturnDstinTp() {
        return sReturnDstinTp;
    }

    /**
     * @param sReturnDstinTp the sReturnDstinTp to set
     */
    public void setsReturnDstinTp(String sReturnDstinTp) {
        this.sReturnDstinTp = sReturnDstinTp;
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
     * @return the sReturnStatCd
     */
    public String getsReturnStatCd() {
        return sReturnStatCd;
    }

    /**
     * @param sReturnStatCd the sReturnStatCd to set
     */
    public void setsReturnStatCd(String sReturnStatCd) {
        this.sReturnStatCd = sReturnStatCd;
    }

    /**
     * @return the sLineNo
     */
    public int getsLineNo() {
        return sLineNo;
    }

    /**
     * @param sLineNo the sLineNo to set
     */
    public void setsLineNo(int sLineNo) {
        this.sLineNo = sLineNo;
    }

    /**
     * @return the sFromDt
     */
    public Date getsFromDt() {
        return sFromDt;
    }

    /**
     * @param sFromDt the sFromDt to set
     */
    public void setsFromDt(Date sFromDt) {
        this.sFromDt = sFromDt;
    }

    /**
     * @return the sToDt
     */
    public Date getsToDt() {
        return sToDt;
    }

    /**
     * @param sToDt the sToDt to set
     */
    public void setsToDt(Date sToDt) {
        this.sToDt = sToDt;
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
