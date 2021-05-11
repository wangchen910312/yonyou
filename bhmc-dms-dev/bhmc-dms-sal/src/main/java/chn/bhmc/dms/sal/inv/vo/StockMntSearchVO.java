package chn.bhmc.dms.sal.inv.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseSearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * @ClassName   : StockMntSearchVO.java
 * @Description : 재고상태관리 조회 VO
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

public class StockMntSearchVO extends BaseSearchVO{

    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = 6341776262101277069L;
    private String sDlrCd;
    private String sCarId;
    private String tStockTp;
    private String sStrgeCd;
    private String sLocCd;
    private String sVinNo;
    private String sCarlineCd;
    private String sFscCd;
    private String sModelCd;
    private String sOcnCd;
    private String sExtColorCd;
    private String sIntColorCd;
    private String sEnginNo;
    private String sBlockYn;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStartGrDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndGrDt;
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
     * @return the tStockTp
     */
    public String gettStockTp() {
        return tStockTp;
    }
    /**
     * @param tStockTp the tStockTp to set
     */
    public void settStockTp(String tStockTp) {
        this.tStockTp = tStockTp;
    }
    /**
     * @return the sStrgeCd
     */
    public String getsStrgeCd() {
        return sStrgeCd;
    }
    /**
     * @param sStrgeCd the sStrgeCd to set
     */
    public void setsStrgeCd(String sStrgeCd) {
        this.sStrgeCd = sStrgeCd;
    }
    /**
     * @return the sLocCd
     */
    public String getsLocCd() {
        return sLocCd;
    }
    /**
     * @param sLocCd the sLocCd to set
     */
    public void setsLocCd(String sLocCd) {
        this.sLocCd = sLocCd;
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
     * @return the sEnginNo
     */
    public String getsEnginNo() {
        return sEnginNo;
    }
    /**
     * @param sEnginNo the sEnginNo to set
     */
    public void setsEnginNo(String sEnginNo) {
        this.sEnginNo = sEnginNo;
    }
    /**
     * @return the sBlockYn
     */
    public String getsBlockYn() {
        return sBlockYn;
    }
    /**
     * @param sBlockYn the sBlockYn to set
     */
    public void setsBlockYn(String sBlockYn) {
        this.sBlockYn = sBlockYn;
    }
    /**
     * @return the sStartGrDt
     */
    public Date getsStartGrDt() {
        return sStartGrDt;
    }
    /**
     * @param sStartGrDt the sStartGrDt to set
     */
    public void setsStartGrDt(Date sStartGrDt) {
        this.sStartGrDt = sStartGrDt;
    }
    /**
     * @return the sEndGrDt
     */
    public Date getsEndGrDt() {
        return sEndGrDt;
    }
    /**
     * @param sEndGrDt the sEndGrDt to set
     */
    public void setsEndGrDt(Date sEndGrDt) {
        this.sEndGrDt = sEndGrDt;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}
