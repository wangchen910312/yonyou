package chn.bhmc.dms.sal.lom.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseSearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

public class EvalSearchEditSearchVO extends BaseSearchVO {

	private static final long serialVersionUID = 7004150579309829417L;

	private String sDlrFlag;
	private String sDlrCd;
    private String sVinNo;
    private String sCarStatCd;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sGrDtS;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sGrDtE;
    private String sGrDtSstr;
    private String sGrDtEstr;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sPltGiDtS;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sPltGiDtE;
    private String sPltGiDtSstr;
    private String sPltGiDtEstr;

    //vin배정일
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sCarVinAllocDtS;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sCarVinAllocDtE;

    //고객판매일
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sCustSaleDtS;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sCustSaleDtE;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sDlrEvalDtS;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sDlrEvalDtE;

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
     * @return the sGrDtS
     */
    public Date getsGrDtS() {
        return sGrDtS;
    }
    /**
     * @param sGrDtS the sGrDtS to set
     */
    public void setsGrDtS(Date sGrDtS) {
        this.sGrDtS = sGrDtS;
    }
    /**
     * @return the sGrDtE
     */
    public Date getsGrDtE() {
        return sGrDtE;
    }
    /**
     * @param sGrDtE the sGrDtE to set
     */
    public void setsGrDtE(Date sGrDtE) {
        this.sGrDtE = sGrDtE;
    }
    /**
     * @return the sGrDtSstr
     */
    public String getsGrDtSstr() {
        return sGrDtSstr;
    }
    /**
     * @param sGrDtSstr the sGrDtSstr to set
     */
    public void setsGrDtSstr(String sGrDtSstr) {
        this.sGrDtSstr = sGrDtSstr;
    }
    /**
     * @return the sGrDtEstr
     */
    public String getsGrDtEstr() {
        return sGrDtEstr;
    }
    /**
     * @param sGrDtEstr the sGrDtEstr to set
     */
    public void setsGrDtEstr(String sGrDtEstr) {
        this.sGrDtEstr = sGrDtEstr;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    /**
     * @return the sPltGiDtS
     */
    public Date getsPltGiDtS() {
        return sPltGiDtS;
    }
    /**
     * @return the sPltGiDtE
     */
    public Date getsPltGiDtE() {
        return sPltGiDtE;
    }
    /**
     * @return the sPltGiDtSstr
     */
    public String getsPltGiDtSstr() {
        return sPltGiDtSstr;
    }
    /**
     * @return the sPltGiDtEstr
     */
    public String getsPltGiDtEstr() {
        return sPltGiDtEstr;
    }
    /**
     * @param sPltGiDtS the sPltGiDtS to set
     */
    public void setsPltGiDtS(Date sPltGiDtS) {
        this.sPltGiDtS = sPltGiDtS;
    }
    /**
     * @param sPltGiDtE the sPltGiDtE to set
     */
    public void setsPltGiDtE(Date sPltGiDtE) {
        this.sPltGiDtE = sPltGiDtE;
    }
    /**
     * @param sPltGiDtSstr the sPltGiDtSstr to set
     */
    public void setsPltGiDtSstr(String sPltGiDtSstr) {
        this.sPltGiDtSstr = sPltGiDtSstr;
    }
    /**
     * @param sPltGiDtEstr the sPltGiDtEstr to set
     */
    public void setsPltGiDtEstr(String sPltGiDtEstr) {
        this.sPltGiDtEstr = sPltGiDtEstr;
    }
    /**
     * @return the sCarVinAllocDtS
     */
    public Date getsCarVinAllocDtS() {
        return sCarVinAllocDtS;
    }
    /**
     * @return the sCarVinAllocDtE
     */
    public Date getsCarVinAllocDtE() {
        return sCarVinAllocDtE;
    }
    /**
     * @return the sCustSaleDtS
     */
    public Date getsCustSaleDtS() {
        return sCustSaleDtS;
    }
    /**
     * @return the sCustSaleDtE
     */
    public Date getsCustSaleDtE() {
        return sCustSaleDtE;
    }
    /**
     * @param sCarVinAllocDtS the sCarVinAllocDtS to set
     */
    public void setsCarVinAllocDtS(Date sCarVinAllocDtS) {
        this.sCarVinAllocDtS = sCarVinAllocDtS;
    }
    /**
     * @param sCarVinAllocDtE the sCarVinAllocDtE to set
     */
    public void setsCarVinAllocDtE(Date sCarVinAllocDtE) {
        this.sCarVinAllocDtE = sCarVinAllocDtE;
    }
    /**
     * @param sCustSaleDtS the sCustSaleDtS to set
     */
    public void setsCustSaleDtS(Date sCustSaleDtS) {
        this.sCustSaleDtS = sCustSaleDtS;
    }
    /**
     * @param sCustSaleDtE the sCustSaleDtE to set
     */
    public void setsCustSaleDtE(Date sCustSaleDtE) {
        this.sCustSaleDtE = sCustSaleDtE;
    }
    /**
     * @return the sDlrFlag
     */
    public String getsDlrFlag() {
        return sDlrFlag;
    }
    /**
     * @param sDlrFlag the sDlrFlag to set
     */
    public void setsDlrFlag(String sDlrFlag) {
        this.sDlrFlag = sDlrFlag;
    }
    /**
     * @return the sDlrEvalDtS
     */
    public Date getsDlrEvalDtS() {
        return sDlrEvalDtS;
    }
    /**
     * @return the sDlrEvalDtE
     */
    public Date getsDlrEvalDtE() {
        return sDlrEvalDtE;
    }
    /**
     * @param sDlrEvalDtS the sDlrEvalDtS to set
     */
    public void setsDlrEvalDtS(Date sDlrEvalDtS) {
        this.sDlrEvalDtS = sDlrEvalDtS;
    }
    /**
     * @param sDlrEvalDtE the sDlrEvalDtE to set
     */
    public void setsDlrEvalDtE(Date sDlrEvalDtE) {
        this.sDlrEvalDtE = sDlrEvalDtE;
    }

}