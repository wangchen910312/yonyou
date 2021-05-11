package chn.bhmc.dms.dply.cmm.service;

import java.util.List;

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
 * @ClassName   : DashboardService.java
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

public interface DashboardService {

    /**
     * Dashboard 배포스케줄요약 조회한다
     * @param dashboardSearchVO
     * @return 조회 목록
     */
    public List<ScheduleSummaryVO> selectScheduleSummary(DashboardSearchVO dashboardSearchVO) throws Exception;

    /**
     * Dashboard 일별 배포스케줄요약 조회한다
     * @param dashboardSearchVO
     * @return 조회 목록
     */
    public List<ScheduleSummaryVO> selectScheduleSummaryByDay(DashboardSearchVO dashboardSearchVO) throws Exception;

    /**
     * Dashboard 배포스케줄목록 조회한다
     * @param dashboardSearchVO
     * @return 조회 목록
     */
    public List<ScheduleSummaryVO> selectScheduleList(DashboardSearchVO dashboardSearchVO) throws Exception;

    /**
     * Dashboard 배포그룹목록을 조회한다
     * @param dashboardSearchVO
     * @return 조회 목록
     */
    public List<DeployGroupForDashboardVO> selectDeployGroupForDashboard(DashboardSearchVO dashboardSearchVO) throws Exception;

    /**
     * Dashboard 배포 DMS 목록을 조회한다
     * @param dashboardSearchVO
     * @return 조회 목록
     */
    public List<DeployGroupDealerForDashboardVO> selectDeployGroupDealerForDashboard(DashboardSearchVO dashboardSearchVO) throws Exception;

    /**
     * DMS측 배포실행 오류내역 조회한다
     * @param dashboardSearchVO
     * @return 조회 목록
     */
    public List<DeployFailContentsVO> selectDeployFailContents(DashboardSearchVO dashboardSearchVO) throws Exception;


    /**
     * DMS 연동 오류내역을 조회한다
     * @param dashboardSearchVO
     * @return 조회 목록
     */
    public List<DMSConnectErrorsVO> selectDMSConnectErrors(DashboardSearchVO dashboardSearchVO) throws Exception;



}
