package chn.bhmc.dms.ser.res.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RescueSearchVO.java
 * @Description : 구원 서비스 SearchVO
 * @author YIN XUEYUAN
 * @since 2016. 6. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 19.    YIN XUEYUAN     최초 생성
 * </pre>
 */

public class RescueSearchVO extends SearchVO{

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
    private String sRescDocNo;

    /**
     * VIN NO
     */
    private String sVinNo;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sSerRescStartDt;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sSerRescEndDt;

    private String sRescStatCd;

    private String sRescTp;

    private String sCarRegNo;

    private String sBayNo;

    private String sCarOwnerNm;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRescReqDt;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRescToDt;

    private String sDriverNm;


    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sFromDt;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sToDt;

    // 01: STATUS, 02: 예약접수
    private String sListType;

    private String sPreFixId;

    private String sRegUsrNm;



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
     * @return the sRescDocNo
     */
    public String getsRescDocNo() {
        return sRescDocNo;
    }

    /**
     * @param sRescDocNo the sRescDocNo to set
     */
    public void setsRescDocNo(String sRescDocNo) {
        this.sRescDocNo = sRescDocNo;
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
     * @return the sSerRescStartDt
     */
    public Date getsSerRescStartDt() {
        return sSerRescStartDt;
    }

    /**
     * @param sSerRescStartDt the sSerRescStartDt to set
     */
    public void setsSerRescStartDt(Date sSerRescStartDt) {
        this.sSerRescStartDt = sSerRescStartDt;
    }

    /**
     * @return the sSerRescEndDt
     */
    public Date getsSerRescEndDt() {
        return sSerRescEndDt;
    }

    /**
     * @param sSerRescEndDt the sSerRescEndDt to set
     */
    public void setsSerRescEndDt(Date sSerRescEndDt) {
        this.sSerRescEndDt = sSerRescEndDt;
    }

    /**
     * @return the sRescStatCd
     */
    public String getsRescStatCd() {
        return sRescStatCd;
    }

    /**
     * @param sRescStatCd the sRescStatCd to set
     */
    public void setsRescStatCd(String sRescStatCd) {
        this.sRescStatCd = sRescStatCd;
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
     * @return the sRescToDt
     */
    public Date getsRescToDt() {
        return sRescToDt;
    }

    /**
     * @param sRescToDt the sRescToDt to set
     */
    public void setsRescToDt(Date sRescToDt) {
        this.sRescToDt = sRescToDt;
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

    public Date getsRescReqDt() {
        return sRescReqDt;
    }

    public void setsRescReqDt(Date sRescReqDt) {
        this.sRescReqDt = sRescReqDt;
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
     * @return the sRescTp
     */
    public String getsRescTp() {
        return sRescTp;
    }

    /**
     * @param sRescTp the sRescTp to set
     */
    public void setsRescTp(String sRescTp) {
        this.sRescTp = sRescTp;
    }




}