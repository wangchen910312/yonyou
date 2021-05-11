package chn.bhmc.dms.mis.tds.vo;

import chn.bhmc.dms.core.datatype.SearchVO;
/**
 * <pre>
 * 목표 분해 공구
 * </pre>
 *
 * @ClassName   : TargetDcptStepSearchVO.java
 * @Description : 목표 분해 공구
 * @author chibeom.song
 * @since 2016. 9. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 20.   chibeom.song     최초 생성
 * </pre>
 */

public class TargetDcptStepSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6534031744201367732L;

    // 공통
    private String tabNo;
    private String dlrCd;
    private String sDlrCd;
    private String dataChk;

    // 목표 차종 설정
    private String sTargetCarlineYyMm;

    private String rnum;
    private String goalYy;
    private String goalMm;
    private String carlineCd;
    private String carlineNm;
    private String carlineConfig;
    private String regUsrId;
    private String regDt;
    private String updtUsrId;
    private String updtDt;

    // 목표 분해 공구 - 시장현황
    private String sMarketStatusProvince;
    private String sMarketStatusCity;

    private String searchDate;
    private String nameArea;

    private String localPossessionRate;
    private String localLastMonthContrast;
    private String localLastYearMonth;
    private String provincePossessionRate;
    private String provinceLastMonthContrast;
    private String provinceLastYearMonth;
    private String cityPossessionRate;
    private String cityLastMonthContrast;
    private String cityLastYearMonth;

    // 목표 분해 공구 - 딜러현황(기초값)
    private String sDcptDate;
    private String sTimeProcess;
    private String sMonitorDate;
    private String allDealerGoalDate;

    private String stockValue;
    private String stockCount;
    private String saleStatus3Month;
    private String lastMonthRestOrder;
    private String salemanCount;
    private String idccPotentialCustomer;
    private String shopPotentialCustomer;

    private String channelGubn;
    private String idccCollectCustQty;
    private String idccVisitReqRate;
    private String idccPerInfoRate;
    private String idccDealQty;
    private String idccVisitDealRate;
    private String idccDealRate;

    // 목표 분해 공구 - 제조사 목표
    private String totGoalPrefVal;
    private String manuCarlineCd;
    private String manuCarlineNm;
    private String goalPrefVal;
    private String goalRstfVal;
    private String goalRstRate;
    private String manuTargQty;
    private String manuDlrCd;

    // 목표 분해 공구 - 딜러분해(차형) 총 목표
    private String allDealerGoalPrefVal;
    private String idccDealerGoalPrefVal;
    private String shopDealerGoalPrefVal;
    private String orgDealerGoalPrefVal;
    private String etcDealerGoalPrefVal;
    private String dealerPrefTp;
    private String idccSaleDealRate;
    private String shopSaleDealRate;
    private String idccDealerCarGoalPrefVal;
    private String idccDealerGoalSumVal;
    private String idccDealerGoalGapVal;
    private String shopDealerCarGoalPrefVal;
    private String shopDealerGoalSumVal;
    private String shopDealerGoalGapVal;

    private String allCustDealerOpinionvalue;
    private String idccCustDealerOpinionvalue;
    private String shopCustDealerOpinionvalue;
    private String allCustDealerGoalPrefVal;
    private String idccCustDealerGoalPrefVal;
    private String shopCustDealerGoalPrefVal;
    private String shopDealRate;
    private String sumDerivationProfit;

    private String sDealerSaleDcptYyMmSave;
    private String idccDealerGoalPrefValSave;
    private String shopDealerGoalPrefValSave;
    private String orgDealerGoalPrefValSave;
    private String sDcptDateSave;
    private String dealerDlrCd;
    private String dealerCarlineCd;
    private String dealerCarlineNm;
    private String dealerDlrTp;
    private String dealerGoalTp;
    private String dealerGoalPrefVal;
    private String valueChk;
    private String dealerCustDate;
    private String dealerProcessDate;
    private String processDerivationDate;
    private String dealerGoalYy;
    private String dealerGoalMm;
    private String dealerSumGoalPrefVal;
    private String dealerGapGoalPrefVal;

    // 목표 분해 공구 - 딜러분해(판매고문)
    private String sDcptSaleDate;
    private String sTimeSaleProcess;
    private String sMonitorSaleDate;

    private String allMonthTargetVal;
    private String idccMonthTargetVal;
    private String shopMonthTargetVal;
    private String allDifferenceTargetVal;
    private String allSalemanCnt;

    private String listGubn;
    private String carDcptCarlineCd;
    private String carDcptCarlineNm;
    private String carDcptGoalPrefVal;
    private String carDcptEmpNo;
    private String carDcptEmpNm;
    private String carDcptGoalSumfVal;

    private String saleGoalYy;
    private String saleGoalMm;

    private String saleUpdtUsrId;
    private String saleRegUsrId;

    private String allDealerGoalSumVal;
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

    private int etcNoiPro;
    private int etcNoi;
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
    private int sumToalVal;

    private int etcNosPro;
    private int etcNos;
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

    private int idccCustDealerGoalPrefValSave;
    private int shopCustDealerGoalPrefValSave;
    private int kpiIdccCustVsitRateSave;
    private int kpiIdccVsitDealCntSave;
    private int kpiIdccDealrateSave;
    private int custInfoInputRateSave;
    private int kpiMarketDealrateSave;
    private int fncPassesRateSave;
    private int oneFinanceProfitSave;
    private int insPassesRateSave;
    private int oneInsuranceProfitSave;
    private int oneOptionMaueValSave;
    private int goodsCarRateSave;
    private int financeProfitSave;
    private int optionProfitSave;
    private int insuranceProfitSave;

    private String kpiIdccCustVsitRate;
    private String kpiIdccVsitDealCnt;
    private String kpiIdccDealrate;
    private String custInfoInputRate;
    private String kpiMarketDealrate;
    private String oneFinanceProfit;
    private String oneInsuranceProfit;
    private String oneOptionMaueVal;
    private String financeProfit;
    private String optionProfit;
    private String insuranceProfit;

    private String empNm;
    private String sumSalemanCnt;
    private String scDcptCarlineCd;
    private String scDcptCarlineNm;
    private String scDcptGoalPrefVal;

    // 목표분해공구 - 딜러분해(집객)
    private String sDcptCustDate;
    private String sMonitorCustDate;

    private String nameGubn;
    private String nameChannel;
    private String statusCarlineCd;
    private String statusCarlineNm;
    private String resultValue;

    private String custCarlineCd;
    private String custCarlineNm;
    private String custValue;

    private String custGubnCarlineCd;
    private String custGubnCarlineNm;
    private String custGubnValue;

    private String custGoalYy;
    private String custGoalMm;

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

    private String custGubn;
    private String custChannel;

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

    private String custGubnVal;
    private String custChannelVal;

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

    // 목표분해공구 - 파생업무이익지표분해
    private String sDcptProfitDate;
    private String sTimeProfitProcess;
    private String sMonitorProfitDate;
    private String goalProfitYy;
    private String goalProfitMm;
    private String carlineProfitCd;
    private String carlineProfitNm;
    private String goalProfitPrefVal;
    private String productProfitVal;
    private String settingProfitVal;
    private String carProfitVal;
    private String allProfitVal;

    private String goalTargetYy;
    private String goalTargetMm;
    private String carlineTargetCd;
    private String carlineTargetNm;
    private String goalTargetPrefVal;
    private String goodsCarQty;
    private String goodsCarAmt;
    private String goodsCarRate;
    private String goodsCarVal;
    private String insPassesRate;
    private String insCarProfitQty;
    private String insCarVal;
    private String insCnt;
    private String insApplyRate;
    private String fncPassesRate;
    private String fncCarProfitQty;
    private String fncCarVal;
    private String fncCnt;
    private String fincApplyRate;
    private String etcCarQty;
    private String etcCarVal;
    private String sumCarVal;

    private String deliverGoal;
    private String terminalObjectGoal;

    /**
     * @return the tabNo
     */
    public String getTabNo() {
        return tabNo;
    }
    /**
     * @param tabNo the tabNo to set
     */
    public void setTabNo(String tabNo) {
        this.tabNo = tabNo;
    }
    /**
     * @return the dlrCd
     */
    public String getDlrCd() {
        return dlrCd;
    }
    /**
     * @param dlrCd the dlrCd to set
     */
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
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
     * @return the dataChk
     */
    public String getDataChk() {
        return dataChk;
    }
    /**
     * @param dataChk the dataChk to set
     */
    public void setDataChk(String dataChk) {
        this.dataChk = dataChk;
    }
    /**
     * @return the sTargetCarlineYyMm
     */
    public String getsTargetCarlineYyMm() {
        return sTargetCarlineYyMm;
    }
    /**
     * @param sTargetCarlineYyMm the sTargetCarlineYyMm to set
     */
    public void setsTargetCarlineYyMm(String sTargetCarlineYyMm) {
        this.sTargetCarlineYyMm = sTargetCarlineYyMm;
    }
    /**
     * @return the rnum
     */
    public String getRnum() {
        return rnum;
    }
    /**
     * @param rnum the rnum to set
     */
    public void setRnum(String rnum) {
        this.rnum = rnum;
    }
    /**
     * @return the goalYy
     */
    public String getGoalYy() {
        return goalYy;
    }
    /**
     * @param goalYy the goalYy to set
     */
    public void setGoalYy(String goalYy) {
        this.goalYy = goalYy;
    }
    /**
     * @return the goalMm
     */
    public String getGoalMm() {
        return goalMm;
    }
    /**
     * @param goalMm the goalMm to set
     */
    public void setGoalMm(String goalMm) {
        this.goalMm = goalMm;
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
     * @return the carlineConfig
     */
    public String getCarlineConfig() {
        return carlineConfig;
    }
    /**
     * @param carlineConfig the carlineConfig to set
     */
    public void setCarlineConfig(String carlineConfig) {
        this.carlineConfig = carlineConfig;
    }
    /**
     * @return the regUsrId
     */
    public String getRegUsrId() {
        return regUsrId;
    }
    /**
     * @param regUsrId the regUsrId to set
     */
    public void setRegUsrId(String regUsrId) {
        this.regUsrId = regUsrId;
    }
    /**
     * @return the regDt
     */
    public String getRegDt() {
        return regDt;
    }
    /**
     * @param regDt the regDt to set
     */
    public void setRegDt(String regDt) {
        this.regDt = regDt;
    }
    /**
     * @return the updtUsrId
     */
    public String getUpdtUsrId() {
        return updtUsrId;
    }
    /**
     * @param updtUsrId the updtUsrId to set
     */
    public void setUpdtUsrId(String updtUsrId) {
        this.updtUsrId = updtUsrId;
    }
    /**
     * @return the updtDt
     */
    public String getUpdtDt() {
        return updtDt;
    }
    /**
     * @param updtDt the updtDt to set
     */
    public void setUpdtDt(String updtDt) {
        this.updtDt = updtDt;
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
     * @return the sDcptDate
     */
    public String getsDcptDate() {
        return sDcptDate;
    }
    /**
     * @param sDcptDate the sDcptDate to set
     */
    public void setsDcptDate(String sDcptDate) {
        this.sDcptDate = sDcptDate;
    }
    /**
     * @return the sTimeProcess
     */
    public String getsTimeProcess() {
        return sTimeProcess;
    }
    /**
     * @param sTimeProcess the sTimeProcess to set
     */
    public void setsTimeProcess(String sTimeProcess) {
        this.sTimeProcess = sTimeProcess;
    }
    /**
     * @return the sMonitorDate
     */
    public String getsMonitorDate() {
        return sMonitorDate;
    }
    /**
     * @param sMonitorDate the sMonitorDate to set
     */
    public void setsMonitorDate(String sMonitorDate) {
        this.sMonitorDate = sMonitorDate;
    }
    /**
     * @return the allDealerGoalDate
     */
    public String getAllDealerGoalDate() {
        return allDealerGoalDate;
    }
    /**
     * @param allDealerGoalDate the allDealerGoalDate to set
     */
    public void setAllDealerGoalDate(String allDealerGoalDate) {
        this.allDealerGoalDate = allDealerGoalDate;
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
     * @return the manuCarlineCd
     */
    public String getManuCarlineCd() {
        return manuCarlineCd;
    }
    /**
     * @param manuCarlineCd the manuCarlineCd to set
     */
    public void setManuCarlineCd(String manuCarlineCd) {
        this.manuCarlineCd = manuCarlineCd;
    }
    /**
     * @return the manuCarlineNm
     */
    public String getManuCarlineNm() {
        return manuCarlineNm;
    }
    /**
     * @param manuCarlineNm the manuCarlineNm to set
     */
    public void setManuCarlineNm(String manuCarlineNm) {
        this.manuCarlineNm = manuCarlineNm;
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
     * @return the manuTargQty
     */
    public String getManuTargQty() {
        return manuTargQty;
    }
    /**
     * @param manuTargQty the manuTargQty to set
     */
    public void setManuTargQty(String manuTargQty) {
        this.manuTargQty = manuTargQty;
    }
    /**
     * @return the manuDlrCd
     */
    public String getManuDlrCd() {
        return manuDlrCd;
    }
    /**
     * @param manuDlrCd the manuDlrCd to set
     */
    public void setManuDlrCd(String manuDlrCd) {
        this.manuDlrCd = manuDlrCd;
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
     * @return the orgDealerGoalPrefVal
     */
    public String getOrgDealerGoalPrefVal() {
        return orgDealerGoalPrefVal;
    }
    /**
     * @param orgDealerGoalPrefVal the orgDealerGoalPrefVal to set
     */
    public void setOrgDealerGoalPrefVal(String orgDealerGoalPrefVal) {
        this.orgDealerGoalPrefVal = orgDealerGoalPrefVal;
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
     * @return the idccDealerCarGoalPrefVal
     */
    public String getIdccDealerCarGoalPrefVal() {
        return idccDealerCarGoalPrefVal;
    }
    /**
     * @param idccDealerCarGoalPrefVal the idccDealerCarGoalPrefVal to set
     */
    public void setIdccDealerCarGoalPrefVal(String idccDealerCarGoalPrefVal) {
        this.idccDealerCarGoalPrefVal = idccDealerCarGoalPrefVal;
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
     * @return the shopDealerCarGoalPrefVal
     */
    public String getShopDealerCarGoalPrefVal() {
        return shopDealerCarGoalPrefVal;
    }
    /**
     * @param shopDealerCarGoalPrefVal the shopDealerCarGoalPrefVal to set
     */
    public void setShopDealerCarGoalPrefVal(String shopDealerCarGoalPrefVal) {
        this.shopDealerCarGoalPrefVal = shopDealerCarGoalPrefVal;
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
     * @return the sumDerivationProfit
     */
    public String getSumDerivationProfit() {
        return sumDerivationProfit;
    }
    /**
     * @param sumDerivationProfit the sumDerivationProfit to set
     */
    public void setSumDerivationProfit(String sumDerivationProfit) {
        this.sumDerivationProfit = sumDerivationProfit;
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
     * @return the orgDealerGoalPrefValSave
     */
    public String getOrgDealerGoalPrefValSave() {
        return orgDealerGoalPrefValSave;
    }
    /**
     * @param orgDealerGoalPrefValSave the orgDealerGoalPrefValSave to set
     */
    public void setOrgDealerGoalPrefValSave(String orgDealerGoalPrefValSave) {
        this.orgDealerGoalPrefValSave = orgDealerGoalPrefValSave;
    }
    /**
     * @return the sDcptDateSave
     */
    public String getsDcptDateSave() {
        return sDcptDateSave;
    }
    /**
     * @param sDcptDateSave the sDcptDateSave to set
     */
    public void setsDcptDateSave(String sDcptDateSave) {
        this.sDcptDateSave = sDcptDateSave;
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
     * @return the valueChk
     */
    public String getValueChk() {
        return valueChk;
    }
    /**
     * @param valueChk the valueChk to set
     */
    public void setValueChk(String valueChk) {
        this.valueChk = valueChk;
    }
    /**
     * @return the dealerCustDate
     */
    public String getDealerCustDate() {
        return dealerCustDate;
    }
    /**
     * @param dealerCustDate the dealerCustDate to set
     */
    public void setDealerCustDate(String dealerCustDate) {
        this.dealerCustDate = dealerCustDate;
    }
    /**
     * @return the dealerProcessDate
     */
    public String getDealerProcessDate() {
        return dealerProcessDate;
    }
    /**
     * @param dealerProcessDate the dealerProcessDate to set
     */
    public void setDealerProcessDate(String dealerProcessDate) {
        this.dealerProcessDate = dealerProcessDate;
    }
    /**
     * @return the processDerivationDate
     */
    public String getProcessDerivationDate() {
        return processDerivationDate;
    }
    /**
     * @param processDerivationDate the processDerivationDate to set
     */
    public void setProcessDerivationDate(String processDerivationDate) {
        this.processDerivationDate = processDerivationDate;
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
     * @return the dealerSumGoalPrefVal
     */
    public String getDealerSumGoalPrefVal() {
        return dealerSumGoalPrefVal;
    }
    /**
     * @param dealerSumGoalPrefVal the dealerSumGoalPrefVal to set
     */
    public void setDealerSumGoalPrefVal(String dealerSumGoalPrefVal) {
        this.dealerSumGoalPrefVal = dealerSumGoalPrefVal;
    }
    /**
     * @return the dealerGapGoalPrefVal
     */
    public String getDealerGapGoalPrefVal() {
        return dealerGapGoalPrefVal;
    }
    /**
     * @param dealerGapGoalPrefVal the dealerGapGoalPrefVal to set
     */
    public void setDealerGapGoalPrefVal(String dealerGapGoalPrefVal) {
        this.dealerGapGoalPrefVal = dealerGapGoalPrefVal;
    }
    /**
     * @return the sDcptSaleDate
     */
    public String getsDcptSaleDate() {
        return sDcptSaleDate;
    }
    /**
     * @param sDcptSaleDate the sDcptSaleDate to set
     */
    public void setsDcptSaleDate(String sDcptSaleDate) {
        this.sDcptSaleDate = sDcptSaleDate;
    }
    /**
     * @return the sTimeSaleProcess
     */
    public String getsTimeSaleProcess() {
        return sTimeSaleProcess;
    }
    /**
     * @param sTimeSaleProcess the sTimeSaleProcess to set
     */
    public void setsTimeSaleProcess(String sTimeSaleProcess) {
        this.sTimeSaleProcess = sTimeSaleProcess;
    }
    /**
     * @return the sMonitorSaleDate
     */
    public String getsMonitorSaleDate() {
        return sMonitorSaleDate;
    }
    /**
     * @param sMonitorSaleDate the sMonitorSaleDate to set
     */
    public void setsMonitorSaleDate(String sMonitorSaleDate) {
        this.sMonitorSaleDate = sMonitorSaleDate;
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
     * @return the allDifferenceTargetVal
     */
    public String getAllDifferenceTargetVal() {
        return allDifferenceTargetVal;
    }
    /**
     * @param allDifferenceTargetVal the allDifferenceTargetVal to set
     */
    public void setAllDifferenceTargetVal(String allDifferenceTargetVal) {
        this.allDifferenceTargetVal = allDifferenceTargetVal;
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
     * @return the listGubn
     */
    public String getListGubn() {
        return listGubn;
    }
    /**
     * @param listGubn the listGubn to set
     */
    public void setListGubn(String listGubn) {
        this.listGubn = listGubn;
    }
    /**
     * @return the carDcptCarlineCd
     */
    public String getCarDcptCarlineCd() {
        return carDcptCarlineCd;
    }
    /**
     * @param carDcptCarlineCd the carDcptCarlineCd to set
     */
    public void setCarDcptCarlineCd(String carDcptCarlineCd) {
        this.carDcptCarlineCd = carDcptCarlineCd;
    }
    /**
     * @return the carDcptCarlineNm
     */
    public String getCarDcptCarlineNm() {
        return carDcptCarlineNm;
    }
    /**
     * @param carDcptCarlineNm the carDcptCarlineNm to set
     */
    public void setCarDcptCarlineNm(String carDcptCarlineNm) {
        this.carDcptCarlineNm = carDcptCarlineNm;
    }
    /**
     * @return the carDcptGoalPrefVal
     */
    public String getCarDcptGoalPrefVal() {
        return carDcptGoalPrefVal;
    }
    /**
     * @param carDcptGoalPrefVal the carDcptGoalPrefVal to set
     */
    public void setCarDcptGoalPrefVal(String carDcptGoalPrefVal) {
        this.carDcptGoalPrefVal = carDcptGoalPrefVal;
    }
    /**
     * @return the carDcptEmpNo
     */
    public String getCarDcptEmpNo() {
        return carDcptEmpNo;
    }
    /**
     * @param carDcptEmpNo the carDcptEmpNo to set
     */
    public void setCarDcptEmpNo(String carDcptEmpNo) {
        this.carDcptEmpNo = carDcptEmpNo;
    }
    /**
     * @return the carDcptEmpNm
     */
    public String getCarDcptEmpNm() {
        return carDcptEmpNm;
    }
    /**
     * @param carDcptEmpNm the carDcptEmpNm to set
     */
    public void setCarDcptEmpNm(String carDcptEmpNm) {
        this.carDcptEmpNm = carDcptEmpNm;
    }
    /**
     * @return the carDcptGoalSumfVal
     */
    public String getCarDcptGoalSumfVal() {
        return carDcptGoalSumfVal;
    }
    /**
     * @param carDcptGoalSumfVal the carDcptGoalSumfVal to set
     */
    public void setCarDcptGoalSumfVal(String carDcptGoalSumfVal) {
        this.carDcptGoalSumfVal = carDcptGoalSumfVal;
    }
    /**
     * @return the saleGoalYy
     */
    public String getSaleGoalYy() {
        return saleGoalYy;
    }
    /**
     * @param saleGoalYy the saleGoalYy to set
     */
    public void setSaleGoalYy(String saleGoalYy) {
        this.saleGoalYy = saleGoalYy;
    }
    /**
     * @return the saleGoalMm
     */
    public String getSaleGoalMm() {
        return saleGoalMm;
    }
    /**
     * @param saleGoalMm the saleGoalMm to set
     */
    public void setSaleGoalMm(String saleGoalMm) {
        this.saleGoalMm = saleGoalMm;
    }
    /**
     * @return the saleUpdtUsrId
     */
    public String getSaleUpdtUsrId() {
        return saleUpdtUsrId;
    }
    /**
     * @param saleUpdtUsrId the saleUpdtUsrId to set
     */
    public void setSaleUpdtUsrId(String saleUpdtUsrId) {
        this.saleUpdtUsrId = saleUpdtUsrId;
    }
    /**
     * @return the saleRegUsrId
     */
    public String getSaleRegUsrId() {
        return saleRegUsrId;
    }
    /**
     * @param saleRegUsrId the saleRegUsrId to set
     */
    public void setSaleRegUsrId(String saleRegUsrId) {
        this.saleRegUsrId = saleRegUsrId;
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
     * @return the etcNoiPro
     */
    public int getEtcNoiPro() {
        return etcNoiPro;
    }
    /**
     * @param etcNoiPro the etcNoiPro to set
     */
    public void setEtcNoiPro(int etcNoiPro) {
        this.etcNoiPro = etcNoiPro;
    }
    /**
     * @return the etcNoi
     */
    public int getEtcNoi() {
        return etcNoi;
    }
    /**
     * @param etcNoi the etcNoi to set
     */
    public void setEtcNoi(int etcNoi) {
        this.etcNoi = etcNoi;
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
     * @return the etcNosPro
     */
    public int getEtcNosPro() {
        return etcNosPro;
    }
    /**
     * @param etcNosPro the etcNosPro to set
     */
    public void setEtcNosPro(int etcNosPro) {
        this.etcNosPro = etcNosPro;
    }
    /**
     * @return the etcNos
     */
    public int getEtcNos() {
        return etcNos;
    }
    /**
     * @param etcNos the etcNos to set
     */
    public void setEtcNos(int etcNos) {
        this.etcNos = etcNos;
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
     * @return the idccCustDealerGoalPrefValSave
     */
    public int getIdccCustDealerGoalPrefValSave() {
        return idccCustDealerGoalPrefValSave;
    }
    /**
     * @param idccCustDealerGoalPrefValSave the idccCustDealerGoalPrefValSave to set
     */
    public void setIdccCustDealerGoalPrefValSave(int idccCustDealerGoalPrefValSave) {
        this.idccCustDealerGoalPrefValSave = idccCustDealerGoalPrefValSave;
    }
    /**
     * @return the shopCustDealerGoalPrefValSave
     */
    public int getShopCustDealerGoalPrefValSave() {
        return shopCustDealerGoalPrefValSave;
    }
    /**
     * @param shopCustDealerGoalPrefValSave the shopCustDealerGoalPrefValSave to set
     */
    public void setShopCustDealerGoalPrefValSave(int shopCustDealerGoalPrefValSave) {
        this.shopCustDealerGoalPrefValSave = shopCustDealerGoalPrefValSave;
    }
    /**
     * @return the kpiIdccCustVsitRateSave
     */
    public int getKpiIdccCustVsitRateSave() {
        return kpiIdccCustVsitRateSave;
    }
    /**
     * @param kpiIdccCustVsitRateSave the kpiIdccCustVsitRateSave to set
     */
    public void setKpiIdccCustVsitRateSave(int kpiIdccCustVsitRateSave) {
        this.kpiIdccCustVsitRateSave = kpiIdccCustVsitRateSave;
    }
    /**
     * @return the kpiIdccVsitDealCntSave
     */
    public int getKpiIdccVsitDealCntSave() {
        return kpiIdccVsitDealCntSave;
    }
    /**
     * @param kpiIdccVsitDealCntSave the kpiIdccVsitDealCntSave to set
     */
    public void setKpiIdccVsitDealCntSave(int kpiIdccVsitDealCntSave) {
        this.kpiIdccVsitDealCntSave = kpiIdccVsitDealCntSave;
    }
    /**
     * @return the kpiIdccDealrateSave
     */
    public int getKpiIdccDealrateSave() {
        return kpiIdccDealrateSave;
    }
    /**
     * @param kpiIdccDealrateSave the kpiIdccDealrateSave to set
     */
    public void setKpiIdccDealrateSave(int kpiIdccDealrateSave) {
        this.kpiIdccDealrateSave = kpiIdccDealrateSave;
    }
    /**
     * @return the custInfoInputRateSave
     */
    public int getCustInfoInputRateSave() {
        return custInfoInputRateSave;
    }
    /**
     * @param custInfoInputRateSave the custInfoInputRateSave to set
     */
    public void setCustInfoInputRateSave(int custInfoInputRateSave) {
        this.custInfoInputRateSave = custInfoInputRateSave;
    }
    /**
     * @return the kpiMarketDealrateSave
     */
    public int getKpiMarketDealrateSave() {
        return kpiMarketDealrateSave;
    }
    /**
     * @param kpiMarketDealrateSave the kpiMarketDealrateSave to set
     */
    public void setKpiMarketDealrateSave(int kpiMarketDealrateSave) {
        this.kpiMarketDealrateSave = kpiMarketDealrateSave;
    }
    /**
     * @return the fncPassesRateSave
     */
    public int getFncPassesRateSave() {
        return fncPassesRateSave;
    }
    /**
     * @param fncPassesRateSave the fncPassesRateSave to set
     */
    public void setFncPassesRateSave(int fncPassesRateSave) {
        this.fncPassesRateSave = fncPassesRateSave;
    }
    /**
     * @return the oneFinanceProfitSave
     */
    public int getOneFinanceProfitSave() {
        return oneFinanceProfitSave;
    }
    /**
     * @param oneFinanceProfitSave the oneFinanceProfitSave to set
     */
    public void setOneFinanceProfitSave(int oneFinanceProfitSave) {
        this.oneFinanceProfitSave = oneFinanceProfitSave;
    }
    /**
     * @return the insPassesRateSave
     */
    public int getInsPassesRateSave() {
        return insPassesRateSave;
    }
    /**
     * @param insPassesRateSave the insPassesRateSave to set
     */
    public void setInsPassesRateSave(int insPassesRateSave) {
        this.insPassesRateSave = insPassesRateSave;
    }
    /**
     * @return the oneInsuranceProfitSave
     */
    public int getOneInsuranceProfitSave() {
        return oneInsuranceProfitSave;
    }
    /**
     * @param oneInsuranceProfitSave the oneInsuranceProfitSave to set
     */
    public void setOneInsuranceProfitSave(int oneInsuranceProfitSave) {
        this.oneInsuranceProfitSave = oneInsuranceProfitSave;
    }
    /**
     * @return the oneOptionMaueValSave
     */
    public int getOneOptionMaueValSave() {
        return oneOptionMaueValSave;
    }
    /**
     * @param oneOptionMaueValSave the oneOptionMaueValSave to set
     */
    public void setOneOptionMaueValSave(int oneOptionMaueValSave) {
        this.oneOptionMaueValSave = oneOptionMaueValSave;
    }
    /**
     * @return the goodsCarRateSave
     */
    public int getGoodsCarRateSave() {
        return goodsCarRateSave;
    }
    /**
     * @param goodsCarRateSave the goodsCarRateSave to set
     */
    public void setGoodsCarRateSave(int goodsCarRateSave) {
        this.goodsCarRateSave = goodsCarRateSave;
    }
    /**
     * @return the financeProfitSave
     */
    public int getFinanceProfitSave() {
        return financeProfitSave;
    }
    /**
     * @param financeProfitSave the financeProfitSave to set
     */
    public void setFinanceProfitSave(int financeProfitSave) {
        this.financeProfitSave = financeProfitSave;
    }
    /**
     * @return the optionProfitSave
     */
    public int getOptionProfitSave() {
        return optionProfitSave;
    }
    /**
     * @param optionProfitSave the optionProfitSave to set
     */
    public void setOptionProfitSave(int optionProfitSave) {
        this.optionProfitSave = optionProfitSave;
    }
    /**
     * @return the insuranceProfitSave
     */
    public int getInsuranceProfitSave() {
        return insuranceProfitSave;
    }
    /**
     * @param insuranceProfitSave the insuranceProfitSave to set
     */
    public void setInsuranceProfitSave(int insuranceProfitSave) {
        this.insuranceProfitSave = insuranceProfitSave;
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
     * @return the kpiIdccDealrate
     */
    public String getKpiIdccDealrate() {
        return kpiIdccDealrate;
    }
    /**
     * @param kpiIdccDealrate the kpiIdccDealrate to set
     */
    public void setKpiIdccDealrate(String kpiIdccDealrate) {
        this.kpiIdccDealrate = kpiIdccDealrate;
    }
    /**
     * @return the custInfoInputRate
     */
    public String getCustInfoInputRate() {
        return custInfoInputRate;
    }
    /**
     * @param custInfoInputRate the custInfoInputRate to set
     */
    public void setCustInfoInputRate(String custInfoInputRate) {
        this.custInfoInputRate = custInfoInputRate;
    }
    /**
     * @return the kpiMarketDealrate
     */
    public String getKpiMarketDealrate() {
        return kpiMarketDealrate;
    }
    /**
     * @param kpiMarketDealrate the kpiMarketDealrate to set
     */
    public void setKpiMarketDealrate(String kpiMarketDealrate) {
        this.kpiMarketDealrate = kpiMarketDealrate;
    }
    /**
     * @return the oneFinanceProfit
     */
    public String getOneFinanceProfit() {
        return oneFinanceProfit;
    }
    /**
     * @param oneFinanceProfit the oneFinanceProfit to set
     */
    public void setOneFinanceProfit(String oneFinanceProfit) {
        this.oneFinanceProfit = oneFinanceProfit;
    }
    /**
     * @return the oneInsuranceProfit
     */
    public String getOneInsuranceProfit() {
        return oneInsuranceProfit;
    }
    /**
     * @param oneInsuranceProfit the oneInsuranceProfit to set
     */
    public void setOneInsuranceProfit(String oneInsuranceProfit) {
        this.oneInsuranceProfit = oneInsuranceProfit;
    }
    /**
     * @return the oneOptionMaueVal
     */
    public String getOneOptionMaueVal() {
        return oneOptionMaueVal;
    }
    /**
     * @param oneOptionMaueVal the oneOptionMaueVal to set
     */
    public void setOneOptionMaueVal(String oneOptionMaueVal) {
        this.oneOptionMaueVal = oneOptionMaueVal;
    }
    /**
     * @return the financeProfit
     */
    public String getFinanceProfit() {
        return financeProfit;
    }
    /**
     * @param financeProfit the financeProfit to set
     */
    public void setFinanceProfit(String financeProfit) {
        this.financeProfit = financeProfit;
    }
    /**
     * @return the optionProfit
     */
    public String getOptionProfit() {
        return optionProfit;
    }
    /**
     * @param optionProfit the optionProfit to set
     */
    public void setOptionProfit(String optionProfit) {
        this.optionProfit = optionProfit;
    }
    /**
     * @return the insuranceProfit
     */
    public String getInsuranceProfit() {
        return insuranceProfit;
    }
    /**
     * @param insuranceProfit the insuranceProfit to set
     */
    public void setInsuranceProfit(String insuranceProfit) {
        this.insuranceProfit = insuranceProfit;
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
     * @return the scDcptCarlineCd
     */
    public String getScDcptCarlineCd() {
        return scDcptCarlineCd;
    }
    /**
     * @param scDcptCarlineCd the scDcptCarlineCd to set
     */
    public void setScDcptCarlineCd(String scDcptCarlineCd) {
        this.scDcptCarlineCd = scDcptCarlineCd;
    }
    /**
     * @return the scDcptCarlineNm
     */
    public String getScDcptCarlineNm() {
        return scDcptCarlineNm;
    }
    /**
     * @param scDcptCarlineNm the scDcptCarlineNm to set
     */
    public void setScDcptCarlineNm(String scDcptCarlineNm) {
        this.scDcptCarlineNm = scDcptCarlineNm;
    }
    /**
     * @return the scDcptGoalPrefVal
     */
    public String getScDcptGoalPrefVal() {
        return scDcptGoalPrefVal;
    }
    /**
     * @param scDcptGoalPrefVal the scDcptGoalPrefVal to set
     */
    public void setScDcptGoalPrefVal(String scDcptGoalPrefVal) {
        this.scDcptGoalPrefVal = scDcptGoalPrefVal;
    }
    /**
     * @return the sDcptCustDate
     */
    public String getsDcptCustDate() {
        return sDcptCustDate;
    }
    /**
     * @param sDcptCustDate the sDcptCustDate to set
     */
    public void setsDcptCustDate(String sDcptCustDate) {
        this.sDcptCustDate = sDcptCustDate;
    }
    /**
     * @return the sMonitorCustDate
     */
    public String getsMonitorCustDate() {
        return sMonitorCustDate;
    }
    /**
     * @param sMonitorCustDate the sMonitorCustDate to set
     */
    public void setsMonitorCustDate(String sMonitorCustDate) {
        this.sMonitorCustDate = sMonitorCustDate;
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
     * @return the statusCarlineCd
     */
    public String getStatusCarlineCd() {
        return statusCarlineCd;
    }
    /**
     * @param statusCarlineCd the statusCarlineCd to set
     */
    public void setStatusCarlineCd(String statusCarlineCd) {
        this.statusCarlineCd = statusCarlineCd;
    }
    /**
     * @return the statusCarlineNm
     */
    public String getStatusCarlineNm() {
        return statusCarlineNm;
    }
    /**
     * @param statusCarlineNm the statusCarlineNm to set
     */
    public void setStatusCarlineNm(String statusCarlineNm) {
        this.statusCarlineNm = statusCarlineNm;
    }
    /**
     * @return the resultValue
     */
    public String getResultValue() {
        return resultValue;
    }
    /**
     * @param resultValue the resultValue to set
     */
    public void setResultValue(String resultValue) {
        this.resultValue = resultValue;
    }
    /**
     * @return the custCarlineCd
     */
    public String getCustCarlineCd() {
        return custCarlineCd;
    }
    /**
     * @param custCarlineCd the custCarlineCd to set
     */
    public void setCustCarlineCd(String custCarlineCd) {
        this.custCarlineCd = custCarlineCd;
    }
    /**
     * @return the custCarlineNm
     */
    public String getCustCarlineNm() {
        return custCarlineNm;
    }
    /**
     * @param custCarlineNm the custCarlineNm to set
     */
    public void setCustCarlineNm(String custCarlineNm) {
        this.custCarlineNm = custCarlineNm;
    }
    /**
     * @return the custValue
     */
    public String getCustValue() {
        return custValue;
    }
    /**
     * @param custValue the custValue to set
     */
    public void setCustValue(String custValue) {
        this.custValue = custValue;
    }
    /**
     * @return the custGubnCarlineCd
     */
    public String getCustGubnCarlineCd() {
        return custGubnCarlineCd;
    }
    /**
     * @param custGubnCarlineCd the custGubnCarlineCd to set
     */
    public void setCustGubnCarlineCd(String custGubnCarlineCd) {
        this.custGubnCarlineCd = custGubnCarlineCd;
    }
    /**
     * @return the custGubnCarlineNm
     */
    public String getCustGubnCarlineNm() {
        return custGubnCarlineNm;
    }
    /**
     * @param custGubnCarlineNm the custGubnCarlineNm to set
     */
    public void setCustGubnCarlineNm(String custGubnCarlineNm) {
        this.custGubnCarlineNm = custGubnCarlineNm;
    }
    /**
     * @return the custGubnValue
     */
    public String getCustGubnValue() {
        return custGubnValue;
    }
    /**
     * @param custGubnValue the custGubnValue to set
     */
    public void setCustGubnValue(String custGubnValue) {
        this.custGubnValue = custGubnValue;
    }
    /**
     * @return the custGoalYy
     */
    public String getCustGoalYy() {
        return custGoalYy;
    }
    /**
     * @param custGoalYy the custGoalYy to set
     */
    public void setCustGoalYy(String custGoalYy) {
        this.custGoalYy = custGoalYy;
    }
    /**
     * @return the custGoalMm
     */
    public String getCustGoalMm() {
        return custGoalMm;
    }
    /**
     * @param custGoalMm the custGoalMm to set
     */
    public void setCustGoalMm(String custGoalMm) {
        this.custGoalMm = custGoalMm;
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
     * @return the sDcptProfitDate
     */
    public String getsDcptProfitDate() {
        return sDcptProfitDate;
    }
    /**
     * @param sDcptProfitDate the sDcptProfitDate to set
     */
    public void setsDcptProfitDate(String sDcptProfitDate) {
        this.sDcptProfitDate = sDcptProfitDate;
    }
    /**
     * @return the sTimeProfitProcess
     */
    public String getsTimeProfitProcess() {
        return sTimeProfitProcess;
    }
    /**
     * @param sTimeProfitProcess the sTimeProfitProcess to set
     */
    public void setsTimeProfitProcess(String sTimeProfitProcess) {
        this.sTimeProfitProcess = sTimeProfitProcess;
    }
    /**
     * @return the sMonitorProfitDate
     */
    public String getsMonitorProfitDate() {
        return sMonitorProfitDate;
    }
    /**
     * @param sMonitorProfitDate the sMonitorProfitDate to set
     */
    public void setsMonitorProfitDate(String sMonitorProfitDate) {
        this.sMonitorProfitDate = sMonitorProfitDate;
    }
    /**
     * @return the goalProfitYy
     */
    public String getGoalProfitYy() {
        return goalProfitYy;
    }
    /**
     * @param goalProfitYy the goalProfitYy to set
     */
    public void setGoalProfitYy(String goalProfitYy) {
        this.goalProfitYy = goalProfitYy;
    }
    /**
     * @return the goalProfitMm
     */
    public String getGoalProfitMm() {
        return goalProfitMm;
    }
    /**
     * @param goalProfitMm the goalProfitMm to set
     */
    public void setGoalProfitMm(String goalProfitMm) {
        this.goalProfitMm = goalProfitMm;
    }
    /**
     * @return the carlineProfitCd
     */
    public String getCarlineProfitCd() {
        return carlineProfitCd;
    }
    /**
     * @param carlineProfitCd the carlineProfitCd to set
     */
    public void setCarlineProfitCd(String carlineProfitCd) {
        this.carlineProfitCd = carlineProfitCd;
    }
    /**
     * @return the carlineProfitNm
     */
    public String getCarlineProfitNm() {
        return carlineProfitNm;
    }
    /**
     * @param carlineProfitNm the carlineProfitNm to set
     */
    public void setCarlineProfitNm(String carlineProfitNm) {
        this.carlineProfitNm = carlineProfitNm;
    }
    /**
     * @return the goalProfitPrefVal
     */
    public String getGoalProfitPrefVal() {
        return goalProfitPrefVal;
    }
    /**
     * @param goalProfitPrefVal the goalProfitPrefVal to set
     */
    public void setGoalProfitPrefVal(String goalProfitPrefVal) {
        this.goalProfitPrefVal = goalProfitPrefVal;
    }
    /**
     * @return the productProfitVal
     */
    public String getProductProfitVal() {
        return productProfitVal;
    }
    /**
     * @param productProfitVal the productProfitVal to set
     */
    public void setProductProfitVal(String productProfitVal) {
        this.productProfitVal = productProfitVal;
    }
    /**
     * @return the settingProfitVal
     */
    public String getSettingProfitVal() {
        return settingProfitVal;
    }
    /**
     * @param settingProfitVal the settingProfitVal to set
     */
    public void setSettingProfitVal(String settingProfitVal) {
        this.settingProfitVal = settingProfitVal;
    }
    /**
     * @return the carProfitVal
     */
    public String getCarProfitVal() {
        return carProfitVal;
    }
    /**
     * @param carProfitVal the carProfitVal to set
     */
    public void setCarProfitVal(String carProfitVal) {
        this.carProfitVal = carProfitVal;
    }
    /**
     * @return the allProfitVal
     */
    public String getAllProfitVal() {
        return allProfitVal;
    }
    /**
     * @param allProfitVal the allProfitVal to set
     */
    public void setAllProfitVal(String allProfitVal) {
        this.allProfitVal = allProfitVal;
    }
    /**
     * @return the goalTargetYy
     */
    public String getGoalTargetYy() {
        return goalTargetYy;
    }
    /**
     * @param goalTargetYy the goalTargetYy to set
     */
    public void setGoalTargetYy(String goalTargetYy) {
        this.goalTargetYy = goalTargetYy;
    }
    /**
     * @return the goalTargetMm
     */
    public String getGoalTargetMm() {
        return goalTargetMm;
    }
    /**
     * @param goalTargetMm the goalTargetMm to set
     */
    public void setGoalTargetMm(String goalTargetMm) {
        this.goalTargetMm = goalTargetMm;
    }
    /**
     * @return the carlineTargetCd
     */
    public String getCarlineTargetCd() {
        return carlineTargetCd;
    }
    /**
     * @param carlineTargetCd the carlineTargetCd to set
     */
    public void setCarlineTargetCd(String carlineTargetCd) {
        this.carlineTargetCd = carlineTargetCd;
    }
    /**
     * @return the carlineTargetNm
     */
    public String getCarlineTargetNm() {
        return carlineTargetNm;
    }
    /**
     * @param carlineTargetNm the carlineTargetNm to set
     */
    public void setCarlineTargetNm(String carlineTargetNm) {
        this.carlineTargetNm = carlineTargetNm;
    }
    /**
     * @return the goalTargetPrefVal
     */
    public String getGoalTargetPrefVal() {
        return goalTargetPrefVal;
    }
    /**
     * @param goalTargetPrefVal the goalTargetPrefVal to set
     */
    public void setGoalTargetPrefVal(String goalTargetPrefVal) {
        this.goalTargetPrefVal = goalTargetPrefVal;
    }
    /**
     * @return the goodsCarQty
     */
    public String getGoodsCarQty() {
        return goodsCarQty;
    }
    /**
     * @param goodsCarQty the goodsCarQty to set
     */
    public void setGoodsCarQty(String goodsCarQty) {
        this.goodsCarQty = goodsCarQty;
    }
    /**
     * @return the goodsCarRate
     */
    public String getGoodsCarRate() {
        return goodsCarRate;
    }
    /**
     * @param goodsCarRate the goodsCarRate to set
     */
    public void setGoodsCarRate(String goodsCarRate) {
        this.goodsCarRate = goodsCarRate;
    }
    /**
     * @return the goodsCarVal
     */
    public String getGoodsCarVal() {
        return goodsCarVal;
    }
    /**
     * @param goodsCarVal the goodsCarVal to set
     */
    public void setGoodsCarVal(String goodsCarVal) {
        this.goodsCarVal = goodsCarVal;
    }
    /**
     * @return the insPassesRate
     */
    public String getInsPassesRate() {
        return insPassesRate;
    }
    /**
     * @param insPassesRate the insPassesRate to set
     */
    public void setInsPassesRate(String insPassesRate) {
        this.insPassesRate = insPassesRate;
    }
    /**
     * @return the insCarProfitQty
     */
    public String getInsCarProfitQty() {
        return insCarProfitQty;
    }
    /**
     * @param insCarProfitQty the insCarProfitQty to set
     */
    public void setInsCarProfitQty(String insCarProfitQty) {
        this.insCarProfitQty = insCarProfitQty;
    }
    /**
     * @return the insCarVal
     */
    public String getInsCarVal() {
        return insCarVal;
    }
    /**
     * @param insCarVal the insCarVal to set
     */
    public void setInsCarVal(String insCarVal) {
        this.insCarVal = insCarVal;
    }
    /**
     * @return the fncPassesRate
     */
    public String getFncPassesRate() {
        return fncPassesRate;
    }
    /**
     * @param fncPassesRate the fncPassesRate to set
     */
    public void setFncPassesRate(String fncPassesRate) {
        this.fncPassesRate = fncPassesRate;
    }
    /**
     * @return the fncCarProfitQty
     */
    public String getFncCarProfitQty() {
        return fncCarProfitQty;
    }
    /**
     * @param fncCarProfitQty the fncCarProfitQty to set
     */
    public void setFncCarProfitQty(String fncCarProfitQty) {
        this.fncCarProfitQty = fncCarProfitQty;
    }
    /**
     * @return the fncCarVal
     */
    public String getFncCarVal() {
        return fncCarVal;
    }
    /**
     * @param fncCarVal the fncCarVal to set
     */
    public void setFncCarVal(String fncCarVal) {
        this.fncCarVal = fncCarVal;
    }
    /**
     * @return the etcCarQty
     */
    public String getEtcCarQty() {
        return etcCarQty;
    }
    /**
     * @param etcCarQty the etcCarQty to set
     */
    public void setEtcCarQty(String etcCarQty) {
        this.etcCarQty = etcCarQty;
    }
    /**
     * @return the etcCarVal
     */
    public String getEtcCarVal() {
        return etcCarVal;
    }
    /**
     * @param etcCarVal the etcCarVal to set
     */
    public void setEtcCarVal(String etcCarVal) {
        this.etcCarVal = etcCarVal;
    }
    /**
     * @return the sumCarVal
     */
    public String getSumCarVal() {
        return sumCarVal;
    }
    /**
     * @param sumCarVal the sumCarVal to set
     */
    public void setSumCarVal(String sumCarVal) {
        this.sumCarVal = sumCarVal;
    }
    /**
     * @return the lastMonthRestOrder
     */
    public String getLastMonthRestOrder() {
        return lastMonthRestOrder;
    }
    /**
     * @param lastMonthRestOrder the lastMonthRestOrder to set
     */
    public void setLastMonthRestOrder(String lastMonthRestOrder) {
        this.lastMonthRestOrder = lastMonthRestOrder;
    }
    /**
     * @return the goodsCarAmt
     */
    public String getGoodsCarAmt() {
        return goodsCarAmt;
    }
    /**
     * @param goodsCarAmt the goodsCarAmt to set
     */
    public void setGoodsCarAmt(String goodsCarAmt) {
        this.goodsCarAmt = goodsCarAmt;
    }
    /**
     * @return the insCnt
     */
    public String getInsCnt() {
        return insCnt;
    }
    /**
     * @param insCnt the insCnt to set
     */
    public void setInsCnt(String insCnt) {
        this.insCnt = insCnt;
    }
    /**
     * @return the fncCnt
     */
    public String getFncCnt() {
        return fncCnt;
    }
    /**
     * @param fncCnt the fncCnt to set
     */
    public void setFncCnt(String fncCnt) {
        this.fncCnt = fncCnt;
    }
    /**
     * @return the insApplyRate
     */
    public String getInsApplyRate() {
        return insApplyRate;
    }
    /**
     * @param insApplyRate the insApplyRate to set
     */
    public void setInsApplyRate(String insApplyRate) {
        this.insApplyRate = insApplyRate;
    }
    /**
     * @return the fincApplyRate
     */
    public String getFincApplyRate() {
        return fincApplyRate;
    }
    /**
     * @param fincApplyRate the fincApplyRate to set
     */
    public void setFincApplyRate(String fincApplyRate) {
        this.fincApplyRate = fincApplyRate;
    }
    /**
     * @return the deliverGoal
     */
    public String getDeliverGoal() {
        return deliverGoal;
    }
    /**
     * @param deliverGoal the deliverGoal to set
     */
    public void setDeliverGoal(String deliverGoal) {
        this.deliverGoal = deliverGoal;
    }
    /**
     * @return the terminalObjectGoal
     */
    public String getTerminalObjectGoal() {
        return terminalObjectGoal;
    }
    /**
     * @param terminalObjectGoal the terminalObjectGoal to set
     */
    public void setTerminalObjectGoal(String terminalObjectGoal) {
        this.terminalObjectGoal = terminalObjectGoal;
    }

}
