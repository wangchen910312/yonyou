package chn.bhmc.dms.sal.dlv.vo;

import com.fasterxml.jackson.annotation.JsonProperty;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RetailItemReportIfVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Lee Seungmin
 * @since 2017. 4. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 4. 14.     Lee Seungmin     최초 생성
 * </pre>
 */

public class RetailItemReportIfVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 7252385778858894998L;

    @JsonProperty("VBELN_GASS")
    private String vbelnGass;

    @JsonProperty("SPART")
    private String spart;

    @JsonProperty("RL_DATE")
    private String rlDate;

    @JsonProperty("MAKTX")
    private String maktx;

    @JsonProperty("TVALUE")
    private String tvalue;

    @JsonProperty("BODYNUM")
    private String bodynum;

    @JsonProperty("RETAIL_STA")
    private String retailSta;

    @JsonProperty("MATNR")
    private String matnr;

    @JsonProperty("EVA_DATE")
    private String evaDate;

    @JsonProperty("GI_DATE")
    private String giDate;

    @JsonProperty("ZFLAG")
    private String zflag;

    @JsonProperty("DATA_FROM")
    private String dataFrom;

    @JsonProperty("RFLAG")
    private String rflag;

    @JsonProperty("GR_DATE")
    private String grDate;

    @JsonProperty("VKGRP")
    private String vkgrp;

    @JsonProperty("VIN")
    private String vin;

    @JsonProperty("BZIRK")
    private String bzirk;

    @JsonProperty("KUNNR")
    private String kunnr;

    @JsonProperty("SEQ_NUMB")
    private String seqNumb;

    @JsonProperty("NETPR_GUID")
    private String netprGuid;

    @JsonProperty("VKBUR")
    private String vkbur;

    @JsonProperty("SPMON")
    private String spmon;

    @JsonProperty("AUART_GASS")
    private String auartGass;

    @JsonProperty("REBAT_STA")
    private String rebatSta;

    /**
     * @return the vbelnGass
     */
    public String getVbelnGass() {
        return vbelnGass;
    }

    /**
     * @param vbelnGass the vbelnGass to set
     */
    public void setVbelnGass(String vbelnGass) {
        this.vbelnGass = vbelnGass;
    }

    /**
     * @return the spart
     */
    public String getSpart() {
        return spart;
    }

    /**
     * @param spart the spart to set
     */
    public void setSpart(String spart) {
        this.spart = spart;
    }

    /**
     * @return the rlDate
     */
    public String getRlDate() {
        return rlDate;
    }

    /**
     * @param rlDate the rlDate to set
     */
    public void setRlDate(String rlDate) {
        this.rlDate = rlDate;
    }

    /**
     * @return the maktx
     */
    public String getMaktx() {
        return maktx;
    }

    /**
     * @param maktx the maktx to set
     */
    public void setMaktx(String maktx) {
        this.maktx = maktx;
    }

    /**
     * @return the tvalue
     */
    public String getTvalue() {
        return tvalue;
    }

    /**
     * @param tvalue the tvalue to set
     */
    public void setTvalue(String tvalue) {
        this.tvalue = tvalue;
    }

    /**
     * @return the bodynum
     */
    public String getBodynum() {
        return bodynum;
    }

    /**
     * @param bodynum the bodynum to set
     */
    public void setBodynum(String bodynum) {
        this.bodynum = bodynum;
    }

    /**
     * @return the retailSta
     */
    public String getRetailSta() {
        return retailSta;
    }

    /**
     * @param retailSta the retailSta to set
     */
    public void setRetailSta(String retailSta) {
        this.retailSta = retailSta;
    }

    /**
     * @return the matnr
     */
    public String getMatnr() {
        return matnr;
    }

    /**
     * @param matnr the matnr to set
     */
    public void setMatnr(String matnr) {
        this.matnr = matnr;
    }

    /**
     * @return the evaDate
     */
    public String getEvaDate() {
        return evaDate;
    }

    /**
     * @param evaDate the evaDate to set
     */
    public void setEvaDate(String evaDate) {
        this.evaDate = evaDate;
    }

    /**
     * @return the giDate
     */
    public String getGiDate() {
        return giDate;
    }

    /**
     * @param giDate the giDate to set
     */
    public void setGiDate(String giDate) {
        this.giDate = giDate;
    }

    /**
     * @return the zflag
     */
    public String getZflag() {
        return zflag;
    }

    /**
     * @param zflag the zflag to set
     */
    public void setZflag(String zflag) {
        this.zflag = zflag;
    }

    /**
     * @return the dataFrom
     */
    public String getDataFrom() {
        return dataFrom;
    }

    /**
     * @param dataFrom the dataFrom to set
     */
    public void setDataFrom(String dataFrom) {
        this.dataFrom = dataFrom;
    }

    /**
     * @return the rflag
     */
    public String getRflag() {
        return rflag;
    }

    /**
     * @param rflag the rflag to set
     */
    public void setRflag(String rflag) {
        this.rflag = rflag;
    }

    /**
     * @return the grDate
     */
    public String getGrDate() {
        return grDate;
    }

    /**
     * @param grDate the grDate to set
     */
    public void setGrDate(String grDate) {
        this.grDate = grDate;
    }

    /**
     * @return the vkgrp
     */
    public String getVkgrp() {
        return vkgrp;
    }

    /**
     * @param vkgrp the vkgrp to set
     */
    public void setVkgrp(String vkgrp) {
        this.vkgrp = vkgrp;
    }

    /**
     * @return the vin
     */
    public String getVin() {
        return vin;
    }

    /**
     * @param vin the vin to set
     */
    public void setVin(String vin) {
        this.vin = vin;
    }

    /**
     * @return the bzirk
     */
    public String getBzirk() {
        return bzirk;
    }

    /**
     * @param bzirk the bzirk to set
     */
    public void setBzirk(String bzirk) {
        this.bzirk = bzirk;
    }

    /**
     * @return the kunnr
     */
    public String getKunnr() {
        return kunnr;
    }

    /**
     * @param kunnr the kunnr to set
     */
    public void setKunnr(String kunnr) {
        this.kunnr = kunnr;
    }

    /**
     * @return the seqNumb
     */
    public String getSeqNumb() {
        return seqNumb;
    }

    /**
     * @param seqNumb the seqNumb to set
     */
    public void setSeqNumb(String seqNumb) {
        this.seqNumb = seqNumb;
    }

    /**
     * @return the netprGuid
     */
    public String getNetprGuid() {
        return netprGuid;
    }

    /**
     * @param netprGuid the netprGuid to set
     */
    public void setNetprGuid(String netprGuid) {
        this.netprGuid = netprGuid;
    }

    /**
     * @return the vkbur
     */
    public String getVkbur() {
        return vkbur;
    }

    /**
     * @param vkbur the vkbur to set
     */
    public void setVkbur(String vkbur) {
        this.vkbur = vkbur;
    }

    /**
     * @return the spmon
     */
    public String getSpmon() {
        return spmon;
    }

    /**
     * @param spmon the spmon to set
     */
    public void setSpmon(String spmon) {
        this.spmon = spmon;
    }

    /**
     * @return the auartGass
     */
    public String getAuartGass() {
        return auartGass;
    }

    /**
     * @param auartGass the auartGass to set
     */
    public void setAuartGass(String auartGass) {
        this.auartGass = auartGass;
    }

    /**
     * @return the rebatSta
     */
    public String getRebatSta() {
        return rebatSta;
    }

    /**
     * @param rebatSta the rebatSta to set
     */
    public void setRebatSta(String rebatSta) {
        this.rebatSta = rebatSta;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }



}