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
 * @ClassName   : ClaimInfoStatusSearchVO.java
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

public class ClaimInfoStatusSearchVO extends SearchVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1122451698648042139L;

    /**
     * 딜러코드
     */
    private String sDlrCd;

    /**
     * RO 시작일자 FROM
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRoStartFromDt;

    /**
     * RO 시작일자 TO
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRoStartToDt;

    /**
     * 클레임 요청일자 FROM
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sClaimReqFromDt;

    /**
     * 클레임 요청일자 TO
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sClaimReqToDt;

    /**
     * RO 번호
     */
    private String sRoDocNo;

    /**
     * 클레임 상태코드
     */
    private String sClaimStatCd;

    private String langCd;        // 언어코드

    /**
     * 클레임유형
     */
    private String sClaimTp;

    /**
     * 빈번호
     */
    private String sVinNo;

    /**
     * 차량번호
     */
    private String sCarRegNo;




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
     * @return the sRoStartFromDt
     */
    public Date getsRoStartFromDt() {
        return sRoStartFromDt;
    }

    /**
     * @param sRoStartFromDt the sRoStartFromDt to set
     */
    public void setsRoStartFromDt(Date sRoStartFromDt) {
        this.sRoStartFromDt = sRoStartFromDt;
    }

    /**
     * @return the sRoStartToDt
     */
    public Date getsRoStartToDt() {
        return sRoStartToDt;
    }

    /**
     * @param sRoStartToDt the sRoStartToDt to set
     */
    public void setsRoStartToDt(Date sRoStartToDt) {
        this.sRoStartToDt = sRoStartToDt;
    }

    /**
     * @return the sRoDocNo
     */
    public String getsRoDocNo() {
        return sRoDocNo;
    }

    /**
     * @param sRoDocNo the sRoDocNo to set
     */
    public void setsRoDocNo(String sRoDocNo) {
        this.sRoDocNo = sRoDocNo;
    }

    /**
     * @return the sClaimStatCd
     */
    public String getsClaimStatCd() {
        return sClaimStatCd;
    }

    /**
     * @param sClaimStatCd the sClaimStatCd to set
     */
    public void setsClaimStatCd(String sClaimStatCd) {
        this.sClaimStatCd = sClaimStatCd;
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
     * @return the sClaimTp
     */
    public String getsClaimTp() {
        return sClaimTp;
    }

    /**
     * @param sClaimTp the sClaimTp to set
     */
    public void setsClaimTp(String sClaimTp) {
        this.sClaimTp = sClaimTp;
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
     * @return the sCarRegNo
     */
    public String getsCarRegNo() {
        return sCarRegNo;
    }

    /**
     * @param sCarRegNo the sCarRegNo to set
     */
    public void setsCarRegNo(String sCarRegNo) {
        this.sCarRegNo = sCarRegNo;
    }

    /**
     * @param sClaimReqFromDt the sClaimReqFromDt to set
     */
    public void setsClaimReqFromDt(Date sClaimReqFromDt) {
        this.sClaimReqFromDt = sClaimReqFromDt;
    }

    /**
     * @return the sClaimReqFromDt
     */
    public Date getsClaimReqFromDt() {
        return sClaimReqFromDt;
    }

    /**
     * @param sClaimReqToDt the sClaimReqToDt to set
     */
    public void setsClaimReqToDt(Date sClaimReqToDt) {
        this.sClaimReqToDt = sClaimReqToDt;
    }

    /**
     * @return the sClaimReqToDt
     */
    public Date getsClaimReqToDt() {
        return sClaimReqToDt;
    }
}