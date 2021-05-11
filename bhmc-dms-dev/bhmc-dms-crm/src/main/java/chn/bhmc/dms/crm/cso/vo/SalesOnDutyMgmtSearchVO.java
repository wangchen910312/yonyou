package chn.bhmc.dms.crm.cso.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * 당직 조회 SearchVO
 *
 * @ClassName   : SalesOnDutyMgmtSearchVO
 * @Description : SalesOnDutyMgmtSearchVO
 * @author in moon lee
 * @since 2016.03.07.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.03.07.     in moon lee     최초 생성
 * </pre>
 */

public class SalesOnDutyMgmtSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 5719323620713132035L;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sVsitResvDt;

    private String sDlrCd;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sVsitResvDtFrom;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sVsitResvDtTo;

    private String sOndutyUsrId;

    private String sOndutyTp;

    private String sOndutyYn;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sOndutyDt;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sOndutyDtFrom;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sOndutyDtTo;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStartDt;

    private String sSeq;

    private String sViewId; //권한 화면기능
    private int sMask; //권한번호

    /**
     * @return the sVsitResvDt
     */
    public Date getsVsitResvDt() {
        return sVsitResvDt;
    }

    /**
     * @param sVsitResvDt the sVsitResvDt to set
     */
    public void setsVsitResvDt(Date sVsitResvDt) {
        this.sVsitResvDt = sVsitResvDt;
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
     * @return the sVsitResvDtFrom
     */
    public Date getsVsitResvDtFrom() {
        return sVsitResvDtFrom;
    }

    /**
     * @param sVsitResvDtFrom the sVsitResvDtFrom to set
     */
    public void setsVsitResvDtFrom(Date sVsitResvDtFrom) {
        this.sVsitResvDtFrom = sVsitResvDtFrom;
    }

    /**
     * @return the sVsitResvDtTo
     */
    public Date getsVsitResvDtTo() {
        return sVsitResvDtTo;
    }

    /**
     * @param sVsitResvDtTo the sVsitResvDtTo to set
     */
    public void setsVsitResvDtTo(Date sVsitResvDtTo) {
        this.sVsitResvDtTo = sVsitResvDtTo;
    }

    /**
     * @return the sOndutyUsrId
     */
    public String getsOndutyUsrId() {
        return sOndutyUsrId;
    }

    /**
     * @param sOndutyUsrId the sOndutyUsrId to set
     */
    public void setsOndutyUsrId(String sOndutyUsrId) {
        this.sOndutyUsrId = sOndutyUsrId;
    }

    /**
     * @return the sOndutyTp
     */
    public String getsOndutyTp() {
        return sOndutyTp;
    }

    /**
     * @param sOndutyTp the sOndutyTp to set
     */
    public void setsOndutyTp(String sOndutyTp) {
        this.sOndutyTp = sOndutyTp;
    }

    /**
     * @return the sOndutyYn
     */
    public String getsOndutyYn() {
        return sOndutyYn;
    }

    /**
     * @param sOndutyYn the sOndutyYn to set
     */
    public void setsOndutyYn(String sOndutyYn) {
        this.sOndutyYn = sOndutyYn;
    }

    /**
     * @return the sOndutyDt
     */
    public Date getsOndutyDt() {
        return sOndutyDt;
    }

    /**
     * @param sOndutyDt the sOndutyDt to set
     */
    public void setsOndutyDt(Date sOndutyDt) {
        this.sOndutyDt = sOndutyDt;
    }

    /**
     * @return the sOndutyDtFrom
     */
    public Date getsOndutyDtFrom() {
        return sOndutyDtFrom;
    }

    /**
     * @param sOndutyDtFrom the sOndutyDtFrom to set
     */
    public void setsOndutyDtFrom(Date sOndutyDtFrom) {
        this.sOndutyDtFrom = sOndutyDtFrom;
    }

    /**
     * @return the sOndutyDtTo
     */
    public Date getsOndutyDtTo() {
        return sOndutyDtTo;
    }

    /**
     * @param sOndutyDtTo the sOndutyDtTo to set
     */
    public void setsOndutyDtTo(Date sOndutyDtTo) {
        this.sOndutyDtTo = sOndutyDtTo;
    }

    /**
     * @return the sStartDt
     */
    public Date getsStartDt() {
        return sStartDt;
    }

    /**
     * @param sStartDt the sStartDt to set
     */
    public void setsStartDt(Date sStartDt) {
        this.sStartDt = sStartDt;
    }

    /**
     * @return the sSeq
     */
    public String getsSeq() {
        return sSeq;
    }

    /**
     * @param sSeq the sSeq to set
     */
    public void setsSeq(String sSeq) {
        this.sSeq = sSeq;
    }

    /**
     * @return the sViewId
     */
    public String getsViewId() {
        return sViewId;
    }

    /**
     * @param sViewId the sViewId to set
     */
    public void setsViewId(String sViewId) {
        this.sViewId = sViewId;
    }

    /**
     * @return the sMask
     */
    public int getsMask() {
        return sMask;
    }

    /**
     * @param sMask the sMask to set
     */
    public void setsMask(int sMask) {
        this.sMask = sMask;
    }

}