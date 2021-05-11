package chn.bhmc.dms.sal.sti.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;

@ValidDescriptor({
  //  @ValidField(field="calcAtcDstinCd", mesgKey="정산구분")

})
public class ConfirmWearingVehicleSaveVO extends BaseSaveVO<ConfirmWearingVehicleVO> {

	/**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2864274377715677856L;

    private String carStatCd;
    private String prty;

    private ConfirmWearingVehiclePopupVO popupVO;
    
    /**
     * @return the carStatCd
     */
    public String getCarStatCd() {
        return carStatCd;
    }

    /**
     * @param carStatCd the carStatCd to set
     */
    public void setCarStatCd(String carStatCd) {
        this.carStatCd = carStatCd;
    }

    /**
     * @return the prty
     */
    public String getPrty() {
        return prty;
    }

    /**
     * @param prty the prty to set
     */
    public void setPrty(String prty) {
        this.prty = prty;
    }

    /**
     * @return the popupVO
     */
    public ConfirmWearingVehiclePopupVO getPopupVO() {
        return popupVO;
    }

    /**
     * @param popupVO the popupVO to set
     */
    public void setPopupVO(ConfirmWearingVehiclePopupVO popupVO) {
        this.popupVO = popupVO;
    }




}
