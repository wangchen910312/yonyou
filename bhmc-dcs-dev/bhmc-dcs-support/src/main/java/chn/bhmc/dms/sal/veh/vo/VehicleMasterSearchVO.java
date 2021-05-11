package chn.bhmc.dms.sal.veh.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VehicleVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 11.    Kang Seok Han     최초 생성
 * </pre>
 */

public class VehicleMasterSearchVO extends SearchVO {

    private static final long serialVersionUID = 5601577997448433799L;

    private String sDlrCd;                               // 딜러코드
    private String sCarId;                               // CAR ID
    private String sVinNo;                               // 차대번호
    private String sVinNo1;                              // VIN NO1
    private String sVinNo2;                              // VIN NO2
    private String sCarlineCd;                           // 차종코드
    private String sModelCd;                             // 모델코드
    private String sOcnCd;                               // OCN코드
    private String sCarStatCd;                           // 차대상태코드
    private String sOwnStatCd;                           // 보유상태
    private String sContractNo;                          // 계약번호
    private String sExtColorCd;                          // 외장색코드
    private String sIntColorCd;                          // 내장색코드
    private String sCustNo;                              // 고객코드
    private String sNcarDstinCd;                         // 신차량구분코드
    private String sCmpCarYn;                            // 회사차여부
    private String sCmpCarDstinCd;                       // 회사차구분
    private String sBpCd;                                // 차량소유자코드
    private String sUseYn;
    private String sCarRegNo;                            // 차량번호
    private String tSearchDt;                            // 검색일자 조건.
    private String sLangCd;                              // 공통코드 언어 코드
    private String sPageGubun;                           // 페이지구분
    private String sFscNm;                              //차관명
    private String sFscCd;                              //차관코드
    private String sSrchDtType;                         //조회일자종류 : 판매일, 공장출고일, 빈배정일, 입고일
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStartDt;                              //조회시작일
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndDt;                                //조회종료일
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sCustSaleDtFrDt;                       //판매조회시작일
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sCustSaleDtToDt;                       //판매조회종료일
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sPltGiDtFrDt;                          //공장출고조회시작일
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
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sPltGiDtToDt;                          //공장출고조회종료일
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sCarVinAllocFrDt;                      //빈배정조회시작일
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sCarVinAllocToDt;                      //빈배정조회종료일
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sDlrGrDtFrDt;                          //입고조회시작일
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sDlrGrDtToDt;                          //입고조회종료일
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sCustSaleDt;                       //판매일
    private String sCarDstinCd;
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
     * @return the sVinNo1
     */
    public String getsVinNo1() {
        return sVinNo1;
    }
    /**
     * @param sVinNo1 the sVinNo1 to set
     */
    public void setsVinNo1(String sVinNo1) {
        this.sVinNo1 = sVinNo1;
    }
    /**
     * @return the sVinNo2
     */
    public String getsVinNo2() {
        return sVinNo2;
    }
    /**
     * @param sVinNo2 the sVinNo2 to set
     */
    public void setsVinNo2(String sVinNo2) {
        this.sVinNo2 = sVinNo2;
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
     * @return the sOwnStatCd
     */
    public String getsOwnStatCd() {
        return sOwnStatCd;
    }
    /**
     * @param sOwnStatCd the sOwnStatCd to set
     */
    public void setsOwnStatCd(String sOwnStatCd) {
        this.sOwnStatCd = sOwnStatCd;
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
     * @return the sNcarDstinCd
     */
    public String getsNcarDstinCd() {
        return sNcarDstinCd;
    }
    /**
     * @param sNcarDstinCd the sNcarDstinCd to set
     */
    public void setsNcarDstinCd(String sNcarDstinCd) {
        this.sNcarDstinCd = sNcarDstinCd;
    }
    /**
     * @return the sCmpCarYn
     */
    public String getsCmpCarYn() {
        return sCmpCarYn;
    }
    /**
     * @param sCmpCarYn the sCmpCarYn to set
     */
    public void setsCmpCarYn(String sCmpCarYn) {
        this.sCmpCarYn = sCmpCarYn;
    }
    /**
     * @return the sCmpCarDstinCd
     */
    public String getsCmpCarDstinCd() {
        return sCmpCarDstinCd;
    }
    /**
     * @param sCmpCarDstinCd the sCmpCarDstinCd to set
     */
    public void setsCmpCarDstinCd(String sCmpCarDstinCd) {
        this.sCmpCarDstinCd = sCmpCarDstinCd;
    }
    /**
     * @return the sBpCd
     */
    public String getsBpCd() {
        return sBpCd;
    }
    /**
     * @param sBpCd the sBpCd to set
     */
    public void setsBpCd(String sBpCd) {
        this.sBpCd = sBpCd;
    }
    /**
     * @return the sUseYn
     */
    public String getsUseYn() {
        return sUseYn;
    }
    /**
     * @param sUseYn the sUseYn to set
     */
    public void setsUseYn(String sUseYn) {
        this.sUseYn = sUseYn;
    }
    /**
     * @return the sCarRegNo
     */
    public String getsCarRegNo() {
        return sCarRegNo;
    }
    /**
     * @param sCarRegNo the sCarRegNo to set
     */
    public void setsCarRegNo(String sCarRegNo) {
        this.sCarRegNo = sCarRegNo;
    }
    /**
     * @return the tSearchDt
     */
    public String gettSearchDt() {
        return tSearchDt;
    }
    /**
     * @param tSearchDt the tSearchDt to set
     */
    public void settSearchDt(String tSearchDt) {
        this.tSearchDt = tSearchDt;
    }
    /**
     * @return the sLangCd
     */
    public String getsLangCd() {
        return sLangCd;
    }
    /**
     * @param sLangCd the sLangCd to set
     */
    public void setsLangCd(String sLangCd) {
        this.sLangCd = sLangCd;
    }
    /**
     * @return the sPageGubun
     */
    public String getsPageGubun() {
        return sPageGubun;
    }
    /**
     * @param sPageGubun the sPageGubun to set
     */
    public void setsPageGubun(String sPageGubun) {
        this.sPageGubun = sPageGubun;
    }
    /**
     * @return the sSrchDtType
     */
    public String getsSrchDtType() {
        return sSrchDtType;
    }
    /**
     * @param sSrchDtType the sSrchDtType to set
     */
    public void setsSrchDtType(String sSrchDtType) {
        this.sSrchDtType = sSrchDtType;
    }
    /**
     * @return the sStartDt
     */
    public Date getsStartDt() {
        return sStartDt;
    }
    /**
     * @param sStartDt the sStartDt to set
     */
    public void setsStartDt(Date sStartDt) {
        this.sStartDt = sStartDt;
    }
    /**
     * @return the sEndDt
     */
    public Date getsEndDt() {
        return sEndDt;
    }
    /**
     * @param sEndDt the sEndDt to set
     */
    public void setsEndDt(Date sEndDt) {
        this.sEndDt = sEndDt;
    }
    /**
     * @return the sCustSaleDtFrDt
     */
    public Date getsCustSaleDtFrDt() {
        return sCustSaleDtFrDt;
    }
    /**
     * @param sCustSaleDtFrDt the sCustSaleDtFrDt to set
     */
    public void setsCustSaleDtFrDt(Date sCustSaleDtFrDt) {
        this.sCustSaleDtFrDt = sCustSaleDtFrDt;
    }
    /**
     * @return the sCustSaleDtToDt
     */
    public Date getsCustSaleDtToDt() {
        return sCustSaleDtToDt;
    }
    /**
     * @param sCustSaleDtToDt the sCustSaleDtToDt to set
     */
    public void setsCustSaleDtToDt(Date sCustSaleDtToDt) {
        this.sCustSaleDtToDt = sCustSaleDtToDt;
    }
    /**
     * @return the sPltGiDtFrDt
     */
    public Date getsPltGiDtFrDt() {
        return sPltGiDtFrDt;
    }
    /**
     * @param sPltGiDtFrDt the sPltGiDtFrDt to set
     */
    public void setsPltGiDtFrDt(Date sPltGiDtFrDt) {
        this.sPltGiDtFrDt = sPltGiDtFrDt;
    }
    /**
     * @return the sPltGiDtToDt
     */
    public Date getsPltGiDtToDt() {
        return sPltGiDtToDt;
    }
    /**
     * @param sPltGiDtToDt the sPltGiDtToDt to set
     */
    public void setsPltGiDtToDt(Date sPltGiDtToDt) {
        this.sPltGiDtToDt = sPltGiDtToDt;
    }
    /**
     * @return the sCarVinAllocFrDt
     */
    public Date getsCarVinAllocFrDt() {
        return sCarVinAllocFrDt;
    }
    /**
     * @param sCarVinAllocFrDt the sCarVinAllocFrDt to set
     */
    public void setsCarVinAllocFrDt(Date sCarVinAllocFrDt) {
        this.sCarVinAllocFrDt = sCarVinAllocFrDt;
    }
    /**
     * @return the sCarVinAllocToDt
     */
    public Date getsCarVinAllocToDt() {
        return sCarVinAllocToDt;
    }
    /**
     * @param sCarVinAllocToDt the sCarVinAllocToDt to set
     */
    public void setsCarVinAllocToDt(Date sCarVinAllocToDt) {
        this.sCarVinAllocToDt = sCarVinAllocToDt;
    }
    /**
     * @return the sDlrGrDtFrDt
     */
    public Date getsDlrGrDtFrDt() {
        return sDlrGrDtFrDt;
    }
    /**
     * @param sDlrGrDtFrDt the sDlrGrDtFrDt to set
     */
    public void setsDlrGrDtFrDt(Date sDlrGrDtFrDt) {
        this.sDlrGrDtFrDt = sDlrGrDtFrDt;
    }
    /**
     * @return the sDlrGrDtToDt
     */
    public Date getsDlrGrDtToDt() {
        return sDlrGrDtToDt;
    }
    /**
     * @param sDlrGrDtToDt the sDlrGrDtToDt to set
     */
    public void setsDlrGrDtToDt(Date sDlrGrDtToDt) {
        this.sDlrGrDtToDt = sDlrGrDtToDt;
    }
    /**
     * @return the sFscNm
     */
    public String getsFscNm() {
        return sFscNm;
    }
    /**
     * @param sFscNm the sFscNm to set
     */
    public void setsFscNm(String sFscNm) {
        this.sFscNm = sFscNm;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}