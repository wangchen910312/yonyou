package chn.bhmc.dms.ser.svi.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * 임률관리 조회 SearchVO
 * </pre>
 *
 * @ClassName   : RateMasterSearchVO.java
 * @Description : 임률관리 조회 SearchVO.
 * @author Yin Xueyuan
 * @since 2016. 1. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 25.     Yin Xueyuan     최초 생성
 * </pre>
 */

public class RateManageSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6947437255468486983L;

    
    /**
     * 조회조건 - 법인코드
     */
    private String sDstinCd;
    
    /**
     * 조회조건 - 딜러코드
     */
    private String sDlrCd;

    /**
     * 조회조건 - 수리유형
     */
    private String sRpirTp;

    /**
     * 조회조건 - 브랜드코드
     */
    private String sBrandCd;
    
    /**
     * 임률 문서번호
     */
    private String sRteDocNo;
    
    /**
     * 적용시작일자 
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date  sApplyStartDt; 
     
    /**
     * 적용종료일자 
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date  sApplyEndDt; 

    /**
     * @return the sDstinCd
     */
    public String getsDstinCd() {
        return sDstinCd;
    }

    /**
     * @param sDstinCd the sDstinCd to set
     */
    public void setsDstinCd(String sDstinCd) {
        this.sDstinCd = sDstinCd;
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
     * @return the sRpirTp
     */
    public String getsRpirTp() {
        return sRpirTp;
    }

    /**
     * @param sRpirTp the sRpirTp to set
     */
    public void setsRpirTp(String sRpirTp) {
        this.sRpirTp = sRpirTp;
    }

    /**
     * @return the sBrandCd
     */
    public String getsBrandCd() {
        return sBrandCd;
    }

    /**
     * @param sBrandCd the sBrandCd to set
     */
    public void setsBrandCd(String sBrandCd) {
        this.sBrandCd = sBrandCd;
    }

    /**
     * @return the sApplyStartDt
     */
    public Date getsApplyStartDt() {
        return sApplyStartDt;
    }

    /**
     * @param sApplyStartDt the sApplyStartDt to set
     */
    public void setsApplyStartDt(Date sApplyStartDt) {
        this.sApplyStartDt = sApplyStartDt;
    }

    /**
     * @return the sApplyEndDt
     */
    public Date getsApplyEndDt() {
        return sApplyEndDt;
    }

    /**
     * @param sApplyEndDt the sApplyEndDt to set
     */
    public void setsApplyEndDt(Date sApplyEndDt) {
        this.sApplyEndDt = sApplyEndDt;
    }

    /**
     * @return the sRteDocNo
     */
    public String getsRteDocNo() {
        return sRteDocNo;
    }

    /**
     * @param sRteDocNo the sRteDocNo to set
     */
    public void setsRteDocNo(String sRteDocNo) {
        this.sRteDocNo = sRteDocNo;
    }

   
 


}
