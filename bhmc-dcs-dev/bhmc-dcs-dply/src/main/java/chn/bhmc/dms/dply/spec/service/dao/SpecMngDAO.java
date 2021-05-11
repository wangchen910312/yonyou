package chn.bhmc.dms.dply.spec.service.dao;

import java.util.HashMap;
import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

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
import chn.bhmc.dms.dply.spec.vo.DplyDlrVO;
import chn.bhmc.dms.dply.spec.vo.DplyGrpVO;
import chn.bhmc.dms.dply.spec.vo.DplyMastVO;
import chn.bhmc.dms.dply.spec.vo.OBRBundleForCompVO;
import chn.bhmc.dms.dply.spec.vo.RepositoryVO;
import chn.bhmc.dms.dply.spec.vo.SpecBasicVO;
import chn.bhmc.dms.dply.spec.vo.SpecBundleVO;
import chn.bhmc.dms.dply.spec.vo.SpecCommandVO;
import chn.bhmc.dms.dply.spec.vo.SpecFileVO;
import chn.bhmc.dms.dply.spec.vo.SpecMngSearchVO;
import chn.bhmc.dms.dply.spec.vo.SpecPrtyVO;
import chn.bhmc.dms.dply.spec.vo.SpecRepositoryVO;
import chn.bhmc.dms.dply.spec.vo.SpecSqlVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SpecMngDAO.java
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

@Mapper("specMngDAO")
public interface SpecMngDAO {

    /**
     * SPEC 기본정보 생성한다.
     * @param saveVO
     * @return
     */
    public int insertSpecBasic(SpecBasicVO saveVO) throws Exception;


    /**
     * SPEC 기본정보 수정한다.
     * @param saveVO
     * @return
     */
    public int updateSpecBasic(SpecBasicVO saveVO) throws Exception;


    /**
     * 조회 조건에 해당하는 SPEC 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는
     * @return 조회 목록
     */
    public SpecBasicVO selectSpecBasicByKey(@Param("specCd") String specCd) throws Exception;


    /**
     * 조회 조건에 해당하는 SPEC Repository 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는
     * @return 조회 목록
     */
//    public List<SpecRepositoryVO> selectSpecRepositoryBySpecCd(SpecMngSearchVO specMngSearchVO) throws Exception;


    /**
     * SPEC Repository 정보 생성한다.
     * @param saveVO
     * @return
     */
    public int insertSpecRepository(SpecRepositoryVO saveVO) throws Exception;


    /**
     * SPEC Repository 정보 수정한다.
     * @param saveVO
     * @return
     */
    public int updateSpecRepository(SpecRepositoryVO saveVO) throws Exception;


    /**
     * SPEC Repository 정보 삭제한다.
     * @param saveVO
     * @return
     */
    public int deleteSpecRepository(SpecRepositoryVO saveVO) throws Exception;



    /**
     * 조회 조건에 해당하는 SPEC Command 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는
     * @return 조회 목록
     */
    public List<SpecCommandVO> selectSpecCommandBySpecCd(SpecMngSearchVO specMngSearchVO) throws Exception;


    /**
     * SPEC Command 정보 생성한다.
     * @param saveVO
     * @return
     */
    public int insertSpecCommand(SpecCommandVO saveVO) throws Exception;


    /**
     * SPEC Command 정보 수정한다.
     * @param saveVO
     * @return
     */
    public int updateSpecCommand(SpecCommandVO saveVO) throws Exception;


    /**
     * SPEC Command 정보 삭제한다.
     * @param saveVO
     * @return
     */
    public int deleteSpecCommand(SpecCommandVO saveVO) throws Exception;


    /**
     * 조회 조건에 해당하는 SPEC SERVICE 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는
     * @return 조회 목록
     */
    public List<SpecBundleVO> selectSpecBundleBySpecCd(SpecMngSearchVO specMngSearchVO) throws Exception;

    /**
     * SPEC Bundle 정보 생성한다.
     * @param saveVO
     * @return
     */
    public int insertSpecBundle(SpecBundleVO saveVO) throws Exception;


    /**
     * SPEC Bundle 정보 수정한다.
     * @param saveVO
     * @return
     */
    public int updateSpecBundle(SpecBundleVO saveVO) throws Exception;


    /**
     * SPEC Bundle 정보 삭제한다.
     * @param saveVO
     * @return
     */
    public int deleteSpecBundle(SpecBundleVO saveVO) throws Exception;


    /**
     * 조회 조건에 해당하는 SPEC SQL 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는
     * @return 조회 목록
     */
    public List<SpecSqlVO> selectSpecSqlBySpecCd(SpecMngSearchVO specMngSearchVO) throws Exception;


    /**
     * SPEC SQL 정보 생성한다.
     * @param saveVO
     * @return
     */
    public int insertSpecSql(SpecSqlVO saveVO) throws Exception;


    /**
     * SPEC SQL 정보 수정한다.
     * @param saveVO
     * @return
     */
    public int updateSpecSql(SpecSqlVO saveVO) throws Exception;


    /**
     * SPEC SQL 정보 삭제한다.
     * @param saveVO
     * @return
     */
    public int deleteSpecSql(SpecSqlVO saveVO) throws Exception;



    /**
     * 조회 조건에 해당하는 SPEC RPOPERTY 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는
     * @return 조회 목록
     */
    public List<SpecPrtyVO> selectSpecPrtyBySpecCd(SpecMngSearchVO specMngSearchVO) throws Exception;


    /**
     * SPEC RPOPERTY 정보 생성한다.
     * @param saveVO
     * @return
     */
    public int insertSpecPrty(SpecPrtyVO saveVO) throws Exception;


    /**
     * SPEC RPOPERTY 정보 수정한다.
     * @param saveVO
     * @return
     */
    public int updateSpecPrty(SpecPrtyVO saveVO) throws Exception;


    /**
     * SPEC RPOPERTY 정보 삭제한다.
     * @param saveVO
     * @return
     */
    public int deleteSpecPrty(SpecPrtyVO saveVO) throws Exception;




    /**
     * 조회 조건에 해당하는 SPEC FILE 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는
     * @return 조회 목록
     */
    public List<SpecFileVO> selectSpecFileBySpecCd(SpecMngSearchVO specMngSearchVO) throws Exception;


    /**
     * SPEC FILE 정보 생성한다.
     * @param saveVO
     * @return
     */
    public int insertSpecFile(SpecFileVO saveVO) throws Exception;


    /**
     * SPEC FILE 정보 수정한다.
     * @param saveVO
     * @return
     */
    public int updateSpecFile(SpecFileVO saveVO) throws Exception;


    /**
     * SPEC FILE 정보 삭제한다.
     * @param saveVO
     * @return
     */
    public int deleteSpecFile(SpecFileVO saveVO) throws Exception;



    /**
     * 조회 조건에 해당하는 Deploy Master 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는
     * @return 조회 목록
     */
    public List<DplyMastVO> selectDplyMastByKey(SpecMngSearchVO specMngSearchVO) throws Exception;

    /**
     * Deploy Master 정보 생성한다.
     * @param saveVO
     * @return
     */
    public int insertDplyMast(DplyMastVO saveVO) throws Exception;

    /**
     * Deploy Master 정보 생성한다. (Redeploy)
     * @param saveVO
     * @return
     */
    public int insertDplyMastForRedeploy(DplyMastVO saveVO) throws Exception;


    /**
     * Deploy Master 정보 수정한다.
     * @param saveVO
     * @return
     */
    public int updateDplyMast(DplyMastVO saveVO) throws Exception;


    /**
     * DEPLOY MASTER 상태 update
     * @param saveVO
     * @return
     */
    public int updateDplyMastState(DplyMastVO saveVO) throws Exception;


    /**
     * DEPLOY MASTER 상태 등록 상태로 update
     * @param saveVO
     * @return
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
     * Deploy Master 정보 삭제한다.
     * @param saveVO
     * @return
     */
    public int deleteDplyMast(DplyMastVO saveVO) throws Exception;


    /**
     * Deploy Master 정보 삭제한다.
     * @param saveVO
     * @return
     */
    public int deleteDplyDlrBySpecCdDeployVerNo(HashMap<String, String> map) throws Exception;


    /**
     * Deploy Master 정보 삭제한다.
     * @param saveVO
     * @return
     */
    public int deleteDplyGrpBySpecCdDeployVerNo(HashMap<String, String> map) throws Exception;


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
     * Deploy Dealer 정보 생성한다.
     * @param saveVO
     * @return
     */
    public int insertDplyDlr(DplyDlrVO saveVO) throws Exception;

    /**
     * Deploy Dealer 제외 정보 수정한다.
     * @param saveVO
     * @return
     */
    public int updateDplyDlrExcp(DplyDlrVO saveVO) throws Exception;

    /**
     * Deploy Dealer 정보 삭제한다.
     * @param saveVO
     * @return
     */
    public int deleteDplyDlr(DplyDlrVO saveVO) throws Exception;

    /**
     * Deploy Group 정보 생성한다.
     * @param saveVO
     * @return
     */
    public int insertDplyGrp(DplyGrpVO saveVO) throws Exception;

    /**
     * Deploy Master 정보 수정한다.
     * @param saveVO
     * @return
     */
    public int updateDplyGrpForTargDlrCnt(DplyMastVO saveVO) throws Exception;

    /**
     * 조회 조건에 해당하는 Deploy Group 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는
     * @return 조회 목록
     */
    public List<DplyGrpVO> selectDplyGrpByKey(SpecMngSearchVO specMngSearchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 Deploy Dealer 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는
     * @return 조회 목록
     */
    public List<DplyDlrVO> selectDplyDlrByKey(SpecMngSearchVO specMngSearchVO) throws Exception;



    /**
     * 특정 조건에 해당하는 SPEC MASTER 정보 삭제
     * @param HashMap
     * @return
     */
    public int deleteSpecMastByCondition(HashMap<String, String> map) throws Exception;

    /**
     * 특정 조건에 해당하는 SPEC SERVICE 정보 삭제
     * @param HashMap
     * @return
     */
    public int deleteSpecServiceByCondition(HashMap<String, String> map) throws Exception;

    /**
     * 특정 조건에 해당하는 SPEC SQL 정보 삭제
     * @param HashMap
     * @return
     */
    public int deleteSpecSqlByCondition(HashMap<String, String> map) throws Exception;

    /**
     * 특정 조건에 해당하는 SPEC PROPERTY 정보 삭제
     * @param HashMap
     * @return
     */
    public int deleteSpecPrtyByCondition(HashMap<String, String> map) throws Exception;

    /**
     * 특정 조건에 해당하는 SPEC FILE 정보 삭제
     * @param HashMap
     * @return
     */
    public int deleteSpecFileByCondition(HashMap<String, String> map) throws Exception;


    /**
     * 특정 조건에 해당하는 SPEC REPOSITORY 정보 삭제
     * @param HashMap
     * @return
     */
    public int deleteSpecRepositoryByCondition(HashMap<String, String> map) throws Exception;


    /**
     * 특정 조건에 해당하는 SPEC COMMAND 정보 삭제
     * @param HashMap
     * @return
     */
    public int deleteSpecCommandByCondition(HashMap<String, String> map) throws Exception;

    /**
     * 특정 조건에 해당하는 DEPLOY MASTER 정보 삭제
     * @param HashMap
     * @return
     */
    public int deleteDplyMastByCondition(HashMap<String, String> map) throws Exception;

    /**
     * 특정 조건에 해당하는 DEPLOY GROUP 정보 삭제
     * @param HashMap
     * @return
     */
    public int deleteDplyGrpByCondition(HashMap<String, String> map) throws Exception;

    /**
     * 특정 조건에 해당하는 DEPLOY DEALER 정보 삭제
     * @param HashMap
     * @return
     */
    public int deleteDplyDlrByCondition(HashMap<String, String> map) throws Exception;

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
     * SPEC_CD, DEPLOY_VER_NO 조건으로 Deploy Report Master 정보를 조회한다.
     * @param deployHistorySearchVO
     * @return 조회 목록
     */
    public List<DeployReportMasterVO> selectDeployReportMasterByCondition(DeployHistorySearchVO deployHistorySearchVO) throws Exception;

    /**
     * 특정 조건으로 Deploy Request History 정보를 조회한다.
     * @param deployHistorySearchVO
     * @return 조회 목록
     */
    public List<DeployReportMasterVO> selectDeployReqHistByDlrCd(DeployHistorySearchVO deployHistorySearchVO) throws Exception;

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
     * 대사대상 정보 생성한다.
     * @param saveVO
     * @return
     */
    public int insertOBRBundleForComp(OBRBundleForCompVO saveVO) throws Exception;

    /**
     * 대사대상 정보 수정한다.
     * @param saveVO
     * @return
     */
    public int updateOBRBundleForComp(OBRBundleForCompVO saveVO) throws Exception;

    /**
     * 대사대상 정보 삭제한다.
     * @param saveVO
     * @return
     */
    public int deleteOBRBundleForComp(OBRBundleForCompVO saveVO) throws Exception;


    /**
     * REPOSITORY 정보 생성한다.
     * @param saveVO
     * @return
     */
    public int insertRepository(RepositoryVO saveVO) throws Exception;

    /**
     * REPOSITORY 정보 수정한다.
     * @param saveVO
     * @return
     */
    public int updateRepository(RepositoryVO saveVO) throws Exception;

    /**
     * REPOSITORY 정보 삭제한다.
     * @param saveVO
     * @return
     */
    public int deleteRepository(RepositoryVO saveVO) throws Exception;



    /**
     * Duplication SPEC Bundle 정보 생성
     * @param saveVO
     * @return
     */
    public int insertSpecBundleForDup(SpecBasicVO saveVO) throws Exception;

    /**
     * Duplication SPEC Repository 정보 생성
     * @param saveVO
     * @return
     */
//    public int insertSpecRepositoryForDup(SpecBasicVO saveVO) throws Exception;


    /**
     * Duplication SPEC Command 정보 생성
     * @param saveVO
     * @return
     */
    public int insertSpecCommandForDup(SpecBasicVO saveVO) throws Exception;


    /**
     * Duplication SPEC SQL 정보 생성
     * @param saveVO
     * @return
     */
    public int insertSpecSqlForDup(SpecBasicVO saveVO) throws Exception;


    /**
     * Duplication SPEC PROPERTY 정보 생성
     * @param saveVO
     * @return
     */
    public int insertSpecPrtyForDup(SpecBasicVO saveVO) throws Exception;


    /**
     * Duplication SPEC FILE 정보 생성
     * @param saveVO
     * @return
     */
    public int insertSpecFileForDup(SpecBasicVO saveVO) throws Exception;

    /**
     * App 정보를 조회
     * @param searchVO - 조회 조건을 포함하는
     * @return 조회 목록
     */
    public List<SpecBundleVO> selectAppInfo(SpecMngSearchVO specMngSearchVO) throws Exception;
    
    /**
     * App 정보 생성한다.
     * @param saveVO
     * @return
     */
    public int insertAppInfo(SpecBundleVO saveVO) throws Exception;

    /**
     * App 정보 수정한다.
     * @param saveVO
     * @return
     */
    public int updateAppInfo(SpecBundleVO saveVO) throws Exception;

    /**
     * App 정보 삭제한다.
     * @param saveVO
     * @return
     */
    public int deleteAppInfo(SpecBundleVO saveVO) throws Exception;

}
