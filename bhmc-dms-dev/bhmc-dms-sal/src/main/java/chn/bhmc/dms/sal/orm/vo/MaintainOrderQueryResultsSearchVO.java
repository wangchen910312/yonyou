package chn.bhmc.dms.sal.orm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseSearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

public class MaintainOrderQueryResultsSearchVO extends BaseSearchVO {

	private static final long serialVersionUID = 7004150579309829417L;

	@JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sSysDt;               //시스템 일자(년월)
	private String sPtyOrdTp;          //위약오더 유형
	private String sStockCauCd;        //책임구분(재고 원인코드)
    private String sCarlineCd;
    private String sModelCd;
    private String sOcnCd;
    private String sExtColorCd;
    private String sIntColorCd;
    private String sPtyOrdStatCd;      //위약오더 상태코드
    private String sDlrCd;
    private String sFscNm;
    private String sFscCd;

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
     * @return the sSysDt
     */
    public Date getsSysDt() {
        return sSysDt;
    }
    /**
     * @param sSysDt the sSysDt to set
     */
    public void setsSysDt(Date sSysDt) {
        this.sSysDt = sSysDt;
    }
    /**
     * @return the sPtyOrdTp
     */
    public String getsPtyOrdTp() {
        return sPtyOrdTp;
    }
    /**
     * @param sPtyOrdTp the sPtyOrdTp to set
     */
    public void setsPtyOrdTp(String sPtyOrdTp) {
        this.sPtyOrdTp = sPtyOrdTp;
    }
    /**
     * @return the sStockCauCd
     */
    public String getsStockCauCd() {
        return sStockCauCd;
    }
    /**
     * @param sStockCauCd the sStockCauCd to set
     */
    public void setsStockCauCd(String sStockCauCd) {
        this.sStockCauCd = sStockCauCd;
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
     * @return the sPtyOrdStatCd
     */
    public String getsPtyOrdStatCd() {
        return sPtyOrdStatCd;
    }
    /**
     * @param sPtyOrdStatCd the sPtyOrdStatCd to set
     */
    public void setsPtyOrdStatCd(String sPtyOrdStatCd) {
        this.sPtyOrdStatCd = sPtyOrdStatCd;
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
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }


}

