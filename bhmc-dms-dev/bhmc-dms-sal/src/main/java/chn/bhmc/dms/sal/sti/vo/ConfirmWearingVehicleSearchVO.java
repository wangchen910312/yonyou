package chn.bhmc.dms.sal.sti.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseSearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

public class ConfirmWearingVehicleSearchVO extends BaseSearchVO {

	private static final long serialVersionUID = 7004150579309829417L;

    private String sCarStatCd;
    private String sOrdTp;
    private String sVinNo;
    private String sDlrCd;
    private String sFscCd;
    private String sCarlineCd;
    private String sModelCd;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sOrdDtS;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sOrdDtE;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sOrdDtStart;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sOrdDtEnd;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sGrDtStart;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sGrDtEnd;

    private List<String> barcodeList = new ArrayList<String>();

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
     * @return the sCarStatCd
     */
    public String getsCarStatCd() {
        return sCarStatCd;
    }
    /**
     * @param sCarStatCd the sCarStatCd to set
     */
    public void setsCarStatCd(String sCarStatCd) {
        this.sCarStatCd = sCarStatCd;
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
     * @return the sVinNo
     */
    public String getsVinNo() {
        return sVinNo;
    }
    /**
     * @param sVinNo the sVinNo to set
     */
    public void setsVinNo(String sVinNo) {
        this.sVinNo = sVinNo;
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
     * @return the barcodeList
     */
    public List<String> getBarcodeList() {
        return barcodeList;
    }
    /**
     * @param barcodeList the barcodeList to set
     */
    public void setBarcodeList(List<String> barcodeList) {
        this.barcodeList = barcodeList;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    /**
     * @return the sOrdDtStart
     */
    public Date getsOrdDtStart() {
        return sOrdDtStart;
    }
    /**
     * @param sOrdDtStart the sOrdDtStart to set
     */
    public void setsOrdDtStart(Date sOrdDtStart) {
        this.sOrdDtStart = sOrdDtStart;
    }
    /**
     * @return the sOrdDtEnd
     */
    public Date getsOrdDtEnd() {
        return sOrdDtEnd;
    }
    /**
     * @param sOrdDtEnd the sOrdDtEnd to set
     */
    public void setsOrdDtEnd(Date sOrdDtEnd) {
        this.sOrdDtEnd = sOrdDtEnd;
    }
    /**
     * @return the sGrDtStart
     */
    public Date getsGrDtStart() {
        return sGrDtStart;
    }
    /**
     * @param sGrDtStart the sGrDtStart to set
     */
    public void setsGrDtStart(Date sGrDtStart) {
        this.sGrDtStart = sGrDtStart;
    }
    /**
     * @return the sGrDtEnd
     */
    public Date getsGrDtEnd() {
        return sGrDtEnd;
    }
    /**
     * @param sGrDtEnd the sGrDtEnd to set
     */
    public void setsGrDtEnd(Date sGrDtEnd) {
        this.sGrDtEnd = sGrDtEnd;
    }

}

