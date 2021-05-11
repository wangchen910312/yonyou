package chn.bhmc.dms.mis.tmp.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * [제조사] 시장현황등록
 * </pre>
 *
 * @ClassName   : TargetMarketStatusSearchVO.java
 * @Description : [제조사] 시장현황등록
 * @author chibeom.song
 * @since 2016. 9. 9.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 9.    chibeom.song     최초 생성
 * </pre>
 */

public class TargetMarketStatusSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6534031744201367732L;

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

    private String searchDate;                  // 자료 등록 년월

    private String marketRegYy;
    private String marketRegMm;
    private String marketSungCd;
    private String marketSungNm;
    private String marketCityCd;
    private String marketCityNm;
    private String refVal;
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
     * @return the searchDate
     */
    public String getSearchDate() {
        return searchDate;
    }
    /**
     * @param searchDate the searchDate to set
     */
    public void setSearchDate(String searchDate) {
        this.searchDate = searchDate;
    }
    /**
     * @return the marketRegYy
     */
    public String getMarketRegYy() {
        return marketRegYy;
    }
    /**
     * @param marketRegYy the marketRegYy to set
     */
    public void setMarketRegYy(String marketRegYy) {
        this.marketRegYy = marketRegYy;
    }
    /**
     * @return the marketRegMm
     */
    public String getMarketRegMm() {
        return marketRegMm;
    }
    /**
     * @param marketRegMm the marketRegMm to set
     */
    public void setMarketRegMm(String marketRegMm) {
        this.marketRegMm = marketRegMm;
    }
    /**
     * @return the marketSungCd
     */
    public String getMarketSungCd() {
        return marketSungCd;
    }
    /**
     * @param marketSungCd the marketSungCd to set
     */
    public void setMarketSungCd(String marketSungCd) {
        this.marketSungCd = marketSungCd;
    }
    /**
     * @return the marketSungNm
     */
    public String getMarketSungNm() {
        return marketSungNm;
    }
    /**
     * @param marketSungNm the marketSungNm to set
     */
    public void setMarketSungNm(String marketSungNm) {
        this.marketSungNm = marketSungNm;
    }
    /**
     * @return the marketCityCd
     */
    public String getMarketCityCd() {
        return marketCityCd;
    }
    /**
     * @param marketCityCd the marketCityCd to set
     */
    public void setMarketCityCd(String marketCityCd) {
        this.marketCityCd = marketCityCd;
    }
    /**
     * @return the marketCityNm
     */
    public String getMarketCityNm() {
        return marketCityNm;
    }
    /**
     * @param marketCityNm the marketCityNm to set
     */
    public void setMarketCityNm(String marketCityNm) {
        this.marketCityNm = marketCityNm;
    }
    /**
     * @return the refVal
     */
    public String getRefVal() {
        return refVal;
    }
    /**
     * @param refVal the refVal to set
     */
    public void setRefVal(String refVal) {
        this.refVal = refVal;
    }
}
