package chn.bhmc.dms.dply.cmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.dply.cmm.service.DashboardService;
import chn.bhmc.dms.dply.cmm.service.dao.DashboardDAO;
import chn.bhmc.dms.dply.cmm.vo.DMSConnectErrorsVO;
import chn.bhmc.dms.dply.cmm.vo.DashboardSearchVO;
import chn.bhmc.dms.dply.cmm.vo.DeployFailContentsVO;
import chn.bhmc.dms.dply.cmm.vo.DeployGroupDealerForDashboardVO;
import chn.bhmc.dms.dply.cmm.vo.DeployGroupForDashboardVO;
import chn.bhmc.dms.dply.cmm.vo.ScheduleSummaryVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DashboardServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Cheol Man Oh
 * @since 2016. 6. 16.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 16.     Cheol Man Oh     최초 생성
 * </pre>
 */

@Service("dashboardService")
public class DashboardServiceImpl extends HService implements DashboardService {
    /**
     * 형상관리 공통업무 DAO 선언
     */
    @Resource(name="dashboardDAO")
    DashboardDAO dashboardDAO;

    /*
     * @see chn.bhmc.dms.dply.cmm.service.DashboardService#selectScheduleSummary(chn.bhmc.dms.dply.cmm.vo.DashboardSearchVO)
     */
    @Override
    public List<ScheduleSummaryVO> selectScheduleSummary(DashboardSearchVO dashboardSearchVO) throws Exception {
        return dashboardDAO.selectScheduleSummary(dashboardSearchVO);
    }

    /*
     * @see chn.bhmc.dms.dply.cmm.service.DashboardService#selectScheduleSummaryByDay(chn.bhmc.dms.dply.cmm.vo.DashboardSearchVO)
     */
    @Override
    public List<ScheduleSummaryVO> selectScheduleSummaryByDay(DashboardSearchVO dashboardSearchVO) throws Exception {
        return dashboardDAO.selectScheduleSummaryByDay(dashboardSearchVO);
    }

    /*
     * @see chn.bhmc.dms.dply.cmm.service.DashboardService#scheduleList(chn.bhmc.dms.dply.cmm.vo.DashboardSearchVO)
     */
    @Override
    public List<ScheduleSummaryVO> selectScheduleList(DashboardSearchVO dashboardSearchVO) throws Exception {
        return dashboardDAO.selectScheduleList(dashboardSearchVO);
    }

    /*
     * @see chn.bhmc.dms.dply.cmm.service.DashboardService#selectDeployGroupForDashboard(chn.bhmc.dms.dply.cmm.vo.DashboardSearchVO)
     */
    @Override
    public List<DeployGroupForDashboardVO> selectDeployGroupForDashboard(DashboardSearchVO dashboardSearchVO) throws Exception {
        return dashboardDAO.selectDeployGroupForDashboard(dashboardSearchVO);
    }

    /*
     * @see chn.bhmc.dms.dply.cmm.service.DashboardService#selectDeployGroupDealerForDashboard(chn.bhmc.dms.dply.cmm.vo.DashboardSearchVO)
     */
    @Override
    public List<DeployGroupDealerForDashboardVO> selectDeployGroupDealerForDashboard(DashboardSearchVO dashboardSearchVO) throws Exception {
        return dashboardDAO.selectDeployGroupDealerForDashboard(dashboardSearchVO);
    }

    /*
     * @see chn.bhmc.dms.dply.cmm.service.DashboardService#selectDeployFailContents(chn.bhmc.dms.dply.cmm.vo.DashboardSearchVO)
     */
    @Override
    public List<DeployFailContentsVO> selectDeployFailContents(DashboardSearchVO dashboardSearchVO) throws Exception {
        return dashboardDAO.selectDeployFailContents(dashboardSearchVO);
    }

    /*
     * @see chn.bhmc.dms.dply.cmm.service.DashboardService#selectDMSConnectErrors(chn.bhmc.dms.dply.cmm.vo.DashboardSearchVO)
     */
    @Override
    public List<DMSConnectErrorsVO> selectDMSConnectErrors(DashboardSearchVO dashboardSearchVO) throws Exception {
        return dashboardDAO.selectDMSConnectErrors(dashboardSearchVO);
    }

}
