package chn.bhmc.dms.mob.api.repair.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ReservationReceiptSearchVO.java
 * @Description : 예약 SearchVO
 * @author KyungMok Kim
 * @since 2016. 2. 5.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 5.    KyungMok Kim     최초 생성
 * </pre>
 */

public class ReservationReceiptSearchVO extends SearchVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 8942495445555858205L;

    /**
     * 딜러코드
     **/
    private String sDlrCd;

    /**
     *  예약번호
     **/
    private String sResvDocNo;

    private String sPreFixId;

    /**
     * 예약간격시간
     */
    private String sResvIvalCd;

    /**
     * VIN NO
     */
    private String sVinNo;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sSerResvStartDt;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sSerResvEndDt;

    private String sResvStatCd;

    private String sCarRegNo;

    private String sBayNo;

    private String sBayNm;

    private String sCarOwnerNm;

    private String sResvTp;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sResvFromDt;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sResvToDt;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRegFromDt;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRegToDt;

    private String sDriverNm;

    // 01: STATUS, 02: 예약접수
    private String sListType;

    private String sRegUsrNm;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sSerResvStartFromDt;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sSerResvStartToDt;

    private String sRresvReptStatCd;

    /* A: CRM(VOC) */
    private String sLinkType;

    private String sSaNm;

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



    public String getsResvIvalCd() {
        return sResvIvalCd;
    }

    public void setsResvIvalCd(String sResvIvalCd) {
        this.sResvIvalCd = sResvIvalCd;
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
     * @return the sResvDocNo
     */
    public String getsResvDocNo() {
        return sResvDocNo;
    }

    /**
     * @param sResvDocNo the sResvDocNo to set
     */
    public void setsResvDocNo(String sResvDocNo) {
        this.sResvDocNo = sResvDocNo;
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
     * @return the sSerResvStartDt
     */
    public Date getsSerResvStartDt() {
        return sSerResvStartDt;
    }

    /**
     * @param sSerResvStartDt the sSerResvStartDt to set
     */
    public void setsSerResvStartDt(Date sSerResvStartDt) {
        this.sSerResvStartDt = sSerResvStartDt;
    }

    /**
     * @return the sSerResvEndDt
     */
    public Date getsSerResvEndDt() {
        return sSerResvEndDt;
    }

    /**
     * @param sSerResvEndDt the sSerResvEndDt to set
     */
    public void setsSerResvEndDt(Date sSerResvEndDt) {
        this.sSerResvEndDt = sSerResvEndDt;
    }

    /**
     * @return the sResvStatCd
     */
    public String getsResvStatCd() {
        return sResvStatCd;
    }

    /**
     * @param sResvStatCd the sResvStatCd to set
     */
    public void setsResvStatCd(String sResvStatCd) {
        this.sResvStatCd = sResvStatCd;
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

    /**
     * @return the sBayNm
     */
    public String getsBayNm() {
        return sBayNm;
    }

    /**
     * @param sBayNm the sBayNm to set
     */
    public void setsBayNm(String sBayNm) {
        this.sBayNm = sBayNm;
    }

    /**
     * @return the sResvFromDt
     */
    public Date getsResvFromDt() {
        return sResvFromDt;
    }

    /**
     * @param sResvFromDt the sResvFromDt to set
     */
    public void setsResvFromDt(Date sResvFromDt) {
        this.sResvFromDt = sResvFromDt;
    }

    /**
     * @return the sResvToDt
     */
    public Date getsResvToDt() {
        return sResvToDt;
    }

    /**
     * @param sResvToDt the sResvToDt to set
     */
    public void setsResvToDt(Date sResvToDt) {
        this.sResvToDt = sResvToDt;
    }

    /**
     * @return the sDriverNm
     */
    public String getsDriverNm() {
        return sDriverNm;
    }

    /**
     * @param sDriverNm the sDriverNm to set
     */
    public void setsDriverNm(String sDriverNm) {
        this.sDriverNm = sDriverNm;
    }

    /**
     * @return the sListType
     */
    public String getsListType() {
        return sListType;
    }

    /**
     * @param sListType the sListType to set
     */
    public void setsListType(String sListType) {
        this.sListType = sListType;
    }

    /**
     * @return the sCarOwnerNm
     */
    public String getsCarOwnerNm() {
        return sCarOwnerNm;
    }

    /**
     * @param sCarOwnerNm the sCarOwnerNm to set
     */
    public void setsCarOwnerNm(String sCarOwnerNm) {
        this.sCarOwnerNm = sCarOwnerNm;
    }

    /**
     * @return the sResvTp
     */
    public String getsResvTp() {
        return sResvTp;
    }

    /**
     * @param sResvTp the sResvTp to set
     */
    public void setsResvTp(String sResvTp) {
        this.sResvTp = sResvTp;
    }

    /**
     * @return the sRegUsrNm
     */
    public String getsRegUsrNm() {
        return sRegUsrNm;
    }

    /**
     * @param sRegUsrNm the sRegUsrNm to set
     */
    public void setsRegUsrNm(String sRegUsrNm) {
        this.sRegUsrNm = sRegUsrNm;
    }

    /**
     * @return the sSerResvStartFromDt
     */
    public Date getsSerResvStartFromDt() {
        return sSerResvStartFromDt;
    }

    /**
     * @param sSerResvStartFromDt the sSerResvStartFromDt to set
     */
    public void setsSerResvStartFromDt(Date sSerResvStartFromDt) {
        this.sSerResvStartFromDt = sSerResvStartFromDt;
    }

    /**
     * @return the sSerResvStartToDt
     */
    public Date getsSerResvStartToDt() {
        return sSerResvStartToDt;
    }

    /**
     * @param sSerResvStartToDt the sSerResvStartToDt to set
     */
    public void setsSerResvStartToDt(Date sSerResvStartToDt) {
        this.sSerResvStartToDt = sSerResvStartToDt;
    }

    /**
     * @return the sRresvReptStatCd
     */
    public String getsRresvReptStatCd() {
        return sRresvReptStatCd;
    }

    /**
     * @param sRresvReptStatCd the sRresvReptStatCd to set
     */
    public void setsRresvReptStatCd(String sRresvReptStatCd) {
        this.sRresvReptStatCd = sRresvReptStatCd;
    }

    /**
     * @return the sRegFromDt
     */
    public Date getsRegFromDt() {
        return sRegFromDt;
    }

    /**
     * @param sRegFromDt the sRegFromDt to set
     */
    public void setsRegFromDt(Date sRegFromDt) {
        this.sRegFromDt = sRegFromDt;
    }

    /**
     * @return the sRegToDt
     */
    public Date getsRegToDt() {
        return sRegToDt;
    }

    /**
     * @param sRegToDt the sRegToDt to set
     */
    public void setsRegToDt(Date sRegToDt) {
        this.sRegToDt = sRegToDt;
    }

    /**
     * @return the sLinkType
     */
    public String getsLinkType() {
        return sLinkType;
    }

    /**
     * @param sLinkType the sLinkType to set
     */
    public void setsLinkType(String sLinkType) {
        this.sLinkType = sLinkType;
    }

    /**
     * @return the sSaNm
     */
    public String getsSaNm() {
        return sSaNm;
    }

    /**
     * @param sSaNm the sSaNm to set
     */
    public void setsSaNm(String sSaNm) {
        this.sSaNm = sSaNm;
    }

}