package chn.bhmc.dms.sal.mst.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseSearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

public class PositionsDiscountSearchVO extends BaseSearchVO {


	/**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5219937150768792764L;

    private String sDlrCd;
    private String sCarlineCd;
    private String sModelCd;
    private String sOcnCd;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStartDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndDt;
    private String sFscCd;

    /**
     * @return the sFscCd
     */
    public String getsFscCd() {
        return sFscCd;
    }

    /**
     * @param sFscCd the sFscCd to set
     */
    public void setsFscCd(String sFscCd) {
        this.sFscCd = sFscCd;
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
     * @return the sCarlineCd
     */
    public String getsCarlineCd() {
        return sCarlineCd;
    }

    /**
     * @param sCarlineCd the sCarlineCd to set
     */
    public void setsCarlineCd(String sCarlineCd) {
        this.sCarlineCd = sCarlineCd;
    }

    /**
     * @return the sModelCd
     */
    public String getsModelCd() {
        return sModelCd;
    }

    /**
     * @param sModelCd the sModelCd to set
     */
    public void setsModelCd(String sModelCd) {
        this.sModelCd = sModelCd;
    }

    /**
     * @return the sOcnCd
     */
    public String getsOcnCd() {
        return sOcnCd;
    }

    /**
     * @param sOcnCd the sOcnCd to set
     */
    public void setsOcnCd(String sOcnCd) {
        this.sOcnCd = sOcnCd;
    }

    /**
     * @return the sStartDt
     */
    public Date getsStartDt() {
        return sStartDt;
    }

    /**
     * @param sStartDt the sStartDt to set
     */
    public void setsStartDt(Date sStartDt) {
        this.sStartDt = sStartDt;
    }

    /**
     * @return the sEndDt
     */
    public Date getsEndDt() {
        return sEndDt;
    }

    /**
     * @param sEndDt the sEndDt to set
     */
    public void setsEndDt(Date sEndDt) {
        this.sEndDt = sEndDt;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }



}

