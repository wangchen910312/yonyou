package chn.bhmc.dms.dply.spec.service.impl;


import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.dply.spec.service.SpecMngService;
import chn.bhmc.dms.dply.spec.service.dao.SpecMngDAO;
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
import chn.bhmc.dms.dply.spec.vo.SpecBasicVO;
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
 * @ClassName   : SpecMngServiceImple.java
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

@Service("specMngService")
public class SpecMngServiceImpl extends HService implements SpecMngService {

    /**
     * SPEC등록 DAO 선언
     */
    @Resource(name="specMngDAO")
    SpecMngDAO specMngDAO;

    /*
     * @see chn.bhmc.dms.dply.spec.service.SpecMngService#multiSpecDuplicate(chn.bhmc.dms.dply.spec.vo.SpecMngSaveVO)
     */
    @Override
    public String multiSpecDuplicate(SpecMngSaveVO saveVO) throws Exception {
        SpecBasicVO specBasicVO = saveVO.getSpecBasicVO();

        String specCd = null;

        specBasicVO.setRegUsrId(LoginUtil.getUserId());     // 생성자

        // SPEC 기본정보 생성
        specMngDAO.insertSpecBasic(specBasicVO);
        specCd = specBasicVO.getSpecCd();

        if("Y".equals(specBasicVO.getsServiceYN())) {
            specMngDAO.insertSpecBundleForDup(specBasicVO);
        }

//        if("Y".equals(specBasicVO.getsRepositoryYN())) {
//            specMngDAO.insertSpecRepositoryForDup(specBasicVO);
//        }

        if("Y".equals(specBasicVO.getsCommandYN())) {
            specMngDAO.insertSpecCommandForDup(specBasicVO);
        }

        if("Y".equals(specBasicVO.getsSqlYN())) {
            specMngDAO.insertSpecSqlForDup(specBasicVO);
        }

        if("Y".equals(specBasicVO.getsPropertyYN())) {
            specMngDAO.insertSpecPrtyForDup(specBasicVO);
        }

        if("Y".equals(specBasicVO.getsFileYN())) {
            specMngDAO.insertSpecFileForDup(specBasicVO);
        }


        return specCd;
    }


    /*
     * @see chn.bhmc.dms.dply.spec.service.SpecMngService#multiSpecMng(chn.bhmc.dms.dply.spec.vo.SpecMngSaveVO)
     */
    @Override
    public String multiSpecMng(SpecMngSaveVO saveVO) throws Exception {

        SpecBasicVO specBasicVO = saveVO.getSpecBasicVO();

        String specCd = null;


        if( "create".equals(saveVO.getMultiFlag()) ) {   // 생성
/*
            UUID uuid = UUID.randomUUID();
            specCd = "S" + uuid.toString().replace("-", "").substring(0, 8);
            specBasicVO.setSpecCd(specCd);
*/
            specBasicVO.setRegUsrId(LoginUtil.getUserId());     // 생성자

            // SPEC 기본정보 생성
            specMngDAO.insertSpecBasic(specBasicVO);
            specCd = specBasicVO.getSpecCd();

        } else {

            specCd = specBasicVO.getSpecCd();
            specBasicVO.setUpdtUsrId(LoginUtil.getUserId());     // 수정자

            // SPEC 기본정보 수정
            specMngDAO.updateSpecBasic(specBasicVO);

        }

        // SPEC Bundle 리스트를 생성한다.
        for(SpecBundleVO specBundleVO : saveVO.getSpecBundleSaveVO().getInsertList()) {
            specBundleVO.setRegUsrId(LoginUtil.getUserId());

            specBundleVO.setSpecCd(specCd);
            specBundleVO.setSpecTpNm("SERVICE");

            specMngDAO.insertSpecBundle(specBundleVO);

        }

        // SPEC Bundle 리스트를 수정한다.
        for(SpecBundleVO specBundleVO : saveVO.getSpecBundleSaveVO().getUpdateList()) {
            specBundleVO.setUpdtUsrId(LoginUtil.getUserId());

            specMngDAO.updateSpecBundle(specBundleVO);
        }

        // SPEC Bundle 리스트를 삭제한다.
        for(SpecBundleVO specBundleVO : saveVO.getSpecBundleSaveVO().getDeleteList()) {

            specMngDAO.deleteSpecBundle(specBundleVO);
        }



/*        // SPEC Repository 리스트를 생성한다.
        for(SpecRepositoryVO specRepositoryVO : saveVO.getSpecRepositorySaveVO().getInsertList()) {
            specRepositoryVO.setRegUsrId(LoginUtil.getUserId());

            specRepositoryVO.setSpecCd(specCd);
            specRepositoryVO.setSpecTpNm("REPOSITORY");

            specMngDAO.insertSpecRepository(specRepositoryVO);

        }

        // SPEC Repository 리스트를 수정한다.
        for(SpecRepositoryVO specRepositoryVO : saveVO.getSpecRepositorySaveVO().getUpdateList()) {
            specRepositoryVO.setUpdtUsrId(LoginUtil.getUserId());

            specMngDAO.updateSpecRepository(specRepositoryVO);
        }

        // SPEC Repository 리스트를 삭제한다.
        for(SpecRepositoryVO specRepositoryVO : saveVO.getSpecRepositorySaveVO().getDeleteList()) {

            specMngDAO.deleteSpecRepository(specRepositoryVO);
        }*/



        // SPEC Command 리스트를 생성한다.
        for(SpecCommandVO specCommandVO : saveVO.getSpecCommandSaveVO().getInsertList()) {
            specCommandVO.setRegUsrId(LoginUtil.getUserId());

            specCommandVO.setSpecCd(specCd);
//            specCommandVO.setSpecTpNm("COMMAND");

            specMngDAO.insertSpecCommand(specCommandVO);

        }

        // SPEC Command 리스트를 수정한다.
        for(SpecCommandVO specCommandVO : saveVO.getSpecCommandSaveVO().getUpdateList()) {
            specCommandVO.setUpdtUsrId(LoginUtil.getUserId());

            specMngDAO.updateSpecCommand(specCommandVO);
        }

        // SPEC Command 리스트를 삭제한다.
        for(SpecCommandVO specCommandVO : saveVO.getSpecCommandSaveVO().getDeleteList()) {

            specMngDAO.deleteSpecCommand(specCommandVO);
        }


        // SPEC SQL 리스트를 생성한다.
        for(SpecSqlVO specSqlVO : saveVO.getSpecSqlSaveVO().getInsertSpecSqlList()) {
            specSqlVO.setRegUsrId(LoginUtil.getUserId());

            specSqlVO.setSpecCd(specCd);
            specSqlVO.setSpecTpNm("SQL");

            specMngDAO.insertSpecSql(specSqlVO);
        }

        // SPEC SQL 리스트를 수정한다.
        for(SpecSqlVO specSqlVO : saveVO.getSpecSqlSaveVO().getUpdateSpecSqlList()) {
            specSqlVO.setUpdtUsrId(LoginUtil.getUserId());

            specMngDAO.updateSpecSql(specSqlVO);
        }

        // SPEC SQL 리스트를 삭제한다.
        for(SpecSqlVO specSqlVO : saveVO.getSpecSqlSaveVO().getDeleteSpecSqlList()) {

            specMngDAO.deleteSpecSql(specSqlVO);
        }


        // SPEC PROPERTY 리스트를 생성한다.
        for(SpecPrtyVO specPrtyVO : saveVO.getSpecPrtySaveVO().getInsertSpecPrtyList()) {
            specPrtyVO.setRegUsrId(LoginUtil.getUserId());

            specPrtyVO.setSpecCd(specCd);
            specPrtyVO.setSpecTpNm("PROPERTY");

            specMngDAO.insertSpecPrty(specPrtyVO);
        }

        // SPEC PROPERTY 리스트를 수정한다.
        for(SpecPrtyVO specPrtyVO : saveVO.getSpecPrtySaveVO().getUpdateSpecPrtyList()) {
            specPrtyVO.setUpdtUsrId(LoginUtil.getUserId());

            specMngDAO.updateSpecPrty(specPrtyVO);
        }

        // SPEC PROPERTY 리스트를 삭제한다.
        for(SpecPrtyVO specPrtyVO : saveVO.getSpecPrtySaveVO().getDeleteSpecPrtyList()) {

            specMngDAO.deleteSpecPrty(specPrtyVO);
        }



        // SPEC FILE 리스트를 생성한다.
        for(SpecFileVO specFileVO : saveVO.getSpecFileSaveVO().getInsertSpecFileList()) {
            specFileVO.setRegUsrId(LoginUtil.getUserId());

            specFileVO.setSpecCd(specCd);
            specFileVO.setSpecTpNm("FILE");

            specMngDAO.insertSpecFile(specFileVO);
        }

        // SPEC FILE 리스트를 수정한다.
        for(SpecFileVO specFileVO : saveVO.getSpecFileSaveVO().getUpdateSpecFileList()) {
            specFileVO.setUpdtUsrId(LoginUtil.getUserId());

            specMngDAO.updateSpecFile(specFileVO);
        }

        // SPEC FILE 리스트를 삭제한다.
        for(SpecFileVO specFileVO : saveVO.getSpecFileSaveVO().getDeleteSpecFileList()) {

            specMngDAO.deleteSpecFile(specFileVO);
        }



        // DEPLOY MASTER 리스트를 생성한다.
        for(DplyMastVO dplyMastVO : saveVO.getDplyMastSaveVO().getInsertDplyMastList()) {
            dplyMastVO.setRegUsrId(LoginUtil.getUserId());

            dplyMastVO.setSpecCd(specCd);

            specMngDAO.insertDplyMast(dplyMastVO);
        }

        // DEPLOY MASTER 리스트를 수정한다.
        for(DplyMastVO dplyMastVO : saveVO.getDplyMastSaveVO().getUpdateDplyMastList()) {
            dplyMastVO.setRegUsrId(LoginUtil.getUserId());

            specMngDAO.updateDplyMast(dplyMastVO);
        }

        // DEPLOY DEALER, GROUP, MASTER 리스트를 삭제한다.
        for(DplyMastVO dplyMastVO : saveVO.getDplyMastSaveVO().getDeleteDplyMastList()) {
            HashMap<String, String> map = new HashMap<String, String>();
            map.put("specCd", dplyMastVO.getSpecCd());
            map.put("deployVerNo", dplyMastVO.getDeployVerNo());

            specMngDAO.deleteDplyDlrBySpecCdDeployVerNo(map);
            specMngDAO.deleteDplyGrpBySpecCdDeployVerNo(map);
            specMngDAO.deleteDplyMast(dplyMastVO);
        }



        return specCd;
    }

    /*
     * @see chn.bhmc.dms.dply.spec.service.SpecMngService#selectSpecBasicByKey(java.lang.String)
     */
    @Override
    public SpecMngVO selectSpecMngByKey(String specCd) throws Exception {
        SpecMngVO specMngVO = new SpecMngVO();
        specMngVO.setSpecBasicVO(specMngDAO.selectSpecBasicByKey(specCd));
        return specMngVO;
    }


    /*
     * @see chn.bhmc.dms.dply.spec.service.SpecMngService#selectSpecSqlBySpecCd(chn.bhmc.dms.dply.spec.vo.SpecMngSearchVO)
     */
    @Override
    public List<SpecSqlVO> selectSpecSqlBySpecCd(SpecMngSearchVO specMngSearchVO) throws Exception {

        return specMngDAO.selectSpecSqlBySpecCd(specMngSearchVO);
    }

    /*
     * @see chn.bhmc.dms.dply.spec.service.SpecMngService#selectSpecPrtyBySpecCd(chn.bhmc.dms.dply.spec.vo.SpecMngSearchVO)
     */
    @Override
    public List<SpecPrtyVO> selectSpecPrtyBySpecCd(SpecMngSearchVO specMngSearchVO) throws Exception {

        return specMngDAO.selectSpecPrtyBySpecCd(specMngSearchVO);
    }

    /*
     * @see chn.bhmc.dms.dply.spec.service.SpecMngService#selectSpecFileBySpecCd(chn.bhmc.dms.dply.spec.vo.SpecMngSearchVO)
     */
    @Override
    public List<SpecFileVO> selectSpecFileBySpecCd(SpecMngSearchVO specMngSearchVO) throws Exception {

        return specMngDAO.selectSpecFileBySpecCd(specMngSearchVO);
    }

    /*
     * @see chn.bhmc.dms.dply.spec.service.SpecMngService#selectDplyMastByKey(chn.bhmc.dms.dply.spec.vo.SpecMngSearchVO)
     */
    @Override
    public List<DplyMastVO> selectDplyMastByKey(SpecMngSearchVO specMngSearchVO) throws Exception {

        return specMngDAO.selectDplyMastByKey(specMngSearchVO);
    }

    /*
     * @see chn.bhmc.dms.dply.spec.service.SpecMngService#selectDmsPopupListForSimulation(chn.bhmc.dms.dply.spec.vo.DmsSearchVO)
     */
    @Override
    public List<DmsVO> selectDmsPopupListForSimulation(DmsSearchVO dmsSearchVO) throws Exception {
        return specMngDAO.selectDmsPopupListForSimulation(dmsSearchVO);
    }

    /*
     * @see chn.bhmc.dms.dply.spec.service.SpecMngService#selectDmsPopupList(chn.bhmc.dms.dply.spec.vo.DmsSearchVO)
     */
    @Override
    public List<DmsVO> selectDmsPopupList(DmsSearchVO dmsSearchVO) throws Exception {

        return specMngDAO.selectDmsPopupList(dmsSearchVO);
    }

    /*
     * @see chn.bhmc.dms.dply.spec.service.SpecMngService#selectDmsPopupListForRedeploy(chn.bhmc.dms.dply.spec.vo.DmsSearchVO)
     */
    @Override
    public List<DmsVO> selectDmsPopupListForRedeploy(DmsSearchVO dmsSearchVO) throws Exception {

        return specMngDAO.selectDmsPopupListForRedeploy(dmsSearchVO);
    }

    /*
     * @see chn.bhmc.dms.dply.spec.service.SpecMngService#insertDplyDlr(chn.bhmc.dms.dply.spec.vo.DplyDlrSaveVO)
     */
    @Override
    public DplyMastVO insertDplyDlr(DplyDlrSaveVO saveVO)throws Exception {

        String sSpecCd = saveVO.getSpecCd();
        String sDeployVerNo = saveVO.getDeployVerNo();

        SpecMngSearchVO specMngSearchVO = new SpecMngSearchVO();
        specMngSearchVO.setsSpecCd(sSpecCd);
        specMngSearchVO.setsDeployVerNo(sDeployVerNo);

        List<DplyMastVO> dplyMastVOList = specMngDAO.selectDplyMastByKey(specMngSearchVO);

        DplyMastVO dplyMastVO = dplyMastVOList.get(0);
        int dmsGrpCnt = dplyMastVO.getDmsGrpCnt();
        int idx = 1;

        String regUsrId = LoginUtil.getUserId();

        DplyGrpVO dplyGrpVO = null;

        for(DplyDlrVO dplyDlrVO : saveVO.getInsertList()) {
            if(idx == 1) {
                // deploy group create
                dplyGrpVO = new DplyGrpVO();
                dplyGrpVO.setSpecCd(dplyMastVO.getSpecCd());
                dplyGrpVO.setDeployVerNo(dplyMastVO.getDeployVerNo());
                dplyGrpVO.setDeployProrVal(idx);
                dplyGrpVO.setDeployEndDlrCnt(0);
                dplyGrpVO.setRegUsrId(regUsrId);

                specMngDAO.insertDplyGrp(dplyGrpVO);
            }

            dplyDlrVO.setSpecCd(dplyMastVO.getSpecCd());
            dplyDlrVO.setDeployVerNo(dplyMastVO.getDeployVerNo());
            dplyDlrVO.setDeployGrpId(dplyGrpVO.getDeployGrpId());
            dplyDlrVO.setDeployExcpYn("N");       // PROPERTY TABLE에서 관리되는 default value setting 해야 함
            dplyDlrVO.setDeployReqEndYn("N");     // PROPERTY TABLE에서 관리되는 default value setting 해야 함
            dplyDlrVO.setDeployProcCnt(0);
            dplyDlrVO.setRegUsrId(regUsrId);

            specMngDAO.insertDplyDlr(dplyDlrVO);

            if(dmsGrpCnt == idx) {
                idx = 1;
            } else {
                idx++;
            }
        }

        specMngDAO.updateDplyGrpForTargDlrCnt(dplyMastVO);

        return dplyMastVO;
    }

    /*
     * @see chn.bhmc.dms.dply.spec.service.SpecMngService#insertDplyDlrForRedeploy(chn.bhmc.dms.dply.spec.vo.DplyDlrSaveVO)
     */
    @Override
    public DplyMastVO insertDplyDlrForRedeploy(DplyDlrSaveVO saveVO)throws Exception {

        String regUsrId = LoginUtil.getUserId();

        String sSpecCd = saveVO.getSpecCd();
        String sDeployVerNo = saveVO.getDeployVerNo();
        Date deployStartDt = saveVO.getDeployStartDt();
        Date deployEndDt = saveVO.getDeployEndDt();

        DplyMastVO dplyMastVOForRedeploy = new DplyMastVO();
        dplyMastVOForRedeploy.setSpecCd(sSpecCd);
        dplyMastVOForRedeploy.setDeployVerNoOrg(sDeployVerNo);
        dplyMastVOForRedeploy.setDeployStartDt(deployStartDt);  // !!!!!!!!!!!!!!!!!!!!! 고쳐야 함 (고침)
        dplyMastVOForRedeploy.setDeployEndDt(deployEndDt);      // !!!!!!!!!!!!!!!!!!!!! 고쳐야 함 (고침)
        dplyMastVOForRedeploy.setDeployStatCd("N");             // 'W'가 아니라 'N'을 setting 해야 한다.
        dplyMastVOForRedeploy.setRegUsrId(regUsrId);

        specMngDAO.insertDplyMastForRedeploy(dplyMastVOForRedeploy);

        SpecMngSearchVO specMngSearchVO = new SpecMngSearchVO();
        specMngSearchVO.setsSpecCd(sSpecCd);
        specMngSearchVO.setsDeployVerNo(dplyMastVOForRedeploy.getDeployVerNo());  // 이 부분이 다름

        List<DplyMastVO> dplyMastVOList = specMngDAO.selectDplyMastByKey(specMngSearchVO);
        DplyMastVO dplyMastVO = dplyMastVOList.get(0);

        int dmsGrpCnt = dplyMastVO.getDmsGrpCnt();
        int idx = 1;

        DplyGrpVO dplyGrpVO = null;

        for(DplyDlrVO dplyDlrVO : saveVO.getInsertList()) {
            if(idx == 1) {
                // deploy group create
                dplyGrpVO = new DplyGrpVO();
                dplyGrpVO.setSpecCd(dplyMastVO.getSpecCd());
                dplyGrpVO.setDeployVerNo(dplyMastVO.getDeployVerNo());
                dplyGrpVO.setDeployProrVal(idx);
                dplyGrpVO.setDeployEndDlrCnt(0);
                dplyGrpVO.setRegUsrId(regUsrId);

                specMngDAO.insertDplyGrp(dplyGrpVO);
            }

            dplyDlrVO.setSpecCd(dplyMastVO.getSpecCd());
            dplyDlrVO.setDeployVerNo(dplyMastVO.getDeployVerNo());
            dplyDlrVO.setDeployGrpId(dplyGrpVO.getDeployGrpId());
            dplyDlrVO.setDeployExcpYn("N");       // PROPERTY TABLE에서 관리되는 default value setting 해야 함
            dplyDlrVO.setDeployReqEndYn("N");     // PROPERTY TABLE에서 관리되는 default value setting 해야 함
            dplyDlrVO.setDeployProcCnt(0);
            dplyDlrVO.setRegUsrId(regUsrId);

            specMngDAO.insertDplyDlr(dplyDlrVO);

            if(dmsGrpCnt == idx) {
                idx = 1;
            } else {
                idx++;
            }
        }

        specMngDAO.updateDplyGrpForTargDlrCnt(dplyMastVO);

        return dplyMastVO;
    }

    /*
     * @see chn.bhmc.dms.dply.spec.service.SpecMngService#deleteDplyDlr(chn.bhmc.dms.dply.spec.vo.DplyDlrSaveVO)
     */
    @Override
    public int deleteDplyDlr(DplyDlrSaveVO saveVO)throws Exception {

        for(DplyDlrVO dplyDlrVO : saveVO.getDeleteList()) {
            specMngDAO.deleteDplyDlr(dplyDlrVO);
        }
        return 0;
    }

    /*
     * @see chn.bhmc.dms.dply.spec.service.SpecMngService#selectDplyGrpByKey(chn.bhmc.dms.dply.spec.vo.SpecMngSearchVO)
     */
    @Override
    public List<DplyGrpVO> selectDplyGrpByKey(SpecMngSearchVO specMngSearchVO) throws Exception {

        return specMngDAO.selectDplyGrpByKey(specMngSearchVO);
    }

    /*
     * @see chn.bhmc.dms.dply.spec.service.SpecMngService#selectDplyDlrByKey(chn.bhmc.dms.dply.spec.vo.SpecMngSearchVO)
     */
    @Override
    public List<DplyDlrVO> selectDplyDlrByKey(SpecMngSearchVO specMngSearchVO) throws Exception {

        return specMngDAO.selectDplyDlrByKey(specMngSearchVO);
    }

    /*
     * @see chn.bhmc.dms.dply.spec.service.SpecMngService#deleteSpec(chn.bhmc.dms.dply.spec.vo.DplyMastSaveVO)
     */
    @Override
    public int deleteSpec(SpecBasicSaveVO saveVO) throws Exception {
        for(SpecBasicVO specBasicVO : saveVO.getDeleteList()) {

            HashMap<String, String> map = new HashMap<String, String>();
            map.put("specCd", specBasicVO.getSpecCd());

            specMngDAO.deleteDplyDlrByCondition(map);
            specMngDAO.deleteDplyGrpByCondition(map);
            specMngDAO.deleteDplyMastByCondition(map);

            map.put("specTpNm", "FILE");
            specMngDAO.deleteSpecFileByCondition(map);

            map.put("specTpNm", "PROPERTY");
            specMngDAO.deleteSpecPrtyByCondition(map);

            map.put("specTpNm", "SQL");
            specMngDAO.deleteSpecSqlByCondition(map);

            map.put("specTpNm", "SERVICE");
            specMngDAO.deleteSpecServiceByCondition(map);

            map.put("specTpNm", null);
            specMngDAO.deleteSpecCommandByCondition(map);

            map.put("specTpNm", "REPOSITORY");
            specMngDAO.deleteSpecRepositoryByCondition(map);

            map.put("specTpNm", null);
            specMngDAO.deleteSpecMastByCondition(map);

        }

        return 1;
    }

    /*
     * @see chn.bhmc.dms.dply.spec.service.SpecMngService#selectNotNewDplyMast(java.util.HashMap)
     */
    @Override
    public int selectNotNewDplyMastCnt(HashMap<String, String> map) throws Exception {
//        int iVal = specMngDAO.selectNotNewDplyMastCnt(map);
//        return iVal;

        return specMngDAO.selectNotNewDplyMastCnt(map);
    }

    /*
     * @see chn.bhmc.dms.dply.spec.service.SpecMngService#selectSpecServiceBySpecCd(chn.bhmc.dms.dply.spec.vo.SpecMngSearchVO)
     */
    @Override
    public List<SpecBundleVO> selectSpecBundleBySpecCd(SpecMngSearchVO specMngSearchVO) throws Exception {
        return specMngDAO.selectSpecBundleBySpecCd(specMngSearchVO);

    }

    /*
     * @see chn.bhmc.dms.dply.spec.service.SpecMngService#selectDplyCurrentState(chn.bhmc.dms.dply.spec.vo.SpecMngSearchVO)
     */
    @Override
    public List<DplyCurrentStateVO> selectDplyCurrentState(SpecMngSearchVO specMngSearchVO) throws Exception {
        return specMngDAO.selectDplyCurrentState(specMngSearchVO);
    }

    /*
     * @see chn.bhmc.dms.dply.spec.service.SpecMngService#selectDeployHistory(chn.bhmc.dms.dply.spec.vo.DeployHistorySearchVO)
     */
    @Override
    public List<DeployHistoryVO> selectDeployHistory(DeployHistorySearchVO deployHistorySearchVO) throws Exception {
        return specMngDAO.selectDeployHistory(deployHistorySearchVO);
    }

    /*
     * @see chn.bhmc.dms.dply.spec.service.SpecMngService#selectDeployReportMasterByCondition(chn.bhmc.dms.dply.spec.vo.DeployHistorySearchVO)
     */
    @Override
    public List<DeployReportMasterVO> selectDeployReportMasterByCondition(DeployHistorySearchVO deployHistorySearchVO) throws Exception {
        return specMngDAO.selectDeployReportMasterByCondition(deployHistorySearchVO);
    }

    /*
     * @see chn.bhmc.dms.dply.spec.service.SpecMngService#selectDeployReportDetailByCondition(chn.bhmc.dms.dply.spec.vo.DeployHistorySearchVO)
     */
    @Override
    public List<DeployReportDetailVO> selectDeployReportDetailByCondition(DeployHistorySearchVO deployHistorySearchVO) throws Exception {
        return specMngDAO.selectDeployReportDetailByCondition(deployHistorySearchVO);
    }

    /*
     * @see chn.bhmc.dms.dply.spec.service.SpecMngService#selectRepository(chn.bhmc.dms.dply.spec.vo.SpecMngSearchVO)
     */
    @Override
    public List<RepositoryVO> selectRepository(SpecMngSearchVO specMngSearchVO) throws Exception {
        return specMngDAO.selectRepository(specMngSearchVO);
    }

    /*
     * @see chn.bhmc.dms.dply.spec.service.SpecMngService#selectSpecRepositoryBySpecCd(chn.bhmc.dms.dply.spec.vo.SpecMngSearchVO)
     */
//    @Override
//    public List<SpecRepositoryVO> selectSpecRepositoryBySpecCd(SpecMngSearchVO specMngSearchVO) throws Exception {
//        return specMngDAO.selectSpecRepositoryBySpecCd(specMngSearchVO);
//    }

    /*
     * @see chn.bhmc.dms.dply.spec.service.SpecMngService#selectSpecCommandBySpecCd(chn.bhmc.dms.dply.spec.vo.SpecMngSearchVO)
     */
    @Override
    public List<SpecCommandVO> selectSpecCommandBySpecCd(SpecMngSearchVO specMngSearchVO) throws Exception {
        return specMngDAO.selectSpecCommandBySpecCd(specMngSearchVO);
    }

    /*
     * @see chn.bhmc.dms.dply.spec.service.SpecMngService#updateDplyMastStateToReg(chn.bhmc.dms.dply.spec.vo.DplyMastSaveVO)
     */
    @Override
    public int updateDplyMastStateToReg(DplyMastVO saveVO) throws Exception {
        String updtUsrId = LoginUtil.getUserId();

        saveVO.setUpdtUsrId(updtUsrId);
        return specMngDAO.updateDplyMastStateToReg(saveVO);

    }

    /*
     * @see chn.bhmc.dms.dply.spec.service.SpecMngService#selectDeployDealerCount(java.util.HashMap)
     */
    @Override
    public int selectDeployDealerCount(HashMap<String, String> map) throws Exception {
        // TODO Auto-generated method stub
        return specMngDAO.selectDeployDealerCount(map);
    }


    /*
     * @see chn.bhmc.dms.dply.spec.service.SpecMngService#updateDplyMastStateToRun(chn.bhmc.dms.dply.spec.vo.DplyMastVO)
     */
    @Override
    public int updateDplyMastStateToRun(DplyMastVO saveVO) throws Exception {
        String updtUsrId = LoginUtil.getUserId();

        saveVO.setUpdtUsrId(updtUsrId);
        return specMngDAO.updateDplyMastStateToRun(saveVO);
    }

    /*
     * @see chn.bhmc.dms.dply.spec.service.SpecMngService#selectCompareBundleSummaryList(chn.bhmc.dms.dply.spec.vo.CompareBundleSummarySearchVO)
     */
    @Override
    public List<CompareBundleSummaryVO> selectCompareBundleSummaryList(CompareBundleSearchVO compareBundleSummarySearchVO) throws Exception {
        return specMngDAO.selectCompareBundleSummaryList(compareBundleSummarySearchVO);
    }

    /*
     * @see chn.bhmc.dms.dply.spec.service.SpecMngService#selectCompareBundleSummaryListCnt(chn.bhmc.dms.dply.spec.vo.CompareBundleSearchVO)
     */
    @Override
    public int selectCompareBundleSummaryListCnt(CompareBundleSearchVO compareBundleSummarySearchVO) throws Exception {
        return specMngDAO.selectCompareBundleSummaryListCnt(compareBundleSummarySearchVO);
    }

    /*
     * @see chn.bhmc.dms.dply.spec.service.SpecMngService#selectCompareTargetBundleList(chn.bhmc.dms.dply.spec.vo.CompareBundleSearchVO)
     */
    @Override
    public List<CompareTargetBundleVO> selectCompareTargetBundleList(CompareBundleSearchVO compareBundleSummarySearchVO) throws Exception {
        return specMngDAO.selectCompareTargetBundleList(compareBundleSummarySearchVO);
    }

    /*
     * @see chn.bhmc.dms.dply.spec.service.SpecMngService#selectCompareRsltList(chn.bhmc.dms.dply.spec.vo.CompareBundleSearchVO)
     */
    @Override
    public List<CompareResultVO> selectCompareRsltList(CompareBundleSearchVO compareBundleSummarySearchVO) throws Exception {
        return specMngDAO.selectCompareRsltList(compareBundleSummarySearchVO);
    }

    /*
     * @see chn.bhmc.dms.dply.spec.service.SpecMngService#selectOBRBundleForCompList(chn.bhmc.dms.dply.spec.vo.CompareBundleSearchVO)
     */
    @Override
    public List<OBRBundleForCompVO> selectOBRBundleForCompList(CompareBundleSearchVO compareBundleSummarySearchVO) throws Exception {
        return specMngDAO.selectOBRBundleForCompList(compareBundleSummarySearchVO);
    }

    /*
     * @see chn.bhmc.dms.dply.spec.service.SpecMngService#selectMaxCompareTargetStdDt(chn.bhmc.dms.dply.spec.vo.CompareBundleSearchVO)
     */
    @Override
    public List<CompareBundleSummaryVO> selectMaxCompareTargetStdDt(CompareBundleSearchVO compareBundleSummarySearchVO) throws Exception {
//        String date = specMngDAO.selectMaxCom/*pareTargetStdDt(compareBundleSummarySearchVO);
//        return date==null?"":date;

        return specMngDAO.selectMaxCompareTargetStdDt(compareBundleSummarySearchVO);
    }

    /*
     * @see chn.bhmc.dms.dply.spec.service.SpecMngService#multiOBRBundleForComp(chn.bhmc.dms.dply.spec.vo.OBRBundleForCompSaveVO)
     */
    @Override
    public String multiOBRBundleForComp(OBRBundleForCompSaveVO saveVO) throws Exception {
        String usrId = LoginUtil.getUserId();

        for(OBRBundleForCompVO oBRBundleForCompVO : saveVO.getUpdateList()) {
            oBRBundleForCompVO.setUpdtUsrId(usrId);
            specMngDAO.updateOBRBundleForComp(oBRBundleForCompVO);
        }

        for(OBRBundleForCompVO oBRBundleForCompVO : saveVO.getDeleteList()) {
            oBRBundleForCompVO.setUpdtUsrId(usrId);
            specMngDAO.deleteOBRBundleForComp(oBRBundleForCompVO);
        }

        for(OBRBundleForCompVO oBRBundleForCompVO : saveVO.getInsertList()) {
            oBRBundleForCompVO.setRegUsrId(usrId);
            specMngDAO.insertOBRBundleForComp(oBRBundleForCompVO);
        }

        return "OK";
    }

    /*
     * @see chn.bhmc.dms.dply.spec.service.SpecMngService#updateDplyDlrExcp(chn.bhmc.dms.dply.spec.vo.DplyDlrVO)
     */
    @Override
    public int updateDplyDlrExcp(DplyDlrSaveVO saveVO) throws Exception {
        for(DplyDlrVO dplyDlrVO : saveVO.getUpdateList()) {
            specMngDAO.updateDplyDlrExcp(dplyDlrVO);
        }
        return 0;
    }

    /*
     * @see chn.bhmc.dms.dply.spec.service.SpecMngService#selectDeployReqHistByDlrCd(chn.bhmc.dms.dply.spec.vo.DeployHistorySearchVO)
     */
    @Override
    public List<DeployReportMasterVO> selectDeployReqHistByDlrCd(DeployHistorySearchVO deployHistorySearchVO) throws Exception {
        return specMngDAO.selectDeployReqHistByDlrCd(deployHistorySearchVO);
    }

    /*
     * @see chn.bhmc.dms.dply.spec.service.SpecMngService#selectCompareBundleSummaryByResult(chn.bhmc.dms.dply.spec.vo.CompareBundleSearchVO)
     */
    @Override
    public List<CompareBundleSummaryVO> selectCompareBundleSummaryByResult(CompareBundleSearchVO compareBundleSummarySearchVO) throws Exception {
        return specMngDAO.selectCompareBundleSummaryByResult(compareBundleSummarySearchVO);
    }

    /*
     * @see chn.bhmc.dms.dply.spec.service.SpecMngService#multiRepository(chn.bhmc.dms.dply.spec.vo.RepositorySaveVO)
     */
    @Override
    public String multiRepository(RepositorySaveVO saveVO) throws Exception {
        String usrId = LoginUtil.getUserId();

        for(RepositoryVO repositoryVO : saveVO.getInsertList()) {
            repositoryVO.setRegUsrId(usrId);
            specMngDAO.insertRepository(repositoryVO);
        }

        for(RepositoryVO repositoryVO : saveVO.getUpdateList()) {
            repositoryVO.setUpdtUsrId(usrId);
            specMngDAO.updateRepository(repositoryVO);
        }

        for(RepositoryVO repositoryVO : saveVO.getDeleteList()) {
            repositoryVO.setUpdtUsrId(usrId);
            specMngDAO.deleteRepository(repositoryVO);
        }


        return "OK";

    }

    /*
     * @see chn.bhmc.dms.dply.spec.service.SpecMngService#selectAppInfo(chn.bhmc.dms.dply.spec.vo.SpecMngSearchVO)
     */
    @Override
    public List<SpecBundleVO> selectAppInfo(SpecMngSearchVO specMngSearchVO) throws Exception {
        return specMngDAO.selectAppInfo(specMngSearchVO);
    }
    
    /*
     * @see chn.bhmc.dms.dply.spec.service.SpecMngService#multiAppInfo(chn.bhmc.dms.dply.spec.vo.SpecMngSaveVO)
     */
    @Override
    public String multiAppInfo(SpecBundleSaveVO saveVO) throws Exception {
        String usrId = LoginUtil.getUserId();

        for(SpecBundleVO specBundleVO : saveVO.getInsertList()) {
            specBundleVO.setRegUsrId(usrId);
            specMngDAO.insertAppInfo(specBundleVO);
        }

        for(SpecBundleVO specBundleVO : saveVO.getUpdateList()) {
            specBundleVO.setUpdtUsrId(usrId);
            specMngDAO.updateAppInfo(specBundleVO);
        }

        for(SpecBundleVO specBundleVO : saveVO.getDeleteList()) {
            specBundleVO.setUpdtUsrId(usrId);
            specMngDAO.deleteAppInfo(specBundleVO);
       }

        return "OK";
    }



}
