package chn.bhmc.dms.sal.inv.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseSearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * @ClassName   : StockOpenSearchVO
 * @Description : 공개재고 조회 VO
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

public class StockOpenSearchVO extends BaseSearchVO{

    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = 3851507519526391149L;
    
    /* 공개재고설정 팝업 */
    private String sDlrCd;
    private String sSdptCd;
    private String sDistOfficeCd;
    private String sSungCd;
    private String sCityCd;
    private String sOneselfDlrCd;
    
    
    /* 공개재고관리 */
    private String sOpenTp;
    private String sVinNo;
    private String sCarlineCd;
    private String sFscCd;
    private String sModelCd;
    private String sOcnCd;
    private String sExtColorCd;
    private String sIntColorCd;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sUpdtStartDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sUpdtEndDt;
    
    
    /* 공개재고 딜러별 팝업 조회 */
    private String sCarId;
    
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
     * @return the sSdptCd
     */
    public String getsSdptCd() {
        return sSdptCd;
    }
    /**
     * @param sSdptCd the sSdptCd to set
     */
    public void setsSdptCd(String sSdptCd) {
        this.sSdptCd = sSdptCd;
    }
    /**
     * @return the sDistOfficeCd
     */
    public String getsDistOfficeCd() {
        return sDistOfficeCd;
    }
    /**
     * @param sDistOfficeCd the sDistOfficeCd to set
     */
    public void setsDistOfficeCd(String sDistOfficeCd) {
        this.sDistOfficeCd = sDistOfficeCd;
    }
    /**
     * @return the sSungCd
     */
    public String getsSungCd() {
        return sSungCd;
    }
    /**
     * @param sSungCd the sSungCd to set
     */
    public void setsSungCd(String sSungCd) {
        this.sSungCd = sSungCd;
    }
    /**
     * @return the sCityCd
     */
    public String getsCityCd() {
        return sCityCd;
    }
    /**
     * @param sCityCd the sCityCd to set
     */
    public void setsCityCd(String sCityCd) {
        this.sCityCd = sCityCd;
    }
    /**
     * @return the sOneselfDlrCd
     */
    public String getsOneselfDlrCd() {
        return sOneselfDlrCd;
    }
    /**
     * @param sOneselfDlrCd the sOneselfDlrCd to set
     */
    public void setsOneselfDlrCd(String sOneselfDlrCd) {
        this.sOneselfDlrCd = sOneselfDlrCd;
    }
    /**
     * @return the sOpenTp
     */
    public String getsOpenTp() {
        return sOpenTp;
    }
    /**
     * @param sOpenTp the sOpenTp to set
     */
    public void setsOpenTp(String sOpenTp) {
        this.sOpenTp = sOpenTp;
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
     * @return the sUpdtStartDt
     */
    public Date getsUpdtStartDt() {
        return sUpdtStartDt;
    }
    /**
     * @param sUpdtStartDt the sUpdtStartDt to set
     */
    public void setsUpdtStartDt(Date sUpdtStartDt) {
        this.sUpdtStartDt = sUpdtStartDt;
    }
    /**
     * @return the sUpdtEndDt
     */
    public Date getsUpdtEndDt() {
        return sUpdtEndDt;
    }
    /**
     * @param sUpdtEndDt the sUpdtEndDt to set
     */
    public void setsUpdtEndDt(Date sUpdtEndDt) {
        this.sUpdtEndDt = sUpdtEndDt;
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
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}