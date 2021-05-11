package chn.bhmc.dms.crm.cif.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 *
 * @ClassName   : CustChargeVO.java
 * @Description : 고객 충전 VO
 * @author liu jing
 * @since 2017. 1. 16.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 1. 16.     liu jing               최초 생성
 * </pre>
 */

public class CustChargeMstSearchVO extends SearchVO{
    
    
    
    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = 8825466603523550226L;
    /**
     * Statements
     * (long)serialVersionUID
     */
    
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date sStartDt;

     /**
     * 상품선택코드
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
     private  Date sEndDt;

    private String sDlrCd;
    private String sCustNm;                        // 고객명 [내방리스트]
    private String sCustNo;                        // 고객번호 [내방리스트-내방이력]
    private String sHpNo;                          // 연락처 [내방리스트]
    
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
     * @return the sHpNo
     */
    public String getsHpNo() {
        return sHpNo;
    }

    /**
     * @param sHpNo the sHpNo to set
     */
    public void setsHpNo(String sHpNo) {
        this.sHpNo = sHpNo;
    }

    /**
     * @param sStartDt the sStartDt to set
     */
    public void setsStartDt(Date sStartDt) {
        this.sStartDt = sStartDt;
    }

    /**
     * @return the sStartDt
     */
    public Date getsStartDt() {
        return sStartDt;
    }

    /**
     * @param sEndDt the sEndDt to set
     */
    public void setsEndDt(Date sEndDt) {
        this.sEndDt = sEndDt;
    }

    /**
     * @return the sEndDt
     */
    public Date getsEndDt() {
        return sEndDt;
    }

    /**
     * @param sDlrCd the sDlrCd to set
     */
    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }

    /**
     * @return the sDlrCd
     */
    public String getsDlrCd() {
        return sDlrCd;
    }
}
