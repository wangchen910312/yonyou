package chn.bhmc.dms.mob.api.main.service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * <pre>
 * 모바일메인화면 데이터 조회 서비스
 * </pre>
 *
 * @ClassName   : MobMainService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2017. 5. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 5. 18.     Kang Seok Han     최초 생성
 * </pre>
 */

public interface MainMobMainService {
	
	public Map<String, BigDecimal> selectStockInOutAmtSummary(String dlrCd) throws Exception;

    public int selectCustSalesCount(String dlrCd, Date startCustSaleDt, Date endCustSaleDt) throws Exception;

    public List<Map<String, Object>> selectDailyCustSalesList(String dlrCd, String yyyymm) throws Exception;

    public List<Map<String, Object>> selectCustSalesListByCarline(String dlrCd, String yyyymm) throws Exception;

    public int selectVisitCount(String dlrCd, Date startVsitDt, Date endVsitDt) throws Exception;

    public int selectLeadCount(String dlrCd, List<String> leadStatCdList, String befLeadStatCd) throws Exception;

    public int selectReservedLeadCount(String dlrCd, Date startVsitResvDt, Date endVsitResvDt) throws Exception;

    public int selectVisitReservedLeadCount(String dlrCd, Date startVsitDt, Date endVsitDt) throws Exception;

    public int selectOutstandingVocClaimCount(String dlrCd) throws Exception;

    public int selectOutstandingCampaignCount(String dlrCd) throws Exception;

    public double selectItemGrAmt(String dlrCd, Date startGrDt, Date endGrDt) throws Exception;

    public double selectItemGiAmt(String dlrCd, Date startGiDt, Date endGiDt) throws Exception;

    public double selectItemSalesAmt(String dlrCd, Date startStmtProcDt, Date endStmtProcDt) throws Exception;
    //新增维修销售额
    public double selectItemReparAmt(String dlrCd, Date startStmtProcDt, Date endStmtProcDt) throws Exception;

    public int selectPurcharsOrderCount(String dlrCd, String purcOrdStatCd) throws Exception;

    public double selectUsedAmtReceivedInAdvanced(String dlrCd) throws Exception;

    public int selectRepairOrderCount(String dlrCd, Date startRoDt, Date endRoDt) throws Exception;

    public double selectCalcTotAmt(String dlrCd, Date startCalcDt, Date endCalcDt) throws Exception;
 
    public double selectCalcSales(String dlrCd, Date startCalcDt, Date endCalcDt) throws Exception;

    public List<Map<String, Object>> selectMonthlyCalcTotAmtList(String dlrCd, String prevYyyy, String currYyyy) throws Exception;

    public Map<String, BigDecimal> selectRepairOrderAmtSummary(String dlrCd, Date startCalcDt, Date endCalcDt) throws Exception;

    public List<Map<String, Object>> selectCalcDocListByCarline(String dlrCd, Date startCalcDt, Date endCalcDt) throws Exception;

    public List<Map<String, Object>> selectCalcDocListByRepairOrderType(String dlrCd, Date startCalcDt, Date endCalcDt, String langCd) throws Exception;

}
