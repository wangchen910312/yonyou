package chn.bhmc.dms.mis.tdm.vo;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;

import chn.bhmc.dms.core.support.excel.AbstractExcelDataBinder;
import chn.bhmc.dms.core.support.excel.ExcelDataBindContext;
import chn.bhmc.dms.core.support.excel.ExcelDataBinderUtil;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelUploadError;

/**
 * <pre>
 * [딜러사] 목표분해도
 * </pre>
 *
 * @ClassName   : TargetDcptMgmtVO.java
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

public class TargetDcptMgmtVO extends AbstractExcelDataBinder {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;

 // 목표분해도 - 시장현황
    private String sMarketStatusYear;               // 년도
    private String sMarketStatusMonth;              // 월
    private String sMarketStatusProvince;           // 성
    private String sMarketStatusCity;               // 시

    private String sMarketStatusYearParam;           // 년도
    private String sMarketStatusMonthParam;          // 월
    private String sMarketStatusProvinceParam;       // 성
    private String sMarketStatusCityParam;           // 시

    private String sMarketStatusYyMm;

    // 목표분해도 - 시장현황
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

    // 목표분해도 - 제조사 목표
    private String sManuTargetYear;             // 년도
    private String sManuTargetMonth;            // 월

    private String sManuTargetYearParam;        // 년도
    private String sManuTargetMonthParam;       // 월

    private String totGoalPrefVal;              // 당월 총목표
    private int rnum;                           // 차종코드
    private String carlineCd;                   // 차종코드
    private String carlineNm;                   // 차종명
    private String goalPrefVal;                 // 목표값
    private String goalRstfVal;                 // 진도값
    private String goalRstRate;                 // 판매진도

    // 목표분해도 - 딜러분해
    private String sDealerDcptYear;             // 년도
    private String sDealerDcptMonth;            // 월
    private String sDealerDcptYearParam;
    private String sDealerDcptMonthParam;

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

    private String allDealerGoalPrefVal;
    private String idccDealerGoalPrefVal;
    private String shopDealerGoalPrefVal;
    private String secondDealerGoalPrefVal;
    private String etcDealerGoalPrefVal;

    private String custDealerDlrTp;
    private String custDealerOpinionvalue;
    private String custDealerPrefVal;

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

    /**
     * {@inheritDoc}
     */
    public void bind(int rowNo, int cellNo, Object value) throws ExcelDataBindingException {
        try{
            switch(cellNo){
                case 0:this.setProvinceCd(ExcelDataBinderUtil.toString(value).trim()); break;       // 성코드
                case 2:this.setCityCd(ExcelDataBinderUtil.toString(value).trim()); break;           // 시코드
                case 4:this.setRegYear(ExcelDataBinderUtil.toString(value).trim()); break;          // 등록년도
                case 5:this.setRegMonth(ExcelDataBinderUtil.toString(value).trim()); break;         // 등록월
                case 6:this.setMarketRefVal(ExcelDataBinderUtil.toString(value).trim()); break;     // 참조값
                default :
            }
        }catch(Exception e){

            ExcelDataBindingException bindingException = new ExcelDataBindingException(messageSource.getMessage("global.err.excelUpload.dataExtract", null, LocaleContextHolder.getLocale()), e);
            bindingException.setRowNo(rowNo);
            bindingException.setColNo(cellNo);
            bindingException.setFieldValue(value.toString());

            throw bindingException;
        }
    }

    /**
     * {@inheritDoc}
     */
    public List<ExcelUploadError> validate(ExcelDataBindContext context) {

        List<ExcelUploadError> errors = new ArrayList<ExcelUploadError>();

        // 성코드
        if(StringUtils.isBlank(this.getProvinceCd())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("mis.lbl.provinceCd", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 0, this.getProvinceCd(), msg));
        }

        // 시코드
        if(StringUtils.isBlank(this.getCityCd())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("mis.lbl.cityCd", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 2, this.getCityCd(), msg));
        }

        // 등록년도
        if(StringUtils.isBlank(this.getRegYear())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("mis.lbl.regYear", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 4, this.getRegYear(), msg));
        }

        // 등록월
        if(StringUtils.isBlank(this.getRegMonth())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("mis.lbl.regMonth", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 5, this.getRegMonth(), msg));
        }

        // 참조값
        if(StringUtils.isBlank(this.getMarketRefVal())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("mis.lbl.marketRefVal", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 6, this.getMarketRefVal(), msg));
        }


        return errors;


    }




}
