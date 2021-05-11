package chn.bhmc.dms.mis.tdm.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * [딜러사] 목표분해도
 * </pre>
 *
 * @ClassName   : TargetDcptMgmtCarVO.java
 * @Description : [딜러사] 목표분해도
 * @author chibeom.song
 * @since 2016. 7. 21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 21.   chibeom.song     최초 생성
 * </pre>
 */

public class TargetDcptMgmtCarVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6534031744201367732L;

    // 목표분해도 - 시장현황
    private String sMarketStatusYear;               // 년도
    private String sMarketStatusMonth;              // 월
    private String sMarketStatusProvince;           // 성
    private String sMarketStatusCity;               // 시
    private String sMarketStatusYyMm;


    private String sMarketStatusYearParam;           // 년도
    private String sMarketStatusMonthParam;          // 월
    private String sMarketStatusProvinceParam;       // 성
    private String sMarketStatusCityParam;           // 시
    private String sMarketStatusYyMmParam;
    private String sDealerStatusYyMmDd;

    // 목표분해도 - 시장현황
    private String nameArea;
    private String provinceCd;                  // 성 코드
    private String provinceNm;                  // 성 이름
    private String cityCd;                      // 시 코드
    private String cityNm;                      // 시 이름
    private String areaCd;                      // 지역 코드
    private String areaNm;                      // 지역 명
    private String regYear;                     // 등록년도
    private String regMonth;                    // 등록월
    private String marketRefVal;                // 참조값

    private String localPossessionRate;         // 국내 점유율 총계
    private String localLastMonthContrast;      // 국내 점유율 전월 대비
    private String localLastYearMonth;          // 국내 점유율 작년 동월
    private String provincePossessionRate;      // 성 점유율 총계
    private String provinceLastMonthContrast;   // 성 점유율 전월대비
    private String provinceLastYearMonth;       // 성 점유율 작년동월
    private String cityPossessionRate;          // 시 점유율 총계
    private String cityLastMonthContrast;       // 시 점유율 전월대비
    private String cityLastYearMonth;           // 시 점유율 작년동월

    // 목표분해도 - 딜러현황
    private String sDealerStatusYear;           // 년도
    private String sDealerStatusMonth;          // 월
    private String sDealerStatusDate;           // 일

    private String sDealerStatusYearParam;      // 년도
    private String sDealerStatusMonthParam;     // 월
    private String sDealerStatusDateParam;      // 일

    private String stockValue;                  // 재고
    private String stockCount;                  // 재고계수
    private String saleStatus3Month;            // 판매현황(최근3개월)
    private String salemanCount;                // 판매고문수
    private String idccPotentialCustomer;       // IDCC 잠재고객수
    private String shopPotentialCustomer;       // 전시장 잠재고객수

    private String idccCollectCustQty;          // IDCC 집객량
    private String shopCollectCustQty;          // 전시장 집객량
    private String idccVisitReqRate;            // IDCC 내방요청율
    private String shopVisitReqRate;            // 전시장 내방요청율
    private String idccPerInfoRate;             // IDCC 개인정보 준 사람 비율
    private String shopPerInfoRate;             // 전시장 개인정보 준 사람 비율
    private String idccDealQty;                 // IDCC 거래량
    private String shopDealQty;                 // 전시장 거래량
    private String idccVisitDealRate;           // IDCC 방문거래율
    private String shopVisitDealRate;           // 전시장 방문거래울
    private String idccDealRate;                // IDCC 총 거래율
    private String shopDealRate;                // 전시장 총 거래율
    private String channelGubn;                 // 채널 구분

    // 목표분해도 - 제조사 목표
    private String sManuTargetYear;             // 년도
    private String sManuTargetMonth;            // 월
    private String sManuTargetYearParam;        // 년도
    private String sManuTargetMonthParam;       // 월
    private String sManuTargetYyMmDd;

    private String totGoalPrefVal;              // 당월 총목표
    private int rnum;                           // 차종코드
    private String carlineCd;                   // 차종코드
    private String carlineNm;                   // 차종명
    private String goalPrefVal;                 // 목표값
    private String goalRstfVal;                 // 진도값
    private String goalRstRate;                 // 판매진도

    // 목표분해도 - 딜러분해(판매)
    private String sDealerDcptYear;             // 년도
    private String sDealerDcptMonth;            // 월
    private String sDealerDcptYearParam;
    private String sDealerDcptMonthParam;

    private String sDealerSaleDcptYyMm;

    private String dealerGoalYy;                // 목표년도
    private String dealerGoalMm;                // 목표월
    private String dealerSdptCd;                // 사업부코드
    private String dealerOfficeCd;              // 사무소코드
    private String dealerDlrCd;                 // 딜러코드
    private String dealerDlrTp;                 // 딜러유형
    private String dealerGoalTp;                // 목표유형
    private String dealerCarlineCd;             // 차종코드
    private String dealerCarlineNm;             // 차종명
    private String dealerGoalPrefVal;           // 목표설정값
    private String dealerPrefTp;                // 설정유형
    private String dealerRegUsrId;              // 등록자ID
    private String dealerRegDt;                 // 등록일자
    private String dealerUpdtUsrId;             // 수정자ID
    private String dealerUpdtDt;                // 수정일자
    private String idccDealerGoalGapVal;
    private String shopDealerGoalGapfVal;
    private String salesAdvisorcnt;

    private String allDealerGoalPrefVal;
    private String idccDealerGoalPrefVal;
    private String idccDealerGoalSumVal;
    private String shopDealerGoalPrefVal;
    private String shopDealerGoalSumVal;
    private String secondDealerGoalPrefVal;
    private String etcDealerGoalPrefVal;

    private String custDealerDlrTp;
    private String custDealerOpinionvalue;
    private String custDealerPrefVal;
    private String custDealerDlrCd;
    private String custDealerGoalYy;
    private String custDealerGoalMm;
    private String custDealerGoalPrefVal;
    private String custDealerUpdtUsrId;

    private String carNo1;
    private String carNo2;
    private String carNo3;
    private String carNo4;
    private String carNo5;
    private String carNo6;
    private String carNo7;
    private String carNo8;
    private String carNo9;
    private String carNo10;
    private String carNo11;
    private String carNo12;
    private String carNo13;
    private String carNo14;
    private String carNo15;
    private String carNo16;
    private String carNo17;
    private String carNo18;
    private String carNo19;
    private String carNo20;
    private String carNo21;

    private String carNo22;
    private String carNo23;
    private String carNo24;
    private String carNo25;
    private String carNo26;
    private String carNo27;
    private String carNo28;
    private String carNo29;
    private String carNo30;
    private String carNo31;
    private String carNo32;
    private String carNo33;
    private String carNo34;
    private String carNo35;
    private String carNo36;
    private String carNo37;
    private String carNo38;
    private String carNo39;
    private String carNo40;
    private String carNo41;
    private String carNo42;

    // 목표분해도 - 과정관리
    private String sProcessMgmtYear;
    private String sProcessMgmtMonth;
    private String sProcessMgmtDate;
    private String sProcessMgmtYearParam;
    private String sProcessMgmtMonthParam;
    private String sProcessMgmtDateParam;
    private String sProcessMgmtYyMmDd;
    private String sProcessMgmtYyMmDdParam;

    private String gubnName;
    private String idccSaleDealCnt;
    private String idccSaleDealRate;
    private String idccSaleTargetGapVal;
    private String idccSaleTargetDayVal;
    private String idccSaleTargetLastMonthVal;
    private String idccSaleTargetLastYearVal;
    private String shopSaleDealCnt;
    private String shopSaleDealRate;
    private String shopSaleTargetGapVal;
    private String shopSaleTargetDayVal;
    private String shopSaleTargetLastMonthVal;
    private String shopSaleTargetLastYearVal;
    private String idccCustDealCnt;
    private String idccCustDealRate;
    private String idccCustTargetGapVal;
    private String idccCustTargetDayVal;
    private String idccCustTargetLastMonthVal;
    private String idccCustTargetLastYearVal;
    private String shopCustDealCnt;
    private String shopCustDealRate;
    private String shopCustTargetGapVal;
    private String shopCustTargetDayVal;
    private String shopCustTargetLastMonthVal;
    private String shopCustTargetLastYearVal;

    // KPI
    private String sCustKpiYear;
    private String sCustKpiMonth;
    private String sCustKpiDate;
    private String eCustKpiYear;
    private String eCustKpiMonth;
    private String eCustKpiDate;
    private String sCustKpiYearParam;
    private String sCustKpiMonthParam;
    private String sCustKpiDateParam;
    private String eCustKpiYearParam;
    private String eCustKpiMonthParam;
    private String eCustKpiDateParam;

    private String idccTargetCustGoalPrefVal;
    private String idccCustVsitCnt;
    private String idccCustReqRate;
    private String idccDealCnt;
    private String shopTargetCustGoalPrefVal;
    private String shopTargetCustVsitCnt;
    private String shopPrsnInfoCollcRate;
    private String shopDealCnt;
    /**
     * @return the sMarketStatusYear
     */
    public String getsMarketStatusYear() {
        return sMarketStatusYear;
    }
    /**
     * @param sMarketStatusYear the sMarketStatusYear to set
     */
    public void setsMarketStatusYear(String sMarketStatusYear) {
        this.sMarketStatusYear = sMarketStatusYear;
    }
    /**
     * @return the sMarketStatusMonth
     */
    public String getsMarketStatusMonth() {
        return sMarketStatusMonth;
    }
    /**
     * @param sMarketStatusMonth the sMarketStatusMonth to set
     */
    public void setsMarketStatusMonth(String sMarketStatusMonth) {
        this.sMarketStatusMonth = sMarketStatusMonth;
    }
    /**
     * @return the sMarketStatusProvince
     */
    public String getsMarketStatusProvince() {
        return sMarketStatusProvince;
    }
    /**
     * @param sMarketStatusProvince the sMarketStatusProvince to set
     */
    public void setsMarketStatusProvince(String sMarketStatusProvince) {
        this.sMarketStatusProvince = sMarketStatusProvince;
    }
    /**
     * @return the sMarketStatusCity
     */
    public String getsMarketStatusCity() {
        return sMarketStatusCity;
    }
    /**
     * @param sMarketStatusCity the sMarketStatusCity to set
     */
    public void setsMarketStatusCity(String sMarketStatusCity) {
        this.sMarketStatusCity = sMarketStatusCity;
    }
    /**
     * @return the sMarketStatusYyMm
     */
    public String getsMarketStatusYyMm() {
        return sMarketStatusYyMm;
    }
    /**
     * @param sMarketStatusYyMm the sMarketStatusYyMm to set
     */
    public void setsMarketStatusYyMm(String sMarketStatusYyMm) {
        this.sMarketStatusYyMm = sMarketStatusYyMm;
    }
    /**
     * @return the sMarketStatusYearParam
     */
    public String getsMarketStatusYearParam() {
        return sMarketStatusYearParam;
    }
    /**
     * @param sMarketStatusYearParam the sMarketStatusYearParam to set
     */
    public void setsMarketStatusYearParam(String sMarketStatusYearParam) {
        this.sMarketStatusYearParam = sMarketStatusYearParam;
    }
    /**
     * @return the sMarketStatusMonthParam
     */
    public String getsMarketStatusMonthParam() {
        return sMarketStatusMonthParam;
    }
    /**
     * @param sMarketStatusMonthParam the sMarketStatusMonthParam to set
     */
    public void setsMarketStatusMonthParam(String sMarketStatusMonthParam) {
        this.sMarketStatusMonthParam = sMarketStatusMonthParam;
    }
    /**
     * @return the sMarketStatusProvinceParam
     */
    public String getsMarketStatusProvinceParam() {
        return sMarketStatusProvinceParam;
    }
    /**
     * @param sMarketStatusProvinceParam the sMarketStatusProvinceParam to set
     */
    public void setsMarketStatusProvinceParam(String sMarketStatusProvinceParam) {
        this.sMarketStatusProvinceParam = sMarketStatusProvinceParam;
    }
    /**
     * @return the sMarketStatusCityParam
     */
    public String getsMarketStatusCityParam() {
        return sMarketStatusCityParam;
    }
    /**
     * @param sMarketStatusCityParam the sMarketStatusCityParam to set
     */
    public void setsMarketStatusCityParam(String sMarketStatusCityParam) {
        this.sMarketStatusCityParam = sMarketStatusCityParam;
    }
    /**
     * @return the sMarketStatusYyMmParam
     */
    public String getsMarketStatusYyMmParam() {
        return sMarketStatusYyMmParam;
    }
    /**
     * @param sMarketStatusYyMmParam the sMarketStatusYyMmParam to set
     */
    public void setsMarketStatusYyMmParam(String sMarketStatusYyMmParam) {
        this.sMarketStatusYyMmParam = sMarketStatusYyMmParam;
    }
    /**
     * @return the sDealerStatusYyMmDd
     */
    public String getsDealerStatusYyMmDd() {
        return sDealerStatusYyMmDd;
    }
    /**
     * @param sDealerStatusYyMmDd the sDealerStatusYyMmDd to set
     */
    public void setsDealerStatusYyMmDd(String sDealerStatusYyMmDd) {
        this.sDealerStatusYyMmDd = sDealerStatusYyMmDd;
    }
    /**
     * @return the nameArea
     */
    public String getNameArea() {
        return nameArea;
    }
    /**
     * @param nameArea the nameArea to set
     */
    public void setNameArea(String nameArea) {
        this.nameArea = nameArea;
    }
    /**
     * @return the provinceCd
     */
    public String getProvinceCd() {
        return provinceCd;
    }
    /**
     * @param provinceCd the provinceCd to set
     */
    public void setProvinceCd(String provinceCd) {
        this.provinceCd = provinceCd;
    }
    /**
     * @return the provinceNm
     */
    public String getProvinceNm() {
        return provinceNm;
    }
    /**
     * @param provinceNm the provinceNm to set
     */
    public void setProvinceNm(String provinceNm) {
        this.provinceNm = provinceNm;
    }
    /**
     * @return the cityCd
     */
    public String getCityCd() {
        return cityCd;
    }
    /**
     * @param cityCd the cityCd to set
     */
    public void setCityCd(String cityCd) {
        this.cityCd = cityCd;
    }
    /**
     * @return the cityNm
     */
    public String getCityNm() {
        return cityNm;
    }
    /**
     * @param cityNm the cityNm to set
     */
    public void setCityNm(String cityNm) {
        this.cityNm = cityNm;
    }
    /**
     * @return the areaCd
     */
    public String getAreaCd() {
        return areaCd;
    }
    /**
     * @param areaCd the areaCd to set
     */
    public void setAreaCd(String areaCd) {
        this.areaCd = areaCd;
    }
    /**
     * @return the areaNm
     */
    public String getAreaNm() {
        return areaNm;
    }
    /**
     * @param areaNm the areaNm to set
     */
    public void setAreaNm(String areaNm) {
        this.areaNm = areaNm;
    }
    /**
     * @return the regYear
     */
    public String getRegYear() {
        return regYear;
    }
    /**
     * @param regYear the regYear to set
     */
    public void setRegYear(String regYear) {
        this.regYear = regYear;
    }
    /**
     * @return the regMonth
     */
    public String getRegMonth() {
        return regMonth;
    }
    /**
     * @param regMonth the regMonth to set
     */
    public void setRegMonth(String regMonth) {
        this.regMonth = regMonth;
    }
    /**
     * @return the marketRefVal
     */
    public String getMarketRefVal() {
        return marketRefVal;
    }
    /**
     * @param marketRefVal the marketRefVal to set
     */
    public void setMarketRefVal(String marketRefVal) {
        this.marketRefVal = marketRefVal;
    }
    /**
     * @return the localPossessionRate
     */
    public String getLocalPossessionRate() {
        return localPossessionRate;
    }
    /**
     * @param localPossessionRate the localPossessionRate to set
     */
    public void setLocalPossessionRate(String localPossessionRate) {
        this.localPossessionRate = localPossessionRate;
    }
    /**
     * @return the localLastMonthContrast
     */
    public String getLocalLastMonthContrast() {
        return localLastMonthContrast;
    }
    /**
     * @param localLastMonthContrast the localLastMonthContrast to set
     */
    public void setLocalLastMonthContrast(String localLastMonthContrast) {
        this.localLastMonthContrast = localLastMonthContrast;
    }
    /**
     * @return the localLastYearMonth
     */
    public String getLocalLastYearMonth() {
        return localLastYearMonth;
    }
    /**
     * @param localLastYearMonth the localLastYearMonth to set
     */
    public void setLocalLastYearMonth(String localLastYearMonth) {
        this.localLastYearMonth = localLastYearMonth;
    }
    /**
     * @return the provincePossessionRate
     */
    public String getProvincePossessionRate() {
        return provincePossessionRate;
    }
    /**
     * @param provincePossessionRate the provincePossessionRate to set
     */
    public void setProvincePossessionRate(String provincePossessionRate) {
        this.provincePossessionRate = provincePossessionRate;
    }
    /**
     * @return the provinceLastMonthContrast
     */
    public String getProvinceLastMonthContrast() {
        return provinceLastMonthContrast;
    }
    /**
     * @param provinceLastMonthContrast the provinceLastMonthContrast to set
     */
    public void setProvinceLastMonthContrast(String provinceLastMonthContrast) {
        this.provinceLastMonthContrast = provinceLastMonthContrast;
    }
    /**
     * @return the provinceLastYearMonth
     */
    public String getProvinceLastYearMonth() {
        return provinceLastYearMonth;
    }
    /**
     * @param provinceLastYearMonth the provinceLastYearMonth to set
     */
    public void setProvinceLastYearMonth(String provinceLastYearMonth) {
        this.provinceLastYearMonth = provinceLastYearMonth;
    }
    /**
     * @return the cityPossessionRate
     */
    public String getCityPossessionRate() {
        return cityPossessionRate;
    }
    /**
     * @param cityPossessionRate the cityPossessionRate to set
     */
    public void setCityPossessionRate(String cityPossessionRate) {
        this.cityPossessionRate = cityPossessionRate;
    }
    /**
     * @return the cityLastMonthContrast
     */
    public String getCityLastMonthContrast() {
        return cityLastMonthContrast;
    }
    /**
     * @param cityLastMonthContrast the cityLastMonthContrast to set
     */
    public void setCityLastMonthContrast(String cityLastMonthContrast) {
        this.cityLastMonthContrast = cityLastMonthContrast;
    }
    /**
     * @return the cityLastYearMonth
     */
    public String getCityLastYearMonth() {
        return cityLastYearMonth;
    }
    /**
     * @param cityLastYearMonth the cityLastYearMonth to set
     */
    public void setCityLastYearMonth(String cityLastYearMonth) {
        this.cityLastYearMonth = cityLastYearMonth;
    }
    /**
     * @return the sDealerStatusYear
     */
    public String getsDealerStatusYear() {
        return sDealerStatusYear;
    }
    /**
     * @param sDealerStatusYear the sDealerStatusYear to set
     */
    public void setsDealerStatusYear(String sDealerStatusYear) {
        this.sDealerStatusYear = sDealerStatusYear;
    }
    /**
     * @return the sDealerStatusMonth
     */
    public String getsDealerStatusMonth() {
        return sDealerStatusMonth;
    }
    /**
     * @param sDealerStatusMonth the sDealerStatusMonth to set
     */
    public void setsDealerStatusMonth(String sDealerStatusMonth) {
        this.sDealerStatusMonth = sDealerStatusMonth;
    }
    /**
     * @return the sDealerStatusDate
     */
    public String getsDealerStatusDate() {
        return sDealerStatusDate;
    }
    /**
     * @param sDealerStatusDate the sDealerStatusDate to set
     */
    public void setsDealerStatusDate(String sDealerStatusDate) {
        this.sDealerStatusDate = sDealerStatusDate;
    }
    /**
     * @return the sDealerStatusYearParam
     */
    public String getsDealerStatusYearParam() {
        return sDealerStatusYearParam;
    }
    /**
     * @param sDealerStatusYearParam the sDealerStatusYearParam to set
     */
    public void setsDealerStatusYearParam(String sDealerStatusYearParam) {
        this.sDealerStatusYearParam = sDealerStatusYearParam;
    }
    /**
     * @return the sDealerStatusMonthParam
     */
    public String getsDealerStatusMonthParam() {
        return sDealerStatusMonthParam;
    }
    /**
     * @param sDealerStatusMonthParam the sDealerStatusMonthParam to set
     */
    public void setsDealerStatusMonthParam(String sDealerStatusMonthParam) {
        this.sDealerStatusMonthParam = sDealerStatusMonthParam;
    }
    /**
     * @return the sDealerStatusDateParam
     */
    public String getsDealerStatusDateParam() {
        return sDealerStatusDateParam;
    }
    /**
     * @param sDealerStatusDateParam the sDealerStatusDateParam to set
     */
    public void setsDealerStatusDateParam(String sDealerStatusDateParam) {
        this.sDealerStatusDateParam = sDealerStatusDateParam;
    }
    /**
     * @return the stockValue
     */
    public String getStockValue() {
        return stockValue;
    }
    /**
     * @param stockValue the stockValue to set
     */
    public void setStockValue(String stockValue) {
        this.stockValue = stockValue;
    }
    /**
     * @return the stockCount
     */
    public String getStockCount() {
        return stockCount;
    }
    /**
     * @param stockCount the stockCount to set
     */
    public void setStockCount(String stockCount) {
        this.stockCount = stockCount;
    }
    /**
     * @return the saleStatus3Month
     */
    public String getSaleStatus3Month() {
        return saleStatus3Month;
    }
    /**
     * @param saleStatus3Month the saleStatus3Month to set
     */
    public void setSaleStatus3Month(String saleStatus3Month) {
        this.saleStatus3Month = saleStatus3Month;
    }
    /**
     * @return the salemanCount
     */
    public String getSalemanCount() {
        return salemanCount;
    }
    /**
     * @param salemanCount the salemanCount to set
     */
    public void setSalemanCount(String salemanCount) {
        this.salemanCount = salemanCount;
    }
    /**
     * @return the idccPotentialCustomer
     */
    public String getIdccPotentialCustomer() {
        return idccPotentialCustomer;
    }
    /**
     * @param idccPotentialCustomer the idccPotentialCustomer to set
     */
    public void setIdccPotentialCustomer(String idccPotentialCustomer) {
        this.idccPotentialCustomer = idccPotentialCustomer;
    }
    /**
     * @return the shopPotentialCustomer
     */
    public String getShopPotentialCustomer() {
        return shopPotentialCustomer;
    }
    /**
     * @param shopPotentialCustomer the shopPotentialCustomer to set
     */
    public void setShopPotentialCustomer(String shopPotentialCustomer) {
        this.shopPotentialCustomer = shopPotentialCustomer;
    }
    /**
     * @return the idccCollectCustQty
     */
    public String getIdccCollectCustQty() {
        return idccCollectCustQty;
    }
    /**
     * @param idccCollectCustQty the idccCollectCustQty to set
     */
    public void setIdccCollectCustQty(String idccCollectCustQty) {
        this.idccCollectCustQty = idccCollectCustQty;
    }
    /**
     * @return the shopCollectCustQty
     */
    public String getShopCollectCustQty() {
        return shopCollectCustQty;
    }
    /**
     * @param shopCollectCustQty the shopCollectCustQty to set
     */
    public void setShopCollectCustQty(String shopCollectCustQty) {
        this.shopCollectCustQty = shopCollectCustQty;
    }
    /**
     * @return the idccVisitReqRate
     */
    public String getIdccVisitReqRate() {
        return idccVisitReqRate;
    }
    /**
     * @param idccVisitReqRate the idccVisitReqRate to set
     */
    public void setIdccVisitReqRate(String idccVisitReqRate) {
        this.idccVisitReqRate = idccVisitReqRate;
    }
    /**
     * @return the shopVisitReqRate
     */
    public String getShopVisitReqRate() {
        return shopVisitReqRate;
    }
    /**
     * @param shopVisitReqRate the shopVisitReqRate to set
     */
    public void setShopVisitReqRate(String shopVisitReqRate) {
        this.shopVisitReqRate = shopVisitReqRate;
    }
    /**
     * @return the idccPerInfoRate
     */
    public String getIdccPerInfoRate() {
        return idccPerInfoRate;
    }
    /**
     * @param idccPerInfoRate the idccPerInfoRate to set
     */
    public void setIdccPerInfoRate(String idccPerInfoRate) {
        this.idccPerInfoRate = idccPerInfoRate;
    }
    /**
     * @return the shopPerInfoRate
     */
    public String getShopPerInfoRate() {
        return shopPerInfoRate;
    }
    /**
     * @param shopPerInfoRate the shopPerInfoRate to set
     */
    public void setShopPerInfoRate(String shopPerInfoRate) {
        this.shopPerInfoRate = shopPerInfoRate;
    }
    /**
     * @return the idccDealQty
     */
    public String getIdccDealQty() {
        return idccDealQty;
    }
    /**
     * @param idccDealQty the idccDealQty to set
     */
    public void setIdccDealQty(String idccDealQty) {
        this.idccDealQty = idccDealQty;
    }
    /**
     * @return the shopDealQty
     */
    public String getShopDealQty() {
        return shopDealQty;
    }
    /**
     * @param shopDealQty the shopDealQty to set
     */
    public void setShopDealQty(String shopDealQty) {
        this.shopDealQty = shopDealQty;
    }
    /**
     * @return the idccVisitDealRate
     */
    public String getIdccVisitDealRate() {
        return idccVisitDealRate;
    }
    /**
     * @param idccVisitDealRate the idccVisitDealRate to set
     */
    public void setIdccVisitDealRate(String idccVisitDealRate) {
        this.idccVisitDealRate = idccVisitDealRate;
    }
    /**
     * @return the shopVisitDealRate
     */
    public String getShopVisitDealRate() {
        return shopVisitDealRate;
    }
    /**
     * @param shopVisitDealRate the shopVisitDealRate to set
     */
    public void setShopVisitDealRate(String shopVisitDealRate) {
        this.shopVisitDealRate = shopVisitDealRate;
    }
    /**
     * @return the idccDealRate
     */
    public String getIdccDealRate() {
        return idccDealRate;
    }
    /**
     * @param idccDealRate the idccDealRate to set
     */
    public void setIdccDealRate(String idccDealRate) {
        this.idccDealRate = idccDealRate;
    }
    /**
     * @return the shopDealRate
     */
    public String getShopDealRate() {
        return shopDealRate;
    }
    /**
     * @param shopDealRate the shopDealRate to set
     */
    public void setShopDealRate(String shopDealRate) {
        this.shopDealRate = shopDealRate;
    }
    /**
     * @return the channelGubn
     */
    public String getChannelGubn() {
        return channelGubn;
    }
    /**
     * @param channelGubn the channelGubn to set
     */
    public void setChannelGubn(String channelGubn) {
        this.channelGubn = channelGubn;
    }
    /**
     * @return the sManuTargetYear
     */
    public String getsManuTargetYear() {
        return sManuTargetYear;
    }
    /**
     * @param sManuTargetYear the sManuTargetYear to set
     */
    public void setsManuTargetYear(String sManuTargetYear) {
        this.sManuTargetYear = sManuTargetYear;
    }
    /**
     * @return the sManuTargetMonth
     */
    public String getsManuTargetMonth() {
        return sManuTargetMonth;
    }
    /**
     * @param sManuTargetMonth the sManuTargetMonth to set
     */
    public void setsManuTargetMonth(String sManuTargetMonth) {
        this.sManuTargetMonth = sManuTargetMonth;
    }
    /**
     * @return the sManuTargetYearParam
     */
    public String getsManuTargetYearParam() {
        return sManuTargetYearParam;
    }
    /**
     * @param sManuTargetYearParam the sManuTargetYearParam to set
     */
    public void setsManuTargetYearParam(String sManuTargetYearParam) {
        this.sManuTargetYearParam = sManuTargetYearParam;
    }
    /**
     * @return the sManuTargetMonthParam
     */
    public String getsManuTargetMonthParam() {
        return sManuTargetMonthParam;
    }
    /**
     * @param sManuTargetMonthParam the sManuTargetMonthParam to set
     */
    public void setsManuTargetMonthParam(String sManuTargetMonthParam) {
        this.sManuTargetMonthParam = sManuTargetMonthParam;
    }
    /**
     * @return the sManuTargetYyMmDd
     */
    public String getsManuTargetYyMmDd() {
        return sManuTargetYyMmDd;
    }
    /**
     * @param sManuTargetYyMmDd the sManuTargetYyMmDd to set
     */
    public void setsManuTargetYyMmDd(String sManuTargetYyMmDd) {
        this.sManuTargetYyMmDd = sManuTargetYyMmDd;
    }
    /**
     * @return the totGoalPrefVal
     */
    public String getTotGoalPrefVal() {
        return totGoalPrefVal;
    }
    /**
     * @param totGoalPrefVal the totGoalPrefVal to set
     */
    public void setTotGoalPrefVal(String totGoalPrefVal) {
        this.totGoalPrefVal = totGoalPrefVal;
    }
    /**
     * @return the rnum
     */
    public int getRnum() {
        return rnum;
    }
    /**
     * @param rnum the rnum to set
     */
    public void setRnum(int rnum) {
        this.rnum = rnum;
    }
    /**
     * @return the carlineCd
     */
    public String getCarlineCd() {
        return carlineCd;
    }
    /**
     * @param carlineCd the carlineCd to set
     */
    public void setCarlineCd(String carlineCd) {
        this.carlineCd = carlineCd;
    }
    /**
     * @return the carlineNm
     */
    public String getCarlineNm() {
        return carlineNm;
    }
    /**
     * @param carlineNm the carlineNm to set
     */
    public void setCarlineNm(String carlineNm) {
        this.carlineNm = carlineNm;
    }
    /**
     * @return the goalPrefVal
     */
    public String getGoalPrefVal() {
        return goalPrefVal;
    }
    /**
     * @param goalPrefVal the goalPrefVal to set
     */
    public void setGoalPrefVal(String goalPrefVal) {
        this.goalPrefVal = goalPrefVal;
    }
    /**
     * @return the goalRstfVal
     */
    public String getGoalRstfVal() {
        return goalRstfVal;
    }
    /**
     * @param goalRstfVal the goalRstfVal to set
     */
    public void setGoalRstfVal(String goalRstfVal) {
        this.goalRstfVal = goalRstfVal;
    }
    /**
     * @return the goalRstRate
     */
    public String getGoalRstRate() {
        return goalRstRate;
    }
    /**
     * @param goalRstRate the goalRstRate to set
     */
    public void setGoalRstRate(String goalRstRate) {
        this.goalRstRate = goalRstRate;
    }
    /**
     * @return the sDealerDcptYear
     */
    public String getsDealerDcptYear() {
        return sDealerDcptYear;
    }
    /**
     * @param sDealerDcptYear the sDealerDcptYear to set
     */
    public void setsDealerDcptYear(String sDealerDcptYear) {
        this.sDealerDcptYear = sDealerDcptYear;
    }
    /**
     * @return the sDealerDcptMonth
     */
    public String getsDealerDcptMonth() {
        return sDealerDcptMonth;
    }
    /**
     * @param sDealerDcptMonth the sDealerDcptMonth to set
     */
    public void setsDealerDcptMonth(String sDealerDcptMonth) {
        this.sDealerDcptMonth = sDealerDcptMonth;
    }
    /**
     * @return the sDealerDcptYearParam
     */
    public String getsDealerDcptYearParam() {
        return sDealerDcptYearParam;
    }
    /**
     * @param sDealerDcptYearParam the sDealerDcptYearParam to set
     */
    public void setsDealerDcptYearParam(String sDealerDcptYearParam) {
        this.sDealerDcptYearParam = sDealerDcptYearParam;
    }
    /**
     * @return the sDealerDcptMonthParam
     */
    public String getsDealerDcptMonthParam() {
        return sDealerDcptMonthParam;
    }
    /**
     * @param sDealerDcptMonthParam the sDealerDcptMonthParam to set
     */
    public void setsDealerDcptMonthParam(String sDealerDcptMonthParam) {
        this.sDealerDcptMonthParam = sDealerDcptMonthParam;
    }
    /**
     * @return the sDealerSaleDcptYyMm
     */
    public String getsDealerSaleDcptYyMm() {
        return sDealerSaleDcptYyMm;
    }
    /**
     * @param sDealerSaleDcptYyMm the sDealerSaleDcptYyMm to set
     */
    public void setsDealerSaleDcptYyMm(String sDealerSaleDcptYyMm) {
        this.sDealerSaleDcptYyMm = sDealerSaleDcptYyMm;
    }
    /**
     * @return the dealerGoalYy
     */
    public String getDealerGoalYy() {
        return dealerGoalYy;
    }
    /**
     * @param dealerGoalYy the dealerGoalYy to set
     */
    public void setDealerGoalYy(String dealerGoalYy) {
        this.dealerGoalYy = dealerGoalYy;
    }
    /**
     * @return the dealerGoalMm
     */
    public String getDealerGoalMm() {
        return dealerGoalMm;
    }
    /**
     * @param dealerGoalMm the dealerGoalMm to set
     */
    public void setDealerGoalMm(String dealerGoalMm) {
        this.dealerGoalMm = dealerGoalMm;
    }
    /**
     * @return the dealerSdptCd
     */
    public String getDealerSdptCd() {
        return dealerSdptCd;
    }
    /**
     * @param dealerSdptCd the dealerSdptCd to set
     */
    public void setDealerSdptCd(String dealerSdptCd) {
        this.dealerSdptCd = dealerSdptCd;
    }
    /**
     * @return the dealerOfficeCd
     */
    public String getDealerOfficeCd() {
        return dealerOfficeCd;
    }
    /**
     * @param dealerOfficeCd the dealerOfficeCd to set
     */
    public void setDealerOfficeCd(String dealerOfficeCd) {
        this.dealerOfficeCd = dealerOfficeCd;
    }
    /**
     * @return the dealerDlrCd
     */
    public String getDealerDlrCd() {
        return dealerDlrCd;
    }
    /**
     * @param dealerDlrCd the dealerDlrCd to set
     */
    public void setDealerDlrCd(String dealerDlrCd) {
        this.dealerDlrCd = dealerDlrCd;
    }
    /**
     * @return the dealerDlrTp
     */
    public String getDealerDlrTp() {
        return dealerDlrTp;
    }
    /**
     * @param dealerDlrTp the dealerDlrTp to set
     */
    public void setDealerDlrTp(String dealerDlrTp) {
        this.dealerDlrTp = dealerDlrTp;
    }
    /**
     * @return the dealerGoalTp
     */
    public String getDealerGoalTp() {
        return dealerGoalTp;
    }
    /**
     * @param dealerGoalTp the dealerGoalTp to set
     */
    public void setDealerGoalTp(String dealerGoalTp) {
        this.dealerGoalTp = dealerGoalTp;
    }
    /**
     * @return the dealerCarlineCd
     */
    public String getDealerCarlineCd() {
        return dealerCarlineCd;
    }
    /**
     * @param dealerCarlineCd the dealerCarlineCd to set
     */
    public void setDealerCarlineCd(String dealerCarlineCd) {
        this.dealerCarlineCd = dealerCarlineCd;
    }
    /**
     * @return the dealerCarlineNm
     */
    public String getDealerCarlineNm() {
        return dealerCarlineNm;
    }
    /**
     * @param dealerCarlineNm the dealerCarlineNm to set
     */
    public void setDealerCarlineNm(String dealerCarlineNm) {
        this.dealerCarlineNm = dealerCarlineNm;
    }
    /**
     * @return the dealerGoalPrefVal
     */
    public String getDealerGoalPrefVal() {
        return dealerGoalPrefVal;
    }
    /**
     * @param dealerGoalPrefVal the dealerGoalPrefVal to set
     */
    public void setDealerGoalPrefVal(String dealerGoalPrefVal) {
        this.dealerGoalPrefVal = dealerGoalPrefVal;
    }
    /**
     * @return the dealerPrefTp
     */
    public String getDealerPrefTp() {
        return dealerPrefTp;
    }
    /**
     * @param dealerPrefTp the dealerPrefTp to set
     */
    public void setDealerPrefTp(String dealerPrefTp) {
        this.dealerPrefTp = dealerPrefTp;
    }
    /**
     * @return the dealerRegUsrId
     */
    public String getDealerRegUsrId() {
        return dealerRegUsrId;
    }
    /**
     * @param dealerRegUsrId the dealerRegUsrId to set
     */
    public void setDealerRegUsrId(String dealerRegUsrId) {
        this.dealerRegUsrId = dealerRegUsrId;
    }
    /**
     * @return the dealerRegDt
     */
    public String getDealerRegDt() {
        return dealerRegDt;
    }
    /**
     * @param dealerRegDt the dealerRegDt to set
     */
    public void setDealerRegDt(String dealerRegDt) {
        this.dealerRegDt = dealerRegDt;
    }
    /**
     * @return the dealerUpdtUsrId
     */
    public String getDealerUpdtUsrId() {
        return dealerUpdtUsrId;
    }
    /**
     * @param dealerUpdtUsrId the dealerUpdtUsrId to set
     */
    public void setDealerUpdtUsrId(String dealerUpdtUsrId) {
        this.dealerUpdtUsrId = dealerUpdtUsrId;
    }
    /**
     * @return the dealerUpdtDt
     */
    public String getDealerUpdtDt() {
        return dealerUpdtDt;
    }
    /**
     * @param dealerUpdtDt the dealerUpdtDt to set
     */
    public void setDealerUpdtDt(String dealerUpdtDt) {
        this.dealerUpdtDt = dealerUpdtDt;
    }
    /**
     * @return the idccDealerGoalGapVal
     */
    public String getIdccDealerGoalGapVal() {
        return idccDealerGoalGapVal;
    }
    /**
     * @param idccDealerGoalGapVal the idccDealerGoalGapVal to set
     */
    public void setIdccDealerGoalGapVal(String idccDealerGoalGapVal) {
        this.idccDealerGoalGapVal = idccDealerGoalGapVal;
    }
    /**
     * @return the shopDealerGoalGapfVal
     */
    public String getShopDealerGoalGapfVal() {
        return shopDealerGoalGapfVal;
    }
    /**
     * @param shopDealerGoalGapfVal the shopDealerGoalGapfVal to set
     */
    public void setShopDealerGoalGapfVal(String shopDealerGoalGapfVal) {
        this.shopDealerGoalGapfVal = shopDealerGoalGapfVal;
    }
    /**
     * @return the salesAdvisorcnt
     */
    public String getSalesAdvisorcnt() {
        return salesAdvisorcnt;
    }
    /**
     * @param salesAdvisorcnt the salesAdvisorcnt to set
     */
    public void setSalesAdvisorcnt(String salesAdvisorcnt) {
        this.salesAdvisorcnt = salesAdvisorcnt;
    }
    /**
     * @return the allDealerGoalPrefVal
     */
    public String getAllDealerGoalPrefVal() {
        return allDealerGoalPrefVal;
    }
    /**
     * @param allDealerGoalPrefVal the allDealerGoalPrefVal to set
     */
    public void setAllDealerGoalPrefVal(String allDealerGoalPrefVal) {
        this.allDealerGoalPrefVal = allDealerGoalPrefVal;
    }
    /**
     * @return the idccDealerGoalPrefVal
     */
    public String getIdccDealerGoalPrefVal() {
        return idccDealerGoalPrefVal;
    }
    /**
     * @param idccDealerGoalPrefVal the idccDealerGoalPrefVal to set
     */
    public void setIdccDealerGoalPrefVal(String idccDealerGoalPrefVal) {
        this.idccDealerGoalPrefVal = idccDealerGoalPrefVal;
    }
    /**
     * @return the idccDealerGoalSumVal
     */
    public String getIdccDealerGoalSumVal() {
        return idccDealerGoalSumVal;
    }
    /**
     * @param idccDealerGoalSumVal the idccDealerGoalSumVal to set
     */
    public void setIdccDealerGoalSumVal(String idccDealerGoalSumVal) {
        this.idccDealerGoalSumVal = idccDealerGoalSumVal;
    }
    /**
     * @return the shopDealerGoalPrefVal
     */
    public String getShopDealerGoalPrefVal() {
        return shopDealerGoalPrefVal;
    }
    /**
     * @param shopDealerGoalPrefVal the shopDealerGoalPrefVal to set
     */
    public void setShopDealerGoalPrefVal(String shopDealerGoalPrefVal) {
        this.shopDealerGoalPrefVal = shopDealerGoalPrefVal;
    }
    /**
     * @return the shopDealerGoalSumVal
     */
    public String getShopDealerGoalSumVal() {
        return shopDealerGoalSumVal;
    }
    /**
     * @param shopDealerGoalSumVal the shopDealerGoalSumVal to set
     */
    public void setShopDealerGoalSumVal(String shopDealerGoalSumVal) {
        this.shopDealerGoalSumVal = shopDealerGoalSumVal;
    }
    /**
     * @return the secondDealerGoalPrefVal
     */
    public String getSecondDealerGoalPrefVal() {
        return secondDealerGoalPrefVal;
    }
    /**
     * @param secondDealerGoalPrefVal the secondDealerGoalPrefVal to set
     */
    public void setSecondDealerGoalPrefVal(String secondDealerGoalPrefVal) {
        this.secondDealerGoalPrefVal = secondDealerGoalPrefVal;
    }
    /**
     * @return the etcDealerGoalPrefVal
     */
    public String getEtcDealerGoalPrefVal() {
        return etcDealerGoalPrefVal;
    }
    /**
     * @param etcDealerGoalPrefVal the etcDealerGoalPrefVal to set
     */
    public void setEtcDealerGoalPrefVal(String etcDealerGoalPrefVal) {
        this.etcDealerGoalPrefVal = etcDealerGoalPrefVal;
    }
    /**
     * @return the custDealerDlrTp
     */
    public String getCustDealerDlrTp() {
        return custDealerDlrTp;
    }
    /**
     * @param custDealerDlrTp the custDealerDlrTp to set
     */
    public void setCustDealerDlrTp(String custDealerDlrTp) {
        this.custDealerDlrTp = custDealerDlrTp;
    }
    /**
     * @return the custDealerOpinionvalue
     */
    public String getCustDealerOpinionvalue() {
        return custDealerOpinionvalue;
    }
    /**
     * @param custDealerOpinionvalue the custDealerOpinionvalue to set
     */
    public void setCustDealerOpinionvalue(String custDealerOpinionvalue) {
        this.custDealerOpinionvalue = custDealerOpinionvalue;
    }
    /**
     * @return the custDealerPrefVal
     */
    public String getCustDealerPrefVal() {
        return custDealerPrefVal;
    }
    /**
     * @param custDealerPrefVal the custDealerPrefVal to set
     */
    public void setCustDealerPrefVal(String custDealerPrefVal) {
        this.custDealerPrefVal = custDealerPrefVal;
    }
    /**
     * @return the custDealerDlrCd
     */
    public String getCustDealerDlrCd() {
        return custDealerDlrCd;
    }
    /**
     * @param custDealerDlrCd the custDealerDlrCd to set
     */
    public void setCustDealerDlrCd(String custDealerDlrCd) {
        this.custDealerDlrCd = custDealerDlrCd;
    }
    /**
     * @return the custDealerGoalYy
     */
    public String getCustDealerGoalYy() {
        return custDealerGoalYy;
    }
    /**
     * @param custDealerGoalYy the custDealerGoalYy to set
     */
    public void setCustDealerGoalYy(String custDealerGoalYy) {
        this.custDealerGoalYy = custDealerGoalYy;
    }
    /**
     * @return the custDealerGoalMm
     */
    public String getCustDealerGoalMm() {
        return custDealerGoalMm;
    }
    /**
     * @param custDealerGoalMm the custDealerGoalMm to set
     */
    public void setCustDealerGoalMm(String custDealerGoalMm) {
        this.custDealerGoalMm = custDealerGoalMm;
    }
    /**
     * @return the custDealerGoalPrefVal
     */
    public String getCustDealerGoalPrefVal() {
        return custDealerGoalPrefVal;
    }
    /**
     * @param custDealerGoalPrefVal the custDealerGoalPrefVal to set
     */
    public void setCustDealerGoalPrefVal(String custDealerGoalPrefVal) {
        this.custDealerGoalPrefVal = custDealerGoalPrefVal;
    }
    /**
     * @return the custDealerUpdtUsrId
     */
    public String getCustDealerUpdtUsrId() {
        return custDealerUpdtUsrId;
    }
    /**
     * @param custDealerUpdtUsrId the custDealerUpdtUsrId to set
     */
    public void setCustDealerUpdtUsrId(String custDealerUpdtUsrId) {
        this.custDealerUpdtUsrId = custDealerUpdtUsrId;
    }
    /**
     * @return the carNo1
     */
    public String getCarNo1() {
        return carNo1;
    }
    /**
     * @param carNo1 the carNo1 to set
     */
    public void setCarNo1(String carNo1) {
        this.carNo1 = carNo1;
    }
    /**
     * @return the carNo2
     */
    public String getCarNo2() {
        return carNo2;
    }
    /**
     * @param carNo2 the carNo2 to set
     */
    public void setCarNo2(String carNo2) {
        this.carNo2 = carNo2;
    }
    /**
     * @return the carNo3
     */
    public String getCarNo3() {
        return carNo3;
    }
    /**
     * @param carNo3 the carNo3 to set
     */
    public void setCarNo3(String carNo3) {
        this.carNo3 = carNo3;
    }
    /**
     * @return the carNo4
     */
    public String getCarNo4() {
        return carNo4;
    }
    /**
     * @param carNo4 the carNo4 to set
     */
    public void setCarNo4(String carNo4) {
        this.carNo4 = carNo4;
    }
    /**
     * @return the carNo5
     */
    public String getCarNo5() {
        return carNo5;
    }
    /**
     * @param carNo5 the carNo5 to set
     */
    public void setCarNo5(String carNo5) {
        this.carNo5 = carNo5;
    }
    /**
     * @return the carNo6
     */
    public String getCarNo6() {
        return carNo6;
    }
    /**
     * @param carNo6 the carNo6 to set
     */
    public void setCarNo6(String carNo6) {
        this.carNo6 = carNo6;
    }
    /**
     * @return the carNo7
     */
    public String getCarNo7() {
        return carNo7;
    }
    /**
     * @param carNo7 the carNo7 to set
     */
    public void setCarNo7(String carNo7) {
        this.carNo7 = carNo7;
    }
    /**
     * @return the carNo8
     */
    public String getCarNo8() {
        return carNo8;
    }
    /**
     * @param carNo8 the carNo8 to set
     */
    public void setCarNo8(String carNo8) {
        this.carNo8 = carNo8;
    }
    /**
     * @return the carNo9
     */
    public String getCarNo9() {
        return carNo9;
    }
    /**
     * @param carNo9 the carNo9 to set
     */
    public void setCarNo9(String carNo9) {
        this.carNo9 = carNo9;
    }
    /**
     * @return the carNo10
     */
    public String getCarNo10() {
        return carNo10;
    }
    /**
     * @param carNo10 the carNo10 to set
     */
    public void setCarNo10(String carNo10) {
        this.carNo10 = carNo10;
    }
    /**
     * @return the carNo11
     */
    public String getCarNo11() {
        return carNo11;
    }
    /**
     * @param carNo11 the carNo11 to set
     */
    public void setCarNo11(String carNo11) {
        this.carNo11 = carNo11;
    }
    /**
     * @return the carNo12
     */
    public String getCarNo12() {
        return carNo12;
    }
    /**
     * @param carNo12 the carNo12 to set
     */
    public void setCarNo12(String carNo12) {
        this.carNo12 = carNo12;
    }
    /**
     * @return the carNo13
     */
    public String getCarNo13() {
        return carNo13;
    }
    /**
     * @param carNo13 the carNo13 to set
     */
    public void setCarNo13(String carNo13) {
        this.carNo13 = carNo13;
    }
    /**
     * @return the carNo14
     */
    public String getCarNo14() {
        return carNo14;
    }
    /**
     * @param carNo14 the carNo14 to set
     */
    public void setCarNo14(String carNo14) {
        this.carNo14 = carNo14;
    }
    /**
     * @return the carNo15
     */
    public String getCarNo15() {
        return carNo15;
    }
    /**
     * @param carNo15 the carNo15 to set
     */
    public void setCarNo15(String carNo15) {
        this.carNo15 = carNo15;
    }
    /**
     * @return the carNo16
     */
    public String getCarNo16() {
        return carNo16;
    }
    /**
     * @param carNo16 the carNo16 to set
     */
    public void setCarNo16(String carNo16) {
        this.carNo16 = carNo16;
    }
    /**
     * @return the carNo17
     */
    public String getCarNo17() {
        return carNo17;
    }
    /**
     * @param carNo17 the carNo17 to set
     */
    public void setCarNo17(String carNo17) {
        this.carNo17 = carNo17;
    }
    /**
     * @return the carNo18
     */
    public String getCarNo18() {
        return carNo18;
    }
    /**
     * @param carNo18 the carNo18 to set
     */
    public void setCarNo18(String carNo18) {
        this.carNo18 = carNo18;
    }
    /**
     * @return the carNo19
     */
    public String getCarNo19() {
        return carNo19;
    }
    /**
     * @param carNo19 the carNo19 to set
     */
    public void setCarNo19(String carNo19) {
        this.carNo19 = carNo19;
    }
    /**
     * @return the carNo20
     */
    public String getCarNo20() {
        return carNo20;
    }
    /**
     * @param carNo20 the carNo20 to set
     */
    public void setCarNo20(String carNo20) {
        this.carNo20 = carNo20;
    }
    /**
     * @return the carNo21
     */
    public String getCarNo21() {
        return carNo21;
    }
    /**
     * @param carNo21 the carNo21 to set
     */
    public void setCarNo21(String carNo21) {
        this.carNo21 = carNo21;
    }
    /**
     * @return the carNo22
     */
    public String getCarNo22() {
        return carNo22;
    }
    /**
     * @param carNo22 the carNo22 to set
     */
    public void setCarNo22(String carNo22) {
        this.carNo22 = carNo22;
    }
    /**
     * @return the carNo23
     */
    public String getCarNo23() {
        return carNo23;
    }
    /**
     * @param carNo23 the carNo23 to set
     */
    public void setCarNo23(String carNo23) {
        this.carNo23 = carNo23;
    }
    /**
     * @return the carNo24
     */
    public String getCarNo24() {
        return carNo24;
    }
    /**
     * @param carNo24 the carNo24 to set
     */
    public void setCarNo24(String carNo24) {
        this.carNo24 = carNo24;
    }
    /**
     * @return the carNo25
     */
    public String getCarNo25() {
        return carNo25;
    }
    /**
     * @param carNo25 the carNo25 to set
     */
    public void setCarNo25(String carNo25) {
        this.carNo25 = carNo25;
    }
    /**
     * @return the carNo26
     */
    public String getCarNo26() {
        return carNo26;
    }
    /**
     * @param carNo26 the carNo26 to set
     */
    public void setCarNo26(String carNo26) {
        this.carNo26 = carNo26;
    }
    /**
     * @return the carNo27
     */
    public String getCarNo27() {
        return carNo27;
    }
    /**
     * @param carNo27 the carNo27 to set
     */
    public void setCarNo27(String carNo27) {
        this.carNo27 = carNo27;
    }
    /**
     * @return the carNo28
     */
    public String getCarNo28() {
        return carNo28;
    }
    /**
     * @param carNo28 the carNo28 to set
     */
    public void setCarNo28(String carNo28) {
        this.carNo28 = carNo28;
    }
    /**
     * @return the carNo29
     */
    public String getCarNo29() {
        return carNo29;
    }
    /**
     * @param carNo29 the carNo29 to set
     */
    public void setCarNo29(String carNo29) {
        this.carNo29 = carNo29;
    }
    /**
     * @return the carNo30
     */
    public String getCarNo30() {
        return carNo30;
    }
    /**
     * @param carNo30 the carNo30 to set
     */
    public void setCarNo30(String carNo30) {
        this.carNo30 = carNo30;
    }
    /**
     * @return the carNo31
     */
    public String getCarNo31() {
        return carNo31;
    }
    /**
     * @param carNo31 the carNo31 to set
     */
    public void setCarNo31(String carNo31) {
        this.carNo31 = carNo31;
    }
    /**
     * @return the carNo32
     */
    public String getCarNo32() {
        return carNo32;
    }
    /**
     * @param carNo32 the carNo32 to set
     */
    public void setCarNo32(String carNo32) {
        this.carNo32 = carNo32;
    }
    /**
     * @return the carNo33
     */
    public String getCarNo33() {
        return carNo33;
    }
    /**
     * @param carNo33 the carNo33 to set
     */
    public void setCarNo33(String carNo33) {
        this.carNo33 = carNo33;
    }
    /**
     * @return the carNo34
     */
    public String getCarNo34() {
        return carNo34;
    }
    /**
     * @param carNo34 the carNo34 to set
     */
    public void setCarNo34(String carNo34) {
        this.carNo34 = carNo34;
    }
    /**
     * @return the carNo35
     */
    public String getCarNo35() {
        return carNo35;
    }
    /**
     * @param carNo35 the carNo35 to set
     */
    public void setCarNo35(String carNo35) {
        this.carNo35 = carNo35;
    }
    /**
     * @return the carNo36
     */
    public String getCarNo36() {
        return carNo36;
    }
    /**
     * @param carNo36 the carNo36 to set
     */
    public void setCarNo36(String carNo36) {
        this.carNo36 = carNo36;
    }
    /**
     * @return the carNo37
     */
    public String getCarNo37() {
        return carNo37;
    }
    /**
     * @param carNo37 the carNo37 to set
     */
    public void setCarNo37(String carNo37) {
        this.carNo37 = carNo37;
    }
    /**
     * @return the carNo38
     */
    public String getCarNo38() {
        return carNo38;
    }
    /**
     * @param carNo38 the carNo38 to set
     */
    public void setCarNo38(String carNo38) {
        this.carNo38 = carNo38;
    }
    /**
     * @return the carNo39
     */
    public String getCarNo39() {
        return carNo39;
    }
    /**
     * @param carNo39 the carNo39 to set
     */
    public void setCarNo39(String carNo39) {
        this.carNo39 = carNo39;
    }
    /**
     * @return the carNo40
     */
    public String getCarNo40() {
        return carNo40;
    }
    /**
     * @param carNo40 the carNo40 to set
     */
    public void setCarNo40(String carNo40) {
        this.carNo40 = carNo40;
    }
    /**
     * @return the carNo41
     */
    public String getCarNo41() {
        return carNo41;
    }
    /**
     * @param carNo41 the carNo41 to set
     */
    public void setCarNo41(String carNo41) {
        this.carNo41 = carNo41;
    }
    /**
     * @return the carNo42
     */
    public String getCarNo42() {
        return carNo42;
    }
    /**
     * @param carNo42 the carNo42 to set
     */
    public void setCarNo42(String carNo42) {
        this.carNo42 = carNo42;
    }
    /**
     * @return the sProcessMgmtYear
     */
    public String getsProcessMgmtYear() {
        return sProcessMgmtYear;
    }
    /**
     * @param sProcessMgmtYear the sProcessMgmtYear to set
     */
    public void setsProcessMgmtYear(String sProcessMgmtYear) {
        this.sProcessMgmtYear = sProcessMgmtYear;
    }
    /**
     * @return the sProcessMgmtMonth
     */
    public String getsProcessMgmtMonth() {
        return sProcessMgmtMonth;
    }
    /**
     * @param sProcessMgmtMonth the sProcessMgmtMonth to set
     */
    public void setsProcessMgmtMonth(String sProcessMgmtMonth) {
        this.sProcessMgmtMonth = sProcessMgmtMonth;
    }
    /**
     * @return the sProcessMgmtDate
     */
    public String getsProcessMgmtDate() {
        return sProcessMgmtDate;
    }
    /**
     * @param sProcessMgmtDate the sProcessMgmtDate to set
     */
    public void setsProcessMgmtDate(String sProcessMgmtDate) {
        this.sProcessMgmtDate = sProcessMgmtDate;
    }
    /**
     * @return the sProcessMgmtYearParam
     */
    public String getsProcessMgmtYearParam() {
        return sProcessMgmtYearParam;
    }
    /**
     * @param sProcessMgmtYearParam the sProcessMgmtYearParam to set
     */
    public void setsProcessMgmtYearParam(String sProcessMgmtYearParam) {
        this.sProcessMgmtYearParam = sProcessMgmtYearParam;
    }
    /**
     * @return the sProcessMgmtMonthParam
     */
    public String getsProcessMgmtMonthParam() {
        return sProcessMgmtMonthParam;
    }
    /**
     * @param sProcessMgmtMonthParam the sProcessMgmtMonthParam to set
     */
    public void setsProcessMgmtMonthParam(String sProcessMgmtMonthParam) {
        this.sProcessMgmtMonthParam = sProcessMgmtMonthParam;
    }
    /**
     * @return the sProcessMgmtDateParam
     */
    public String getsProcessMgmtDateParam() {
        return sProcessMgmtDateParam;
    }
    /**
     * @param sProcessMgmtDateParam the sProcessMgmtDateParam to set
     */
    public void setsProcessMgmtDateParam(String sProcessMgmtDateParam) {
        this.sProcessMgmtDateParam = sProcessMgmtDateParam;
    }
    /**
     * @return the sProcessMgmtYyMmDd
     */
    public String getsProcessMgmtYyMmDd() {
        return sProcessMgmtYyMmDd;
    }
    /**
     * @param sProcessMgmtYyMmDd the sProcessMgmtYyMmDd to set
     */
    public void setsProcessMgmtYyMmDd(String sProcessMgmtYyMmDd) {
        this.sProcessMgmtYyMmDd = sProcessMgmtYyMmDd;
    }
    /**
     * @return the sProcessMgmtYyMmDdParam
     */
    public String getsProcessMgmtYyMmDdParam() {
        return sProcessMgmtYyMmDdParam;
    }
    /**
     * @param sProcessMgmtYyMmDdParam the sProcessMgmtYyMmDdParam to set
     */
    public void setsProcessMgmtYyMmDdParam(String sProcessMgmtYyMmDdParam) {
        this.sProcessMgmtYyMmDdParam = sProcessMgmtYyMmDdParam;
    }
    /**
     * @return the gubnName
     */
    public String getGubnName() {
        return gubnName;
    }
    /**
     * @param gubnName the gubnName to set
     */
    public void setGubnName(String gubnName) {
        this.gubnName = gubnName;
    }
    /**
     * @return the idccSaleDealCnt
     */
    public String getIdccSaleDealCnt() {
        return idccSaleDealCnt;
    }
    /**
     * @param idccSaleDealCnt the idccSaleDealCnt to set
     */
    public void setIdccSaleDealCnt(String idccSaleDealCnt) {
        this.idccSaleDealCnt = idccSaleDealCnt;
    }
    /**
     * @return the idccSaleDealRate
     */
    public String getIdccSaleDealRate() {
        return idccSaleDealRate;
    }
    /**
     * @param idccSaleDealRate the idccSaleDealRate to set
     */
    public void setIdccSaleDealRate(String idccSaleDealRate) {
        this.idccSaleDealRate = idccSaleDealRate;
    }
    /**
     * @return the idccSaleTargetGapVal
     */
    public String getIdccSaleTargetGapVal() {
        return idccSaleTargetGapVal;
    }
    /**
     * @param idccSaleTargetGapVal the idccSaleTargetGapVal to set
     */
    public void setIdccSaleTargetGapVal(String idccSaleTargetGapVal) {
        this.idccSaleTargetGapVal = idccSaleTargetGapVal;
    }
    /**
     * @return the idccSaleTargetDayVal
     */
    public String getIdccSaleTargetDayVal() {
        return idccSaleTargetDayVal;
    }
    /**
     * @param idccSaleTargetDayVal the idccSaleTargetDayVal to set
     */
    public void setIdccSaleTargetDayVal(String idccSaleTargetDayVal) {
        this.idccSaleTargetDayVal = idccSaleTargetDayVal;
    }
    /**
     * @return the idccSaleTargetLastMonthVal
     */
    public String getIdccSaleTargetLastMonthVal() {
        return idccSaleTargetLastMonthVal;
    }
    /**
     * @param idccSaleTargetLastMonthVal the idccSaleTargetLastMonthVal to set
     */
    public void setIdccSaleTargetLastMonthVal(String idccSaleTargetLastMonthVal) {
        this.idccSaleTargetLastMonthVal = idccSaleTargetLastMonthVal;
    }
    /**
     * @return the idccSaleTargetLastYearVal
     */
    public String getIdccSaleTargetLastYearVal() {
        return idccSaleTargetLastYearVal;
    }
    /**
     * @param idccSaleTargetLastYearVal the idccSaleTargetLastYearVal to set
     */
    public void setIdccSaleTargetLastYearVal(String idccSaleTargetLastYearVal) {
        this.idccSaleTargetLastYearVal = idccSaleTargetLastYearVal;
    }
    /**
     * @return the shopSaleDealCnt
     */
    public String getShopSaleDealCnt() {
        return shopSaleDealCnt;
    }
    /**
     * @param shopSaleDealCnt the shopSaleDealCnt to set
     */
    public void setShopSaleDealCnt(String shopSaleDealCnt) {
        this.shopSaleDealCnt = shopSaleDealCnt;
    }
    /**
     * @return the shopSaleDealRate
     */
    public String getShopSaleDealRate() {
        return shopSaleDealRate;
    }
    /**
     * @param shopSaleDealRate the shopSaleDealRate to set
     */
    public void setShopSaleDealRate(String shopSaleDealRate) {
        this.shopSaleDealRate = shopSaleDealRate;
    }
    /**
     * @return the shopSaleTargetGapVal
     */
    public String getShopSaleTargetGapVal() {
        return shopSaleTargetGapVal;
    }
    /**
     * @param shopSaleTargetGapVal the shopSaleTargetGapVal to set
     */
    public void setShopSaleTargetGapVal(String shopSaleTargetGapVal) {
        this.shopSaleTargetGapVal = shopSaleTargetGapVal;
    }
    /**
     * @return the shopSaleTargetDayVal
     */
    public String getShopSaleTargetDayVal() {
        return shopSaleTargetDayVal;
    }
    /**
     * @param shopSaleTargetDayVal the shopSaleTargetDayVal to set
     */
    public void setShopSaleTargetDayVal(String shopSaleTargetDayVal) {
        this.shopSaleTargetDayVal = shopSaleTargetDayVal;
    }
    /**
     * @return the shopSaleTargetLastMonthVal
     */
    public String getShopSaleTargetLastMonthVal() {
        return shopSaleTargetLastMonthVal;
    }
    /**
     * @param shopSaleTargetLastMonthVal the shopSaleTargetLastMonthVal to set
     */
    public void setShopSaleTargetLastMonthVal(String shopSaleTargetLastMonthVal) {
        this.shopSaleTargetLastMonthVal = shopSaleTargetLastMonthVal;
    }
    /**
     * @return the shopSaleTargetLastYearVal
     */
    public String getShopSaleTargetLastYearVal() {
        return shopSaleTargetLastYearVal;
    }
    /**
     * @param shopSaleTargetLastYearVal the shopSaleTargetLastYearVal to set
     */
    public void setShopSaleTargetLastYearVal(String shopSaleTargetLastYearVal) {
        this.shopSaleTargetLastYearVal = shopSaleTargetLastYearVal;
    }
    /**
     * @return the idccCustDealCnt
     */
    public String getIdccCustDealCnt() {
        return idccCustDealCnt;
    }
    /**
     * @param idccCustDealCnt the idccCustDealCnt to set
     */
    public void setIdccCustDealCnt(String idccCustDealCnt) {
        this.idccCustDealCnt = idccCustDealCnt;
    }
    /**
     * @return the idccCustDealRate
     */
    public String getIdccCustDealRate() {
        return idccCustDealRate;
    }
    /**
     * @param idccCustDealRate the idccCustDealRate to set
     */
    public void setIdccCustDealRate(String idccCustDealRate) {
        this.idccCustDealRate = idccCustDealRate;
    }
    /**
     * @return the idccCustTargetGapVal
     */
    public String getIdccCustTargetGapVal() {
        return idccCustTargetGapVal;
    }
    /**
     * @param idccCustTargetGapVal the idccCustTargetGapVal to set
     */
    public void setIdccCustTargetGapVal(String idccCustTargetGapVal) {
        this.idccCustTargetGapVal = idccCustTargetGapVal;
    }
    /**
     * @return the idccCustTargetDayVal
     */
    public String getIdccCustTargetDayVal() {
        return idccCustTargetDayVal;
    }
    /**
     * @param idccCustTargetDayVal the idccCustTargetDayVal to set
     */
    public void setIdccCustTargetDayVal(String idccCustTargetDayVal) {
        this.idccCustTargetDayVal = idccCustTargetDayVal;
    }
    /**
     * @return the idccCustTargetLastMonthVal
     */
    public String getIdccCustTargetLastMonthVal() {
        return idccCustTargetLastMonthVal;
    }
    /**
     * @param idccCustTargetLastMonthVal the idccCustTargetLastMonthVal to set
     */
    public void setIdccCustTargetLastMonthVal(String idccCustTargetLastMonthVal) {
        this.idccCustTargetLastMonthVal = idccCustTargetLastMonthVal;
    }
    /**
     * @return the idccCustTargetLastYearVal
     */
    public String getIdccCustTargetLastYearVal() {
        return idccCustTargetLastYearVal;
    }
    /**
     * @param idccCustTargetLastYearVal the idccCustTargetLastYearVal to set
     */
    public void setIdccCustTargetLastYearVal(String idccCustTargetLastYearVal) {
        this.idccCustTargetLastYearVal = idccCustTargetLastYearVal;
    }
    /**
     * @return the shopCustDealCnt
     */
    public String getShopCustDealCnt() {
        return shopCustDealCnt;
    }
    /**
     * @param shopCustDealCnt the shopCustDealCnt to set
     */
    public void setShopCustDealCnt(String shopCustDealCnt) {
        this.shopCustDealCnt = shopCustDealCnt;
    }
    /**
     * @return the shopCustDealRate
     */
    public String getShopCustDealRate() {
        return shopCustDealRate;
    }
    /**
     * @param shopCustDealRate the shopCustDealRate to set
     */
    public void setShopCustDealRate(String shopCustDealRate) {
        this.shopCustDealRate = shopCustDealRate;
    }
    /**
     * @return the shopCustTargetGapVal
     */
    public String getShopCustTargetGapVal() {
        return shopCustTargetGapVal;
    }
    /**
     * @param shopCustTargetGapVal the shopCustTargetGapVal to set
     */
    public void setShopCustTargetGapVal(String shopCustTargetGapVal) {
        this.shopCustTargetGapVal = shopCustTargetGapVal;
    }
    /**
     * @return the shopCustTargetDayVal
     */
    public String getShopCustTargetDayVal() {
        return shopCustTargetDayVal;
    }
    /**
     * @param shopCustTargetDayVal the shopCustTargetDayVal to set
     */
    public void setShopCustTargetDayVal(String shopCustTargetDayVal) {
        this.shopCustTargetDayVal = shopCustTargetDayVal;
    }
    /**
     * @return the shopCustTargetLastMonthVal
     */
    public String getShopCustTargetLastMonthVal() {
        return shopCustTargetLastMonthVal;
    }
    /**
     * @param shopCustTargetLastMonthVal the shopCustTargetLastMonthVal to set
     */
    public void setShopCustTargetLastMonthVal(String shopCustTargetLastMonthVal) {
        this.shopCustTargetLastMonthVal = shopCustTargetLastMonthVal;
    }
    /**
     * @return the shopCustTargetLastYearVal
     */
    public String getShopCustTargetLastYearVal() {
        return shopCustTargetLastYearVal;
    }
    /**
     * @param shopCustTargetLastYearVal the shopCustTargetLastYearVal to set
     */
    public void setShopCustTargetLastYearVal(String shopCustTargetLastYearVal) {
        this.shopCustTargetLastYearVal = shopCustTargetLastYearVal;
    }
    /**
     * @return the sCustKpiYear
     */
    public String getsCustKpiYear() {
        return sCustKpiYear;
    }
    /**
     * @param sCustKpiYear the sCustKpiYear to set
     */
    public void setsCustKpiYear(String sCustKpiYear) {
        this.sCustKpiYear = sCustKpiYear;
    }
    /**
     * @return the sCustKpiMonth
     */
    public String getsCustKpiMonth() {
        return sCustKpiMonth;
    }
    /**
     * @param sCustKpiMonth the sCustKpiMonth to set
     */
    public void setsCustKpiMonth(String sCustKpiMonth) {
        this.sCustKpiMonth = sCustKpiMonth;
    }
    /**
     * @return the sCustKpiDate
     */
    public String getsCustKpiDate() {
        return sCustKpiDate;
    }
    /**
     * @param sCustKpiDate the sCustKpiDate to set
     */
    public void setsCustKpiDate(String sCustKpiDate) {
        this.sCustKpiDate = sCustKpiDate;
    }
    /**
     * @return the eCustKpiYear
     */
    public String geteCustKpiYear() {
        return eCustKpiYear;
    }
    /**
     * @param eCustKpiYear the eCustKpiYear to set
     */
    public void seteCustKpiYear(String eCustKpiYear) {
        this.eCustKpiYear = eCustKpiYear;
    }
    /**
     * @return the eCustKpiMonth
     */
    public String geteCustKpiMonth() {
        return eCustKpiMonth;
    }
    /**
     * @param eCustKpiMonth the eCustKpiMonth to set
     */
    public void seteCustKpiMonth(String eCustKpiMonth) {
        this.eCustKpiMonth = eCustKpiMonth;
    }
    /**
     * @return the eCustKpiDate
     */
    public String geteCustKpiDate() {
        return eCustKpiDate;
    }
    /**
     * @param eCustKpiDate the eCustKpiDate to set
     */
    public void seteCustKpiDate(String eCustKpiDate) {
        this.eCustKpiDate = eCustKpiDate;
    }
    /**
     * @return the sCustKpiYearParam
     */
    public String getsCustKpiYearParam() {
        return sCustKpiYearParam;
    }
    /**
     * @param sCustKpiYearParam the sCustKpiYearParam to set
     */
    public void setsCustKpiYearParam(String sCustKpiYearParam) {
        this.sCustKpiYearParam = sCustKpiYearParam;
    }
    /**
     * @return the sCustKpiMonthParam
     */
    public String getsCustKpiMonthParam() {
        return sCustKpiMonthParam;
    }
    /**
     * @param sCustKpiMonthParam the sCustKpiMonthParam to set
     */
    public void setsCustKpiMonthParam(String sCustKpiMonthParam) {
        this.sCustKpiMonthParam = sCustKpiMonthParam;
    }
    /**
     * @return the sCustKpiDateParam
     */
    public String getsCustKpiDateParam() {
        return sCustKpiDateParam;
    }
    /**
     * @param sCustKpiDateParam the sCustKpiDateParam to set
     */
    public void setsCustKpiDateParam(String sCustKpiDateParam) {
        this.sCustKpiDateParam = sCustKpiDateParam;
    }
    /**
     * @return the eCustKpiYearParam
     */
    public String geteCustKpiYearParam() {
        return eCustKpiYearParam;
    }
    /**
     * @param eCustKpiYearParam the eCustKpiYearParam to set
     */
    public void seteCustKpiYearParam(String eCustKpiYearParam) {
        this.eCustKpiYearParam = eCustKpiYearParam;
    }
    /**
     * @return the eCustKpiMonthParam
     */
    public String geteCustKpiMonthParam() {
        return eCustKpiMonthParam;
    }
    /**
     * @param eCustKpiMonthParam the eCustKpiMonthParam to set
     */
    public void seteCustKpiMonthParam(String eCustKpiMonthParam) {
        this.eCustKpiMonthParam = eCustKpiMonthParam;
    }
    /**
     * @return the eCustKpiDateParam
     */
    public String geteCustKpiDateParam() {
        return eCustKpiDateParam;
    }
    /**
     * @param eCustKpiDateParam the eCustKpiDateParam to set
     */
    public void seteCustKpiDateParam(String eCustKpiDateParam) {
        this.eCustKpiDateParam = eCustKpiDateParam;
    }
    /**
     * @return the idccTargetCustGoalPrefVal
     */
    public String getIdccTargetCustGoalPrefVal() {
        return idccTargetCustGoalPrefVal;
    }
    /**
     * @param idccTargetCustGoalPrefVal the idccTargetCustGoalPrefVal to set
     */
    public void setIdccTargetCustGoalPrefVal(String idccTargetCustGoalPrefVal) {
        this.idccTargetCustGoalPrefVal = idccTargetCustGoalPrefVal;
    }
    /**
     * @return the idccCustVsitCnt
     */
    public String getIdccCustVsitCnt() {
        return idccCustVsitCnt;
    }
    /**
     * @param idccCustVsitCnt the idccCustVsitCnt to set
     */
    public void setIdccCustVsitCnt(String idccCustVsitCnt) {
        this.idccCustVsitCnt = idccCustVsitCnt;
    }
    /**
     * @return the idccCustReqRate
     */
    public String getIdccCustReqRate() {
        return idccCustReqRate;
    }
    /**
     * @param idccCustReqRate the idccCustReqRate to set
     */
    public void setIdccCustReqRate(String idccCustReqRate) {
        this.idccCustReqRate = idccCustReqRate;
    }
    /**
     * @return the idccDealCnt
     */
    public String getIdccDealCnt() {
        return idccDealCnt;
    }
    /**
     * @param idccDealCnt the idccDealCnt to set
     */
    public void setIdccDealCnt(String idccDealCnt) {
        this.idccDealCnt = idccDealCnt;
    }
    /**
     * @return the shopTargetCustGoalPrefVal
     */
    public String getShopTargetCustGoalPrefVal() {
        return shopTargetCustGoalPrefVal;
    }
    /**
     * @param shopTargetCustGoalPrefVal the shopTargetCustGoalPrefVal to set
     */
    public void setShopTargetCustGoalPrefVal(String shopTargetCustGoalPrefVal) {
        this.shopTargetCustGoalPrefVal = shopTargetCustGoalPrefVal;
    }
    /**
     * @return the shopTargetCustVsitCnt
     */
    public String getShopTargetCustVsitCnt() {
        return shopTargetCustVsitCnt;
    }
    /**
     * @param shopTargetCustVsitCnt the shopTargetCustVsitCnt to set
     */
    public void setShopTargetCustVsitCnt(String shopTargetCustVsitCnt) {
        this.shopTargetCustVsitCnt = shopTargetCustVsitCnt;
    }
    /**
     * @return the shopPrsnInfoCollcRate
     */
    public String getShopPrsnInfoCollcRate() {
        return shopPrsnInfoCollcRate;
    }
    /**
     * @param shopPrsnInfoCollcRate the shopPrsnInfoCollcRate to set
     */
    public void setShopPrsnInfoCollcRate(String shopPrsnInfoCollcRate) {
        this.shopPrsnInfoCollcRate = shopPrsnInfoCollcRate;
    }
    /**
     * @return the shopDealCnt
     */
    public String getShopDealCnt() {
        return shopDealCnt;
    }
    /**
     * @param shopDealCnt the shopDealCnt to set
     */
    public void setShopDealCnt(String shopDealCnt) {
        this.shopDealCnt = shopDealCnt;
    }




}
