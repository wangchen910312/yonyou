package chn.bhmc.dms.mob.api.sales.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseSearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

public class BtoCreateOrderSearchVO extends BaseSearchVO {

	private static final long serialVersionUID = 7004150579309829417L;

	private String sDlrCd;
	private String sDeptCd;
	private String sOrdTp;
    private String sOrdYyMmPrid;
    private String sCarlineCd;
    private String sModelCd;
    private String sOcnCd;
    private String sExtColorCd;
    private String sIntColorCd;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sOrdDtS;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sOrdDtE;
    private String sFscNm;
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
     * @return the sFscNm
     */
    public String getsFscNm() {
        return sFscNm;
    }
    /**
     * @param sFscNm the sFscNm to set
     */
    public void setsFscNm(String sFscNm) {
        this.sFscNm = sFscNm;
    }
    private int sTotalCnt;          // total count

    /**
     * @return the sTotalCnt
     */
    public int getsTotalCnt() {
        return sTotalCnt;
    }
    /**
     * @param sTotalCnt the sTotalCnt to set
     */
    public void setsTotalCnt(int sTotalCnt) {
        this.sTotalCnt = sTotalCnt;
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
     * @return the sDeptCd
     */
    public String getsDeptCd() {
        return sDeptCd;
    }
    /**
     * @param sDeptCd the sDeptCd to set
     */
    public void setsDeptCd(String sDeptCd) {
        this.sDeptCd = sDeptCd;
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



}

