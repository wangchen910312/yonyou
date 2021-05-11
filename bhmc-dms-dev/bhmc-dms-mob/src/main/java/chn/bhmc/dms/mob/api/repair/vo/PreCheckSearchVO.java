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
 * @ClassName   : PreCheckSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 3. 28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 28.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public class PreCheckSearchVO extends SearchVO{



    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1266355296308761479L;

    private String sVinNo;

    private String sCarId;

    private String sDlrCd;

    private String sCarOwnerNm;

    private String sCarAcptTp;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sFromDt;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sToDt;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sFromEndDt;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sToEndDt;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sSerResvStartDt;

    /**
     * 이미지좌표내용
     */
    private String sIimgCrdnCont;

    /**
     * 파일키명
     */
    private String sFileKeyNm;

    private String sRegUsrNm;

    private String sPopupYn;

    private String sDiagStatCd;

    private String sCarlineCd;

    private String sCarlineNm;

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
     * @return the sCarAcptTp
     */
    public String getsCarAcptTp() {
        return sCarAcptTp;
    }

    /**
     * @param sCarAcptTp the sCarAcptTp to set
     */
    public void setsCarAcptTp(String sCarAcptTp) {
        this.sCarAcptTp = sCarAcptTp;
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

    private String sCarRegNo;

    private String sDriverNm;

    public String sPreFixId;

    public String sRoStatCd;

    /**
     * 진단문서번호
     **/
    private String sDiagDocNo;

    /**
     * 예약번호
     */
    private String sResvDocNo;

    /**
     * @return the sRoStatCd
     */
    public String getsRoStatCd() {
        return sRoStatCd;
    }

    /**
     * @param sRoStatCd the sRoStatCd to set
     */
    public void setsRoStatCd(String sRoStatCd) {
        this.sRoStatCd = sRoStatCd;
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
     * @return the sDiagDocNo
     */
    public String getsDiagDocNo() {
        return sDiagDocNo;
    }

    /**
     * @param sDiagDocNo the sDiagDocNo to set
     */
    public void setsDiagDocNo(String sDiagDocNo) {
        this.sDiagDocNo = sDiagDocNo;
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



    public Date getsFromEndDt() {
        return sFromEndDt;
    }

    public void setsFromEndDt(Date sFromEndDt) {
        this.sFromEndDt = sFromEndDt;
    }

    public Date getsToEndDt() {
        return sToEndDt;
    }

    public void setsToEndDt(Date sToEndDt) {
        this.sToEndDt = sToEndDt;
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
     * @return the sIimgCrdnCont
     */
    public String getsIimgCrdnCont() {
        return sIimgCrdnCont;
    }

    /**
     * @param sIimgCrdnCont the sIimgCrdnCont to set
     */
    public void setsIimgCrdnCont(String sIimgCrdnCont) {
        this.sIimgCrdnCont = sIimgCrdnCont;
    }

    /**
     * @return the sFileKeyNm
     */
    public String getsFileKeyNm() {
        return sFileKeyNm;
    }

    /**
     * @param sFileKeyNm the sFileKeyNm to set
     */
    public void setsFileKeyNm(String sFileKeyNm) {
        this.sFileKeyNm = sFileKeyNm;
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
     * @return the sCarId
     */
    public String getsCarId() {
        return sCarId;
    }

    /**
     * @param sCarId the sCarId to set
     */
    public void setsCarId(String sCarId) {
        this.sCarId = sCarId;
    }

    public String getsPopupYn() {
        return sPopupYn;
    }

    public void setsPopupYn(String sPopupYn) {
        this.sPopupYn = sPopupYn;
    }

    /**
     * @return the sDiagStatCd
     */
    public String getsDiagStatCd() {
        return sDiagStatCd;
    }

    /**
     * @param sDiagStatCd the sDiagStatCd to set
     */
    public void setsDiagStatCd(String sDiagStatCd) {
        this.sDiagStatCd = sDiagStatCd;
    }

    /**
     * @return the sCarlineCd
     */
    public String getsCarlineCd() {
        return sCarlineCd;
    }

    /**
     * @param sCarlineCd the sCarlineCd to set
     */
    public void setsCarlineCd(String sCarlineCd) {
        this.sCarlineCd = sCarlineCd;
    }

    /**
     * @return the sCarlineNm
     */
    public String getsCarlineNm() {
        return sCarlineNm;
    }

    /**
     * @param sCarlineNm the sCarlineNm to set
     */
    public void setsCarlineNm(String sCarlineNm) {
        this.sCarlineNm = sCarlineNm;
    }

}
