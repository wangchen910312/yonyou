package chn.bhmc.dms.cmm.sci.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.UserDefinedService;
import chn.bhmc.dms.cmm.sci.service.dao.UserDefinedDAO;
import chn.bhmc.dms.cmm.sci.vo.SurveyReplyVO;
import chn.bhmc.dms.cmm.sci.vo.UserDefinedDetailVO;
import chn.bhmc.dms.cmm.sci.vo.UserDefinedMasterVO;
import chn.bhmc.dms.cmm.sci.vo.UserDefinedSaveVO;
import chn.bhmc.dms.cmm.sci.vo.UserDefinedSearchVO;
import chn.bhmc.dms.cmm.sci.vo.UserDefinedTargetVO;
import chn.bhmc.dms.core.util.LoginUtil;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : UserDefinedServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 5. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 18.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

@Service("userDefinedService")
public class UserDefinedServiceImpl extends HService implements UserDefinedService {
    /**
     * 사용자 정의 DAO
     */
    @Resource(name = "userDefinedDAO")
    UserDefinedDAO userDefinedDAO;

    @Resource(name="userDefinedIdgenService")
    EgovIdGnrService userDefinedIdgenService;

    @Override
    public int insertUserDefinedMaster(UserDefinedMasterVO userDefinedMasterVO) throws Exception {
        return userDefinedDAO.insertUserDefinedMaster(userDefinedMasterVO);
    }

    @Override
    public int updateUserDefinedMaster(UserDefinedMasterVO userDefinedMasterVO) throws Exception {
        return userDefinedDAO.updateUserDefinedMaster(userDefinedMasterVO);
    }

    @Override
    public int updateUserDefinedReference(UserDefinedMasterVO userDefinedMasterVO) throws Exception {
        return userDefinedDAO.updateUserDefinedReference(userDefinedMasterVO);
    }

    @Override
    public void deleteUserDefinedMaster(UserDefinedSaveVO saveVO) throws Exception {
        for(UserDefinedMasterVO userDefinedMasterVO : saveVO.getDeleteList()){
            userDefinedDAO.deleteUserDefinedMaster(userDefinedMasterVO);
        }
    }

    // Target 추가
    @Override
    public int insertUserDefinedTarget(UserDefinedTargetVO userDefinedTargetVO) throws Exception {
        return userDefinedDAO.insertUserDefinedTarget(userDefinedTargetVO);
    }

    // Target 삭제
    @Override
    public int deleteUserDefinedTarget(UserDefinedTargetVO userDefinedTargetVO) throws Exception {
        return userDefinedDAO.deleteUserDefinedTarget(userDefinedTargetVO);
    }

    @Override
    public int insertUserDefinedDetail(UserDefinedDetailVO userDefinedDetailVO) throws Exception {
        return userDefinedDAO.insertUserDefinedDetail(userDefinedDetailVO);
    }

    @Override
    public int deleteUserDefinedDetail(UserDefinedDetailVO userDefinedDetailVO) throws Exception {
        return userDefinedDAO.deleteUserDefinedDetail(userDefinedDetailVO);
    }

    @Override
    public UserDefinedMasterVO selectUserDefinedMasterByKey(UserDefinedSearchVO searchVO) throws Exception {
        return userDefinedDAO.selectUserDefinedMasterByKey(searchVO);
    }

    @Override
    public List<UserDefinedMasterVO> selectUserDefinedMasterByCondition(UserDefinedSearchVO searchVO) throws Exception {
        return userDefinedDAO.selectUserDefinedMasterByCondition(searchVO);
    }

    @Override
    public int selectUserDefinedMasterByConditionCnt(UserDefinedSearchVO searchVO) throws Exception {
        return userDefinedDAO.selectUserDefinedMasterByConditionCnt(searchVO);
    }

    // DropDown 선택 된 Target List
    @Override
    public List<UserDefinedTargetVO> selectUserDefinedTargetList(UserDefinedSearchVO searchVO) throws Exception {
        return userDefinedDAO.selectUserDefinedTargetList(searchVO);
    }

    // Target List
    @Override
    public List<UserDefinedTargetVO> selectUserDefinedTargetByCondition(UserDefinedSearchVO searchVO) throws Exception {
        return userDefinedDAO.selectUserDefinedTargetByCondition(searchVO);
    }

    // Target Count
    @Override
    public int selectUserDefinedTargetByConditionCnt(UserDefinedSearchVO searchVO) throws Exception {
        return userDefinedDAO.selectUserDefinedTargetByConditionCnt(searchVO);
    }

    // 문항 List
    @Override
    public List<UserDefinedDetailVO> selectUserDefinedDetailByCondition(UserDefinedSearchVO searchVO) throws Exception {
        return userDefinedDAO.selectUserDefinedDetailByCondition(searchVO);
    }

    // 문항 Count
    @Override
    public int selectUserDefinedDetailByConditionCnt(UserDefinedSearchVO searchVO) throws Exception {
        return userDefinedDAO.selectUserDefinedDetailByConditionCnt(searchVO);
    }

    @Override
    public List<SurveyReplyVO> selectSurveyAnswerMasterByCondition(UserDefinedSearchVO searchVO) throws Exception {
        return userDefinedDAO.selectSurveyAnswerMasterByCondition(searchVO);
    }

    @Override
    public SurveyReplyVO selectSurveyAnswerSubByKey(UserDefinedSearchVO searchVO) throws Exception {
        return userDefinedDAO.selectSurveyAnswerSubByKey(searchVO);
    }

    @Override
    public List<SurveyReplyVO> selectSurveyAnswerSubByCondition(UserDefinedSearchVO searchVO) throws Exception {
        return userDefinedDAO.selectSurveyAnswerSubByCondition(searchVO);
    }

    @Override
    public int selectSurveyAnswerByConditionCnt(UserDefinedSearchVO searchVO) throws Exception {
        return userDefinedDAO.selectSurveyAnswerByConditionCnt(searchVO);
    }

    // 저장
    @Override
    public void multiUserDefined(UserDefinedSaveVO saveVO) throws Exception {
        int loop = 1;

        String usrDefReqDocId = "";
        String userId = LoginUtil.getUserId();

        UserDefinedMasterVO userDefinedMasterVO = new UserDefinedMasterVO();

        userDefinedMasterVO.setUsrDefReqDocNm(saveVO.getUsrDefReqDocNm());
        userDefinedMasterVO.setStartDt(saveVO.getStartDt());
        userDefinedMasterVO.setEndDt(saveVO.getEndDt());
        userDefinedMasterVO.setUsrDefReqCont(saveVO.getUsrDefReqCont());
        userDefinedMasterVO.setTempYn(saveVO.getTempYn());
        userDefinedMasterVO.setRegUsrId(userId);
        userDefinedMasterVO.setUpdtUsrId(userId);

        if ("".equals(saveVO.getUsrDefReqDocId())) {
            // Insert
            usrDefReqDocId = userDefinedIdgenService.getNextStringId();
            userDefinedMasterVO.setUsrDefReqDocId(usrDefReqDocId);

            this.insertUserDefinedMaster(userDefinedMasterVO);
        }
        else {
            // Update
            usrDefReqDocId = saveVO.getUsrDefReqDocId();
            userDefinedMasterVO.setUsrDefReqDocId(usrDefReqDocId);

            this.updateUserDefinedMaster(userDefinedMasterVO);
        }

        UserDefinedTargetVO userDefinedTargetVO = new UserDefinedTargetVO();
        UserDefinedDetailVO userDefinedDetailVO = new UserDefinedDetailVO();

        /*List<UserDefinedTargetVO> userDefinedTargetListVO = new ArrayList<UserDefinedTargetVO>();*/

        // Target List 삭제
        userDefinedTargetVO.setUsrDefReqDocId(usrDefReqDocId);
        this.deleteUserDefinedTarget(userDefinedTargetVO);

        /*for(UserDefinedTargetVO targetVO : saveVO.getAllTargetList()){
            userDefinedTargetVO = new UserDefinedTargetVO();

            userDefinedTargetVO.setDlrCd(targetVO.getDlrCd());

            userDefinedTargetListVO.add(userDefinedTargetVO);
        }*/

        Map<String, String> map = new HashMap<String, String>();

        // Target Insert
        for (UserDefinedTargetVO targetVO : saveVO.getAllTargetList()) {
            if (!map.containsKey(targetVO.getDlrCd())) {
                map.put(targetVO.getDlrCd(), targetVO.getDlrCd());

                userDefinedTargetVO = new UserDefinedTargetVO();

                userDefinedTargetVO.setUsrDefReqDocId(usrDefReqDocId);
                userDefinedTargetVO.setDlrCd(targetVO.getDlrCd());

                this.insertUserDefinedTarget(userDefinedTargetVO);
            }
        }

        // 문항 List 삭제
        userDefinedDetailVO.setUsrDefReqDocId(usrDefReqDocId);
        this.deleteUserDefinedDetail(userDefinedDetailVO);

        // 문항 Insert
        for(UserDefinedDetailVO detailVO : saveVO.getAllSurveyList()){
            userDefinedDetailVO = new UserDefinedDetailVO();

            userDefinedDetailVO.setUsrDefReqDocId(usrDefReqDocId);
            userDefinedDetailVO.setAtcNo(Integer.toString(loop));
            userDefinedDetailVO.setAtcNm(detailVO.getAtcNm());
            userDefinedDetailVO.setAtcTp(detailVO.getAtcTp());
            userDefinedDetailVO.setAtcListCont(detailVO.getAtcListCont());
            userDefinedDetailVO.setEtcInsUseYn(detailVO.getEtcInsUseYn());
            userDefinedDetailVO.setSortOrder(detailVO.getSortOrder());

            loop++;

            this.insertUserDefinedDetail(userDefinedDetailVO);
        }
    }
}