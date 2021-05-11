package chn.bhmc.dms.sal.usc.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PurcEvalSearchVO
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim yewon
 * @since 2016. 6. 9.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 9.    Kim yewon               최초 생성
 * </pre>
 */

public class PurcEvalSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;

    private String sDlrCd;                      //딜러번호
    private String sPurcNo;                     //매입번호
    private String sPurcCustNo;                 //구매고객번호
    private String sVinNo;                      //VIN NO
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sPurcRegStartDt;               //매입등록일자 - 시작일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sPurcRegEndDt;                 //매입등록일자 - 종료일자
    private String sPlatNo;                     //차량번호
    private String sCarlineCd;
    private String sPurcCustNm;
    private String sContractNo;
    private String sPurcStatCd;
    /**
     * @return the sPurcStatCd
     */
    public String getsPurcStatCd() {
        return sPurcStatCd;
    }
    /**
     * @param sPurcStatCd the sPurcStatCd to set
     */
    public void setsPurcStatCd(String sPurcStatCd) {
        this.sPurcStatCd = sPurcStatCd;
    }
    /**
     * @return the sContSearch
     */
    public String getsContSearch() {
        return sContSearch;
    }
    /**
     * @param sContSearch the sContSearch to set
     */
    public void setsContSearch(String sContSearch) {
        this.sContSearch = sContSearch;
    }
    private String sContSearch;


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
    private String sCarBrandCd;
    private String sModelCd;
    private String sExtColorCd;

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
     * @return the sPurcNo
     */
    public String getsPurcNo() {
        return sPurcNo;
    }
    /**
     * @param sPurcNo the sPurcNo to set
     */
    public void setsPurcNo(String sPurcNo) {
        this.sPurcNo = sPurcNo;
    }
    /**
     * @return the sPurcCustNo
     */
    public String getsPurcCustNo() {
        return sPurcCustNo;
    }
    /**
     * @param sPurcCustNo the sPurcCustNo to set
     */
    public void setsPurcCustNo(String sPurcCustNo) {
        this.sPurcCustNo = sPurcCustNo;
    }
    /**
     * @return the sPurcRegStartDt
     */
    public Date getsPurcRegStartDt() {
        return sPurcRegStartDt;
    }
    /**
     * @param sPurcRegStartDt the sPurcRegStartDt to set
     */
    public void setsPurcRegStartDt(Date sPurcRegStartDt) {
        this.sPurcRegStartDt = sPurcRegStartDt;
    }
    /**
     * @return the sPurcRegEndDt
     */
    public Date getsPurcRegEndDt() {
        return sPurcRegEndDt;
    }
    /**
     * @param sPurcRegEndDt the sPurcRegEndDt to set
     */
    public void setsPurcRegEndDt(Date sPurcRegEndDt) {
        this.sPurcRegEndDt = sPurcRegEndDt;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    /**
     * @return the sPlatNo
     */
    public String getsPlatNo() {
        return sPlatNo;
    }
    /**
     * @param sPlatNo the sPlatNo to set
     */
    public void setsPlatNo(String sPlatNo) {
        this.sPlatNo = sPlatNo;
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
     * @return the sPurcCustNm
     */
    public String getsPurcCustNm() {
        return sPurcCustNm;
    }
    /**
     * @param sPurcCustNm the sPurcCustNm to set
     */
    public void setsPurcCustNm(String sPurcCustNm) {
        this.sPurcCustNm = sPurcCustNm;
    }
    /**
     * @return the sContractNo
     */
    public String getsContractNo() {
        return sContractNo;
    }
    /**
     * @param sContractNo the sContractNo to set
     */
    public void setsContractNo(String sContractNo) {
        this.sContractNo = sContractNo;
    }

}