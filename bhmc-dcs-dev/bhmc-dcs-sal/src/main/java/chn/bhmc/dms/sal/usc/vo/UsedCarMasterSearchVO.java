package chn.bhmc.dms.sal.usc.vo;


import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : UsedCarMasterSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 6. 2.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 2.      Kim yewon              최초 생성
 * </pre>
 */

public class UsedCarMasterSearchVO extends SearchVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;

    private String sCarId;                      // CAR ID
    private String sVinNo;                      // VIN NO
    private String sCarStatCd;                  // 차량상태

    private String sDlrCd;                      // 딜러코드
    private String sCorpCarDstinCd;             // 자사차여부

    // 타사 : 02
    private String sCarBrandCd;                 // 브랜드
    private String sCarNm;                      // 차량명

    // 자사 : 01
    private String sCarlineCd;                  // 차종코드
    private String sModelCd;                    // 모델코드
    private String sOcnCd;                      // ocn코드
    private String sExtColorCd;                 // 외장색코드
    private String sIntColorCd;                 // 내장색코드

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
     * @return the sCarStatCd
     */
    public String getsCarStatCd() {
        return sCarStatCd;
    }
    /**
     * @param sCarStatCd the sCarStatCd to set
     */
    public void setsCarStatCd(String sCarStatCd) {
        this.sCarStatCd = sCarStatCd;
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
     * @return the sCorpCarDstinCd
     */
    public String getsCorpCarDstinCd() {
        return sCorpCarDstinCd;
    }
    /**
     * @param sCorpCarDstinCd the sCorpCarDstinCd to set
     */
    public void setsCorpCarDstinCd(String sCorpCarDstinCd) {
        this.sCorpCarDstinCd = sCorpCarDstinCd;
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
     * @return the sCarNm
     */
    public String getsCarNm() {
        return sCarNm;
    }
    /**
     * @param sCarNm the sCarNm to set
     */
    public void setsCarNm(String sCarNm) {
        this.sCarNm = sCarNm;
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
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}
