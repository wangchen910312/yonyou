package chn.bhmc.dms.mob.api.main.dao;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

/**
 * <pre>
 * 모바일메인화면 데이터 조회 DAO
 * </pre>
 *
 * @ClassName   : MobMainServiceDAO.java
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

@Mapper("MainMobMainDAO")
public interface MainMobMainDAO {
	
	public Map<String, BigDecimal> selectStockInOutAmtSummary(String dlrCd);

    public int selectCustSalesCount(@Param("dlrCd") String dlrCd, @Param("startCustSaleDt") Date startCustSaleDt, @Param("endCustSaleDt") Date endCustSaleDt);

    public List<Map<String, Object>> selectDailyCustSalesList(@Param("dlrCd") String dlrCd, @Param("yyyymm") String yyyymm);

    public List<Map<String, Object>> selectCustSalesListByCarline(@Param("dlrCd") String dlrCd, @Param("yyyymm") String yyyymm);

    public int selectVisitCount(@Param("dlrCd") String dlrCd, @Param("startVsitDt") Date startVsitDt, @Param("endVsitDt") Date endVsitDt);

    public int selectLeadCount(@Param("dlrCd") String dlrCd, @Param("leadStatCdList") List<String> leadStatCdList, @Param("befLeadStatCd") String befLeadStatCd);

    public int selectReservedLeadCount(@Param("dlrCd") String dlrCd, @Param("startVsitResvDt") Date startVsitResvDt, @Param("endVsitResvDt") Date endVsitResvDt);

    public int selectVisitReservedLeadCount(@Param("dlrCd") String dlrCd, @Param("startVsitDt") Date startVsitDt, @Param("endVsitDt") Date endVsitDt);

    public int selectOutstandingVocClaimCount(String dlrCd);

    public int selectOutstandingCampaignCount(String dlrCd);

    public double selectItemGrAmt(@Param("dlrCd") String dlrCd, @Param("startGrDt") Date startGrDt, @Param("endGrDt") Date endGrDt);

    public double selectItemGiAmt(@Param("dlrCd") String dlrCd, @Param("startGiDt") Date startGiDt, @Param("endGiDt") Date endGiDt);

    public double selectItemSalesAmt(@Param("dlrCd") String dlrCd, @Param("startGiDt") Date startGiDt, @Param("endGiDt") Date endGiDt);
    //新增维修销售额
    public double selectItemReparAmt(@Param("dlrCd") String dlrCd, @Param("startGiDt") Date startGiDt, @Param("endGiDt") Date endGiDt);

    public int selectPurcharsOrderCount(@Param("dlrCd") String dlrCd, @Param("purcOrdStatCd") String purcOrdStatCd);

    public double selectUsedAmtReceivedInAdvanced(String dlrCd);

    public int selectRepairOrderCount(@Param("dlrCd") String dlrCd, @Param("startRoDt") Date startRoDt, @Param("endRoDt") Date endRoDt);

    public double selectCalcTotAmt(@Param("dlrCd") String dlrCd, @Param("startCalcDt") Date startCalcDt, @Param("endCalcDt") Date endCalcDt);

    public double selectCalcSales(@Param("dlrCd") String dlrCd, @Param("startCalcDt") Date startCalcDt, @Param("endCalcDt") Date endCalcDt);

    public List<Map<String, Object>> selectMonthlyCalcTotAmtList(@Param("dlrCd") String dlrCd, @Param("prevYyyy") String prevYyyy, @Param("currYyyy") String currYyyy);

    public Map<String, BigDecimal> selectRepairOrderAmtSummary(@Param("dlrCd") String dlrCd, @Param("startCalcDt") Date startCalcDt, @Param("endCalcDt") Date endCalcDt);

    public List<Map<String, Object>> selectCalcDocListByCarline(@Param("dlrCd") String dlrCd, @Param("startCalcDt") Date startCalcDt, @Param("endCalcDt") Date endCalcDt);

    public List<Map<String, Object>> selectCalcDocListByRepairOrderType(@Param("dlrCd") String dlrCd, @Param("startCalcDt") Date startCalcDt, @Param("endCalcDt") Date endCalcDt, @Param("langCd") String langCd);

}
