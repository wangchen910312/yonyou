package chn.bhmc.dms.sal.bto.vo;

import chn.bhmc.dms.core.datatype.BaseSearchVO;

public class BuyPredictedQuantityMngmntSearchVO extends BaseSearchVO {

	private static final long serialVersionUID = 7004150579309829417L;

    private String sYyMm;
    private String sDlrCd;

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

