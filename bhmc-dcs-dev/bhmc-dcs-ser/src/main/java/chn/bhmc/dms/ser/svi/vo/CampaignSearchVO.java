package chn.bhmc.dms.ser.svi.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CampaignSearchVO.java
 * @Description : 캠페인 조회 VO
 * @author Kwon Ki Hyun
 * @since 2016. 2. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 19.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public class CampaignSearchVO extends SearchVO{

    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = -2270158125461839565L;
    
    /**
     * 캠페인 번호 
     **/
    private String sCrNo;
    /**
     * 캠페인 명 
     **/
    private String sCrNm;
    /**
     * 캠페인 시작일자 
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sCrStartDt;
    
    /**
     * 캠페인 종료일자 
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sCrEndDt;
    
    /**
     * 캠페인 빈
     **/ 
    private String sVinNo;
    
    /**
     * 차량유형
     */
    private String sCarDstinCd;
    
    /**
     * 딜러코드
     */
    private String sDlrCd;
    
    
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
     * 생산일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sSignOffDt;       
    
    /**
     * 고객판매일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sCustSaleDt;       
    
    /**
     * 차량브랜드코드
     */
    private String sCarBrandCd;   
    
    /**
     * LTS MODEL CD
     */
    private String sLtsModelCd;
    
    /**
     * 공임 코드
     */
    private String sLbrCd;
    
    /**
     * PDI 여부
     */
    private String sPdiYn;
    
    
    

    /**
     * @return the sPdiYn
     */
    public String getsPdiYn() {
        return sPdiYn;
    }

    /**
     * @param sPdiYn the sPdiYn to set
     */
    public void setsPdiYn(String sPdiYn) {
        this.sPdiYn = sPdiYn;
    }

    /**
     * @return the sLbrCd
     */
    public String getsLbrCd() {
        return sLbrCd;
    }

    /**
     * @param sLbrCd the sLbrCd to set
     */
    public void setsLbrCd(String sLbrCd) {
        this.sLbrCd = sLbrCd;
    }

    /**
     * @return the sCrNo
     */
    public String getsCrNo() {
        return sCrNo;
    }

    /**
     * @param sCrNo the sCrNo to set
     */
    public void setsCrNo(String sCrNo) {
        this.sCrNo = sCrNo;
    }

    /**
     * @return the sCrNm
     */
    public String getsCrNm() {
        return sCrNm;
    }

    /**
     * @param sCrNm the sCrNm to set
     */
    public void setsCrNm(String sCrNm) {
        this.sCrNm = sCrNm;
    }

    

    /**
     * @return the sCrStartDt
     */
    public Date getsCrStartDt() {
        return sCrStartDt;
    }

    /**
     * @param sCrStartDt the sCrStartDt to set
     */
    public void setsCrStartDt(Date sCrStartDt) {
        this.sCrStartDt = sCrStartDt;
    }

    /**
     * @return the sCrEndDt
     */
    public Date getsCrEndDt() {
        return sCrEndDt;
    }

    /**
     * @param sCrEndDt the sCrEndDt to set
     */
    public void setsCrEndDt(Date sCrEndDt) {
        this.sCrEndDt = sCrEndDt;
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
     * @return the sCarDstinCd
     */
    public String getsCarDstinCd() {
        return sCarDstinCd;
    }

    /**
     * @param sCarDstinCd the sCarDstinCd to set
     */
    public void setsCarDstinCd(String sCarDstinCd) {
        this.sCarDstinCd = sCarDstinCd;
    }

    /**
     * @return the sSignOffDt
     */
    public Date getsSignOffDt() {
        return sSignOffDt;
    }

    /**
     * @param sSignOffDt the sSignOffDt to set
     */
    public void setsSignOffDt(Date sSignOffDt) {
        this.sSignOffDt = sSignOffDt;
    }

    /**
     * @return the sCustSaleDt
     */
    public Date getsCustSaleDt() {
        return sCustSaleDt;
    }

    /**
     * @param sCustSaleDt the sCustSaleDt to set
     */
    public void setsCustSaleDt(Date sCustSaleDt) {
        this.sCustSaleDt = sCustSaleDt;
    }

    /**
     * @return the sCarBrandCd
     */
    public String getsCarBrandCd() {
        return sCarBrandCd;
    }

    /**
     * @param sCarBrandCd the sCarBrandCd to set
     */
    public void setsCarBrandCd(String sCarBrandCd) {
        this.sCarBrandCd = sCarBrandCd;
    }

    /**
     * @return the sLtsModelCd
     */
    public String getsLtsModelCd() {
        return sLtsModelCd;
    }

    /**
     * @param sLtsModelCd the sLtsModelCd to set
     */
    public void setsLtsModelCd(String sLtsModelCd) {
        this.sLtsModelCd = sLtsModelCd;
    }

     
    
    
    
    
    

}
