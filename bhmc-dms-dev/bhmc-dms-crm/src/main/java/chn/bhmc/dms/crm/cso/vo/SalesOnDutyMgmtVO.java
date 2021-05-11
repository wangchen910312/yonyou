package chn.bhmc.dms.crm.cso.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * 당직관리  VO
 *
 * @ClassName   : SalesOnDutyMgmtVO.java
 * @Description : SalesOnDutyMgmtVO
 * @author kyo jin lee
 * @since 2016.03.07.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.03.07     kyo jin lee      Created First
 * </pre>
 */


public class SalesOnDutyMgmtVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -4743624905572179718L;

    private String dlrCd;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date ondutyDt;

    private String ondutyUsrId;
    private String ondutyUsrNm;
    private String regUsrId;
    private Date regDt;
    private String updtUsrId;
    private Date updtDt;
    private int cnt;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date ondutyDtFrom;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date ondutyDtTo;


    private Date vsitResvDtFrom;
    private Date vsitResvDtTo;

    private Date vsitResvDt;

    private String ondutyTp;

    private String seq;

    /**
     * @return the dlrCd
     */
    public String getDlrCd() {
        return dlrCd;
    }
    /**
     * @param dlrCd the dlrCd to set
     */
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }
    /**
     * @return the ondutyDt
     */
    public Date getOndutyDt() {
        return ondutyDt;
    }
    /**
     * @param ondutyDt the ondutyDt to set
     */
    public void setOndutyDt(Date ondutyDt) {
        this.ondutyDt = ondutyDt;
    }
    /**
     * @return the ondutyUsrId
     */
    public String getOndutyUsrId() {
        return ondutyUsrId;
    }
    /**
     * @param ondutyUsrId the ondutyUsrId to set
     */
    public void setOndutyUsrId(String ondutyUsrId) {
        this.ondutyUsrId = ondutyUsrId;
    }
    /**
     * @return the regUsrId
     */
    public String getRegUsrId() {
        return regUsrId;
    }
    /**
     * @param regUsrId the regUsrId to set
     */
    public void setRegUsrId(String regUsrId) {
        this.regUsrId = regUsrId;
    }
    /**
     * @return the regDt
     */
    public Date getRegDt() {
        return regDt;
    }
    /**
     * @param regDt the regDt to set
     */
    public void setRegDt(Date regDt) {
        this.regDt = regDt;
    }
    /**
     * @return the updtUsrId
     */
    public String getUpdtUsrId() {
        return updtUsrId;
    }
    /**
     * @param updtUsrId the updtUsrId to set
     */
    public void setUpdtUsrId(String updtUsrId) {
        this.updtUsrId = updtUsrId;
    }
    /**
     * @return the updtDt
     */
    public Date getUpdtDt() {
        return updtDt;
    }
    /**
     * @param updtDt the updtDt to set
     */
    public void setUpdtDt(Date updtDt) {
        this.updtDt = updtDt;
    }
    /**
     * @return the cnt
     */
    public int getCnt() {
        return cnt;
    }
    /**
     * @param cnt the cnt to set
     */
    public void setCnt(int cnt) {
        this.cnt = cnt;
    }
    /**
     * @return the vsitResvDtFrom
     */
    public Date getVsitResvDtFrom() {
        return vsitResvDtFrom;
    }
    /**
     * @param vsitResvDtFrom the vsitResvDtFrom to set
     */
    public void setVsitResvDtFrom(Date vsitResvDtFrom) {
        this.vsitResvDtFrom = vsitResvDtFrom;
    }
    /**
     * @return the vsitResvDtTo
     */
    public Date getVsitResvDtTo() {
        return vsitResvDtTo;
    }
    /**
     * @param vsitResvDtTo the vsitResvDtTo to set
     */
    public void setVsitResvDtTo(Date vsitResvDtTo) {
        this.vsitResvDtTo = vsitResvDtTo;
    }
    /**
     * @return the vsitResvDt
     */
    public Date getVsitResvDt() {
        return vsitResvDt;
    }
    /**
     * @param vsitResvDt the vsitResvDt to set
     */
    public void setVsitResvDt(Date vsitResvDt) {
        this.vsitResvDt = vsitResvDt;
    }
    /**
     * @return the ondutyTp
     */
    public String getOndutyTp() {
        return ondutyTp;
    }
    /**
     * @param ondutyTp the ondutyTp to set
     */
    public void setOndutyTp(String ondutyTp) {
        this.ondutyTp = ondutyTp;
    }
    /**
     * @return the ondutyDtFrom
     */
    public Date getOndutyDtFrom() {
        return ondutyDtFrom;
    }
    /**
     * @param ondutyDtFrom the ondutyDtFrom to set
     */
    public void setOndutyDtFrom(Date ondutyDtFrom) {
        this.ondutyDtFrom = ondutyDtFrom;
    }
    /**
     * @return the ondutyDtTo
     */
    public Date getOndutyDtTo() {
        return ondutyDtTo;
    }
    /**
     * @param ondutyDtTo the ondutyDtTo to set
     */
    public void setOndutyDtTo(Date ondutyDtTo) {
        this.ondutyDtTo = ondutyDtTo;
    }
    /**
     * @return the seq
     */
    public String getSeq() {
        return seq;
    }
    /**
     * @param seq the seq to set
     */
    public void setSeq(String seq) {
        this.seq = seq;
    }
    /**
     * @return the ondutyUsrNm
     */
    public String getOndutyUsrNm() {
        return ondutyUsrNm;
    }
    /**
     * @param ondutyUsrNm the ondutyUsrNm to set
     */
    public void setOndutyUsrNm(String ondutyUsrNm) {
        this.ondutyUsrNm = ondutyUsrNm;
    }

}