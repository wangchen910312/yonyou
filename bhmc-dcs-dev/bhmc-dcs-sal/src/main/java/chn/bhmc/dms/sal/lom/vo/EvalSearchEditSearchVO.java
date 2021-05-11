package chn.bhmc.dms.sal.lom.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseSearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

public class EvalSearchEditSearchVO extends BaseSearchVO {

	private static final long serialVersionUID = 7004150579309829417L;

	private String sDlrCd;
    private String sVinNo;
    private String sCarStatCd;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sPltGiDtS;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sPltGiDtE;
    
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sGrDtS;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sGrDtE;

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
     * @return the sPltGiDtS
     */
    public Date getsPltGiDtS() {
        return sPltGiDtS;
    }

    /**
     * @param sPltGiDtS the sPltGiDtS to set
     */
    public void setsPltGiDtS(Date sPltGiDtS) {
        this.sPltGiDtS = sPltGiDtS;
    }

    /**
     * @return the sPltGiDtE
     */
    public Date getsPltGiDtE() {
        return sPltGiDtE;
    }

    /**
     * @param sPltGiDtE the sPltGiDtE to set
     */
    public void setsPltGiDtE(Date sPltGiDtE) {
        this.sPltGiDtE = sPltGiDtE;
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
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}