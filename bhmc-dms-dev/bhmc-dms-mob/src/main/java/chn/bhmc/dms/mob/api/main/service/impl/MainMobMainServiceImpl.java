package chn.bhmc.dms.mob.api.main.service.impl;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.mob.api.main.dao.MainMobMainDAO;
import chn.bhmc.dms.mob.api.main.service.MainMobMainService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MobMainServiceImpl.java
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
@Service("MainMobMainService")
public class MainMobMainServiceImpl extends HService implements MainMobMainService {

    @Resource(name="MainMobMainDAO")
    MainMobMainDAO MainMobMainDAO;


    /**
     * {@inheritDoc}
     */
    @Override
    public int selectCustSalesCount(String dlrCd, Date startCustSaleDt, Date endCustSaleDt) throws Exception {
        return MainMobMainDAO.selectCustSalesCount(dlrCd, startCustSaleDt, endCustSaleDt);
    }
    
    @Override
    public Map<String, BigDecimal> selectStockInOutAmtSummary(String dlrCd) throws Exception {
        return MainMobMainDAO.selectStockInOutAmtSummary(dlrCd);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<Map<String, Object>> selectDailyCustSalesList(String dlrCd, String yyyymm) throws Exception {
        return MainMobMainDAO.selectDailyCustSalesList(dlrCd, yyyymm);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<Map<String, Object>> selectCustSalesListByCarline(String dlrCd, String yyyymm) throws Exception {
        return MainMobMainDAO.selectCustSalesListByCarline(dlrCd, yyyymm);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectVisitCount(String dlrCd, Date startVsitDt, Date endVsitDt) throws Exception {
        return MainMobMainDAO.selectVisitCount(dlrCd, startVsitDt, endVsitDt);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectLeadCount(String dlrCd, List<String> leadStatCdList, String befLeadStatCd) throws Exception {
        return MainMobMainDAO.selectLeadCount(dlrCd, leadStatCdList, befLeadStatCd);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectReservedLeadCount(String dlrCd, Date startVsitResvDt, Date endVsitResvDt) throws Exception {
        return MainMobMainDAO.selectReservedLeadCount(dlrCd, startVsitResvDt, endVsitResvDt);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectVisitReservedLeadCount(String dlrCd, Date startVsitDt, Date endVsitDt) throws Exception {
        return MainMobMainDAO.selectVisitReservedLeadCount(dlrCd, startVsitDt, endVsitDt);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectOutstandingVocClaimCount(String dlrCd) throws Exception {
        return MainMobMainDAO.selectOutstandingVocClaimCount(dlrCd);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectOutstandingCampaignCount(String dlrCd) throws Exception {
        return MainMobMainDAO.selectOutstandingCampaignCount(dlrCd);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public double selectItemGrAmt(String dlrCd, Date startGrDt, Date endGrDt) throws Exception {
        return MainMobMainDAO.selectItemGrAmt(dlrCd, startGrDt, endGrDt);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public double selectItemGiAmt(String dlrCd, Date startGiDt, Date endGiDt) throws Exception {
        return MainMobMainDAO.selectItemGiAmt(dlrCd, startGiDt, endGiDt);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public double selectItemSalesAmt(String dlrCd, Date startStmtProcDt, Date endStmtProcDt) throws Exception {
        return MainMobMainDAO.selectItemSalesAmt(dlrCd, startStmtProcDt, endStmtProcDt);
    }
    
    @Override
    public double selectItemReparAmt(String dlrCd, Date startStmtProcDt, Date endStmtProcDt) throws Exception {
        return MainMobMainDAO.selectItemReparAmt(dlrCd, startStmtProcDt, endStmtProcDt);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectPurcharsOrderCount(String dlrCd, String purcOrdStatCd) throws Exception {
        return MainMobMainDAO.selectPurcharsOrderCount(dlrCd, purcOrdStatCd);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public double selectUsedAmtReceivedInAdvanced(String dlrCd) throws Exception {
        return MainMobMainDAO.selectUsedAmtReceivedInAdvanced(dlrCd);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectRepairOrderCount(String dlrCd, Date startRoDt, Date endRoDt) throws Exception {
        return MainMobMainDAO.selectRepairOrderCount(dlrCd, startRoDt, endRoDt);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public double selectCalcTotAmt(String dlrCd, Date startCalcDt, Date endCalcDt) throws Exception {
        return MainMobMainDAO.selectCalcTotAmt(dlrCd, startCalcDt, endCalcDt);
    }



    /**
     * {@inheritDoc}
     */
    @Override
    public double selectCalcSales(String dlrCd, Date startCalcDt, Date endCalcDt) throws Exception {
        // TODO Auto-generated method stub
        return MainMobMainDAO.selectCalcSales(dlrCd, startCalcDt, endCalcDt);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<Map<String, Object>> selectMonthlyCalcTotAmtList(String dlrCd, String prevYyyy, String currYyyy) throws Exception {
        return MainMobMainDAO.selectMonthlyCalcTotAmtList(dlrCd, prevYyyy, currYyyy);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public Map<String, BigDecimal> selectRepairOrderAmtSummary(String dlrCd, Date startCalcDt, Date endCalcDt) throws Exception {
        Map<String, BigDecimal> map = MainMobMainDAO.selectRepairOrderAmtSummary(dlrCd, startCalcDt, endCalcDt);
        return map;
    }

    /**
     * {@inheritDoc}
     */
    public List<Map<String, Object>> selectCalcDocListByCarline(String dlrCd, Date startCalcDt, Date endCalcDt) throws Exception {
        return MainMobMainDAO.selectCalcDocListByCarline(dlrCd, startCalcDt, endCalcDt);
    }

    /**
     * {@inheritDoc}
     */
    public List<Map<String, Object>> selectCalcDocListByRepairOrderType(String dlrCd, Date startCalcDt, Date endCalcDt, String langCd) throws Exception {
        return MainMobMainDAO.selectCalcDocListByRepairOrderType(dlrCd, startCalcDt, endCalcDt, langCd);
    }

}
