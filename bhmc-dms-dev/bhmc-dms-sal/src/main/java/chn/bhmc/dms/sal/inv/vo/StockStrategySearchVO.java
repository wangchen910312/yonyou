package chn.bhmc.dms.sal.inv.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseSearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * @ClassName   : StockStrategySearchVO
 * @Description : 전략출고관리 조회 VO
 * @author Jin Suk Kim
 * @since 2016. 3. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 24.     Jin Suk Kim     최초 생성
 * </pre>
 */

public class StockStrategySearchVO extends BaseSearchVO{
    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = 5182547076886072601L;

    private String sDlrCd;
    private String sStrStat;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStrAskStartDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStrAskEndDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStrConfirmStartDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStrConfirmEndDt;
    private String sCarlineCd;
    private String sModelCd;
    private String sOcnCd;
    private String sExtColorCd;
    private String sIntColorCd;
    private String sVinNo;
    private String sCarId;

    private String isDeliveryGubun = "N";
    
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
     * @return the sStrStat
     */
    public String getsStrStat() {
        return sStrStat;
    }
    /**
     * @param sStrStat the sStrStat to set
     */
    public void setsStrStat(String sStrStat) {
        this.sStrStat = sStrStat;
    }
    /**
     * @return the sStrAskStartDt
     */
    public Date getsStrAskStartDt() {
        return sStrAskStartDt;
    }
    /**
     * @param sStrAskStartDt the sStrAskStartDt to set
     */
    public void setsStrAskStartDt(Date sStrAskStartDt) {
        this.sStrAskStartDt = sStrAskStartDt;
    }
    /**
     * @return the sStrAskEndDt
     */
    public Date getsStrAskEndDt() {
        return sStrAskEndDt;
    }
    /**
     * @param sStrAskEndDt the sStrAskEndDt to set
     */
    public void setsStrAskEndDt(Date sStrAskEndDt) {
        this.sStrAskEndDt = sStrAskEndDt;
    }
    /**
     * @return the sStrConfirmStartDt
     */
    public Date getsStrConfirmStartDt() {
        return sStrConfirmStartDt;
    }
    /**
     * @param sStrConfirmStartDt the sStrConfirmStartDt to set
     */
    public void setsStrConfirmStartDt(Date sStrConfirmStartDt) {
        this.sStrConfirmStartDt = sStrConfirmStartDt;
    }
    /**
     * @return the sStrConfirmEndDt
     */
    public Date getsStrConfirmEndDt() {
        return sStrConfirmEndDt;
    }
    /**
     * @param sStrConfirmEndDt the sStrConfirmEndDt to set
     */
    public void setsStrConfirmEndDt(Date sStrConfirmEndDt) {
        this.sStrConfirmEndDt = sStrConfirmEndDt;
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
     * @return the sCarId
     */
    public String getsCarId() {
        return sCarId;
    }
    /**
     * @param sCarId the sCarId to set
     */
    public void setsCarId(String sCarId) {
        this.sCarId = sCarId;
    }
    /**
     * @return the isDeliveryGubun
     */
    public String getIsDeliveryGubun() {
        return isDeliveryGubun;
    }
    /**
     * @param isDeliveryGubun the isDeliveryGubun to set
     */
    public void setIsDeliveryGubun(String isDeliveryGubun) {
        this.isDeliveryGubun = isDeliveryGubun;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}