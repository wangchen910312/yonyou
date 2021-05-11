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
 * @ClassName   : ClaimStatusSearchVO.java
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

public class ClaimStatusSearchVO extends SearchVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -9096293830698553322L;

    /**
     * 딜러코드
     */
    private String sDlrCd;

    /**
     * 클레임 시작일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sClaimFromDt;

    /**
     * 클레임 종료일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sClaimToDt;

    /**
     * 클레임 번호
     */
    private String sClaimDocNo;

    /**
     * 클레임 유형
     */
    private String sClaimTp;

    /**
     * 차대번호
     */
    private String sVinNo;

    /**
     * 클레임 상태코드
     */
    private String sClaimStatCd;

    /**
     * pwa 승인번호
     */
    private String sPwaApproveNo;

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
     * @return the sClaimFromDt
     */
    public Date getsClaimFromDt() {
        return sClaimFromDt;
    }

    /**
     * @param sClaimFromDt the sClaimFromDt to set
     */
    public void setsClaimFromDt(Date sClaimFromDt) {
        this.sClaimFromDt = sClaimFromDt;
    }

    /**
     * @return the sClaimToDt
     */
    public Date getsClaimToDt() {
        return sClaimToDt;
    }

    /**
     * @param sClaimToDt the sClaimToDt to set
     */
    public void setsClaimToDt(Date sClaimToDt) {
        this.sClaimToDt = sClaimToDt;
    }

    /**
     * @return the sClaimDocNo
     */
    public String getsClaimDocNo() {
        return sClaimDocNo;
    }

    /**
     * @param sClaimDocNo the sClaimDocNo to set
     */
    public void setsClaimDocNo(String sClaimDocNo) {
        this.sClaimDocNo = sClaimDocNo;
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
     * @param sPwaApproveNo the sPwaApproveNo to set
     */
    public void setsPwaApproveNo(String sPwaApproveNo) {
        this.sPwaApproveNo = sPwaApproveNo;
    }

    /**
     * @return the sPwaApproveNo
     */
    public String getsPwaApproveNo() {
        return sPwaApproveNo;
    }
}