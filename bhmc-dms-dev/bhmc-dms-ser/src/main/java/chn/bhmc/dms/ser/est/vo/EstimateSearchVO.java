package chn.bhmc.dms.ser.est.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : EstimateSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 4. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 25.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public class EstimateSearchVO extends SearchVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -4544068766054040862L;

    private String sDlrCd;

    private String sEstDocNo;

    private String sResvDocNo;

    private String sRoDocNo;

    private String sResvStatCd;

    private String sEstStatCd;

    private String sVinNo;

    private String sLtsModelCd;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEstFromDt;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEstToDt;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRoFromDt;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRoToDt;

    private String sCarRegNo;
    private String sDriverNm;
    private String sRegUsrNm;
    private String sPreFixId;

    private String sRoTp;


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
     * @return the sEstDocNo
     */
    public String getsEstDocNo() {
        return sEstDocNo;
    }

    /**
     * @param sEstDocNo the sEstDocNo to set
     */
    public void setsEstDocNo(String sEstDocNo) {
        this.sEstDocNo = sEstDocNo;
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
     * @return the sEstFromDt
     */
    public Date getsEstFromDt() {
        return sEstFromDt;
    }

    /**
     * @param sEstFromDt the sEstFromDt to set
     */
    public void setsEstFromDt(Date sEstFromDt) {
        this.sEstFromDt = sEstFromDt;
    }

    /**
     * @return the sEstToDt
     */
    public Date getsEstToDt() {
        return sEstToDt;
    }

    /**
     * @param sEstToDt the sEstToDt to set
     */
    public void setsEstToDt(Date sEstToDt) {
        this.sEstToDt = sEstToDt;
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
     * @return the sLtsModelCd
     */
    public String getsLtsModelCd() {
        return sLtsModelCd;
    }

    /**
     * @param sLtsModelCd the sLtsModelCd to set
     */
    public void setsLtsModelCd(String sLtsModelCd) {
        this.sLtsModelCd = sLtsModelCd;
    }

    public String getsEstStatCd() {
        return sEstStatCd;
    }

    public void setsEstStatCd(String sEstStatCd) {
        this.sEstStatCd = sEstStatCd;
    }

    public Date getsRoFromDt() {
        return sRoFromDt;
    }

    public void setsRoFromDt(Date sRoFromDt) {
        this.sRoFromDt = sRoFromDt;
    }

    public Date getsRoToDt() {
        return sRoToDt;
    }

    public void setsRoToDt(Date sRoToDt) {
        this.sRoToDt = sRoToDt;
    }

    public String getsRegUsrNm() {
        return sRegUsrNm;
    }

    public void setsRegUsrNm(String sRegUsrNm) {
        this.sRegUsrNm = sRegUsrNm;
    }

    /**
     * @return the sRoTp
     */
    public String getsRoTp() {
        return sRoTp;
    }

    /**
     * @param sRoTp the sRoTp to set
     */
    public void setsRoTp(String sRoTp) {
        this.sRoTp = sRoTp;
    }

}
