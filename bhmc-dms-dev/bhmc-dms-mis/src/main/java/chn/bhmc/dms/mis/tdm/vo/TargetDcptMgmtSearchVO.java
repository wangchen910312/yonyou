package chn.bhmc.dms.mis.tdm.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * [딜러사] 목표분해도
 * </pre>
 *
 * @ClassName   : TargetDcptMgmtSearchVO.java
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

public class TargetDcptMgmtSearchVO extends SearchVO {

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
    private String sDealerSaleDcptYyMm1;
    private String sDealerSaleDcptYyMm2;
    private String sDealerSaleDcptYyMm3;
    private String sDealerSaleDcptYyMm4;
    private String sDealerSaleDcptYyMm5;

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
    private String shopDealerGoalGapVal;

    private String custDealerDlrTp;
    private String custDealerOpinionvalue;
    private String custDealerPrefVal;
    private String custDealerDlrCd;
    private String custDealerGoalYy;
    private String custDealerGoalMm;
    private String custDealerGoalPrefVal;
    private String custDealerUpdtUsrId;
    private String allCustDealerOpinionvalue;
    private String idccCustDealerOpinionvalue;
    private String shopCustDealerOpinionvalue;
    private String allCustDealerGoalPrefVal;
    private String idccCustDealerGoalPrefVal;
    private String shopCustDealerGoalPrefVal;
    private String idccCustDealerGoalPrefValSave;
    private String shopCustDealerGoalPrefValSave;

    private String sDealerSaleDcptYyMmSave;
    private String idccDealerGoalPrefValSave;
    private String shopDealerGoalPrefValSave;
    private String dealerPrefTpSave;

    private int carNo1;
    private int carNo2;
    private int carNo3;
    private int carNo4;
    private int carNo5;
    private int carNo6;
    private int carNo7;
    private int carNo8;
    private int carNo9;
    private int carNo10;
    private int carNo11;
    private int carNo12;
    private int carNo13;
    private int carNo14;
    private int carNo15;
    private int carNo16;
    private int carNo17;
    private int carNo18;
    private int carNo19;
    private int carNo20;
    private int carNo21;

    private int carNo22;
    private int carNo23;
    private int carNo24;
    private int carNo25;
    private int carNo26;
    private int carNo27;
    private int carNo28;
    private int carNo29;
    private int carNo30;
    private int carNo31;
    private int carNo32;
    private int carNo33;
    private int carNo34;
    private int carNo35;
    private int carNo36;
    private int carNo37;
    private int carNo38;
    private int carNo39;
    private int carNo40;
    private int carNo41;
    private int carNo42;

    private int carPro1;
    private int carPro2;
    private int carPro3;
    private int carPro4;
    private int carPro5;
    private int carPro6;
    private int carPro7;
    private int carPro8;
    private int carPro9;
    private int carPro10;
    private int carPro11;
    private int carPro12;
    private int carPro13;
    private int carPro14;
    private int carPro15;
    private int carPro16;
    private int carPro17;
    private int carPro18;
    private int carPro19;
    private int carPro20;
    private int carPro21;

    private int carPro22;
    private int carPro23;
    private int carPro24;
    private int carPro25;
    private int carPro26;
    private int carPro27;
    private int carPro28;
    private int carPro29;
    private int carPro30;
    private int carPro31;
    private int carPro32;
    private int carPro33;
    private int carPro34;
    private int carPro35;
    private int carPro36;
    private int carPro37;
    private int carPro38;
    private int carPro39;
    private int carPro40;
    private int carPro41;
    private int carPro42;

    private int sumToalVal;

    private String sDealerSaleManDcptYyMm;
    private String allMonthTargetVal;
    private String idccMonthTargetVal;
    private String shopMonthTargetVal;
    private String allSalemanCnt;
    private String allDealerGoalSumVal;
    private String sumSalemanCnt;

    // 목표분해도 - 딜러분해(판매고문)
    private String prefTp;

    // 목표분해도 - 딜러분해(집객목표현황)
    private String sTargetStatusYyMmDd;
    private String sTargetStatusYyMmDds;
    private String sCustChannel;
    private String potenCustCnt1;
    private String potenCustCnt2;
    private String potenCustCnt3;
    private String potenCustCnt4;
    private String potenCustCnt5;
    private String potenCustCnt6;
    private String potenCustCnt7;
    private String potenCustCnt8;
    private String potenCustCnt9;
    private String potenCustCnt10;
    private String potenCustCnt11;
    private String potenCustCnt12;
    private String potenCustCnt13;
    private String potenCustCnt14;
    private String potenCustCnt15;
    private String potenCustCnt16;
    private String potenCustCnt17;
    private String potenCustCnt18;
    private String potenCustCnt19;
    private String potenCustCnt20;
    private String potenCustCnt21;

    private String potenCustCnt22;
    private String potenCustCnt23;
    private String potenCustCnt24;
    private String potenCustCnt25;
    private String potenCustCnt26;
    private String potenCustCnt27;
    private String potenCustCnt28;
    private String potenCustCnt29;
    private String potenCustCnt30;
    private String potenCustCnt31;
    private String potenCustCnt32;
    private String potenCustCnt33;
    private String potenCustCnt34;
    private String potenCustCnt35;
    private String potenCustCnt36;
    private String potenCustCnt37;
    private String potenCustCnt38;
    private String potenCustCnt39;
    private String potenCustCnt40;
    private String potenCustCnt41;
    private String potenCustCnt42;

    private String targetconfig1;
    private String targetconfig2;
    private String targetconfig3;
    private String targetconfig4;
    private String targetconfig5;
    private String targetconfig6;
    private String targetconfig7;
    private String targetconfig8;
    private String targetconfig9;
    private String targetconfig10;
    private String targetconfig11;
    private String targetconfig12;
    private String targetconfig13;
    private String targetconfig14;
    private String targetconfig15;
    private String targetconfig16;
    private String targetconfig17;
    private String targetconfig18;
    private String targetconfig19;
    private String targetconfig20;
    private String targetconfig21;

    private String sDealerTargetAchieveYyMmDd;
    private String targetAchieveCarlineCd;
    private String sumAllCustVsitCnt;
    private String monthGoalPrefVal;
    private String dayGoalPrefVal;
    private String gapTodatCUstVsitCnt;
    private String sumCustVsitCnt;
    private String gapCustVsitCnt;
    private String lastMonthGoalPrefVal;
    private String lastMonthCustVsitCnt;
    private String gapMonthCustVsitCnt;
    private String prosMonthCustVsitPer;
    private String lastYearGoalPrefVal;
    private String lastYearCustVsitCnt;
    private String gapYearCustVsitCnt;
    private String prosYearCustVsitPers;
    private String prosDayCustVsitPers;
    private String prosMonthCustVsitPers;
    private String lastMonthName;
    private String lastYearhName;

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
    private String empNm;

    private String totalDayTargetVal;
    private String totalDayGoalVal;
    private String totalDayGapVal;
    private String totalDayDealRate;
    private String totalMonthTargetVal;
    private String totalMonthGoalVal;
    private String totalMonthGapVal;
    private String totalMonthDealRate;
    private String totalYearTargetVal;
    private String totalYearGoalVal;
    private String totalYearGapVal;
    private String totalYearDealRate;

    // KPI
    private String sCustKpiYyMmDd;
    private String eCustKpiYyMmDd;
    private String sCustKpiYyMmDdParam;
    private String eCustKpiYyMmDdParam;

    private String kpiIdccTargetCustGoalPrefVal;
    private String kpiIdccCustVsitCnt;
    private String kpiIdccCustReqRate;
    private String kpiIdccDealCnt;
    private String kpiShopTargetCustGoalPrefVal;
    private String kpiShopTargetCustVsitCnt;
    private String kpiShopPrsnInfoCollcRate;
    private String kpiShopDealCnt;
    private String kpiIdcc3MTargetCustGoalPrefVal;
    private String kpiIdcc3MCustVsitCnt;
    private String kpiIdcc3MCustReqRate;
    private String kpiIdcc3MDealCnt;
    private String kpiShop3MTargetCustGoalPrefVal;
    private String kpiShop3MTargetCustVsitCnt;
    private String kpiShop3MPrsnInfoCollcRate;
    private String kpiShop3MDealCnt;
    private String kpiIdccCustVsitRate;
    private String kpiIdcc3MCustVsitRate;
    private String kpiIdccVsitDealCnt;
    private String kpiIdccVsitDealRate;
    private String referCustReqRate;
    private String referCustDealRate;
    private String referPrsnInfoCollcRate;
    private String referTargetDealRate;
    private String refer3MCustReqRate;
    private String refer3MCustDealRate;
    private String refer3MPrsnInfoCollcRate;
    private String refer3MTargetDealRate;
    private String kpiIdcc3MVsitDealCnt;
    private String kpiIdcc3MVsitDealRate;
    private String kpiShopVsitPrsnInfoCollcRate;
    private String kpiShop3MVsitPrsnInfoCollcRate;
    private String kpiShopVsitSuccessRate;
    private String kpiShop3MVsitSuccessRate;
    private String kpiShopCustTargetAchieve;
    private String kpiShop3MCustTargetAchieve;
    private String kpiTotalDealRate;

    private String nameGubn;
    private String nameChannel;

    private String custGubn;
    private String custChannel;

    private String custCnt1;
    private String custCnt2;
    private String custCnt3;
    private String custCnt4;
    private String custCnt5;
    private String custCnt6;
    private String custCnt7;
    private String custCnt8;
    private String custCnt9;
    private String custCnt10;
    private String custCnt11;
    private String custCnt12;
    private String custCnt13;
    private String custCnt14;
    private String custCnt15;
    private String custCnt16;
    private String custCnt17;
    private String custCnt18;
    private String custCnt19;
    private String custCnt20;
    private String custCnt21;

    private String custGubnVal;
    private String custChannelVal;
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
     * @return the sDealerSaleDcptYyMm1
     */
    public String getsDealerSaleDcptYyMm1() {
        return sDealerSaleDcptYyMm1;
    }
    /**
     * @param sDealerSaleDcptYyMm1 the sDealerSaleDcptYyMm1 to set
     */
    public void setsDealerSaleDcptYyMm1(String sDealerSaleDcptYyMm1) {
        this.sDealerSaleDcptYyMm1 = sDealerSaleDcptYyMm1;
    }
    /**
     * @return the sDealerSaleDcptYyMm2
     */
    public String getsDealerSaleDcptYyMm2() {
        return sDealerSaleDcptYyMm2;
    }
    /**
     * @param sDealerSaleDcptYyMm2 the sDealerSaleDcptYyMm2 to set
     */
    public void setsDealerSaleDcptYyMm2(String sDealerSaleDcptYyMm2) {
        this.sDealerSaleDcptYyMm2 = sDealerSaleDcptYyMm2;
    }
    /**
     * @return the sDealerSaleDcptYyMm3
     */
    public String getsDealerSaleDcptYyMm3() {
        return sDealerSaleDcptYyMm3;
    }
    /**
     * @param sDealerSaleDcptYyMm3 the sDealerSaleDcptYyMm3 to set
     */
    public void setsDealerSaleDcptYyMm3(String sDealerSaleDcptYyMm3) {
        this.sDealerSaleDcptYyMm3 = sDealerSaleDcptYyMm3;
    }
    /**
     * @return the sDealerSaleDcptYyMm4
     */
    public String getsDealerSaleDcptYyMm4() {
        return sDealerSaleDcptYyMm4;
    }
    /**
     * @param sDealerSaleDcptYyMm4 the sDealerSaleDcptYyMm4 to set
     */
    public void setsDealerSaleDcptYyMm4(String sDealerSaleDcptYyMm4) {
        this.sDealerSaleDcptYyMm4 = sDealerSaleDcptYyMm4;
    }
    /**
     * @return the sDealerSaleDcptYyMm5
     */
    public String getsDealerSaleDcptYyMm5() {
        return sDealerSaleDcptYyMm5;
    }
    /**
     * @param sDealerSaleDcptYyMm5 the sDealerSaleDcptYyMm5 to set
     */
    public void setsDealerSaleDcptYyMm5(String sDealerSaleDcptYyMm5) {
        this.sDealerSaleDcptYyMm5 = sDealerSaleDcptYyMm5;
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
     * @return the shopDealerGoalGapVal
     */
    public String getShopDealerGoalGapVal() {
        return shopDealerGoalGapVal;
    }
    /**
     * @param shopDealerGoalGapVal the shopDealerGoalGapVal to set
     */
    public void setShopDealerGoalGapVal(String shopDealerGoalGapVal) {
        this.shopDealerGoalGapVal = shopDealerGoalGapVal;
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
     * @return the allCustDealerOpinionvalue
     */
    public String getAllCustDealerOpinionvalue() {
        return allCustDealerOpinionvalue;
    }
    /**
     * @param allCustDealerOpinionvalue the allCustDealerOpinionvalue to set
     */
    public void setAllCustDealerOpinionvalue(String allCustDealerOpinionvalue) {
        this.allCustDealerOpinionvalue = allCustDealerOpinionvalue;
    }
    /**
     * @return the idccCustDealerOpinionvalue
     */
    public String getIdccCustDealerOpinionvalue() {
        return idccCustDealerOpinionvalue;
    }
    /**
     * @param idccCustDealerOpinionvalue the idccCustDealerOpinionvalue to set
     */
    public void setIdccCustDealerOpinionvalue(String idccCustDealerOpinionvalue) {
        this.idccCustDealerOpinionvalue = idccCustDealerOpinionvalue;
    }
    /**
     * @return the shopCustDealerOpinionvalue
     */
    public String getShopCustDealerOpinionvalue() {
        return shopCustDealerOpinionvalue;
    }
    /**
     * @param shopCustDealerOpinionvalue the shopCustDealerOpinionvalue to set
     */
    public void setShopCustDealerOpinionvalue(String shopCustDealerOpinionvalue) {
        this.shopCustDealerOpinionvalue = shopCustDealerOpinionvalue;
    }
    /**
     * @return the allCustDealerGoalPrefVal
     */
    public String getAllCustDealerGoalPrefVal() {
        return allCustDealerGoalPrefVal;
    }
    /**
     * @param allCustDealerGoalPrefVal the allCustDealerGoalPrefVal to set
     */
    public void setAllCustDealerGoalPrefVal(String allCustDealerGoalPrefVal) {
        this.allCustDealerGoalPrefVal = allCustDealerGoalPrefVal;
    }
    /**
     * @return the idccCustDealerGoalPrefVal
     */
    public String getIdccCustDealerGoalPrefVal() {
        return idccCustDealerGoalPrefVal;
    }
    /**
     * @param idccCustDealerGoalPrefVal the idccCustDealerGoalPrefVal to set
     */
    public void setIdccCustDealerGoalPrefVal(String idccCustDealerGoalPrefVal) {
        this.idccCustDealerGoalPrefVal = idccCustDealerGoalPrefVal;
    }
    /**
     * @return the shopCustDealerGoalPrefVal
     */
    public String getShopCustDealerGoalPrefVal() {
        return shopCustDealerGoalPrefVal;
    }
    /**
     * @param shopCustDealerGoalPrefVal the shopCustDealerGoalPrefVal to set
     */
    public void setShopCustDealerGoalPrefVal(String shopCustDealerGoalPrefVal) {
        this.shopCustDealerGoalPrefVal = shopCustDealerGoalPrefVal;
    }
    /**
     * @return the idccCustDealerGoalPrefValSave
     */
    public String getIdccCustDealerGoalPrefValSave() {
        return idccCustDealerGoalPrefValSave;
    }
    /**
     * @param idccCustDealerGoalPrefValSave the idccCustDealerGoalPrefValSave to set
     */
    public void setIdccCustDealerGoalPrefValSave(String idccCustDealerGoalPrefValSave) {
        this.idccCustDealerGoalPrefValSave = idccCustDealerGoalPrefValSave;
    }
    /**
     * @return the shopCustDealerGoalPrefValSave
     */
    public String getShopCustDealerGoalPrefValSave() {
        return shopCustDealerGoalPrefValSave;
    }
    /**
     * @param shopCustDealerGoalPrefValSave the shopCustDealerGoalPrefValSave to set
     */
    public void setShopCustDealerGoalPrefValSave(String shopCustDealerGoalPrefValSave) {
        this.shopCustDealerGoalPrefValSave = shopCustDealerGoalPrefValSave;
    }
    /**
     * @return the sDealerSaleDcptYyMmSave
     */
    public String getsDealerSaleDcptYyMmSave() {
        return sDealerSaleDcptYyMmSave;
    }
    /**
     * @param sDealerSaleDcptYyMmSave the sDealerSaleDcptYyMmSave to set
     */
    public void setsDealerSaleDcptYyMmSave(String sDealerSaleDcptYyMmSave) {
        this.sDealerSaleDcptYyMmSave = sDealerSaleDcptYyMmSave;
    }
    /**
     * @return the idccDealerGoalPrefValSave
     */
    public String getIdccDealerGoalPrefValSave() {
        return idccDealerGoalPrefValSave;
    }
    /**
     * @param idccDealerGoalPrefValSave the idccDealerGoalPrefValSave to set
     */
    public void setIdccDealerGoalPrefValSave(String idccDealerGoalPrefValSave) {
        this.idccDealerGoalPrefValSave = idccDealerGoalPrefValSave;
    }
    /**
     * @return the shopDealerGoalPrefValSave
     */
    public String getShopDealerGoalPrefValSave() {
        return shopDealerGoalPrefValSave;
    }
    /**
     * @param shopDealerGoalPrefValSave the shopDealerGoalPrefValSave to set
     */
    public void setShopDealerGoalPrefValSave(String shopDealerGoalPrefValSave) {
        this.shopDealerGoalPrefValSave = shopDealerGoalPrefValSave;
    }
    /**
     * @return the dealerPrefTpSave
     */
    public String getDealerPrefTpSave() {
        return dealerPrefTpSave;
    }
    /**
     * @param dealerPrefTpSave the dealerPrefTpSave to set
     */
    public void setDealerPrefTpSave(String dealerPrefTpSave) {
        this.dealerPrefTpSave = dealerPrefTpSave;
    }
    /**
     * @return the carNo1
     */
    public int getCarNo1() {
        return carNo1;
    }
    /**
     * @param carNo1 the carNo1 to set
     */
    public void setCarNo1(int carNo1) {
        this.carNo1 = carNo1;
    }
    /**
     * @return the carNo2
     */
    public int getCarNo2() {
        return carNo2;
    }
    /**
     * @param carNo2 the carNo2 to set
     */
    public void setCarNo2(int carNo2) {
        this.carNo2 = carNo2;
    }
    /**
     * @return the carNo3
     */
    public int getCarNo3() {
        return carNo3;
    }
    /**
     * @param carNo3 the carNo3 to set
     */
    public void setCarNo3(int carNo3) {
        this.carNo3 = carNo3;
    }
    /**
     * @return the carNo4
     */
    public int getCarNo4() {
        return carNo4;
    }
    /**
     * @param carNo4 the carNo4 to set
     */
    public void setCarNo4(int carNo4) {
        this.carNo4 = carNo4;
    }
    /**
     * @return the carNo5
     */
    public int getCarNo5() {
        return carNo5;
    }
    /**
     * @param carNo5 the carNo5 to set
     */
    public void setCarNo5(int carNo5) {
        this.carNo5 = carNo5;
    }
    /**
     * @return the carNo6
     */
    public int getCarNo6() {
        return carNo6;
    }
    /**
     * @param carNo6 the carNo6 to set
     */
    public void setCarNo6(int carNo6) {
        this.carNo6 = carNo6;
    }
    /**
     * @return the carNo7
     */
    public int getCarNo7() {
        return carNo7;
    }
    /**
     * @param carNo7 the carNo7 to set
     */
    public void setCarNo7(int carNo7) {
        this.carNo7 = carNo7;
    }
    /**
     * @return the carNo8
     */
    public int getCarNo8() {
        return carNo8;
    }
    /**
     * @param carNo8 the carNo8 to set
     */
    public void setCarNo8(int carNo8) {
        this.carNo8 = carNo8;
    }
    /**
     * @return the carNo9
     */
    public int getCarNo9() {
        return carNo9;
    }
    /**
     * @param carNo9 the carNo9 to set
     */
    public void setCarNo9(int carNo9) {
        this.carNo9 = carNo9;
    }
    /**
     * @return the carNo10
     */
    public int getCarNo10() {
        return carNo10;
    }
    /**
     * @param carNo10 the carNo10 to set
     */
    public void setCarNo10(int carNo10) {
        this.carNo10 = carNo10;
    }
    /**
     * @return the carNo11
     */
    public int getCarNo11() {
        return carNo11;
    }
    /**
     * @param carNo11 the carNo11 to set
     */
    public void setCarNo11(int carNo11) {
        this.carNo11 = carNo11;
    }
    /**
     * @return the carNo12
     */
    public int getCarNo12() {
        return carNo12;
    }
    /**
     * @param carNo12 the carNo12 to set
     */
    public void setCarNo12(int carNo12) {
        this.carNo12 = carNo12;
    }
    /**
     * @return the carNo13
     */
    public int getCarNo13() {
        return carNo13;
    }
    /**
     * @param carNo13 the carNo13 to set
     */
    public void setCarNo13(int carNo13) {
        this.carNo13 = carNo13;
    }
    /**
     * @return the carNo14
     */
    public int getCarNo14() {
        return carNo14;
    }
    /**
     * @param carNo14 the carNo14 to set
     */
    public void setCarNo14(int carNo14) {
        this.carNo14 = carNo14;
    }
    /**
     * @return the carNo15
     */
    public int getCarNo15() {
        return carNo15;
    }
    /**
     * @param carNo15 the carNo15 to set
     */
    public void setCarNo15(int carNo15) {
        this.carNo15 = carNo15;
    }
    /**
     * @return the carNo16
     */
    public int getCarNo16() {
        return carNo16;
    }
    /**
     * @param carNo16 the carNo16 to set
     */
    public void setCarNo16(int carNo16) {
        this.carNo16 = carNo16;
    }
    /**
     * @return the carNo17
     */
    public int getCarNo17() {
        return carNo17;
    }
    /**
     * @param carNo17 the carNo17 to set
     */
    public void setCarNo17(int carNo17) {
        this.carNo17 = carNo17;
    }
    /**
     * @return the carNo18
     */
    public int getCarNo18() {
        return carNo18;
    }
    /**
     * @param carNo18 the carNo18 to set
     */
    public void setCarNo18(int carNo18) {
        this.carNo18 = carNo18;
    }
    /**
     * @return the carNo19
     */
    public int getCarNo19() {
        return carNo19;
    }
    /**
     * @param carNo19 the carNo19 to set
     */
    public void setCarNo19(int carNo19) {
        this.carNo19 = carNo19;
    }
    /**
     * @return the carNo20
     */
    public int getCarNo20() {
        return carNo20;
    }
    /**
     * @param carNo20 the carNo20 to set
     */
    public void setCarNo20(int carNo20) {
        this.carNo20 = carNo20;
    }
    /**
     * @return the carNo21
     */
    public int getCarNo21() {
        return carNo21;
    }
    /**
     * @param carNo21 the carNo21 to set
     */
    public void setCarNo21(int carNo21) {
        this.carNo21 = carNo21;
    }
    /**
     * @return the carNo22
     */
    public int getCarNo22() {
        return carNo22;
    }
    /**
     * @param carNo22 the carNo22 to set
     */
    public void setCarNo22(int carNo22) {
        this.carNo22 = carNo22;
    }
    /**
     * @return the carNo23
     */
    public int getCarNo23() {
        return carNo23;
    }
    /**
     * @param carNo23 the carNo23 to set
     */
    public void setCarNo23(int carNo23) {
        this.carNo23 = carNo23;
    }
    /**
     * @return the carNo24
     */
    public int getCarNo24() {
        return carNo24;
    }
    /**
     * @param carNo24 the carNo24 to set
     */
    public void setCarNo24(int carNo24) {
        this.carNo24 = carNo24;
    }
    /**
     * @return the carNo25
     */
    public int getCarNo25() {
        return carNo25;
    }
    /**
     * @param carNo25 the carNo25 to set
     */
    public void setCarNo25(int carNo25) {
        this.carNo25 = carNo25;
    }
    /**
     * @return the carNo26
     */
    public int getCarNo26() {
        return carNo26;
    }
    /**
     * @param carNo26 the carNo26 to set
     */
    public void setCarNo26(int carNo26) {
        this.carNo26 = carNo26;
    }
    /**
     * @return the carNo27
     */
    public int getCarNo27() {
        return carNo27;
    }
    /**
     * @param carNo27 the carNo27 to set
     */
    public void setCarNo27(int carNo27) {
        this.carNo27 = carNo27;
    }
    /**
     * @return the carNo28
     */
    public int getCarNo28() {
        return carNo28;
    }
    /**
     * @param carNo28 the carNo28 to set
     */
    public void setCarNo28(int carNo28) {
        this.carNo28 = carNo28;
    }
    /**
     * @return the carNo29
     */
    public int getCarNo29() {
        return carNo29;
    }
    /**
     * @param carNo29 the carNo29 to set
     */
    public void setCarNo29(int carNo29) {
        this.carNo29 = carNo29;
    }
    /**
     * @return the carNo30
     */
    public int getCarNo30() {
        return carNo30;
    }
    /**
     * @param carNo30 the carNo30 to set
     */
    public void setCarNo30(int carNo30) {
        this.carNo30 = carNo30;
    }
    /**
     * @return the carNo31
     */
    public int getCarNo31() {
        return carNo31;
    }
    /**
     * @param carNo31 the carNo31 to set
     */
    public void setCarNo31(int carNo31) {
        this.carNo31 = carNo31;
    }
    /**
     * @return the carNo32
     */
    public int getCarNo32() {
        return carNo32;
    }
    /**
     * @param carNo32 the carNo32 to set
     */
    public void setCarNo32(int carNo32) {
        this.carNo32 = carNo32;
    }
    /**
     * @return the carNo33
     */
    public int getCarNo33() {
        return carNo33;
    }
    /**
     * @param carNo33 the carNo33 to set
     */
    public void setCarNo33(int carNo33) {
        this.carNo33 = carNo33;
    }
    /**
     * @return the carNo34
     */
    public int getCarNo34() {
        return carNo34;
    }
    /**
     * @param carNo34 the carNo34 to set
     */
    public void setCarNo34(int carNo34) {
        this.carNo34 = carNo34;
    }
    /**
     * @return the carNo35
     */
    public int getCarNo35() {
        return carNo35;
    }
    /**
     * @param carNo35 the carNo35 to set
     */
    public void setCarNo35(int carNo35) {
        this.carNo35 = carNo35;
    }
    /**
     * @return the carNo36
     */
    public int getCarNo36() {
        return carNo36;
    }
    /**
     * @param carNo36 the carNo36 to set
     */
    public void setCarNo36(int carNo36) {
        this.carNo36 = carNo36;
    }
    /**
     * @return the carNo37
     */
    public int getCarNo37() {
        return carNo37;
    }
    /**
     * @param carNo37 the carNo37 to set
     */
    public void setCarNo37(int carNo37) {
        this.carNo37 = carNo37;
    }
    /**
     * @return the carNo38
     */
    public int getCarNo38() {
        return carNo38;
    }
    /**
     * @param carNo38 the carNo38 to set
     */
    public void setCarNo38(int carNo38) {
        this.carNo38 = carNo38;
    }
    /**
     * @return the carNo39
     */
    public int getCarNo39() {
        return carNo39;
    }
    /**
     * @param carNo39 the carNo39 to set
     */
    public void setCarNo39(int carNo39) {
        this.carNo39 = carNo39;
    }
    /**
     * @return the carNo40
     */
    public int getCarNo40() {
        return carNo40;
    }
    /**
     * @param carNo40 the carNo40 to set
     */
    public void setCarNo40(int carNo40) {
        this.carNo40 = carNo40;
    }
    /**
     * @return the carNo41
     */
    public int getCarNo41() {
        return carNo41;
    }
    /**
     * @param carNo41 the carNo41 to set
     */
    public void setCarNo41(int carNo41) {
        this.carNo41 = carNo41;
    }
    /**
     * @return the carNo42
     */
    public int getCarNo42() {
        return carNo42;
    }
    /**
     * @param carNo42 the carNo42 to set
     */
    public void setCarNo42(int carNo42) {
        this.carNo42 = carNo42;
    }
    /**
     * @return the carPro1
     */
    public int getCarPro1() {
        return carPro1;
    }
    /**
     * @param carPro1 the carPro1 to set
     */
    public void setCarPro1(int carPro1) {
        this.carPro1 = carPro1;
    }
    /**
     * @return the carPro2
     */
    public int getCarPro2() {
        return carPro2;
    }
    /**
     * @param carPro2 the carPro2 to set
     */
    public void setCarPro2(int carPro2) {
        this.carPro2 = carPro2;
    }
    /**
     * @return the carPro3
     */
    public int getCarPro3() {
        return carPro3;
    }
    /**
     * @param carPro3 the carPro3 to set
     */
    public void setCarPro3(int carPro3) {
        this.carPro3 = carPro3;
    }
    /**
     * @return the carPro4
     */
    public int getCarPro4() {
        return carPro4;
    }
    /**
     * @param carPro4 the carPro4 to set
     */
    public void setCarPro4(int carPro4) {
        this.carPro4 = carPro4;
    }
    /**
     * @return the carPro5
     */
    public int getCarPro5() {
        return carPro5;
    }
    /**
     * @param carPro5 the carPro5 to set
     */
    public void setCarPro5(int carPro5) {
        this.carPro5 = carPro5;
    }
    /**
     * @return the carPro6
     */
    public int getCarPro6() {
        return carPro6;
    }
    /**
     * @param carPro6 the carPro6 to set
     */
    public void setCarPro6(int carPro6) {
        this.carPro6 = carPro6;
    }
    /**
     * @return the carPro7
     */
    public int getCarPro7() {
        return carPro7;
    }
    /**
     * @param carPro7 the carPro7 to set
     */
    public void setCarPro7(int carPro7) {
        this.carPro7 = carPro7;
    }
    /**
     * @return the carPro8
     */
    public int getCarPro8() {
        return carPro8;
    }
    /**
     * @param carPro8 the carPro8 to set
     */
    public void setCarPro8(int carPro8) {
        this.carPro8 = carPro8;
    }
    /**
     * @return the carPro9
     */
    public int getCarPro9() {
        return carPro9;
    }
    /**
     * @param carPro9 the carPro9 to set
     */
    public void setCarPro9(int carPro9) {
        this.carPro9 = carPro9;
    }
    /**
     * @return the carPro10
     */
    public int getCarPro10() {
        return carPro10;
    }
    /**
     * @param carPro10 the carPro10 to set
     */
    public void setCarPro10(int carPro10) {
        this.carPro10 = carPro10;
    }
    /**
     * @return the carPro11
     */
    public int getCarPro11() {
        return carPro11;
    }
    /**
     * @param carPro11 the carPro11 to set
     */
    public void setCarPro11(int carPro11) {
        this.carPro11 = carPro11;
    }
    /**
     * @return the carPro12
     */
    public int getCarPro12() {
        return carPro12;
    }
    /**
     * @param carPro12 the carPro12 to set
     */
    public void setCarPro12(int carPro12) {
        this.carPro12 = carPro12;
    }
    /**
     * @return the carPro13
     */
    public int getCarPro13() {
        return carPro13;
    }
    /**
     * @param carPro13 the carPro13 to set
     */
    public void setCarPro13(int carPro13) {
        this.carPro13 = carPro13;
    }
    /**
     * @return the carPro14
     */
    public int getCarPro14() {
        return carPro14;
    }
    /**
     * @param carPro14 the carPro14 to set
     */
    public void setCarPro14(int carPro14) {
        this.carPro14 = carPro14;
    }
    /**
     * @return the carPro15
     */
    public int getCarPro15() {
        return carPro15;
    }
    /**
     * @param carPro15 the carPro15 to set
     */
    public void setCarPro15(int carPro15) {
        this.carPro15 = carPro15;
    }
    /**
     * @return the carPro16
     */
    public int getCarPro16() {
        return carPro16;
    }
    /**
     * @param carPro16 the carPro16 to set
     */
    public void setCarPro16(int carPro16) {
        this.carPro16 = carPro16;
    }
    /**
     * @return the carPro17
     */
    public int getCarPro17() {
        return carPro17;
    }
    /**
     * @param carPro17 the carPro17 to set
     */
    public void setCarPro17(int carPro17) {
        this.carPro17 = carPro17;
    }
    /**
     * @return the carPro18
     */
    public int getCarPro18() {
        return carPro18;
    }
    /**
     * @param carPro18 the carPro18 to set
     */
    public void setCarPro18(int carPro18) {
        this.carPro18 = carPro18;
    }
    /**
     * @return the carPro19
     */
    public int getCarPro19() {
        return carPro19;
    }
    /**
     * @param carPro19 the carPro19 to set
     */
    public void setCarPro19(int carPro19) {
        this.carPro19 = carPro19;
    }
    /**
     * @return the carPro20
     */
    public int getCarPro20() {
        return carPro20;
    }
    /**
     * @param carPro20 the carPro20 to set
     */
    public void setCarPro20(int carPro20) {
        this.carPro20 = carPro20;
    }
    /**
     * @return the carPro21
     */
    public int getCarPro21() {
        return carPro21;
    }
    /**
     * @param carPro21 the carPro21 to set
     */
    public void setCarPro21(int carPro21) {
        this.carPro21 = carPro21;
    }
    /**
     * @return the carPro22
     */
    public int getCarPro22() {
        return carPro22;
    }
    /**
     * @param carPro22 the carPro22 to set
     */
    public void setCarPro22(int carPro22) {
        this.carPro22 = carPro22;
    }
    /**
     * @return the carPro23
     */
    public int getCarPro23() {
        return carPro23;
    }
    /**
     * @param carPro23 the carPro23 to set
     */
    public void setCarPro23(int carPro23) {
        this.carPro23 = carPro23;
    }
    /**
     * @return the carPro24
     */
    public int getCarPro24() {
        return carPro24;
    }
    /**
     * @param carPro24 the carPro24 to set
     */
    public void setCarPro24(int carPro24) {
        this.carPro24 = carPro24;
    }
    /**
     * @return the carPro25
     */
    public int getCarPro25() {
        return carPro25;
    }
    /**
     * @param carPro25 the carPro25 to set
     */
    public void setCarPro25(int carPro25) {
        this.carPro25 = carPro25;
    }
    /**
     * @return the carPro26
     */
    public int getCarPro26() {
        return carPro26;
    }
    /**
     * @param carPro26 the carPro26 to set
     */
    public void setCarPro26(int carPro26) {
        this.carPro26 = carPro26;
    }
    /**
     * @return the carPro27
     */
    public int getCarPro27() {
        return carPro27;
    }
    /**
     * @param carPro27 the carPro27 to set
     */
    public void setCarPro27(int carPro27) {
        this.carPro27 = carPro27;
    }
    /**
     * @return the carPro28
     */
    public int getCarPro28() {
        return carPro28;
    }
    /**
     * @param carPro28 the carPro28 to set
     */
    public void setCarPro28(int carPro28) {
        this.carPro28 = carPro28;
    }
    /**
     * @return the carPro29
     */
    public int getCarPro29() {
        return carPro29;
    }
    /**
     * @param carPro29 the carPro29 to set
     */
    public void setCarPro29(int carPro29) {
        this.carPro29 = carPro29;
    }
    /**
     * @return the carPro30
     */
    public int getCarPro30() {
        return carPro30;
    }
    /**
     * @param carPro30 the carPro30 to set
     */
    public void setCarPro30(int carPro30) {
        this.carPro30 = carPro30;
    }
    /**
     * @return the carPro31
     */
    public int getCarPro31() {
        return carPro31;
    }
    /**
     * @param carPro31 the carPro31 to set
     */
    public void setCarPro31(int carPro31) {
        this.carPro31 = carPro31;
    }
    /**
     * @return the carPro32
     */
    public int getCarPro32() {
        return carPro32;
    }
    /**
     * @param carPro32 the carPro32 to set
     */
    public void setCarPro32(int carPro32) {
        this.carPro32 = carPro32;
    }
    /**
     * @return the carPro33
     */
    public int getCarPro33() {
        return carPro33;
    }
    /**
     * @param carPro33 the carPro33 to set
     */
    public void setCarPro33(int carPro33) {
        this.carPro33 = carPro33;
    }
    /**
     * @return the carPro34
     */
    public int getCarPro34() {
        return carPro34;
    }
    /**
     * @param carPro34 the carPro34 to set
     */
    public void setCarPro34(int carPro34) {
        this.carPro34 = carPro34;
    }
    /**
     * @return the carPro35
     */
    public int getCarPro35() {
        return carPro35;
    }
    /**
     * @param carPro35 the carPro35 to set
     */
    public void setCarPro35(int carPro35) {
        this.carPro35 = carPro35;
    }
    /**
     * @return the carPro36
     */
    public int getCarPro36() {
        return carPro36;
    }
    /**
     * @param carPro36 the carPro36 to set
     */
    public void setCarPro36(int carPro36) {
        this.carPro36 = carPro36;
    }
    /**
     * @return the carPro37
     */
    public int getCarPro37() {
        return carPro37;
    }
    /**
     * @param carPro37 the carPro37 to set
     */
    public void setCarPro37(int carPro37) {
        this.carPro37 = carPro37;
    }
    /**
     * @return the carPro38
     */
    public int getCarPro38() {
        return carPro38;
    }
    /**
     * @param carPro38 the carPro38 to set
     */
    public void setCarPro38(int carPro38) {
        this.carPro38 = carPro38;
    }
    /**
     * @return the carPro39
     */
    public int getCarPro39() {
        return carPro39;
    }
    /**
     * @param carPro39 the carPro39 to set
     */
    public void setCarPro39(int carPro39) {
        this.carPro39 = carPro39;
    }
    /**
     * @return the carPro40
     */
    public int getCarPro40() {
        return carPro40;
    }
    /**
     * @param carPro40 the carPro40 to set
     */
    public void setCarPro40(int carPro40) {
        this.carPro40 = carPro40;
    }
    /**
     * @return the carPro41
     */
    public int getCarPro41() {
        return carPro41;
    }
    /**
     * @param carPro41 the carPro41 to set
     */
    public void setCarPro41(int carPro41) {
        this.carPro41 = carPro41;
    }
    /**
     * @return the carPro42
     */
    public int getCarPro42() {
        return carPro42;
    }
    /**
     * @param carPro42 the carPro42 to set
     */
    public void setCarPro42(int carPro42) {
        this.carPro42 = carPro42;
    }
    /**
     * @return the sumToalVal
     */
    public int getSumToalVal() {
        return sumToalVal;
    }
    /**
     * @param sumToalVal the sumToalVal to set
     */
    public void setSumToalVal(int sumToalVal) {
        this.sumToalVal = sumToalVal;
    }
    /**
     * @return the sDealerSaleManDcptYyMm
     */
    public String getsDealerSaleManDcptYyMm() {
        return sDealerSaleManDcptYyMm;
    }
    /**
     * @param sDealerSaleManDcptYyMm the sDealerSaleManDcptYyMm to set
     */
    public void setsDealerSaleManDcptYyMm(String sDealerSaleManDcptYyMm) {
        this.sDealerSaleManDcptYyMm = sDealerSaleManDcptYyMm;
    }
    /**
     * @return the allMonthTargetVal
     */
    public String getAllMonthTargetVal() {
        return allMonthTargetVal;
    }
    /**
     * @param allMonthTargetVal the allMonthTargetVal to set
     */
    public void setAllMonthTargetVal(String allMonthTargetVal) {
        this.allMonthTargetVal = allMonthTargetVal;
    }
    /**
     * @return the idccMonthTargetVal
     */
    public String getIdccMonthTargetVal() {
        return idccMonthTargetVal;
    }
    /**
     * @param idccMonthTargetVal the idccMonthTargetVal to set
     */
    public void setIdccMonthTargetVal(String idccMonthTargetVal) {
        this.idccMonthTargetVal = idccMonthTargetVal;
    }
    /**
     * @return the shopMonthTargetVal
     */
    public String getShopMonthTargetVal() {
        return shopMonthTargetVal;
    }
    /**
     * @param shopMonthTargetVal the shopMonthTargetVal to set
     */
    public void setShopMonthTargetVal(String shopMonthTargetVal) {
        this.shopMonthTargetVal = shopMonthTargetVal;
    }
    /**
     * @return the allSalemanCnt
     */
    public String getAllSalemanCnt() {
        return allSalemanCnt;
    }
    /**
     * @param allSalemanCnt the allSalemanCnt to set
     */
    public void setAllSalemanCnt(String allSalemanCnt) {
        this.allSalemanCnt = allSalemanCnt;
    }
    /**
     * @return the allDealerGoalSumVal
     */
    public String getAllDealerGoalSumVal() {
        return allDealerGoalSumVal;
    }
    /**
     * @param allDealerGoalSumVal the allDealerGoalSumVal to set
     */
    public void setAllDealerGoalSumVal(String allDealerGoalSumVal) {
        this.allDealerGoalSumVal = allDealerGoalSumVal;
    }
    /**
     * @return the sumSalemanCnt
     */
    public String getSumSalemanCnt() {
        return sumSalemanCnt;
    }
    /**
     * @param sumSalemanCnt the sumSalemanCnt to set
     */
    public void setSumSalemanCnt(String sumSalemanCnt) {
        this.sumSalemanCnt = sumSalemanCnt;
    }
    /**
     * @return the prefTp
     */
    public String getPrefTp() {
        return prefTp;
    }
    /**
     * @param prefTp the prefTp to set
     */
    public void setPrefTp(String prefTp) {
        this.prefTp = prefTp;
    }
    /**
     * @return the sTargetStatusYyMmDd
     */
    public String getsTargetStatusYyMmDd() {
        return sTargetStatusYyMmDd;
    }
    /**
     * @param sTargetStatusYyMmDd the sTargetStatusYyMmDd to set
     */
    public void setsTargetStatusYyMmDd(String sTargetStatusYyMmDd) {
        this.sTargetStatusYyMmDd = sTargetStatusYyMmDd;
    }
    /**
     * @return the sTargetStatusYyMmDds
     */
    public String getsTargetStatusYyMmDds() {
        return sTargetStatusYyMmDds;
    }
    /**
     * @param sTargetStatusYyMmDds the sTargetStatusYyMmDds to set
     */
    public void setsTargetStatusYyMmDds(String sTargetStatusYyMmDds) {
        this.sTargetStatusYyMmDds = sTargetStatusYyMmDds;
    }
    /**
     * @return the sCustChannel
     */
    public String getsCustChannel() {
        return sCustChannel;
    }
    /**
     * @param sCustChannel the sCustChannel to set
     */
    public void setsCustChannel(String sCustChannel) {
        this.sCustChannel = sCustChannel;
    }
    /**
     * @return the potenCustCnt1
     */
    public String getPotenCustCnt1() {
        return potenCustCnt1;
    }
    /**
     * @param potenCustCnt1 the potenCustCnt1 to set
     */
    public void setPotenCustCnt1(String potenCustCnt1) {
        this.potenCustCnt1 = potenCustCnt1;
    }
    /**
     * @return the potenCustCnt2
     */
    public String getPotenCustCnt2() {
        return potenCustCnt2;
    }
    /**
     * @param potenCustCnt2 the potenCustCnt2 to set
     */
    public void setPotenCustCnt2(String potenCustCnt2) {
        this.potenCustCnt2 = potenCustCnt2;
    }
    /**
     * @return the potenCustCnt3
     */
    public String getPotenCustCnt3() {
        return potenCustCnt3;
    }
    /**
     * @param potenCustCnt3 the potenCustCnt3 to set
     */
    public void setPotenCustCnt3(String potenCustCnt3) {
        this.potenCustCnt3 = potenCustCnt3;
    }
    /**
     * @return the potenCustCnt4
     */
    public String getPotenCustCnt4() {
        return potenCustCnt4;
    }
    /**
     * @param potenCustCnt4 the potenCustCnt4 to set
     */
    public void setPotenCustCnt4(String potenCustCnt4) {
        this.potenCustCnt4 = potenCustCnt4;
    }
    /**
     * @return the potenCustCnt5
     */
    public String getPotenCustCnt5() {
        return potenCustCnt5;
    }
    /**
     * @param potenCustCnt5 the potenCustCnt5 to set
     */
    public void setPotenCustCnt5(String potenCustCnt5) {
        this.potenCustCnt5 = potenCustCnt5;
    }
    /**
     * @return the potenCustCnt6
     */
    public String getPotenCustCnt6() {
        return potenCustCnt6;
    }
    /**
     * @param potenCustCnt6 the potenCustCnt6 to set
     */
    public void setPotenCustCnt6(String potenCustCnt6) {
        this.potenCustCnt6 = potenCustCnt6;
    }
    /**
     * @return the potenCustCnt7
     */
    public String getPotenCustCnt7() {
        return potenCustCnt7;
    }
    /**
     * @param potenCustCnt7 the potenCustCnt7 to set
     */
    public void setPotenCustCnt7(String potenCustCnt7) {
        this.potenCustCnt7 = potenCustCnt7;
    }
    /**
     * @return the potenCustCnt8
     */
    public String getPotenCustCnt8() {
        return potenCustCnt8;
    }
    /**
     * @param potenCustCnt8 the potenCustCnt8 to set
     */
    public void setPotenCustCnt8(String potenCustCnt8) {
        this.potenCustCnt8 = potenCustCnt8;
    }
    /**
     * @return the potenCustCnt9
     */
    public String getPotenCustCnt9() {
        return potenCustCnt9;
    }
    /**
     * @param potenCustCnt9 the potenCustCnt9 to set
     */
    public void setPotenCustCnt9(String potenCustCnt9) {
        this.potenCustCnt9 = potenCustCnt9;
    }
    /**
     * @return the potenCustCnt10
     */
    public String getPotenCustCnt10() {
        return potenCustCnt10;
    }
    /**
     * @param potenCustCnt10 the potenCustCnt10 to set
     */
    public void setPotenCustCnt10(String potenCustCnt10) {
        this.potenCustCnt10 = potenCustCnt10;
    }
    /**
     * @return the potenCustCnt11
     */
    public String getPotenCustCnt11() {
        return potenCustCnt11;
    }
    /**
     * @param potenCustCnt11 the potenCustCnt11 to set
     */
    public void setPotenCustCnt11(String potenCustCnt11) {
        this.potenCustCnt11 = potenCustCnt11;
    }
    /**
     * @return the potenCustCnt12
     */
    public String getPotenCustCnt12() {
        return potenCustCnt12;
    }
    /**
     * @param potenCustCnt12 the potenCustCnt12 to set
     */
    public void setPotenCustCnt12(String potenCustCnt12) {
        this.potenCustCnt12 = potenCustCnt12;
    }
    /**
     * @return the potenCustCnt13
     */
    public String getPotenCustCnt13() {
        return potenCustCnt13;
    }
    /**
     * @param potenCustCnt13 the potenCustCnt13 to set
     */
    public void setPotenCustCnt13(String potenCustCnt13) {
        this.potenCustCnt13 = potenCustCnt13;
    }
    /**
     * @return the potenCustCnt14
     */
    public String getPotenCustCnt14() {
        return potenCustCnt14;
    }
    /**
     * @param potenCustCnt14 the potenCustCnt14 to set
     */
    public void setPotenCustCnt14(String potenCustCnt14) {
        this.potenCustCnt14 = potenCustCnt14;
    }
    /**
     * @return the potenCustCnt15
     */
    public String getPotenCustCnt15() {
        return potenCustCnt15;
    }
    /**
     * @param potenCustCnt15 the potenCustCnt15 to set
     */
    public void setPotenCustCnt15(String potenCustCnt15) {
        this.potenCustCnt15 = potenCustCnt15;
    }
    /**
     * @return the potenCustCnt16
     */
    public String getPotenCustCnt16() {
        return potenCustCnt16;
    }
    /**
     * @param potenCustCnt16 the potenCustCnt16 to set
     */
    public void setPotenCustCnt16(String potenCustCnt16) {
        this.potenCustCnt16 = potenCustCnt16;
    }
    /**
     * @return the potenCustCnt17
     */
    public String getPotenCustCnt17() {
        return potenCustCnt17;
    }
    /**
     * @param potenCustCnt17 the potenCustCnt17 to set
     */
    public void setPotenCustCnt17(String potenCustCnt17) {
        this.potenCustCnt17 = potenCustCnt17;
    }
    /**
     * @return the potenCustCnt18
     */
    public String getPotenCustCnt18() {
        return potenCustCnt18;
    }
    /**
     * @param potenCustCnt18 the potenCustCnt18 to set
     */
    public void setPotenCustCnt18(String potenCustCnt18) {
        this.potenCustCnt18 = potenCustCnt18;
    }
    /**
     * @return the potenCustCnt19
     */
    public String getPotenCustCnt19() {
        return potenCustCnt19;
    }
    /**
     * @param potenCustCnt19 the potenCustCnt19 to set
     */
    public void setPotenCustCnt19(String potenCustCnt19) {
        this.potenCustCnt19 = potenCustCnt19;
    }
    /**
     * @return the potenCustCnt20
     */
    public String getPotenCustCnt20() {
        return potenCustCnt20;
    }
    /**
     * @param potenCustCnt20 the potenCustCnt20 to set
     */
    public void setPotenCustCnt20(String potenCustCnt20) {
        this.potenCustCnt20 = potenCustCnt20;
    }
    /**
     * @return the potenCustCnt21
     */
    public String getPotenCustCnt21() {
        return potenCustCnt21;
    }
    /**
     * @param potenCustCnt21 the potenCustCnt21 to set
     */
    public void setPotenCustCnt21(String potenCustCnt21) {
        this.potenCustCnt21 = potenCustCnt21;
    }
    /**
     * @return the potenCustCnt22
     */
    public String getPotenCustCnt22() {
        return potenCustCnt22;
    }
    /**
     * @param potenCustCnt22 the potenCustCnt22 to set
     */
    public void setPotenCustCnt22(String potenCustCnt22) {
        this.potenCustCnt22 = potenCustCnt22;
    }
    /**
     * @return the potenCustCnt23
     */
    public String getPotenCustCnt23() {
        return potenCustCnt23;
    }
    /**
     * @param potenCustCnt23 the potenCustCnt23 to set
     */
    public void setPotenCustCnt23(String potenCustCnt23) {
        this.potenCustCnt23 = potenCustCnt23;
    }
    /**
     * @return the potenCustCnt24
     */
    public String getPotenCustCnt24() {
        return potenCustCnt24;
    }
    /**
     * @param potenCustCnt24 the potenCustCnt24 to set
     */
    public void setPotenCustCnt24(String potenCustCnt24) {
        this.potenCustCnt24 = potenCustCnt24;
    }
    /**
     * @return the potenCustCnt25
     */
    public String getPotenCustCnt25() {
        return potenCustCnt25;
    }
    /**
     * @param potenCustCnt25 the potenCustCnt25 to set
     */
    public void setPotenCustCnt25(String potenCustCnt25) {
        this.potenCustCnt25 = potenCustCnt25;
    }
    /**
     * @return the potenCustCnt26
     */
    public String getPotenCustCnt26() {
        return potenCustCnt26;
    }
    /**
     * @param potenCustCnt26 the potenCustCnt26 to set
     */
    public void setPotenCustCnt26(String potenCustCnt26) {
        this.potenCustCnt26 = potenCustCnt26;
    }
    /**
     * @return the potenCustCnt27
     */
    public String getPotenCustCnt27() {
        return potenCustCnt27;
    }
    /**
     * @param potenCustCnt27 the potenCustCnt27 to set
     */
    public void setPotenCustCnt27(String potenCustCnt27) {
        this.potenCustCnt27 = potenCustCnt27;
    }
    /**
     * @return the potenCustCnt28
     */
    public String getPotenCustCnt28() {
        return potenCustCnt28;
    }
    /**
     * @param potenCustCnt28 the potenCustCnt28 to set
     */
    public void setPotenCustCnt28(String potenCustCnt28) {
        this.potenCustCnt28 = potenCustCnt28;
    }
    /**
     * @return the potenCustCnt29
     */
    public String getPotenCustCnt29() {
        return potenCustCnt29;
    }
    /**
     * @param potenCustCnt29 the potenCustCnt29 to set
     */
    public void setPotenCustCnt29(String potenCustCnt29) {
        this.potenCustCnt29 = potenCustCnt29;
    }
    /**
     * @return the potenCustCnt30
     */
    public String getPotenCustCnt30() {
        return potenCustCnt30;
    }
    /**
     * @param potenCustCnt30 the potenCustCnt30 to set
     */
    public void setPotenCustCnt30(String potenCustCnt30) {
        this.potenCustCnt30 = potenCustCnt30;
    }
    /**
     * @return the potenCustCnt31
     */
    public String getPotenCustCnt31() {
        return potenCustCnt31;
    }
    /**
     * @param potenCustCnt31 the potenCustCnt31 to set
     */
    public void setPotenCustCnt31(String potenCustCnt31) {
        this.potenCustCnt31 = potenCustCnt31;
    }
    /**
     * @return the potenCustCnt32
     */
    public String getPotenCustCnt32() {
        return potenCustCnt32;
    }
    /**
     * @param potenCustCnt32 the potenCustCnt32 to set
     */
    public void setPotenCustCnt32(String potenCustCnt32) {
        this.potenCustCnt32 = potenCustCnt32;
    }
    /**
     * @return the potenCustCnt33
     */
    public String getPotenCustCnt33() {
        return potenCustCnt33;
    }
    /**
     * @param potenCustCnt33 the potenCustCnt33 to set
     */
    public void setPotenCustCnt33(String potenCustCnt33) {
        this.potenCustCnt33 = potenCustCnt33;
    }
    /**
     * @return the potenCustCnt34
     */
    public String getPotenCustCnt34() {
        return potenCustCnt34;
    }
    /**
     * @param potenCustCnt34 the potenCustCnt34 to set
     */
    public void setPotenCustCnt34(String potenCustCnt34) {
        this.potenCustCnt34 = potenCustCnt34;
    }
    /**
     * @return the potenCustCnt35
     */
    public String getPotenCustCnt35() {
        return potenCustCnt35;
    }
    /**
     * @param potenCustCnt35 the potenCustCnt35 to set
     */
    public void setPotenCustCnt35(String potenCustCnt35) {
        this.potenCustCnt35 = potenCustCnt35;
    }
    /**
     * @return the potenCustCnt36
     */
    public String getPotenCustCnt36() {
        return potenCustCnt36;
    }
    /**
     * @param potenCustCnt36 the potenCustCnt36 to set
     */
    public void setPotenCustCnt36(String potenCustCnt36) {
        this.potenCustCnt36 = potenCustCnt36;
    }
    /**
     * @return the potenCustCnt37
     */
    public String getPotenCustCnt37() {
        return potenCustCnt37;
    }
    /**
     * @param potenCustCnt37 the potenCustCnt37 to set
     */
    public void setPotenCustCnt37(String potenCustCnt37) {
        this.potenCustCnt37 = potenCustCnt37;
    }
    /**
     * @return the potenCustCnt38
     */
    public String getPotenCustCnt38() {
        return potenCustCnt38;
    }
    /**
     * @param potenCustCnt38 the potenCustCnt38 to set
     */
    public void setPotenCustCnt38(String potenCustCnt38) {
        this.potenCustCnt38 = potenCustCnt38;
    }
    /**
     * @return the potenCustCnt39
     */
    public String getPotenCustCnt39() {
        return potenCustCnt39;
    }
    /**
     * @param potenCustCnt39 the potenCustCnt39 to set
     */
    public void setPotenCustCnt39(String potenCustCnt39) {
        this.potenCustCnt39 = potenCustCnt39;
    }
    /**
     * @return the potenCustCnt40
     */
    public String getPotenCustCnt40() {
        return potenCustCnt40;
    }
    /**
     * @param potenCustCnt40 the potenCustCnt40 to set
     */
    public void setPotenCustCnt40(String potenCustCnt40) {
        this.potenCustCnt40 = potenCustCnt40;
    }
    /**
     * @return the potenCustCnt41
     */
    public String getPotenCustCnt41() {
        return potenCustCnt41;
    }
    /**
     * @param potenCustCnt41 the potenCustCnt41 to set
     */
    public void setPotenCustCnt41(String potenCustCnt41) {
        this.potenCustCnt41 = potenCustCnt41;
    }
    /**
     * @return the potenCustCnt42
     */
    public String getPotenCustCnt42() {
        return potenCustCnt42;
    }
    /**
     * @param potenCustCnt42 the potenCustCnt42 to set
     */
    public void setPotenCustCnt42(String potenCustCnt42) {
        this.potenCustCnt42 = potenCustCnt42;
    }
    /**
     * @return the targetconfig1
     */
    public String getTargetconfig1() {
        return targetconfig1;
    }
    /**
     * @param targetconfig1 the targetconfig1 to set
     */
    public void setTargetconfig1(String targetconfig1) {
        this.targetconfig1 = targetconfig1;
    }
    /**
     * @return the targetconfig2
     */
    public String getTargetconfig2() {
        return targetconfig2;
    }
    /**
     * @param targetconfig2 the targetconfig2 to set
     */
    public void setTargetconfig2(String targetconfig2) {
        this.targetconfig2 = targetconfig2;
    }
    /**
     * @return the targetconfig3
     */
    public String getTargetconfig3() {
        return targetconfig3;
    }
    /**
     * @param targetconfig3 the targetconfig3 to set
     */
    public void setTargetconfig3(String targetconfig3) {
        this.targetconfig3 = targetconfig3;
    }
    /**
     * @return the targetconfig4
     */
    public String getTargetconfig4() {
        return targetconfig4;
    }
    /**
     * @param targetconfig4 the targetconfig4 to set
     */
    public void setTargetconfig4(String targetconfig4) {
        this.targetconfig4 = targetconfig4;
    }
    /**
     * @return the targetconfig5
     */
    public String getTargetconfig5() {
        return targetconfig5;
    }
    /**
     * @param targetconfig5 the targetconfig5 to set
     */
    public void setTargetconfig5(String targetconfig5) {
        this.targetconfig5 = targetconfig5;
    }
    /**
     * @return the targetconfig6
     */
    public String getTargetconfig6() {
        return targetconfig6;
    }
    /**
     * @param targetconfig6 the targetconfig6 to set
     */
    public void setTargetconfig6(String targetconfig6) {
        this.targetconfig6 = targetconfig6;
    }
    /**
     * @return the targetconfig7
     */
    public String getTargetconfig7() {
        return targetconfig7;
    }
    /**
     * @param targetconfig7 the targetconfig7 to set
     */
    public void setTargetconfig7(String targetconfig7) {
        this.targetconfig7 = targetconfig7;
    }
    /**
     * @return the targetconfig8
     */
    public String getTargetconfig8() {
        return targetconfig8;
    }
    /**
     * @param targetconfig8 the targetconfig8 to set
     */
    public void setTargetconfig8(String targetconfig8) {
        this.targetconfig8 = targetconfig8;
    }
    /**
     * @return the targetconfig9
     */
    public String getTargetconfig9() {
        return targetconfig9;
    }
    /**
     * @param targetconfig9 the targetconfig9 to set
     */
    public void setTargetconfig9(String targetconfig9) {
        this.targetconfig9 = targetconfig9;
    }
    /**
     * @return the targetconfig10
     */
    public String getTargetconfig10() {
        return targetconfig10;
    }
    /**
     * @param targetconfig10 the targetconfig10 to set
     */
    public void setTargetconfig10(String targetconfig10) {
        this.targetconfig10 = targetconfig10;
    }
    /**
     * @return the targetconfig11
     */
    public String getTargetconfig11() {
        return targetconfig11;
    }
    /**
     * @param targetconfig11 the targetconfig11 to set
     */
    public void setTargetconfig11(String targetconfig11) {
        this.targetconfig11 = targetconfig11;
    }
    /**
     * @return the targetconfig12
     */
    public String getTargetconfig12() {
        return targetconfig12;
    }
    /**
     * @param targetconfig12 the targetconfig12 to set
     */
    public void setTargetconfig12(String targetconfig12) {
        this.targetconfig12 = targetconfig12;
    }
    /**
     * @return the targetconfig13
     */
    public String getTargetconfig13() {
        return targetconfig13;
    }
    /**
     * @param targetconfig13 the targetconfig13 to set
     */
    public void setTargetconfig13(String targetconfig13) {
        this.targetconfig13 = targetconfig13;
    }
    /**
     * @return the targetconfig14
     */
    public String getTargetconfig14() {
        return targetconfig14;
    }
    /**
     * @param targetconfig14 the targetconfig14 to set
     */
    public void setTargetconfig14(String targetconfig14) {
        this.targetconfig14 = targetconfig14;
    }
    /**
     * @return the targetconfig15
     */
    public String getTargetconfig15() {
        return targetconfig15;
    }
    /**
     * @param targetconfig15 the targetconfig15 to set
     */
    public void setTargetconfig15(String targetconfig15) {
        this.targetconfig15 = targetconfig15;
    }
    /**
     * @return the targetconfig16
     */
    public String getTargetconfig16() {
        return targetconfig16;
    }
    /**
     * @param targetconfig16 the targetconfig16 to set
     */
    public void setTargetconfig16(String targetconfig16) {
        this.targetconfig16 = targetconfig16;
    }
    /**
     * @return the targetconfig17
     */
    public String getTargetconfig17() {
        return targetconfig17;
    }
    /**
     * @param targetconfig17 the targetconfig17 to set
     */
    public void setTargetconfig17(String targetconfig17) {
        this.targetconfig17 = targetconfig17;
    }
    /**
     * @return the targetconfig18
     */
    public String getTargetconfig18() {
        return targetconfig18;
    }
    /**
     * @param targetconfig18 the targetconfig18 to set
     */
    public void setTargetconfig18(String targetconfig18) {
        this.targetconfig18 = targetconfig18;
    }
    /**
     * @return the targetconfig19
     */
    public String getTargetconfig19() {
        return targetconfig19;
    }
    /**
     * @param targetconfig19 the targetconfig19 to set
     */
    public void setTargetconfig19(String targetconfig19) {
        this.targetconfig19 = targetconfig19;
    }
    /**
     * @return the targetconfig20
     */
    public String getTargetconfig20() {
        return targetconfig20;
    }
    /**
     * @param targetconfig20 the targetconfig20 to set
     */
    public void setTargetconfig20(String targetconfig20) {
        this.targetconfig20 = targetconfig20;
    }
    /**
     * @return the targetconfig21
     */
    public String getTargetconfig21() {
        return targetconfig21;
    }
    /**
     * @param targetconfig21 the targetconfig21 to set
     */
    public void setTargetconfig21(String targetconfig21) {
        this.targetconfig21 = targetconfig21;
    }
    /**
     * @return the sDealerTargetAchieveYyMmDd
     */
    public String getsDealerTargetAchieveYyMmDd() {
        return sDealerTargetAchieveYyMmDd;
    }
    /**
     * @param sDealerTargetAchieveYyMmDd the sDealerTargetAchieveYyMmDd to set
     */
    public void setsDealerTargetAchieveYyMmDd(String sDealerTargetAchieveYyMmDd) {
        this.sDealerTargetAchieveYyMmDd = sDealerTargetAchieveYyMmDd;
    }
    /**
     * @return the targetAchieveCarlineCd
     */
    public String getTargetAchieveCarlineCd() {
        return targetAchieveCarlineCd;
    }
    /**
     * @param targetAchieveCarlineCd the targetAchieveCarlineCd to set
     */
    public void setTargetAchieveCarlineCd(String targetAchieveCarlineCd) {
        this.targetAchieveCarlineCd = targetAchieveCarlineCd;
    }
    /**
     * @return the sumAllCustVsitCnt
     */
    public String getSumAllCustVsitCnt() {
        return sumAllCustVsitCnt;
    }
    /**
     * @param sumAllCustVsitCnt the sumAllCustVsitCnt to set
     */
    public void setSumAllCustVsitCnt(String sumAllCustVsitCnt) {
        this.sumAllCustVsitCnt = sumAllCustVsitCnt;
    }
    /**
     * @return the monthGoalPrefVal
     */
    public String getMonthGoalPrefVal() {
        return monthGoalPrefVal;
    }
    /**
     * @param monthGoalPrefVal the monthGoalPrefVal to set
     */
    public void setMonthGoalPrefVal(String monthGoalPrefVal) {
        this.monthGoalPrefVal = monthGoalPrefVal;
    }
    /**
     * @return the dayGoalPrefVal
     */
    public String getDayGoalPrefVal() {
        return dayGoalPrefVal;
    }
    /**
     * @param dayGoalPrefVal the dayGoalPrefVal to set
     */
    public void setDayGoalPrefVal(String dayGoalPrefVal) {
        this.dayGoalPrefVal = dayGoalPrefVal;
    }
    /**
     * @return the gapTodatCUstVsitCnt
     */
    public String getGapTodatCUstVsitCnt() {
        return gapTodatCUstVsitCnt;
    }
    /**
     * @param gapTodatCUstVsitCnt the gapTodatCUstVsitCnt to set
     */
    public void setGapTodatCUstVsitCnt(String gapTodatCUstVsitCnt) {
        this.gapTodatCUstVsitCnt = gapTodatCUstVsitCnt;
    }
    /**
     * @return the sumCustVsitCnt
     */
    public String getSumCustVsitCnt() {
        return sumCustVsitCnt;
    }
    /**
     * @param sumCustVsitCnt the sumCustVsitCnt to set
     */
    public void setSumCustVsitCnt(String sumCustVsitCnt) {
        this.sumCustVsitCnt = sumCustVsitCnt;
    }
    /**
     * @return the gapCustVsitCnt
     */
    public String getGapCustVsitCnt() {
        return gapCustVsitCnt;
    }
    /**
     * @param gapCustVsitCnt the gapCustVsitCnt to set
     */
    public void setGapCustVsitCnt(String gapCustVsitCnt) {
        this.gapCustVsitCnt = gapCustVsitCnt;
    }
    /**
     * @return the lastMonthGoalPrefVal
     */
    public String getLastMonthGoalPrefVal() {
        return lastMonthGoalPrefVal;
    }
    /**
     * @param lastMonthGoalPrefVal the lastMonthGoalPrefVal to set
     */
    public void setLastMonthGoalPrefVal(String lastMonthGoalPrefVal) {
        this.lastMonthGoalPrefVal = lastMonthGoalPrefVal;
    }
    /**
     * @return the lastMonthCustVsitCnt
     */
    public String getLastMonthCustVsitCnt() {
        return lastMonthCustVsitCnt;
    }
    /**
     * @param lastMonthCustVsitCnt the lastMonthCustVsitCnt to set
     */
    public void setLastMonthCustVsitCnt(String lastMonthCustVsitCnt) {
        this.lastMonthCustVsitCnt = lastMonthCustVsitCnt;
    }
    /**
     * @return the gapMonthCustVsitCnt
     */
    public String getGapMonthCustVsitCnt() {
        return gapMonthCustVsitCnt;
    }
    /**
     * @param gapMonthCustVsitCnt the gapMonthCustVsitCnt to set
     */
    public void setGapMonthCustVsitCnt(String gapMonthCustVsitCnt) {
        this.gapMonthCustVsitCnt = gapMonthCustVsitCnt;
    }
    /**
     * @return the prosMonthCustVsitPer
     */
    public String getProsMonthCustVsitPer() {
        return prosMonthCustVsitPer;
    }
    /**
     * @param prosMonthCustVsitPer the prosMonthCustVsitPer to set
     */
    public void setProsMonthCustVsitPer(String prosMonthCustVsitPer) {
        this.prosMonthCustVsitPer = prosMonthCustVsitPer;
    }
    /**
     * @return the lastYearGoalPrefVal
     */
    public String getLastYearGoalPrefVal() {
        return lastYearGoalPrefVal;
    }
    /**
     * @param lastYearGoalPrefVal the lastYearGoalPrefVal to set
     */
    public void setLastYearGoalPrefVal(String lastYearGoalPrefVal) {
        this.lastYearGoalPrefVal = lastYearGoalPrefVal;
    }
    /**
     * @return the lastYearCustVsitCnt
     */
    public String getLastYearCustVsitCnt() {
        return lastYearCustVsitCnt;
    }
    /**
     * @param lastYearCustVsitCnt the lastYearCustVsitCnt to set
     */
    public void setLastYearCustVsitCnt(String lastYearCustVsitCnt) {
        this.lastYearCustVsitCnt = lastYearCustVsitCnt;
    }
    /**
     * @return the gapYearCustVsitCnt
     */
    public String getGapYearCustVsitCnt() {
        return gapYearCustVsitCnt;
    }
    /**
     * @param gapYearCustVsitCnt the gapYearCustVsitCnt to set
     */
    public void setGapYearCustVsitCnt(String gapYearCustVsitCnt) {
        this.gapYearCustVsitCnt = gapYearCustVsitCnt;
    }
    /**
     * @return the prosYearCustVsitPers
     */
    public String getProsYearCustVsitPers() {
        return prosYearCustVsitPers;
    }
    /**
     * @param prosYearCustVsitPers the prosYearCustVsitPers to set
     */
    public void setProsYearCustVsitPers(String prosYearCustVsitPers) {
        this.prosYearCustVsitPers = prosYearCustVsitPers;
    }
    /**
     * @return the prosDayCustVsitPers
     */
    public String getProsDayCustVsitPers() {
        return prosDayCustVsitPers;
    }
    /**
     * @param prosDayCustVsitPers the prosDayCustVsitPers to set
     */
    public void setProsDayCustVsitPers(String prosDayCustVsitPers) {
        this.prosDayCustVsitPers = prosDayCustVsitPers;
    }
    /**
     * @return the prosMonthCustVsitPers
     */
    public String getProsMonthCustVsitPers() {
        return prosMonthCustVsitPers;
    }
    /**
     * @param prosMonthCustVsitPers the prosMonthCustVsitPers to set
     */
    public void setProsMonthCustVsitPers(String prosMonthCustVsitPers) {
        this.prosMonthCustVsitPers = prosMonthCustVsitPers;
    }
    /**
     * @return the lastMonthName
     */
    public String getLastMonthName() {
        return lastMonthName;
    }
    /**
     * @param lastMonthName the lastMonthName to set
     */
    public void setLastMonthName(String lastMonthName) {
        this.lastMonthName = lastMonthName;
    }
    /**
     * @return the lastYearhName
     */
    public String getLastYearhName() {
        return lastYearhName;
    }
    /**
     * @param lastYearhName the lastYearhName to set
     */
    public void setLastYearhName(String lastYearhName) {
        this.lastYearhName = lastYearhName;
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
     * @return the empNm
     */
    public String getEmpNm() {
        return empNm;
    }
    /**
     * @param empNm the empNm to set
     */
    public void setEmpNm(String empNm) {
        this.empNm = empNm;
    }
    /**
     * @return the totalDayTargetVal
     */
    public String getTotalDayTargetVal() {
        return totalDayTargetVal;
    }
    /**
     * @param totalDayTargetVal the totalDayTargetVal to set
     */
    public void setTotalDayTargetVal(String totalDayTargetVal) {
        this.totalDayTargetVal = totalDayTargetVal;
    }
    /**
     * @return the totalDayGoalVal
     */
    public String getTotalDayGoalVal() {
        return totalDayGoalVal;
    }
    /**
     * @param totalDayGoalVal the totalDayGoalVal to set
     */
    public void setTotalDayGoalVal(String totalDayGoalVal) {
        this.totalDayGoalVal = totalDayGoalVal;
    }
    /**
     * @return the totalDayGapVal
     */
    public String getTotalDayGapVal() {
        return totalDayGapVal;
    }
    /**
     * @param totalDayGapVal the totalDayGapVal to set
     */
    public void setTotalDayGapVal(String totalDayGapVal) {
        this.totalDayGapVal = totalDayGapVal;
    }
    /**
     * @return the totalDayDealRate
     */
    public String getTotalDayDealRate() {
        return totalDayDealRate;
    }
    /**
     * @param totalDayDealRate the totalDayDealRate to set
     */
    public void setTotalDayDealRate(String totalDayDealRate) {
        this.totalDayDealRate = totalDayDealRate;
    }
    /**
     * @return the totalMonthTargetVal
     */
    public String getTotalMonthTargetVal() {
        return totalMonthTargetVal;
    }
    /**
     * @param totalMonthTargetVal the totalMonthTargetVal to set
     */
    public void setTotalMonthTargetVal(String totalMonthTargetVal) {
        this.totalMonthTargetVal = totalMonthTargetVal;
    }
    /**
     * @return the totalMonthGoalVal
     */
    public String getTotalMonthGoalVal() {
        return totalMonthGoalVal;
    }
    /**
     * @param totalMonthGoalVal the totalMonthGoalVal to set
     */
    public void setTotalMonthGoalVal(String totalMonthGoalVal) {
        this.totalMonthGoalVal = totalMonthGoalVal;
    }
    /**
     * @return the totalMonthGapVal
     */
    public String getTotalMonthGapVal() {
        return totalMonthGapVal;
    }
    /**
     * @param totalMonthGapVal the totalMonthGapVal to set
     */
    public void setTotalMonthGapVal(String totalMonthGapVal) {
        this.totalMonthGapVal = totalMonthGapVal;
    }
    /**
     * @return the totalMonthDealRate
     */
    public String getTotalMonthDealRate() {
        return totalMonthDealRate;
    }
    /**
     * @param totalMonthDealRate the totalMonthDealRate to set
     */
    public void setTotalMonthDealRate(String totalMonthDealRate) {
        this.totalMonthDealRate = totalMonthDealRate;
    }
    /**
     * @return the totalYearTargetVal
     */
    public String getTotalYearTargetVal() {
        return totalYearTargetVal;
    }
    /**
     * @param totalYearTargetVal the totalYearTargetVal to set
     */
    public void setTotalYearTargetVal(String totalYearTargetVal) {
        this.totalYearTargetVal = totalYearTargetVal;
    }
    /**
     * @return the totalYearGoalVal
     */
    public String getTotalYearGoalVal() {
        return totalYearGoalVal;
    }
    /**
     * @param totalYearGoalVal the totalYearGoalVal to set
     */
    public void setTotalYearGoalVal(String totalYearGoalVal) {
        this.totalYearGoalVal = totalYearGoalVal;
    }
    /**
     * @return the totalYearGapVal
     */
    public String getTotalYearGapVal() {
        return totalYearGapVal;
    }
    /**
     * @param totalYearGapVal the totalYearGapVal to set
     */
    public void setTotalYearGapVal(String totalYearGapVal) {
        this.totalYearGapVal = totalYearGapVal;
    }
    /**
     * @return the totalYearDealRate
     */
    public String getTotalYearDealRate() {
        return totalYearDealRate;
    }
    /**
     * @param totalYearDealRate the totalYearDealRate to set
     */
    public void setTotalYearDealRate(String totalYearDealRate) {
        this.totalYearDealRate = totalYearDealRate;
    }
    /**
     * @return the sCustKpiYyMmDd
     */
    public String getsCustKpiYyMmDd() {
        return sCustKpiYyMmDd;
    }
    /**
     * @param sCustKpiYyMmDd the sCustKpiYyMmDd to set
     */
    public void setsCustKpiYyMmDd(String sCustKpiYyMmDd) {
        this.sCustKpiYyMmDd = sCustKpiYyMmDd;
    }
    /**
     * @return the eCustKpiYyMmDd
     */
    public String geteCustKpiYyMmDd() {
        return eCustKpiYyMmDd;
    }
    /**
     * @param eCustKpiYyMmDd the eCustKpiYyMmDd to set
     */
    public void seteCustKpiYyMmDd(String eCustKpiYyMmDd) {
        this.eCustKpiYyMmDd = eCustKpiYyMmDd;
    }
    /**
     * @return the sCustKpiYyMmDdParam
     */
    public String getsCustKpiYyMmDdParam() {
        return sCustKpiYyMmDdParam;
    }
    /**
     * @param sCustKpiYyMmDdParam the sCustKpiYyMmDdParam to set
     */
    public void setsCustKpiYyMmDdParam(String sCustKpiYyMmDdParam) {
        this.sCustKpiYyMmDdParam = sCustKpiYyMmDdParam;
    }
    /**
     * @return the eCustKpiYyMmDdParam
     */
    public String geteCustKpiYyMmDdParam() {
        return eCustKpiYyMmDdParam;
    }
    /**
     * @param eCustKpiYyMmDdParam the eCustKpiYyMmDdParam to set
     */
    public void seteCustKpiYyMmDdParam(String eCustKpiYyMmDdParam) {
        this.eCustKpiYyMmDdParam = eCustKpiYyMmDdParam;
    }
    /**
     * @return the kpiIdccTargetCustGoalPrefVal
     */
    public String getKpiIdccTargetCustGoalPrefVal() {
        return kpiIdccTargetCustGoalPrefVal;
    }
    /**
     * @param kpiIdccTargetCustGoalPrefVal the kpiIdccTargetCustGoalPrefVal to set
     */
    public void setKpiIdccTargetCustGoalPrefVal(String kpiIdccTargetCustGoalPrefVal) {
        this.kpiIdccTargetCustGoalPrefVal = kpiIdccTargetCustGoalPrefVal;
    }
    /**
     * @return the kpiIdccCustVsitCnt
     */
    public String getKpiIdccCustVsitCnt() {
        return kpiIdccCustVsitCnt;
    }
    /**
     * @param kpiIdccCustVsitCnt the kpiIdccCustVsitCnt to set
     */
    public void setKpiIdccCustVsitCnt(String kpiIdccCustVsitCnt) {
        this.kpiIdccCustVsitCnt = kpiIdccCustVsitCnt;
    }
    /**
     * @return the kpiIdccCustReqRate
     */
    public String getKpiIdccCustReqRate() {
        return kpiIdccCustReqRate;
    }
    /**
     * @param kpiIdccCustReqRate the kpiIdccCustReqRate to set
     */
    public void setKpiIdccCustReqRate(String kpiIdccCustReqRate) {
        this.kpiIdccCustReqRate = kpiIdccCustReqRate;
    }
    /**
     * @return the kpiIdccDealCnt
     */
    public String getKpiIdccDealCnt() {
        return kpiIdccDealCnt;
    }
    /**
     * @param kpiIdccDealCnt the kpiIdccDealCnt to set
     */
    public void setKpiIdccDealCnt(String kpiIdccDealCnt) {
        this.kpiIdccDealCnt = kpiIdccDealCnt;
    }
    /**
     * @return the kpiShopTargetCustGoalPrefVal
     */
    public String getKpiShopTargetCustGoalPrefVal() {
        return kpiShopTargetCustGoalPrefVal;
    }
    /**
     * @param kpiShopTargetCustGoalPrefVal the kpiShopTargetCustGoalPrefVal to set
     */
    public void setKpiShopTargetCustGoalPrefVal(String kpiShopTargetCustGoalPrefVal) {
        this.kpiShopTargetCustGoalPrefVal = kpiShopTargetCustGoalPrefVal;
    }
    /**
     * @return the kpiShopTargetCustVsitCnt
     */
    public String getKpiShopTargetCustVsitCnt() {
        return kpiShopTargetCustVsitCnt;
    }
    /**
     * @param kpiShopTargetCustVsitCnt the kpiShopTargetCustVsitCnt to set
     */
    public void setKpiShopTargetCustVsitCnt(String kpiShopTargetCustVsitCnt) {
        this.kpiShopTargetCustVsitCnt = kpiShopTargetCustVsitCnt;
    }
    /**
     * @return the kpiShopPrsnInfoCollcRate
     */
    public String getKpiShopPrsnInfoCollcRate() {
        return kpiShopPrsnInfoCollcRate;
    }
    /**
     * @param kpiShopPrsnInfoCollcRate the kpiShopPrsnInfoCollcRate to set
     */
    public void setKpiShopPrsnInfoCollcRate(String kpiShopPrsnInfoCollcRate) {
        this.kpiShopPrsnInfoCollcRate = kpiShopPrsnInfoCollcRate;
    }
    /**
     * @return the kpiShopDealCnt
     */
    public String getKpiShopDealCnt() {
        return kpiShopDealCnt;
    }
    /**
     * @param kpiShopDealCnt the kpiShopDealCnt to set
     */
    public void setKpiShopDealCnt(String kpiShopDealCnt) {
        this.kpiShopDealCnt = kpiShopDealCnt;
    }
    /**
     * @return the kpiIdcc3MTargetCustGoalPrefVal
     */
    public String getKpiIdcc3MTargetCustGoalPrefVal() {
        return kpiIdcc3MTargetCustGoalPrefVal;
    }
    /**
     * @param kpiIdcc3MTargetCustGoalPrefVal the kpiIdcc3MTargetCustGoalPrefVal to set
     */
    public void setKpiIdcc3MTargetCustGoalPrefVal(String kpiIdcc3MTargetCustGoalPrefVal) {
        this.kpiIdcc3MTargetCustGoalPrefVal = kpiIdcc3MTargetCustGoalPrefVal;
    }
    /**
     * @return the kpiIdcc3MCustVsitCnt
     */
    public String getKpiIdcc3MCustVsitCnt() {
        return kpiIdcc3MCustVsitCnt;
    }
    /**
     * @param kpiIdcc3MCustVsitCnt the kpiIdcc3MCustVsitCnt to set
     */
    public void setKpiIdcc3MCustVsitCnt(String kpiIdcc3MCustVsitCnt) {
        this.kpiIdcc3MCustVsitCnt = kpiIdcc3MCustVsitCnt;
    }
    /**
     * @return the kpiIdcc3MCustReqRate
     */
    public String getKpiIdcc3MCustReqRate() {
        return kpiIdcc3MCustReqRate;
    }
    /**
     * @param kpiIdcc3MCustReqRate the kpiIdcc3MCustReqRate to set
     */
    public void setKpiIdcc3MCustReqRate(String kpiIdcc3MCustReqRate) {
        this.kpiIdcc3MCustReqRate = kpiIdcc3MCustReqRate;
    }
    /**
     * @return the kpiIdcc3MDealCnt
     */
    public String getKpiIdcc3MDealCnt() {
        return kpiIdcc3MDealCnt;
    }
    /**
     * @param kpiIdcc3MDealCnt the kpiIdcc3MDealCnt to set
     */
    public void setKpiIdcc3MDealCnt(String kpiIdcc3MDealCnt) {
        this.kpiIdcc3MDealCnt = kpiIdcc3MDealCnt;
    }
    /**
     * @return the kpiShop3MTargetCustGoalPrefVal
     */
    public String getKpiShop3MTargetCustGoalPrefVal() {
        return kpiShop3MTargetCustGoalPrefVal;
    }
    /**
     * @param kpiShop3MTargetCustGoalPrefVal the kpiShop3MTargetCustGoalPrefVal to set
     */
    public void setKpiShop3MTargetCustGoalPrefVal(String kpiShop3MTargetCustGoalPrefVal) {
        this.kpiShop3MTargetCustGoalPrefVal = kpiShop3MTargetCustGoalPrefVal;
    }
    /**
     * @return the kpiShop3MTargetCustVsitCnt
     */
    public String getKpiShop3MTargetCustVsitCnt() {
        return kpiShop3MTargetCustVsitCnt;
    }
    /**
     * @param kpiShop3MTargetCustVsitCnt the kpiShop3MTargetCustVsitCnt to set
     */
    public void setKpiShop3MTargetCustVsitCnt(String kpiShop3MTargetCustVsitCnt) {
        this.kpiShop3MTargetCustVsitCnt = kpiShop3MTargetCustVsitCnt;
    }
    /**
     * @return the kpiShop3MPrsnInfoCollcRate
     */
    public String getKpiShop3MPrsnInfoCollcRate() {
        return kpiShop3MPrsnInfoCollcRate;
    }
    /**
     * @param kpiShop3MPrsnInfoCollcRate the kpiShop3MPrsnInfoCollcRate to set
     */
    public void setKpiShop3MPrsnInfoCollcRate(String kpiShop3MPrsnInfoCollcRate) {
        this.kpiShop3MPrsnInfoCollcRate = kpiShop3MPrsnInfoCollcRate;
    }
    /**
     * @return the kpiShop3MDealCnt
     */
    public String getKpiShop3MDealCnt() {
        return kpiShop3MDealCnt;
    }
    /**
     * @param kpiShop3MDealCnt the kpiShop3MDealCnt to set
     */
    public void setKpiShop3MDealCnt(String kpiShop3MDealCnt) {
        this.kpiShop3MDealCnt = kpiShop3MDealCnt;
    }
    /**
     * @return the kpiIdccCustVsitRate
     */
    public String getKpiIdccCustVsitRate() {
        return kpiIdccCustVsitRate;
    }
    /**
     * @param kpiIdccCustVsitRate the kpiIdccCustVsitRate to set
     */
    public void setKpiIdccCustVsitRate(String kpiIdccCustVsitRate) {
        this.kpiIdccCustVsitRate = kpiIdccCustVsitRate;
    }
    /**
     * @return the kpiIdcc3MCustVsitRate
     */
    public String getKpiIdcc3MCustVsitRate() {
        return kpiIdcc3MCustVsitRate;
    }
    /**
     * @param kpiIdcc3MCustVsitRate the kpiIdcc3MCustVsitRate to set
     */
    public void setKpiIdcc3MCustVsitRate(String kpiIdcc3MCustVsitRate) {
        this.kpiIdcc3MCustVsitRate = kpiIdcc3MCustVsitRate;
    }
    /**
     * @return the kpiIdccVsitDealCnt
     */
    public String getKpiIdccVsitDealCnt() {
        return kpiIdccVsitDealCnt;
    }
    /**
     * @param kpiIdccVsitDealCnt the kpiIdccVsitDealCnt to set
     */
    public void setKpiIdccVsitDealCnt(String kpiIdccVsitDealCnt) {
        this.kpiIdccVsitDealCnt = kpiIdccVsitDealCnt;
    }
    /**
     * @return the kpiIdccVsitDealRate
     */
    public String getKpiIdccVsitDealRate() {
        return kpiIdccVsitDealRate;
    }
    /**
     * @param kpiIdccVsitDealRate the kpiIdccVsitDealRate to set
     */
    public void setKpiIdccVsitDealRate(String kpiIdccVsitDealRate) {
        this.kpiIdccVsitDealRate = kpiIdccVsitDealRate;
    }
    /**
     * @return the referCustReqRate
     */
    public String getReferCustReqRate() {
        return referCustReqRate;
    }
    /**
     * @param referCustReqRate the referCustReqRate to set
     */
    public void setReferCustReqRate(String referCustReqRate) {
        this.referCustReqRate = referCustReqRate;
    }
    /**
     * @return the referCustDealRate
     */
    public String getReferCustDealRate() {
        return referCustDealRate;
    }
    /**
     * @param referCustDealRate the referCustDealRate to set
     */
    public void setReferCustDealRate(String referCustDealRate) {
        this.referCustDealRate = referCustDealRate;
    }
    /**
     * @return the referPrsnInfoCollcRate
     */
    public String getReferPrsnInfoCollcRate() {
        return referPrsnInfoCollcRate;
    }
    /**
     * @param referPrsnInfoCollcRate the referPrsnInfoCollcRate to set
     */
    public void setReferPrsnInfoCollcRate(String referPrsnInfoCollcRate) {
        this.referPrsnInfoCollcRate = referPrsnInfoCollcRate;
    }
    /**
     * @return the referTargetDealRate
     */
    public String getReferTargetDealRate() {
        return referTargetDealRate;
    }
    /**
     * @param referTargetDealRate the referTargetDealRate to set
     */
    public void setReferTargetDealRate(String referTargetDealRate) {
        this.referTargetDealRate = referTargetDealRate;
    }
    /**
     * @return the refer3MCustReqRate
     */
    public String getRefer3MCustReqRate() {
        return refer3MCustReqRate;
    }
    /**
     * @param refer3mCustReqRate the refer3MCustReqRate to set
     */
    public void setRefer3MCustReqRate(String refer3mCustReqRate) {
        refer3MCustReqRate = refer3mCustReqRate;
    }
    /**
     * @return the refer3MCustDealRate
     */
    public String getRefer3MCustDealRate() {
        return refer3MCustDealRate;
    }
    /**
     * @param refer3mCustDealRate the refer3MCustDealRate to set
     */
    public void setRefer3MCustDealRate(String refer3mCustDealRate) {
        refer3MCustDealRate = refer3mCustDealRate;
    }
    /**
     * @return the refer3MPrsnInfoCollcRate
     */
    public String getRefer3MPrsnInfoCollcRate() {
        return refer3MPrsnInfoCollcRate;
    }
    /**
     * @param refer3mPrsnInfoCollcRate the refer3MPrsnInfoCollcRate to set
     */
    public void setRefer3MPrsnInfoCollcRate(String refer3mPrsnInfoCollcRate) {
        refer3MPrsnInfoCollcRate = refer3mPrsnInfoCollcRate;
    }
    /**
     * @return the refer3MTargetDealRate
     */
    public String getRefer3MTargetDealRate() {
        return refer3MTargetDealRate;
    }
    /**
     * @param refer3mTargetDealRate the refer3MTargetDealRate to set
     */
    public void setRefer3MTargetDealRate(String refer3mTargetDealRate) {
        refer3MTargetDealRate = refer3mTargetDealRate;
    }
    /**
     * @return the kpiIdcc3MVsitDealCnt
     */
    public String getKpiIdcc3MVsitDealCnt() {
        return kpiIdcc3MVsitDealCnt;
    }
    /**
     * @param kpiIdcc3MVsitDealCnt the kpiIdcc3MVsitDealCnt to set
     */
    public void setKpiIdcc3MVsitDealCnt(String kpiIdcc3MVsitDealCnt) {
        this.kpiIdcc3MVsitDealCnt = kpiIdcc3MVsitDealCnt;
    }
    /**
     * @return the kpiIdcc3MVsitDealRate
     */
    public String getKpiIdcc3MVsitDealRate() {
        return kpiIdcc3MVsitDealRate;
    }
    /**
     * @param kpiIdcc3MVsitDealRate the kpiIdcc3MVsitDealRate to set
     */
    public void setKpiIdcc3MVsitDealRate(String kpiIdcc3MVsitDealRate) {
        this.kpiIdcc3MVsitDealRate = kpiIdcc3MVsitDealRate;
    }
    /**
     * @return the kpiShopVsitPrsnInfoCollcRate
     */
    public String getKpiShopVsitPrsnInfoCollcRate() {
        return kpiShopVsitPrsnInfoCollcRate;
    }
    /**
     * @param kpiShopVsitPrsnInfoCollcRate the kpiShopVsitPrsnInfoCollcRate to set
     */
    public void setKpiShopVsitPrsnInfoCollcRate(String kpiShopVsitPrsnInfoCollcRate) {
        this.kpiShopVsitPrsnInfoCollcRate = kpiShopVsitPrsnInfoCollcRate;
    }
    /**
     * @return the kpiShop3MVsitPrsnInfoCollcRate
     */
    public String getKpiShop3MVsitPrsnInfoCollcRate() {
        return kpiShop3MVsitPrsnInfoCollcRate;
    }
    /**
     * @param kpiShop3MVsitPrsnInfoCollcRate the kpiShop3MVsitPrsnInfoCollcRate to set
     */
    public void setKpiShop3MVsitPrsnInfoCollcRate(String kpiShop3MVsitPrsnInfoCollcRate) {
        this.kpiShop3MVsitPrsnInfoCollcRate = kpiShop3MVsitPrsnInfoCollcRate;
    }
    /**
     * @return the kpiShopVsitSuccessRate
     */
    public String getKpiShopVsitSuccessRate() {
        return kpiShopVsitSuccessRate;
    }
    /**
     * @param kpiShopVsitSuccessRate the kpiShopVsitSuccessRate to set
     */
    public void setKpiShopVsitSuccessRate(String kpiShopVsitSuccessRate) {
        this.kpiShopVsitSuccessRate = kpiShopVsitSuccessRate;
    }
    /**
     * @return the kpiShop3MVsitSuccessRate
     */
    public String getKpiShop3MVsitSuccessRate() {
        return kpiShop3MVsitSuccessRate;
    }
    /**
     * @param kpiShop3MVsitSuccessRate the kpiShop3MVsitSuccessRate to set
     */
    public void setKpiShop3MVsitSuccessRate(String kpiShop3MVsitSuccessRate) {
        this.kpiShop3MVsitSuccessRate = kpiShop3MVsitSuccessRate;
    }
    /**
     * @return the kpiShopCustTargetAchieve
     */
    public String getKpiShopCustTargetAchieve() {
        return kpiShopCustTargetAchieve;
    }
    /**
     * @param kpiShopCustTargetAchieve the kpiShopCustTargetAchieve to set
     */
    public void setKpiShopCustTargetAchieve(String kpiShopCustTargetAchieve) {
        this.kpiShopCustTargetAchieve = kpiShopCustTargetAchieve;
    }
    /**
     * @return the kpiShop3MCustTargetAchieve
     */
    public String getKpiShop3MCustTargetAchieve() {
        return kpiShop3MCustTargetAchieve;
    }
    /**
     * @param kpiShop3MCustTargetAchieve the kpiShop3MCustTargetAchieve to set
     */
    public void setKpiShop3MCustTargetAchieve(String kpiShop3MCustTargetAchieve) {
        this.kpiShop3MCustTargetAchieve = kpiShop3MCustTargetAchieve;
    }
    /**
     * @return the kpiTotalDealRate
     */
    public String getKpiTotalDealRate() {
        return kpiTotalDealRate;
    }
    /**
     * @param kpiTotalDealRate the kpiTotalDealRate to set
     */
    public void setKpiTotalDealRate(String kpiTotalDealRate) {
        this.kpiTotalDealRate = kpiTotalDealRate;
    }
    /**
     * @return the nameGubn
     */
    public String getNameGubn() {
        return nameGubn;
    }
    /**
     * @param nameGubn the nameGubn to set
     */
    public void setNameGubn(String nameGubn) {
        this.nameGubn = nameGubn;
    }
    /**
     * @return the nameChannel
     */
    public String getNameChannel() {
        return nameChannel;
    }
    /**
     * @param nameChannel the nameChannel to set
     */
    public void setNameChannel(String nameChannel) {
        this.nameChannel = nameChannel;
    }
    /**
     * @return the custGubn
     */
    public String getCustGubn() {
        return custGubn;
    }
    /**
     * @param custGubn the custGubn to set
     */
    public void setCustGubn(String custGubn) {
        this.custGubn = custGubn;
    }
    /**
     * @return the custChannel
     */
    public String getCustChannel() {
        return custChannel;
    }
    /**
     * @param custChannel the custChannel to set
     */
    public void setCustChannel(String custChannel) {
        this.custChannel = custChannel;
    }
    /**
     * @return the custCnt1
     */
    public String getCustCnt1() {
        return custCnt1;
    }
    /**
     * @param custCnt1 the custCnt1 to set
     */
    public void setCustCnt1(String custCnt1) {
        this.custCnt1 = custCnt1;
    }
    /**
     * @return the custCnt2
     */
    public String getCustCnt2() {
        return custCnt2;
    }
    /**
     * @param custCnt2 the custCnt2 to set
     */
    public void setCustCnt2(String custCnt2) {
        this.custCnt2 = custCnt2;
    }
    /**
     * @return the custCnt3
     */
    public String getCustCnt3() {
        return custCnt3;
    }
    /**
     * @param custCnt3 the custCnt3 to set
     */
    public void setCustCnt3(String custCnt3) {
        this.custCnt3 = custCnt3;
    }
    /**
     * @return the custCnt4
     */
    public String getCustCnt4() {
        return custCnt4;
    }
    /**
     * @param custCnt4 the custCnt4 to set
     */
    public void setCustCnt4(String custCnt4) {
        this.custCnt4 = custCnt4;
    }
    /**
     * @return the custCnt5
     */
    public String getCustCnt5() {
        return custCnt5;
    }
    /**
     * @param custCnt5 the custCnt5 to set
     */
    public void setCustCnt5(String custCnt5) {
        this.custCnt5 = custCnt5;
    }
    /**
     * @return the custCnt6
     */
    public String getCustCnt6() {
        return custCnt6;
    }
    /**
     * @param custCnt6 the custCnt6 to set
     */
    public void setCustCnt6(String custCnt6) {
        this.custCnt6 = custCnt6;
    }
    /**
     * @return the custCnt7
     */
    public String getCustCnt7() {
        return custCnt7;
    }
    /**
     * @param custCnt7 the custCnt7 to set
     */
    public void setCustCnt7(String custCnt7) {
        this.custCnt7 = custCnt7;
    }
    /**
     * @return the custCnt8
     */
    public String getCustCnt8() {
        return custCnt8;
    }
    /**
     * @param custCnt8 the custCnt8 to set
     */
    public void setCustCnt8(String custCnt8) {
        this.custCnt8 = custCnt8;
    }
    /**
     * @return the custCnt9
     */
    public String getCustCnt9() {
        return custCnt9;
    }
    /**
     * @param custCnt9 the custCnt9 to set
     */
    public void setCustCnt9(String custCnt9) {
        this.custCnt9 = custCnt9;
    }
    /**
     * @return the custCnt10
     */
    public String getCustCnt10() {
        return custCnt10;
    }
    /**
     * @param custCnt10 the custCnt10 to set
     */
    public void setCustCnt10(String custCnt10) {
        this.custCnt10 = custCnt10;
    }
    /**
     * @return the custCnt11
     */
    public String getCustCnt11() {
        return custCnt11;
    }
    /**
     * @param custCnt11 the custCnt11 to set
     */
    public void setCustCnt11(String custCnt11) {
        this.custCnt11 = custCnt11;
    }
    /**
     * @return the custCnt12
     */
    public String getCustCnt12() {
        return custCnt12;
    }
    /**
     * @param custCnt12 the custCnt12 to set
     */
    public void setCustCnt12(String custCnt12) {
        this.custCnt12 = custCnt12;
    }
    /**
     * @return the custCnt13
     */
    public String getCustCnt13() {
        return custCnt13;
    }
    /**
     * @param custCnt13 the custCnt13 to set
     */
    public void setCustCnt13(String custCnt13) {
        this.custCnt13 = custCnt13;
    }
    /**
     * @return the custCnt14
     */
    public String getCustCnt14() {
        return custCnt14;
    }
    /**
     * @param custCnt14 the custCnt14 to set
     */
    public void setCustCnt14(String custCnt14) {
        this.custCnt14 = custCnt14;
    }
    /**
     * @return the custCnt15
     */
    public String getCustCnt15() {
        return custCnt15;
    }
    /**
     * @param custCnt15 the custCnt15 to set
     */
    public void setCustCnt15(String custCnt15) {
        this.custCnt15 = custCnt15;
    }
    /**
     * @return the custCnt16
     */
    public String getCustCnt16() {
        return custCnt16;
    }
    /**
     * @param custCnt16 the custCnt16 to set
     */
    public void setCustCnt16(String custCnt16) {
        this.custCnt16 = custCnt16;
    }
    /**
     * @return the custCnt17
     */
    public String getCustCnt17() {
        return custCnt17;
    }
    /**
     * @param custCnt17 the custCnt17 to set
     */
    public void setCustCnt17(String custCnt17) {
        this.custCnt17 = custCnt17;
    }
    /**
     * @return the custCnt18
     */
    public String getCustCnt18() {
        return custCnt18;
    }
    /**
     * @param custCnt18 the custCnt18 to set
     */
    public void setCustCnt18(String custCnt18) {
        this.custCnt18 = custCnt18;
    }
    /**
     * @return the custCnt19
     */
    public String getCustCnt19() {
        return custCnt19;
    }
    /**
     * @param custCnt19 the custCnt19 to set
     */
    public void setCustCnt19(String custCnt19) {
        this.custCnt19 = custCnt19;
    }
    /**
     * @return the custCnt20
     */
    public String getCustCnt20() {
        return custCnt20;
    }
    /**
     * @param custCnt20 the custCnt20 to set
     */
    public void setCustCnt20(String custCnt20) {
        this.custCnt20 = custCnt20;
    }
    /**
     * @return the custCnt21
     */
    public String getCustCnt21() {
        return custCnt21;
    }
    /**
     * @param custCnt21 the custCnt21 to set
     */
    public void setCustCnt21(String custCnt21) {
        this.custCnt21 = custCnt21;
    }
    /**
     * @return the custGubnVal
     */
    public String getCustGubnVal() {
        return custGubnVal;
    }
    /**
     * @param custGubnVal the custGubnVal to set
     */
    public void setCustGubnVal(String custGubnVal) {
        this.custGubnVal = custGubnVal;
    }
    /**
     * @return the custChannelVal
     */
    public String getCustChannelVal() {
        return custChannelVal;
    }
    /**
     * @param custChannelVal the custChannelVal to set
     */
    public void setCustChannelVal(String custChannelVal) {
        this.custChannelVal = custChannelVal;
    }



}
