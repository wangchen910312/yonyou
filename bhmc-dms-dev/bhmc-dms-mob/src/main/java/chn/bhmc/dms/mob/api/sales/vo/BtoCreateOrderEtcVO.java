package chn.bhmc.dms.mob.api.sales.vo;

import java.io.Serializable;
/*
@ValidDescriptor({
     @ValidField(field="fincCmpCd", mesgKey="금융사")
    ,@ValidField(field="useYn", mesgKey="사용여부")
})
*/
public class BtoCreateOrderEtcVO implements Serializable {

	private static final long serialVersionUID = -6091261787809835772L;

	private String btoYmwCd;
	private String btoYmwNm;
	private String pfpExamDt;
	private String remark;
    private String ordRefQty;
    private String ordGradeCd;
    private String endDt;

    /**
     * @return the endDt
     */
    public String getEndDt() {
        return endDt;
    }
    /**
     * @param endDt the endDt to set
     */
    public void setEndDt(String endDt) {
        this.endDt = endDt;
    }
    /**
     * @return the btoYmwCd
     */
    public String getBtoYmwCd() {
        return btoYmwCd;
    }
    /**
     * @param btoYmwCd the btoYmwCd to set
     */
    public void setBtoYmwCd(String btoYmwCd) {
        this.btoYmwCd = btoYmwCd;
    }
    /**
     * @return the btoYmwNm
     */
    public String getBtoYmwNm() {
        return btoYmwNm;
    }
    /**
     * @param btoYmwNm the btoYmwNm to set
     */
    public void setBtoYmwNm(String btoYmwNm) {
        this.btoYmwNm = btoYmwNm;
    }
    /**
     * @return the pfpExamDt
     */
    public String getPfpExamDt() {
        return pfpExamDt;
    }
    /**
     * @param pfpExamDt the pfpExamDt to set
     */
    public void setPfpExamDt(String pfpExamDt) {
        this.pfpExamDt = pfpExamDt;
    }
    /**
     * @return the remark
     */
    public String getRemark() {
        return remark;
    }
    /**
     * @param remark the remark to set
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }
    /**
     * @return the ordRefQty
     */
    public String getOrdRefQty() {
        return ordRefQty;
    }
    /**
     * @param ordRefQty the ordRefQty to set
     */
    public void setOrdRefQty(String ordRefQty) {
        this.ordRefQty = ordRefQty;
    }
    /**
     * @return the ordGradeCd
     */
    public String getOrdGradeCd() {
        return ordGradeCd;
    }
    /**
     * @param ordGradeCd the ordGradeCd to set
     */
    public void setOrdGradeCd(String ordGradeCd) {
        this.ordGradeCd = ordGradeCd;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }




}

