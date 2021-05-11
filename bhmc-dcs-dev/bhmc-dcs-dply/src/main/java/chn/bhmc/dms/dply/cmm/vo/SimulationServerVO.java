package chn.bhmc.dms.dply.cmm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SimulationServerVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Cheol Man Oh
 * @since 2016. 7. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 11.     Cheol Man Oh     최초 생성
 * </pre>
 */

public class SimulationServerVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 3182451890753755935L;

    private String dlrCd           ;

    private String dlrNm           ;

    private String telNo           ;

    private String faxNo           ;

    private String dmsIpNm         ;

    private String dmsPortNm       ;

    private String dmsTestUrlNm    ;

    private String regUsrId        ;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date   regDt           ;

    private String updtUsrId       ;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date   updtDt          ;

    /**
     * @param dlrCd the dlrCd to set
     */
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    /**
     * @return the dlrCd
     */
    public String getDlrCd() {
        return dlrCd;
    }

    /**
     * @param dlrNm the dlrNm to set
     */
    public void setDlrNm(String dlrNm) {
        this.dlrNm = dlrNm;
    }

    /**
     * @return the dlrNm
     */
    public String getDlrNm() {
        return dlrNm;
    }

    /**
     * @param telNo the telNo to set
     */
    public void setTelNo(String telNo) {
        this.telNo = telNo;
    }

    /**
     * @return the telNo
     */
    public String getTelNo() {
        return telNo;
    }

    /**
     * @param faxNo the faxNo to set
     */
    public void setFaxNo(String faxNo) {
        this.faxNo = faxNo;
    }

    /**
     * @return the faxNo
     */
    public String getFaxNo() {
        return faxNo;
    }

    /**
     * @param dmsIpNm the dmsIpNm to set
     */
    public void setDmsIpNm(String dmsIpNm) {
        this.dmsIpNm = dmsIpNm;
    }

    /**
     * @return the dmsIpNm
     */
    public String getDmsIpNm() {
        return dmsIpNm;
    }

    /**
     * @param dmsPortNm the dmsPortNm to set
     */
    public void setDmsPortNm(String dmsPortNm) {
        this.dmsPortNm = dmsPortNm;
    }

    /**
     * @return the dmsPortNm
     */
    public String getDmsPortNm() {
        return dmsPortNm;
    }

    /**
     * @param dmsTestUrlNm the dmsTestUrlNm to set
     */
    public void setDmsTestUrlNm(String dmsTestUrlNm) {
        this.dmsTestUrlNm = dmsTestUrlNm;
    }

    /**
     * @return the dmsTestUrlNm
     */
    public String getDmsTestUrlNm() {
        return dmsTestUrlNm;
    }

    /**
     * @param regUsrId the regUsrId to set
     */
    public void setRegUsrId(String regUsrId) {
        this.regUsrId = regUsrId;
    }

    /**
     * @return the regUsrId
     */
    public String getRegUsrId() {
        return regUsrId;
    }

    /**
     * @param regDt the regDt to set
     */
    public void setRegDt(Date regDt) {
        this.regDt = regDt;
    }

    /**
     * @return the regDt
     */
    public Date getRegDt() {
        return regDt;
    }

    /**
     * @param updtUsrId the updtUsrId to set
     */
    public void setUpdtUsrId(String updtUsrId) {
        this.updtUsrId = updtUsrId;
    }

    /**
     * @return the updtUsrId
     */
    public String getUpdtUsrId() {
        return updtUsrId;
    }
    /**
     * @param updtDt the updtDt to set
     */
    public void setUpdtDt(Date updtDt) {
        this.updtDt = updtDt;
    }

    /**
     * @return the updtDt
     */
    public Date getUpdtDt() {
        return updtDt;
    }


}
