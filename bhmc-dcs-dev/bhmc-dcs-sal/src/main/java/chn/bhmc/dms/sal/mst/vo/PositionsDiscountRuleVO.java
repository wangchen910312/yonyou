package chn.bhmc.dms.sal.mst.vo;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

public class PositionsDiscountRuleVO implements Serializable {

	private static final long serialVersionUID = -6091261787809835772L;

	private String dlrCd;

	@JsonDeserialize(using=JsonDateDeserializer.class)
    private Date startDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date endDt;

	private String dcApplyYn;
	private String prcNregYn;

    private String regUsrId;
    private String updtUsrId;

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
     * @return the startDt
     */
    public Date getStartDt() {
        return startDt;
    }
    /**
     * @param startDt the startDt to set
     */
    public void setStartDt(Date startDt) {
        this.startDt = startDt;
    }
    /**
     * @return the endDt
     */
    public Date getEndDt() {
        return endDt;
    }
    /**
     * @param endDt the endDt to set
     */
    public void setEndDt(Date endDt) {
        this.endDt = endDt;
    }
    /**
     * @return the dcApplyYn
     */
    public String getDcApplyYn() {
        return dcApplyYn;
    }
    /**
     * @param dcApplyYn the dcApplyYn to set
     */
    public void setDcApplyYn(String dcApplyYn) {
        this.dcApplyYn = dcApplyYn;
    }
    /**
     * @return the prcNregYn
     */
    public String getPrcNregYn() {
        return prcNregYn;
    }
    /**
     * @param prcNregYn the prcNregYn to set
     */
    public void setPrcNregYn(String prcNregYn) {
        this.prcNregYn = prcNregYn;
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
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}

