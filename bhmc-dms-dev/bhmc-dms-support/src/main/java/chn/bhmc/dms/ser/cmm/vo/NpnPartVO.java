package chn.bhmc.dms.ser.cmm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : NpnPartVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2017. 2. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 19.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public class NpnPartVO  extends BaseVO  {
        
    
    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = -2437725072188924462L;

    /**
     * Company-Id          
     **/
    private String npnpCmpnCd;      
     
    /**
     * Distributor         
     **/
    private String npnpCorpCd;      
     
    /**
     * NPN PART NUMBER     
     **/
    private String npnpPartNo;      
     
    /**
     * PART  ENG NAME      
     **/
    //NPNP_PART_NM_ENG
    private String npnpPartNmEng;   
     
    /**
     * PART CHINESE NAME   
     **/
    //NPNP_PART_NM_NAT
    private String npnpPartNmNat;   
    
    private String npnpPartNm;
     
    /**
     * EFFECTIVE START DATE
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date npnpEfftFrom;    
     
    /**
     * EFFECTIVE END DATE  
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date npnpEfftTo;      
     
    /**
     * MODELCODe 
     **/
    //NPNP_MDL_CD
    private String npnpMdlCd;       
     
    /**
     * MODELFLAg 
     **/
    //NPNP_MDL_FLAG
    private String npnpMdlFlag;     
     
    /**
     * MAX AMT PER UNIT    
     **/
    //NPNP_MAX_UNIT_AMT
    private Double npnpMaxUnitAmt;  
     
    /**
     * MAX QTY             
     **/
    //NPNP_MAX_PER_QTY
    private Double npnpMaxPerQty;   
     
    /**
     * MAX AMT             
     **/
    //NPNP_MAX_PER_AMT
    private Double npnpMaxPerAmt;   
    
    private String npnpYn;
     
    /**
     * ACTIVE FLAG         
     **/
    //NPNP_ACTIVE_FLAG
    private String npnpActiveFlag;

    public String getNpnpCmpnCd() {
        return npnpCmpnCd;
    }

    public void setNpnpCmpnCd(String npnpCmpnCd) {
        this.npnpCmpnCd = npnpCmpnCd;
    }

    public String getNpnpCorpCd() {
        return npnpCorpCd;
    }

    public void setNpnpCorpCd(String npnpCorpCd) {
        this.npnpCorpCd = npnpCorpCd;
    }

    public String getNpnpPartNo() {
        return npnpPartNo;
    }

    public void setNpnpPartNo(String npnpPartNo) {
        this.npnpPartNo = npnpPartNo;
    }

    public String getNpnpPartNmEng() {
        return npnpPartNmEng;
    }

    public void setNpnpPartNmEng(String npnpPartNmEng) {
        this.npnpPartNmEng = npnpPartNmEng;
    }

    public String getNpnpPartNmNat() {
        return npnpPartNmNat;
    }

    public void setNpnpPartNmNat(String npnpPartNmNat) {
        this.npnpPartNmNat = npnpPartNmNat;
    }

    public Date getNpnpEfftFrom() {
        return npnpEfftFrom;
    }

    public void setNpnpEfftFrom(Date npnpEfftFrom) {
        this.npnpEfftFrom = npnpEfftFrom;
    }

    public Date getNpnpEfftTo() {
        return npnpEfftTo;
    }

    public void setNpnpEfftTo(Date npnpEfftTo) {
        this.npnpEfftTo = npnpEfftTo;
    }

    public String getNpnpMdlCd() {
        return npnpMdlCd;
    }

    public void setNpnpMdlCd(String npnpMdlCd) {
        this.npnpMdlCd = npnpMdlCd;
    }

    public String getNpnpMdlFlag() {
        return npnpMdlFlag;
    }

    public void setNpnpMdlFlag(String npnpMdlFlag) {
        this.npnpMdlFlag = npnpMdlFlag;
    }

    public Double getNpnpMaxUnitAmt() {
        return npnpMaxUnitAmt;
    }

    public void setNpnpMaxUnitAmt(Double npnpMaxUnitAmt) {
        this.npnpMaxUnitAmt = npnpMaxUnitAmt;
    }

    public Double getNpnpMaxPerQty() {
        return npnpMaxPerQty;
    }

    public void setNpnpMaxPerQty(Double npnpMaxPerQty) {
        this.npnpMaxPerQty = npnpMaxPerQty;
    }

    public Double getNpnpMaxPerAmt() {
        return npnpMaxPerAmt;
    }

    public void setNpnpMaxPerAmt(Double npnpMaxPerAmt) {
        this.npnpMaxPerAmt = npnpMaxPerAmt;
    }

    public String getNpnpActiveFlag() {
        return npnpActiveFlag;
    }

    public void setNpnpActiveFlag(String npnpActiveFlag) {
        this.npnpActiveFlag = npnpActiveFlag;
    }

    public String getNpnpPartNm() {
        return npnpPartNm;
    }

    public void setNpnpPartNm(String npnpPartNm) {
        this.npnpPartNm = npnpPartNm;
    }

    public String getNpnpYn() {
        return npnpYn;
    }

    public void setNpnpYn(String npnpYn) {
        this.npnpYn = npnpYn;
    }

     
    
}
