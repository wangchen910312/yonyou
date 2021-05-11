package chn.bhmc.dms.sal.bto.vo;

import chn.bhmc.dms.core.datatype.BaseSearchVO;

public class BuyPredictedQuantityMngmntSearchVO extends BaseSearchVO {

	private static final long serialVersionUID = 7004150579309829417L;

    private String sYear;
    private String sDlrCd;
    private String sYyMm;

    /**
     * @return the sYear
     */
    public String getsYear() {
        return sYear;
    }
    /**
     * @param sYear the sYear to set
     */
    public void setsYear(String sYear) {
        this.sYear = sYear;
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
     * @return the sYyMm
     */
    public String getsYyMm() {
        return sYyMm;
    }
    /**
     * @param sYyMm the sYyMm to set
     */
    public void setsYyMm(String sYyMm) {
        this.sYyMm = sYyMm;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }


}

