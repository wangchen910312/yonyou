package chn.bhmc.dms.sal.orm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseSearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

public class BtoSearchOrderSearchVO extends BaseSearchVO {

	private static final long serialVersionUID = 7004150579309829417L;

	private String sDlrCd;
	private String sOrdTp;
    private String sOrdYyMmPrid;
    private String sCarlineCd;
    private String sModelCd;
    private String sOcnCd;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sOrdDtS;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sOrdDtE;
    private String sOrdStatCd;

    private String sExtColorCd;
    private String sIntColorCd;
    private String sOrdYyMmDt;
    private String sOrdPrid;
    private String sOrdNo;

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
     * @return the sOrdYyMmPrid
     */
    public String getsOrdYyMmPrid() {
        return sOrdYyMmPrid;
    }
    /**
     * @param sOrdYyMmPrid the sOrdYyMmPrid to set
     */
    public void setsOrdYyMmPrid(String sOrdYyMmPrid) {
        this.sOrdYyMmPrid = sOrdYyMmPrid;
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
     * @return the sOrdDtS
     */
    public Date getsOrdDtS() {
        return sOrdDtS;
    }
    /**
     * @param sOrdDtS the sOrdDtS to set
     */
    public void setsOrdDtS(Date sOrdDtS) {
        this.sOrdDtS = sOrdDtS;
    }
    /**
     * @return the sOrdDtE
     */
    public Date getsOrdDtE() {
        return sOrdDtE;
    }
    /**
     * @param sOrdDtE the sOrdDtE to set
     */
    public void setsOrdDtE(Date sOrdDtE) {
        this.sOrdDtE = sOrdDtE;
    }
    /**
     * @return the sStatCd
     */
    public String getsOrdStatCd() {
        return sOrdStatCd;
    }
    /**
     * @param sStatCd the sStatCd to set
     */
    public void setsOrdStatCd(String sOrdStatCd) {
        this.sOrdStatCd = sOrdStatCd;
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
     * @return the sOrdYyMmDt
     */
    public String getsOrdYyMmDt() {
        return sOrdYyMmDt;
    }
    /**
     * @param sOrdYyMmDt the sOrdYyMmDt to set
     */
    public void setsOrdYyMmDt(String sOrdYyMmDt) {
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
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    /**
     * @return the sOrdNo
     */
    public String getsOrdNo() {
        return sOrdNo;
    }
    /**
     * @param sOrdNo the sOrdNo to set
     */
    public void setsOrdNo(String sOrdNo) {
        this.sOrdNo = sOrdNo;
    }

}