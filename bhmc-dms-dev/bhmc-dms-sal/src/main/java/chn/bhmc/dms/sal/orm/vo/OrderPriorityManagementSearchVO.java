package chn.bhmc.dms.sal.orm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseSearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

public class OrderPriorityManagementSearchVO extends BaseSearchVO {

	private static final long serialVersionUID = 7004150579309829417L;

    private String sDlrCd;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sOrdYyMmDt;
    private String sOrdPrid;
    private String sOrdTp;

    private String sCarlineCd;
    private String sModelCd;
    private String sOcnCd;
    private String sExtColorCd;
    private String sIntColorCd;


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
     * @return the sOrdYyMmDt
     */
    public Date getsOrdYyMmDt() {
        return sOrdYyMmDt;
    }


    /**
     * @param sOrdYyMmDt the sOrdYyMmDt to set
     */
    public void setsOrdYyMmDt(Date sOrdYyMmDt) {
        this.sOrdYyMmDt = sOrdYyMmDt;
    }


    /**
     * @return the sOrdPrid
     */
    public String getsOrdPrid() {
        return sOrdPrid;
    }


    /**
     * @param sOrdPrid the sOrdPrid to set
     */
    public void setsOrdPrid(String sOrdPrid) {
        this.sOrdPrid = sOrdPrid;
    }


    /**
     * @return the sOrdTp
     */
    public String getsOrdTp() {
        return sOrdTp;
    }


    /**
     * @param sOrdTp the sOrdTp to set
     */
    public void setsOrdTp(String sOrdTp) {
        this.sOrdTp = sOrdTp;
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
     * @return the sExtColorCd
     */
    public String getsExtColorCd() {
        return sExtColorCd;
    }


    /**
     * @param sExtColorCd the sExtColorCd to set
     */
    public void setsExtColorCd(String sExtColorCd) {
        this.sExtColorCd = sExtColorCd;
    }


    /**
     * @return the sIntColorCd
     */
    public String getsIntColorCd() {
        return sIntColorCd;
    }


    /**
     * @param sIntColorCd the sIntColorCd to set
     */
    public void setsIntColorCd(String sIntColorCd) {
        this.sIntColorCd = sIntColorCd;
    }


    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }


}

