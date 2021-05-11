package chn.bhmc.dms.mis.tpm.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * 과정 모니터링
 * </pre>
 *
 * @ClassName   : TargetPcsMnrSearchVO.java
 * @Description : 과정 모니터링
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

public class TargetPcsMnrSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6534031744201367732L;

    // 과정 모니터링 - 딜러분해(집객달성현황)
    private String tabNo;
    private String offCd;
    private String sDcptAchieveDate;
    private String sTimeAchieveProcess;
    private String sMonitorAchieveDate;
    private String sCustChannel;

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

    // 과정 모니터링 - 과정관리
    private String sDcptProcessDate;
    private String sTimeProcessProcess;
    private String sMonitorProcessDate;

    private String nameGubn;
    private String nameChannel;

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

    // 과정 모니터링 - KPI
    private String sDcptKpiDate;
    private String sTimeKpiProcess;
    private String sMonitorKpiDate;
    private String kpiIdccTargetCustGoalPrefVal;
    private String kpiIdccCustVsitCnt;
    private String kpiIdccCustReqRate;
    private String kpiIdccDealCnt;
    private String kpiShopTargetCustGoalPrefVal;
    private String kpiShopTargetCustVsitCnt;
    private String kpiShopPrsnInfoCollcRate;
    private String kpiShopDealCnt;
    private String kpiIdccCustVsitRate;
    private String kpiIdcc3MCustVsitRate;
    private String referCustReqRate;
    private String kpiIdccVsitDealCnt;
    private String kpiIdcc3MVsitDealCnt;
    private String kpiIdccVsitDealRate;
    private String kpiIdcc3MVsitDealRate;
    private String referCustDealRate;
    private String kpiShopVsitPrsnInfoCollcRate;
    private String kpiShop3MVsitPrsnInfoCollcRate;
    private String referPrsnInfoCollcRate;
    private int kpiShopVsitSuccessRate;
    private String kpiShop3MVsitSuccessRate;
    private String kpiShopCustTargetAchieve;
    private String kpiShop3MCustTargetAchieve;
    private String kpiTotalDealRate;

    private String targetIdccVsitReqRate;
    private String targetIdccVsitDealRate;
    private String targetIdccDealRate;
    private String targetShopPrsnInfoCollcRate;

    private String idccVsitReqRateData;
    private String idccVsitDealRateData;
    private String idccTotDealRateData;
    private String marketPrsnInfoOfferRate;
    private String marketSuccRateExec;
    private String totalGoalAchvRate;
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
     * @return the offCd
     */
    public String getOffCd() {
        return offCd;
    }
    /**
     * @param offCd the offCd to set
     */
    public void setOffCd(String offCd) {
        this.offCd = offCd;
    }
    /**
     * @return the sDcptAchieveDate
     */
    public String getsDcptAchieveDate() {
        return sDcptAchieveDate;
    }
    /**
     * @param sDcptAchieveDate the sDcptAchieveDate to set
     */
    public void setsDcptAchieveDate(String sDcptAchieveDate) {
        this.sDcptAchieveDate = sDcptAchieveDate;
    }
    /**
     * @return the sTimeAchieveProcess
     */
    public String getsTimeAchieveProcess() {
        return sTimeAchieveProcess;
    }
    /**
     * @param sTimeAchieveProcess the sTimeAchieveProcess to set
     */
    public void setsTimeAchieveProcess(String sTimeAchieveProcess) {
        this.sTimeAchieveProcess = sTimeAchieveProcess;
    }
    /**
     * @return the sMonitorAchieveDate
     */
    public String getsMonitorAchieveDate() {
        return sMonitorAchieveDate;
    }
    /**
     * @param sMonitorAchieveDate the sMonitorAchieveDate to set
     */
    public void setsMonitorAchieveDate(String sMonitorAchieveDate) {
        this.sMonitorAchieveDate = sMonitorAchieveDate;
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
     * @return the sDcptProcessDate
     */
    public String getsDcptProcessDate() {
        return sDcptProcessDate;
    }
    /**
     * @param sDcptProcessDate the sDcptProcessDate to set
     */
    public void setsDcptProcessDate(String sDcptProcessDate) {
        this.sDcptProcessDate = sDcptProcessDate;
    }
    /**
     * @return the sTimeProcessProcess
     */
    public String getsTimeProcessProcess() {
        return sTimeProcessProcess;
    }
    /**
     * @param sTimeProcessProcess the sTimeProcessProcess to set
     */
    public void setsTimeProcessProcess(String sTimeProcessProcess) {
        this.sTimeProcessProcess = sTimeProcessProcess;
    }
    /**
     * @return the sMonitorProcessDate
     */
    public String getsMonitorProcessDate() {
        return sMonitorProcessDate;
    }
    /**
     * @param sMonitorProcessDate the sMonitorProcessDate to set
     */
    public void setsMonitorProcessDate(String sMonitorProcessDate) {
        this.sMonitorProcessDate = sMonitorProcessDate;
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
     * @return the sDcptKpiDate
     */
    public String getsDcptKpiDate() {
        return sDcptKpiDate;
    }
    /**
     * @param sDcptKpiDate the sDcptKpiDate to set
     */
    public void setsDcptKpiDate(String sDcptKpiDate) {
        this.sDcptKpiDate = sDcptKpiDate;
    }
    /**
     * @return the sTimeKpiProcess
     */
    public String getsTimeKpiProcess() {
        return sTimeKpiProcess;
    }
    /**
     * @param sTimeKpiProcess the sTimeKpiProcess to set
     */
    public void setsTimeKpiProcess(String sTimeKpiProcess) {
        this.sTimeKpiProcess = sTimeKpiProcess;
    }
    /**
     * @return the sMonitorKpiDate
     */
    public String getsMonitorKpiDate() {
        return sMonitorKpiDate;
    }
    /**
     * @param sMonitorKpiDate the sMonitorKpiDate to set
     */
    public void setsMonitorKpiDate(String sMonitorKpiDate) {
        this.sMonitorKpiDate = sMonitorKpiDate;
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
     * @return the kpiShopVsitSuccessRate
     */
    public int getKpiShopVsitSuccessRate() {
        return kpiShopVsitSuccessRate;
    }
    /**
     * @param kpiShopVsitSuccessRate the kpiShopVsitSuccessRate to set
     */
    public void setKpiShopVsitSuccessRate(int kpiShopVsitSuccessRate) {
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
     * @return the targetIdccVsitReqRate
     */
    public String getTargetIdccVsitReqRate() {
        return targetIdccVsitReqRate;
    }
    /**
     * @param targetIdccVsitReqRate the targetIdccVsitReqRate to set
     */
    public void setTargetIdccVsitReqRate(String targetIdccVsitReqRate) {
        this.targetIdccVsitReqRate = targetIdccVsitReqRate;
    }
    /**
     * @return the targetIdccVsitDealRate
     */
    public String getTargetIdccVsitDealRate() {
        return targetIdccVsitDealRate;
    }
    /**
     * @param targetIdccVsitDealRate the targetIdccVsitDealRate to set
     */
    public void setTargetIdccVsitDealRate(String targetIdccVsitDealRate) {
        this.targetIdccVsitDealRate = targetIdccVsitDealRate;
    }
    /**
     * @return the targetIdccDealRate
     */
    public String getTargetIdccDealRate() {
        return targetIdccDealRate;
    }
    /**
     * @param targetIdccDealRate the targetIdccDealRate to set
     */
    public void setTargetIdccDealRate(String targetIdccDealRate) {
        this.targetIdccDealRate = targetIdccDealRate;
    }
    /**
     * @return the targetShopPrsnInfoCollcRate
     */
    public String getTargetShopPrsnInfoCollcRate() {
        return targetShopPrsnInfoCollcRate;
    }
    /**
     * @param targetShopPrsnInfoCollcRate the targetShopPrsnInfoCollcRate to set
     */
    public void setTargetShopPrsnInfoCollcRate(String targetShopPrsnInfoCollcRate) {
        this.targetShopPrsnInfoCollcRate = targetShopPrsnInfoCollcRate;
    }
    /**
     * @return the idccVsitReqRateData
     */
    public String getIdccVsitReqRateData() {
        return idccVsitReqRateData;
    }
    /**
     * @param idccVsitReqRateData the idccVsitReqRateData to set
     */
    public void setIdccVsitReqRateData(String idccVsitReqRateData) {
        this.idccVsitReqRateData = idccVsitReqRateData;
    }
    /**
     * @return the idccVsitDealRateData
     */
    public String getIdccVsitDealRateData() {
        return idccVsitDealRateData;
    }
    /**
     * @param idccVsitDealRateData the idccVsitDealRateData to set
     */
    public void setIdccVsitDealRateData(String idccVsitDealRateData) {
        this.idccVsitDealRateData = idccVsitDealRateData;
    }
    /**
     * @return the idccTotDealRateData
     */
    public String getIdccTotDealRateData() {
        return idccTotDealRateData;
    }
    /**
     * @param idccTotDealRateData the idccTotDealRateData to set
     */
    public void setIdccTotDealRateData(String idccTotDealRateData) {
        this.idccTotDealRateData = idccTotDealRateData;
    }
    /**
     * @return the marketPrsnInfoOfferRate
     */
    public String getMarketPrsnInfoOfferRate() {
        return marketPrsnInfoOfferRate;
    }
    /**
     * @param marketPrsnInfoOfferRate the marketPrsnInfoOfferRate to set
     */
    public void setMarketPrsnInfoOfferRate(String marketPrsnInfoOfferRate) {
        this.marketPrsnInfoOfferRate = marketPrsnInfoOfferRate;
    }
    /**
     * @return the marketSuccRateExec
     */
    public String getMarketSuccRateExec() {
        return marketSuccRateExec;
    }
    /**
     * @param marketSuccRateExec the marketSuccRateExec to set
     */
    public void setMarketSuccRateExec(String marketSuccRateExec) {
        this.marketSuccRateExec = marketSuccRateExec;
    }
    /**
     * @return the totalGoalAchvRate
     */
    public String getTotalGoalAchvRate() {
        return totalGoalAchvRate;
    }
    /**
     * @param totalGoalAchvRate the totalGoalAchvRate to set
     */
    public void setTotalGoalAchvRate(String totalGoalAchvRate) {
        this.totalGoalAchvRate = totalGoalAchvRate;
    }

}
