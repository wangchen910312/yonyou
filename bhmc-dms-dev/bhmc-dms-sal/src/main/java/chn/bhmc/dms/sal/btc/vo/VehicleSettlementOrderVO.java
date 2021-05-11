package chn.bhmc.dms.sal.btc.vo;

import java.io.Serializable;

import javax.validation.constraints.DecimalMin;

import org.hibernate.validator.constraints.NotBlank;

public class VehicleSettlementOrderVO implements Serializable {

	private static final long serialVersionUID = -6091261787809835772L;

	@NotBlank
	private String calcAtcDstinCd;
	@NotBlank
	private String taxAtcDstinCd;
	@NotBlank
	private String calcId;
	@NotBlank
	private String calcAtcNm;
	@NotBlank
    private String fmulaCont;
	@DecimalMin(value = "1")
    private Integer calcOrder;
	@DecimalMin(value = "1")
    private Integer displayOrder;
    @NotBlank
    private String sboIfYn;
    @NotBlank
    private String dprecvYn;
    @NotBlank
    private String displayYn;
    @NotBlank
    private String useYn;
    private String remark;
    private String regUsrId;
    private String regUsrNm;
    private String updtUsrId;
    private String updtUsrNm;
    private String fincItemKindCd;

    /**
     * @return the calcAtcDstinCd
     */
    public String getCalcAtcDstinCd() {
        return calcAtcDstinCd;
    }
    /**
     * @param calcAtcDstinCd the calcAtcDstinCd to set
     */
    public void setCalcAtcDstinCd(String calcAtcDstinCd) {
        this.calcAtcDstinCd = calcAtcDstinCd;
    }
    /**
     * @return the taxAtcDstinCd
     */
    public String getTaxAtcDstinCd() {
        return taxAtcDstinCd;
    }
    /**
     * @param taxAtcDstinCd the taxAtcDstinCd to set
     */
    public void setTaxAtcDstinCd(String taxAtcDstinCd) {
        this.taxAtcDstinCd = taxAtcDstinCd;
    }
    /**
     * @return the calcId
     */
    public String getCalcId() {
        return calcId;
    }
    /**
     * @param calcId the calcId to set
     */
    public void setCalcId(String calcId) {
        this.calcId = calcId;
    }
    /**
     * @return the calcAtcNm
     */
    public String getCalcAtcNm() {
        return calcAtcNm;
    }
    /**
     * @param calcAtcNm the calcAtcNm to set
     */
    public void setCalcAtcNm(String calcAtcNm) {
        this.calcAtcNm = calcAtcNm;
    }
    /**
     * @return the fmulaCont
     */
    public String getFmulaCont() {
        return fmulaCont;
    }
    /**
     * @param fmulaCont the fmulaCont to set
     */
    public void setFmulaCont(String fmulaCont) {
        this.fmulaCont = fmulaCont;
    }
    /**
     * @return the calcOrder
     */
    public Integer getCalcOrder() {
        return calcOrder;
    }
    /**
     * @param calcOrder the calcOrder to set
     */
    public void setCalcOrder(Integer calcOrder) {
        this.calcOrder = calcOrder;
    }
    /**
     * @return the displayOrder
     */
    public Integer getDisplayOrder() {
        return displayOrder;
    }
    /**
     * @param displayOrder the displayOrder to set
     */
    public void setDisplayOrder(Integer displayOrder) {
        this.displayOrder = displayOrder;
    }
    /**
     * @return the sboIfYn
     */
    public String getSboIfYn() {
        return sboIfYn;
    }
    /**
     * @param sboIfYn the sboIfYn to set
     */
    public void setSboIfYn(String sboIfYn) {
        this.sboIfYn = sboIfYn;
    }
    /**
     * @return the dprecvYn
     */
    public String getDprecvYn() {
        return dprecvYn;
    }
    /**
     * @param dprecvYn the dprecvYn to set
     */
    public void setDprecvYn(String dprecvYn) {
        this.dprecvYn = dprecvYn;
    }
    /**
     * @return the displayYn
     */
    public String getDisplayYn() {
        return displayYn;
    }
    /**
     * @param displayYn the displayYn to set
     */
    public void setDisplayYn(String displayYn) {
        this.displayYn = displayYn;
    }
    /**
     * @return the useYn
     */
    public String getUseYn() {
        return useYn;
    }
    /**
     * @param useYn the useYn to set
     */
    public void setUseYn(String useYn) {
        this.useYn = useYn;
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
     * @return the regUsrNm
     */
    public String getRegUsrNm() {
        return regUsrNm;
    }
    /**
     * @param regUsrNm the regUsrNm to set
     */
    public void setRegUsrNm(String regUsrNm) {
        this.regUsrNm = regUsrNm;
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
     * @return the updtUsrNm
     */
    public String getUpdtUsrNm() {
        return updtUsrNm;
    }
    /**
     * @param updtUsrNm the updtUsrNm to set
     */
    public void setUpdtUsrNm(String updtUsrNm) {
        this.updtUsrNm = updtUsrNm;
    }
    /**
     * @return the fincItemKindCd
     */
    public String getFincItemKindCd() {
        return fincItemKindCd;
    }
    /**
     * @param fincItemKindCd the fincItemKindCd to set
     */
    public void setFincItemKindCd(String fincItemKindCd) {
        this.fincItemKindCd = fincItemKindCd;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}

