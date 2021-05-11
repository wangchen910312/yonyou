package chn.bhmc.dms.dply.spec.service;


import java.util.HashMap;
import java.util.List;

import chn.bhmc.dms.dply.spec.vo.CompareBundleSearchVO;
import chn.bhmc.dms.dply.spec.vo.CompareBundleSummaryVO;
import chn.bhmc.dms.dply.spec.vo.CompareResultVO;
import chn.bhmc.dms.dply.spec.vo.CompareTargetBundleVO;
import chn.bhmc.dms.dply.spec.vo.DeployHistorySearchVO;
import chn.bhmc.dms.dply.spec.vo.DeployHistoryVO;
import chn.bhmc.dms.dply.spec.vo.DeployReportDetailVO;
import chn.bhmc.dms.dply.spec.vo.DeployReportMasterVO;
import chn.bhmc.dms.dply.spec.vo.DmsSearchVO;
import chn.bhmc.dms.dply.spec.vo.DmsVO;
import chn.bhmc.dms.dply.spec.vo.DplyCurrentStateVO;
import chn.bhmc.dms.dply.spec.vo.DplyDlrSaveVO;
import chn.bhmc.dms.dply.spec.vo.DplyDlrVO;
import chn.bhmc.dms.dply.spec.vo.DplyGrpVO;
import chn.bhmc.dms.dply.spec.vo.DplyMastVO;
import chn.bhmc.dms.dply.spec.vo.OBRBundleForCompSaveVO;
import chn.bhmc.dms.dply.spec.vo.OBRBundleForCompVO;
import chn.bhmc.dms.dply.spec.vo.RepositorySaveVO;
import chn.bhmc.dms.dply.spec.vo.RepositoryVO;
import chn.bhmc.dms.dply.spec.vo.SpecBasicSaveVO;
import chn.bhmc.dms.dply.spec.vo.SpecBundleSaveVO;
import chn.bhmc.dms.dply.spec.vo.SpecBundleVO;
import chn.bhmc.dms.dply.spec.vo.SpecCommandVO;
import chn.bhmc.dms.dply.spec.vo.SpecFileVO;
import chn.bhmc.dms.dply.spec.vo.SpecMngSaveVO;
import chn.bhmc.dms.dply.spec.vo.SpecMngSearchVO;
import chn.bhmc.dms.dply.spec.vo.SpecMngVO;
import chn.bhmc.dms.dply.spec.vo.SpecPrtyVO;
import chn.bhmc.dms.dply.spec.vo.SpecSqlVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SpecMngService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 3. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 24.     Kang Seok Han     최초 생성
 * </pre>
 */

public interface SpecMngService {

    /**
     * 저장/수정 한다.
     */
    public String multiSpecMng(SpecMngSaveVO saveVO) throws Exception;

    /**
     * 저장/수정 한다.
     */
    public String multiSpecDuplicate(SpecMngSaveVO saveVO) throws Exception;

    /**
     * Key에 해당하는 메세지소스 정보를 조회한다.
     * @param mesgKey - 메세지키
     * @return 조회한 메세지소스 정보
     */
    public SpecMngVO selectSpecMngByKey(String specCd) throws Exception;


    /**
     * 조회 조건에 해당하는 SPEC Bundle 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는
     * @return 조회 목록
     */
    public List<SpecBundleVO> selectSpecBundleBySpecCd(SpecMngSearchVO specMngSearchVO) throws Exception;


    /**
     * Key에 해당하는 메세지소스 정보를 조회한다.
     * @param mesgKey - 메세지키
     * @return 조회한 메세지소스 정보
     */
    public List<SpecSqlVO> selectSpecSqlBySpecCd(SpecMngSearchVO specMngSearchVO) throws Exception;

    /**
     * Key에 해당하는 메세지소스 정보를 조회한다.
     * @param mesgKey - 메세지키
     * @return 조회한 메세지소스 정보
     */
    public List<SpecPrtyVO> selectSpecPrtyBySpecCd(SpecMngSearchVO specMngSearchVO) throws Exception;

    /**
     * Key에 해당하는 메세지소스 정보를 조회한다.
     * @param mesgKey - 메세지키
     * @return 조회한 메세지소스 정보
     */
    public List<SpecFileVO> selectSpecFileBySpecCd(SpecMngSearchVO specMngSearchVO) throws Exception;



    /**
     * 조회조건 해당하는 DEPLOY MASTER 정보를 조회한다.
     * @param mesgKey - 메세지키
     * @return 조회한 메세지소스 정보
     */
    public List<DplyMastVO> selectDplyMastByKey(SpecMngSearchVO specMngSearchVO) throws Exception;

    /**
     * Simulation을 Virtual DMS 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는
     * @return 조회 목록
     */
    public List<DmsVO> selectDmsPopupListForSimulation(DmsSearchVO dmsSearchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 DMS 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는
     * @return 조회 목록
     */
    public List<DmsVO> selectDmsPopupList(DmsSearchVO dmsSearchVO) throws Exception;

    /**
     * Redeploy DMS 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는
     * @return 조회 목록
     */
    public List<DmsVO> selectDmsPopupListForRedeploy(DmsSearchVO dmsSearchVO) throws Exception;

    /**
     * DEPLOY DEALER를 생성한다.
     */
    public DplyMastVO insertDplyDlr(DplyDlrSaveVO saveVO) throws Exception;

    /**
     * Deploy Dealer 제외 정보 수정한다.
     * @param saveVO
     * @return
     */
    public int updateDplyDlrExcp(DplyDlrSaveVO saveVO) throws Exception;

    /**
     * REDEPLOY DEALER를 생성한다.
     */
    public DplyMastVO insertDplyDlrForRedeploy(DplyDlrSaveVO saveVO) throws Exception;


    /**
     * DEPLOY DEALER를 삭제한다.
     */
    public int deleteDplyDlr(DplyDlrSaveVO saveVO) throws Exception;

    /**
     * 조회 조건에 해당하는 Deploy Group 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는
     * @return 조회 목록
     */
    public List<DplyGrpVO> selectDplyGrpByKey(SpecMngSearchVO specMngSearchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 Deploy Dealser 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는
     * @return 조회 목록
     */
    public List<DplyDlrVO> selectDplyDlrByKey(SpecMngSearchVO specMngSearchVO) throws Exception;

    /**
     * SPEC을 삭제한다.
     */
    public int deleteSpec(SpecBasicSaveVO saveVO) throws Exception;


    /**
     * SPEC코드를 조건으로 등록상태가 아닌 Deploy Master 의 갯수를 조회한다
     * @param HashMap
     * @return
     */
    public int selectNotNewDplyMastCnt(HashMap<String, String> map) throws Exception;


    /**
     * SPEC_CD, DEPLOY_VER_NO, DEPLOY_GRP_ID 조건으로 Deploy Current State 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는
     * @return 조회 목록
     */
    public List<DplyCurrentStateVO> selectDplyCurrentState(SpecMngSearchVO specMngSearchVO) throws Exception;


    /**
     * SPEC_CD, DEPLOY_VER_NO 조건으로 Deploy History 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는
     * @return 조회 목록
     */
    public List<DeployHistoryVO> selectDeployHistory(DeployHistorySearchVO deployHistorySearchVO) throws Exception;

    /**
     * 특정 조건으로 Deploy Request History 정보를 조회한다.
     * @param deployHistorySearchVO
     * @return 조회 목록
     */
    public List<DeployReportMasterVO> selectDeployReqHistByDlrCd(DeployHistorySearchVO deployHistorySearchVO) throws Exception;

    /**
     * SPEC_CD, DEPLOY_VER_NO 조건으로 Deploy Report Master 정보를 조회한다.
     * @param deployHistorySearchVO
     * @return 조회 목록
     */
    public List<DeployReportMasterVO> selectDeployReportMasterByCondition(DeployHistorySearchVO deployHistorySearchVO) throws Exception;

    /**
     * Deploy Report Detail 정보를 조회한다.
     * @param deployHistorySearchVO
     * @return 조회 목록
     */
    public List<DeployReportDetailVO> selectDeployReportDetailByCondition(DeployHistorySearchVO deployHistorySearchVO) throws Exception;


    /**
     * REPOSITORY 정보를 조회
     * @param searchVO - 조회 조건을 포함하는
     * @return 조회 목록
     */
    public List<RepositoryVO> selectRepository(SpecMngSearchVO specMngSearchVO) throws Exception;

    /**
     * REPOSITORY 정보를 저장
     * @param saveVO
     * @return
     */
    public String multiRepository(RepositorySaveVO saveVO) throws Exception;

    /**
     * App 정보를 조회
     * @param searchVO - 조회 조건을 포함하는
     * @return 조회 목록
     */
    public List<SpecBundleVO> selectAppInfo(SpecMngSearchVO specMngSearchVO) throws Exception;

    /**
     * multiAppInfo 정보를 저장
     * @param saveVO
     * @return
     */
    public String multiAppInfo(SpecBundleSaveVO saveVO) throws Exception;
    /**
     * 조회 조건에 해당하는 SPEC Repository 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는
     * @return 조회 목록
     */
//    public List<SpecRepositoryVO> selectSpecRepositoryBySpecCd(SpecMngSearchVO specMngSearchVO) throws Exception;


    /**
     * 조회 조건에 해당하는 SPEC Command 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는
     * @return 조회 목록
     */
    public List<SpecCommandVO> selectSpecCommandBySpecCd(SpecMngSearchVO specMngSearchVO) throws Exception;

    /**
     * DEPLOY MASTER를 activate한다.
     */
    public int updateDplyMastStateToReg(DplyMastVO saveVO) throws Exception;

    /**
     * SPEC_CD, DEPLOY_VER_NO를 조건으로 Deploy Dealer의 갯수를 조회한다.
     * @param HashMap
     * @return
     */
    public int selectDeployDealerCount(HashMap<String, String> map) throws Exception;


    /**
     * DEPLOY MASTER 상태를 Running으로 update, DEPLOY시작일자를 SYSDATE로 update
     * @param saveVO
     * @return
     */
    public int updateDplyMastStateToRun(DplyMastVO saveVO) throws Exception;

    /**
     * 특정 대사일자를 조건으로 대사요약 정보를 조회한다
     * @param searchVO - 조회 조건을 포함하는
     * @return 조회 목록
     */
    public List<CompareBundleSummaryVO> selectCompareBundleSummaryList(CompareBundleSearchVO compareBundleSummarySearchVO) throws Exception;

    /**
     * 특정 대사일자를 조건으로 대사요약 정보 갯수를 조회한다
     * @param searchVO - 조회 조건을 포함하는
     * @return 조회 목록
     */
    public int selectCompareBundleSummaryListCnt(CompareBundleSearchVO compareBundleSummarySearchVO) throws Exception;

    /**
     * 특정 대사일자를 조건으로 대사결과 요약 정보를 조회한다
     * @param searchVO - 조회 조건을 포함하는
     * @return 조회 목록
     */
    public List<CompareBundleSummaryVO> selectCompareBundleSummaryByResult(CompareBundleSearchVO compareBundleSummarySearchVO) throws Exception;

    /**
     * 특정 대사일자를 조건으로 대사대상목록을 조회한다
     * @param searchVO - 조회 조건을 포함하는
     * @return 조회 목록
     */
    public List<CompareTargetBundleVO> selectCompareTargetBundleList(CompareBundleSearchVO compareBundleSummarySearchVO) throws Exception;

    /**
     * 특정 대사일자, Dealer Code를 조건으로 대사 결과를 조회한다
     * @param searchVO - 조회 조건을 포함하는
     * @return 조회 목록
     */
    public List<CompareResultVO> selectCompareRsltList(CompareBundleSearchVO compareBundleSummarySearchVO) throws Exception;

    /**
     * 특정 대사일자를 조건으로 OBR 번들 목록을 조회한다
     * @param searchVO - 조회 조건을 포함하는
     * @return 조회 목록
     */
    public List<OBRBundleForCompVO> selectOBRBundleForCompList(CompareBundleSearchVO compareBundleSummarySearchVO) throws Exception;

    /**
     * 대사대상 테이블에서 가장 최근의 대사일자를 조회한다
     * @param searchVO - 조회 조건을 포함하는
     * @return 조회 목록
     */
    public List<CompareBundleSummaryVO> selectMaxCompareTargetStdDt(CompareBundleSearchVO compareBundleSummarySearchVO) throws Exception;

    /**
     * 대사대상 테이블에서 가장 최근의 대사일자를 조회한다
     * @param searchVO - 조회 조건을 포함하는
     * @return 조회 목록
     */
    public String multiOBRBundleForComp(OBRBundleForCompSaveVO saveVO) throws Exception;

}
