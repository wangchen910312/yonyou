package chn.bhmc.dms.ser.svi.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.svi.service.WorkGroupManageService;
import chn.bhmc.dms.ser.svi.service.dao.WorkGroupManageDAO;
import chn.bhmc.dms.ser.svi.vo.WorkGroupDetailVO;
import chn.bhmc.dms.ser.svi.vo.WorkGroupManageSaveVO;
import chn.bhmc.dms.ser.svi.vo.WorkGroupManageSearchVO;
import chn.bhmc.dms.ser.svi.vo.WorkGroupMasterVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : WorkGroupManageServiceImpl.java
 * @Description : WorkGroup관리 ServiceImpl
 * @author KyungMok Kim
 * @since 2016. 1. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 19.   KyungMok Kim     최초 생성
 * </pre>
 */

@Service("workGroupManageService")
public class WorkGroupManageServiceImpl extends HService implements WorkGroupManageService {

    /**
     * 소조관리 DAO
     */
    @Resource(name="workGroupManageDAO")
    WorkGroupManageDAO workGroupManageDAO;

    /**
     * 조회 조건에 해당하는 WorkGroup마스터 정보 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 WorkGroupManageSearchVO
     * @return 조회 목록
     */
    @Override
    public int selectWorkGroupMastersByConditionCnt(WorkGroupManageSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return workGroupManageDAO.selectWorkGroupMastersByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 WorkGroup마스터 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 WorkGroupManageSearchVO
     * @return 조회 목록
     */
    @Override
    public List<WorkGroupMasterVO> selectWorkGroupMastersByCondition(WorkGroupManageSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return workGroupManageDAO.selectWorkGroupMastersByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 WorkGroup마스터 KEY 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 WorkGroupManageSearchVO
     * @return 조회 목록
     */
    public WorkGroupMasterVO selectWorkGroupMasterByKey(WorkGroupManageSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return workGroupManageDAO.selectWorkGroupMasterByKey(searchVO);
    }

    /**
     * 조회 조건에 해당하는 WorkGroup마스터 정보 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 WorkGroupManageSearchVO
     * @return 조회 목록
     */
    @Override
    public int selectWorkGroupDetailsByConditionCnt(WorkGroupManageSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return workGroupManageDAO.selectWorkGroupDetailsByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 WorkGroup마스터 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 WorkGroupManageSearchVO
     * @return 조회 목록
     */
    @Override
    public List<WorkGroupDetailVO> selectWorkGroupDetailsByCondition(WorkGroupManageSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return workGroupManageDAO.selectWorkGroupDetailsByCondition(searchVO);
    }

    @Override
    public void multiWorkGroupMasters(WorkGroupManageSaveVO saveVO) throws Exception {

        String userId = LoginUtil.getUserId();

        
        
        BaseSaveVO<WorkGroupMasterVO> obj = saveVO.getWorkGroupMasterListVO();
        
        for(WorkGroupMasterVO masterVO : obj.getInsertList()){
            masterVO.setRegUsrId(userId);
            masterVO.setDlrCd(LoginUtil.getDlrCd());
            workGroupManageDAO.insertWorkGroupMaster(masterVO);
        }

        for(WorkGroupMasterVO masterVO : obj.getUpdateList()){
            masterVO.setUpdtUsrId(userId);
            masterVO.setDlrCd(LoginUtil.getDlrCd());
            workGroupManageDAO.updateWorkGroupMaster(masterVO);
        }

        for(WorkGroupMasterVO masterVO : obj.getDeleteList()){
            masterVO.setDlrCd(LoginUtil.getDlrCd());
            workGroupManageDAO.deleteWorkGroupMaster(masterVO);
        }

    }

    @Override
    public void multiWorkGroupDetails(WorkGroupManageSaveVO saveVO) throws Exception {

        String userId = LoginUtil.getUserId();

        BaseSaveVO<WorkGroupDetailVO> obj = saveVO.getWorkGroupDetailListVO();
        
        for(WorkGroupDetailVO detailVO : obj.getInsertList()){
            detailVO.setRegUsrId(userId);
            detailVO.setDlrCd(LoginUtil.getDlrCd());
            workGroupManageDAO.insertWorkGroupDetail(detailVO);
        }

        for(WorkGroupDetailVO detailVO : obj.getUpdateList()){
            detailVO.setUpdtUsrId(userId);
            detailVO.setDlrCd(LoginUtil.getDlrCd());
            workGroupManageDAO.updateWorkGroupDetail(detailVO);
        }

        for(WorkGroupDetailVO detailVO : obj.getDeleteList()){
            detailVO.setDlrCd(LoginUtil.getDlrCd());
            workGroupManageDAO.deleteWorkGroupDetail(detailVO);
        }

    }
    
    /**
     * 소조상세 정보를 삭제한다.
     * @param obj - 조회 조건을 포함하는 WorkGroupDetailVO
     * @return 조회 목록
     */
    public void deleteWorkGroups(WorkGroupMasterVO workGroupMasterVO) throws Exception{
        
        String dlrCd = LoginUtil.getDlrCd();
        
        WorkGroupDetailVO workGroupDetailVO = new WorkGroupDetailVO();
        workGroupDetailVO.setDlrCd(dlrCd);
        workGroupDetailVO.setWkgrpNo(workGroupMasterVO.getWkgrpNo());
        workGroupManageDAO.deleteWorkGroupDetail(workGroupDetailVO);

        workGroupMasterVO.setDlrCd(dlrCd);
        workGroupManageDAO.deleteWorkGroupMaster(workGroupMasterVO); 
        
    }
}
