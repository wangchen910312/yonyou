package chn.bhmc.dms.sal.acu.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseSearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * @ClassName   : ContBeforeMngSearchVO
 * @Description : 예약판매 조회 VO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 12.    Kim Jin Suk      최초 생성
 * </pre>
 */

public class ContBeforeMngSupportSearchVO extends BaseSearchVO{

    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = 6458282278879389847L;

    private String sDlrCd;
    private String sBeforeNo;
    private String sSaleEmpNo;
    private String sCustNm;
    private String sCustNo;
    private String sBeforeStatCd;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStartBeforeDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndBeforeDt;
    private String sCarlineCd;
    private String sModelCd;
    private String sFscCd;
    private String sOcnCd;
    private String sGb;
    
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
     * @return the sBeforeNo
     */
    public String getsBeforeNo() {
        return sBeforeNo;
    }
    /**
     * @param sBeforeNo the sBeforeNo to set
     */
    public void setsBeforeNo(String sBeforeNo) {
        this.sBeforeNo = sBeforeNo;
    }
    /**
     * @return the sSaleEmpNo
     */
    public String getsSaleEmpNo() {
        return sSaleEmpNo;
    }
    /**
     * @param sSaleEmpNo the sSaleEmpNo to set
     */
    public void setsSaleEmpNo(String sSaleEmpNo) {
        this.sSaleEmpNo = sSaleEmpNo;
    }
    /**
     * @return the sCustNm
     */
    public String getsCustNm() {
        return sCustNm;
    }
    /**
     * @param sCustNm the sCustNm to set
     */
    public void setsCustNm(String sCustNm) {
        this.sCustNm = sCustNm;
    }
    /**
     * @return the sCustNo
     */
    public String getsCustNo() {
        return sCustNo;
    }
    /**
     * @param sCustNo the sCustNo to set
     */
    public void setsCustNo(String sCustNo) {
        this.sCustNo = sCustNo;
    }
    /**
     * @return the sBeforeStatCd
     */
    public String getsBeforeStatCd() {
        return sBeforeStatCd;
    }
    /**
     * @param sBeforeStatCd the sBeforeStatCd to set
     */
    public void setsBeforeStatCd(String sBeforeStatCd) {
        this.sBeforeStatCd = sBeforeStatCd;
    }
    /**
     * @return the sStartBeforeDt
     */
    public Date getsStartBeforeDt() {
        return sStartBeforeDt;
    }
    /**
     * @param sStartBeforeDt the sStartBeforeDt to set
     */
    public void setsStartBeforeDt(Date sStartBeforeDt) {
        this.sStartBeforeDt = sStartBeforeDt;
    }
    /**
     * @return the sEndBeforeDt
     */
    public Date getsEndBeforeDt() {
        return sEndBeforeDt;
    }
    /**
     * @param sEndBeforeDt the sEndBeforeDt to set
     */
    public void setsEndBeforeDt(Date sEndBeforeDt) {
        this.sEndBeforeDt = sEndBeforeDt;
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
     * @return the sGb
     */
    public String getsGb() {
        return sGb;
    }
    /**
     * @param sGb the sGb to set
     */
    public void setsGb(String sGb) {
        this.sGb = sGb;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}