package chn.bhmc.dms.sal.stm.vo;

import com.fasterxml.jackson.annotation.JsonProperty;

import chn.bhmc.dms.core.datatype.BaseVO;


public class CorporateAvailabilityIFVO extends BaseVO{
	private static final long serialVersionUID = -6091261787809835772L;


	@JsonProperty("STCK_CARL_CD")
	private String stckCarlCd;

	@JsonProperty("STCK_MODEL_CD")
	private String stckModelCd;

	@JsonProperty("STCK_OCN_CD")
	private String stckOcnCd;

	@JsonProperty("STCK_EXT_CD")
	private String stckExtCd;

	@JsonProperty("STCK_INC_CD")
	private String stckIncCd;

	@JsonProperty("STCK_LOC_CD")
	private String stckLocCd;

	@JsonProperty("STCK_LOC_QTY")
	private double stckLocQty;

	@JsonProperty("STCK_UNIT")
	private String stckUnit;

    /**
     * @return the stckCarlCd
     */
    public String getStckCarlCd() {
        return stckCarlCd;
    }

    /**
     * @param stckCarlCd the stckCarlCd to set
     */
    public void setStckCarlCd(String stckCarlCd) {
        this.stckCarlCd = stckCarlCd;
    }

    /**
     * @return the stckModelCd
     */
    public String getStckModelCd() {
        return stckModelCd;
    }

    /**
     * @param stckModelCd the stckModelCd to set
     */
    public void setStckModelCd(String stckModelCd) {
        this.stckModelCd = stckModelCd;
    }

    /**
     * @return the stckOcnCd
     */
    public String getStckOcnCd() {
        return stckOcnCd;
    }

    /**
     * @param stckOcnCd the stckOcnCd to set
     */
    public void setStckOcnCd(String stckOcnCd) {
        this.stckOcnCd = stckOcnCd;
    }

    /**
     * @return the stckExtCd
     */
    public String getStckExtCd() {
        return stckExtCd;
    }

    /**
     * @param stckExtCd the stckExtCd to set
     */
    public void setStckExtCd(String stckExtCd) {
        this.stckExtCd = stckExtCd;
    }

    /**
     * @return the stckIncCd
     */
    public String getStckIncCd() {
        return stckIncCd;
    }

    /**
     * @param stckIncCd the stckIncCd to set
     */
    public void setStckIncCd(String stckIncCd) {
        this.stckIncCd = stckIncCd;
    }

    /**
     * @return the stckLocCd
     */
    public String getStckLocCd() {
        return stckLocCd;
    }

    /**
     * @param stckLocCd the stckLocCd to set
     */
    public void setStckLocCd(String stckLocCd) {
        this.stckLocCd = stckLocCd;
    }

    /**
     * @return the stckLocQty
     */
    public double getStckLocQty() {
        return stckLocQty;
    }

    /**
     * @param stckLocQty the stckLocQty to set
     */
    public void setStckLocQty(double stckLocQty) {
        this.stckLocQty = stckLocQty;
    }

    /**
     * @return the stckUnit
     */
    public String getStckUnit() {
        return stckUnit;
    }

    /**
     * @param stckUnit the stckUnit to set
     */
    public void setStckUnit(String stckUnit) {
        this.stckUnit = stckUnit;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}

