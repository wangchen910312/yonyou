package chn.bhmc.dms.sal.orm.vo;

import java.io.Serializable;

import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

@ValidDescriptor({
     @ValidField(field="carlineCd", mesgKey="global.lbl.carLine")
    ,@ValidField(field="modelCd", mesgKey="global.lbl.model")
    ,@ValidField(field="ocnCd", mesgKey="global.lbl.ocn")
    ,@ValidField(field="extColorCd", mesgKey="global.lbl.extColor")
    ,@ValidField(field="intColorCd", mesgKey="global.lbl.intColor")
})

public class BtoCreateOrderAmtPopupVO implements Serializable {

	private static final long serialVersionUID = -6091261787809835772L;

    private String modelCd;
    private String ocnCd;
    private double whPrc;
    private double msPrc;
    /**
     * @return the modelCd
     */
    public String getModelCd() {
        return modelCd;
    }
    /**
     * @param modelCd the modelCd to set
     */
    public void setModelCd(String modelCd) {
        this.modelCd = modelCd;
    }
    /**
     * @return the ocnCd
     */
    public String getOcnCd() {
        return ocnCd;
    }
    /**
     * @param ocnCd the ocnCd to set
     */
    public void setOcnCd(String ocnCd) {
        this.ocnCd = ocnCd;
    }
    /**
     * @return the whPrc
     */
    public double getWhPrc() {
        return whPrc;
    }
    /**
     * @param whPrc the whPrc to set
     */
    public void setWhPrc(double whPrc) {
        this.whPrc = whPrc;
    }
    /**
     * @return the msPrc
     */
    public double getMsPrc() {
        return msPrc;
    }
    /**
     * @param msPrc the msPrc to set
     */
    public void setMsPrc(double msPrc) {
        this.msPrc = msPrc;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }





}

