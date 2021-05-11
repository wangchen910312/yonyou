package chn.bhmc.dms.mob.cmm.service.impl;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.mob.cmm.service.MobMainService;
import chn.bhmc.dms.mob.cmm.service.dao.MobMainDAO;

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
@Service("mobMainService")
public class MobMainServiceImpl extends HService implements MobMainService {

    @Resource(name="mobMainDAO")
    MobMainDAO mobMainDAO;

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectSalesCount(String dlrCd, String yyyymm, List<String> kmoptList) throws Exception {
        return mobMainDAO.selectSalesCount(dlrCd, yyyymm, kmoptList);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectCustSalesCount(String dlrCd, Date startCustSaleDt, Date endCustSaleDt) throws Exception {
        return mobMainDAO.selectCustSalesCount(dlrCd, startCustSaleDt, endCustSaleDt);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<Map<String, Object>> selectDailyCustSalesList(String dlrCd, String yyyymm) throws Exception {
        return mobMainDAO.selectDailyCustSalesList(dlrCd, yyyymm);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<Map<String, Object>> selectCustSalesListByCarline(String dlrCd, String yyyymm) throws Exception {
        return mobMainDAO.selectCustSalesListByCarline(dlrCd, yyyymm);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectVisitCount(String dlrCd, Date startVsitDt, Date endVsitDt) throws Exception {
        return mobMainDAO.selectVisitCount(dlrCd, startVsitDt, endVsitDt);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectLeadCount(String dlrCd, List<String> leadStatCdList, String befLeadStatCd) throws Exception {
        return mobMainDAO.selectLeadCount(dlrCd, leadStatCdList, befLeadStatCd);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectReservedLeadCount(String dlrCd, Date startVsitResvDt, Date endVsitResvDt) throws Exception {
        return mobMainDAO.selectReservedLeadCount(dlrCd, startVsitResvDt, endVsitResvDt);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectVisitReservedLeadCount(String dlrCd, Date startVsitDt, Date endVsitDt) throws Exception {
        return mobMainDAO.selectVisitReservedLeadCount(dlrCd, startVsitDt, endVsitDt);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectOutstandingVocClaimCount(String dlrCd) throws Exception {
        return mobMainDAO.selectOutstandingVocClaimCount(dlrCd);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectOutstandingCampaignCount(String dlrCd) throws Exception {
        return mobMainDAO.selectOutstandingCampaignCount(dlrCd);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public Map<String, BigDecimal> selectStockInOutAmtSummary(String dlrCd) throws Exception {
        return mobMainDAO.selectStockInOutAmtSummary(dlrCd);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public double selectItemGrAmt(String dlrCd, Date startGrDt, Date endGrDt) throws Exception {
        return mobMainDAO.selectItemGrAmt(dlrCd, startGrDt, endGrDt);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public double selectItemGiAmt(String dlrCd, Date startGiDt, Date endGiDt) throws Exception {
        return mobMainDAO.selectItemGiAmt(dlrCd, startGiDt, endGiDt);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public double selectItemSalesAmt(String dlrCd, Date startStmtProcDt, Date endStmtProcDt) throws Exception {
        return mobMainDAO.selectItemSalesAmt(dlrCd, startStmtProcDt, endStmtProcDt);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectPurcharsOrderCount(String dlrCd, String purcOrdStatCd) throws Exception {
        return mobMainDAO.selectPurcharsOrderCount(dlrCd, purcOrdStatCd);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public double selectUsedAmtReceivedInAdvanced(String dlrCd) throws Exception {
        return mobMainDAO.selectUsedAmtReceivedInAdvanced(dlrCd);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectRepairOrderCount(String dlrCd, Date startRoDt, Date endRoDt) throws Exception {
        return mobMainDAO.selectRepairOrderCount(dlrCd, startRoDt, endRoDt);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public double selectCalcTotAmt(String dlrCd, Date startCalcDt, Date endCalcDt) throws Exception {
        return mobMainDAO.selectCalcTotAmt(dlrCd, startCalcDt, endCalcDt);
    }



    /**
     * {@inheritDoc}
     */
    @Override
    public double selectCalcSales(String dlrCd, Date startCalcDt, Date endCalcDt) throws Exception {
        // TODO Auto-generated method stub
        return mobMainDAO.selectCalcSales(dlrCd, startCalcDt, endCalcDt);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<Map<String, Object>> selectMonthlyCalcTotAmtList(String dlrCd, String prevYyyy, String currYyyy) throws Exception {
        return mobMainDAO.selectMonthlyCalcTotAmtList(dlrCd, prevYyyy, currYyyy);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public Map<String, BigDecimal> selectRepairOrderAmtSummary(String dlrCd, Date startCalcDt, Date endCalcDt) throws Exception {
        Map<String, BigDecimal> map = mobMainDAO.selectRepairOrderAmtSummary(dlrCd, startCalcDt, endCalcDt);
        return map;
    }

    /**
     * {@inheritDoc}
     */
    public List<Map<String, Object>> selectCalcDocListByCarline(String dlrCd, Date startCalcDt, Date endCalcDt) throws Exception {
        return mobMainDAO.selectCalcDocListByCarline(dlrCd, startCalcDt, endCalcDt);
    }

    /**
     * {@inheritDoc}
     */
    public List<Map<String, Object>> selectCalcDocListByRepairOrderType(String dlrCd, Date startCalcDt, Date endCalcDt, String langCd) throws Exception {
        return mobMainDAO.selectCalcDocListByRepairOrderType(dlrCd, startCalcDt, endCalcDt, langCd);
    }

}
