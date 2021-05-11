package chn.bhmc.dms.cmm.sci.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.UserDefinedApplyService;
import chn.bhmc.dms.cmm.sci.service.UserDefinedService;
import chn.bhmc.dms.cmm.sci.service.dao.UserDefinedApplyDAO;
import chn.bhmc.dms.cmm.sci.vo.SurveyReplySaveVO;
import chn.bhmc.dms.cmm.sci.vo.SurveyReplyVO;
import chn.bhmc.dms.cmm.sci.vo.UserDefinedApplyVO;
import chn.bhmc.dms.cmm.sci.vo.UserDefinedMasterVO;
import chn.bhmc.dms.cmm.sci.vo.UserDefinedSearchVO;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : UserDefinedApplyServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 5. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 26.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

@Service("userDefinedApplyService")
public class UserDefinedApplyServiceImpl extends HService implements UserDefinedApplyService {
    /**
     * 사용자 정의 DAO
     */
    @Resource(name = "userDefinedApplyDAO")
    UserDefinedApplyDAO userDefinedApplyDAO;

    /**
     * 사용자 정의 관리
     */
    @Resource(name="userDefinedService")
    UserDefinedService userDefinedService;

    @Override
    public int insertUserDefinedApplyMaster(SurveyReplyVO saveVO) throws Exception {
        return userDefinedApplyDAO.insertUserDefinedApplyMaster(saveVO);
    }

    @Override
    public int insertUserDefinedApplyDetail(SurveyReplyVO saveVO) throws Exception {
        return userDefinedApplyDAO.insertUserDefinedApplyDetail(saveVO);
    }

    @Override
    public int updateUserDefinedApplyState (SurveyReplyVO saveVO) throws Exception {
        String usrId = LoginUtil.getUserId();

        saveVO.setUpdtUsrId(usrId);
        saveVO.setApproveUsrId(usrId);

        if ("02".equals(saveVO.getApproveStatCd())) {
            saveVO.setApproveDt(DateUtil.getDate("yyyy-MM-dd"));
        }
        else {
            saveVO.setApproveUsrId(null);
            saveVO.setApproveDt(null);
        }

        return userDefinedApplyDAO.updateUserDefinedApplyState(saveVO);
    }

    @Override
    public int updateUserDefinedApplyDetail(SurveyReplyVO saveVO) throws Exception {
        return userDefinedApplyDAO.updateUserDefinedApplyDetail(saveVO);
    }

    @Override
    public int selectUserDefinedApplyByKeyCnt(UserDefinedSearchVO searchVO) throws Exception {
        return userDefinedApplyDAO.selectUserDefinedApplyByKeyCnt(searchVO);
    }

    @Override
    public List<UserDefinedApplyVO> selectUserDefinedApplyByCondition(UserDefinedSearchVO searchVO) throws Exception {
        return userDefinedApplyDAO.selectUserDefinedApplyByCondition(searchVO);
    }

    @Override
    public int selectUserDefinedApplyByConditionCnt(UserDefinedSearchVO searchVO) throws Exception {
        return userDefinedApplyDAO.selectUserDefinedApplyByConditionCnt(searchVO);
    }

    // 저장
    @Override
    public void multiUserDefined(SurveyReplySaveVO saveVO) throws Exception {
        String dlrCd = LoginUtil.getDlrCd();

        UserDefinedSearchVO searchVO = new UserDefinedSearchVO();
        searchVO.setsUsrDefReqDocId(saveVO.getUsrDefReqDocId());
        searchVO.setsDlrCd(dlrCd);

        if (this.selectUserDefinedApplyByKeyCnt(searchVO) > 0) {
            // Update
            for(SurveyReplyVO surveyReplyVO : saveVO.getInsertList()) {
                surveyReplyVO.setUsrDefReqDocId(saveVO.getUsrDefReqDocId());
                surveyReplyVO.setDlrCd(dlrCd);

                this.updateUserDefinedApplyDetail(surveyReplyVO);
            }
        }
        else {
            // Insert
            SurveyReplyVO surveyReplyMasterVO = new SurveyReplyVO();
            UserDefinedMasterVO userDefinedMasterVO = new UserDefinedMasterVO();

            surveyReplyMasterVO.setUsrDefReqDocId(saveVO.getUsrDefReqDocId());
            surveyReplyMasterVO.setDlrCd(dlrCd);
            surveyReplyMasterVO.setRegUsrId(LoginUtil.getUserId());

            userDefinedMasterVO.setUsrDefReqDocId(saveVO.getUsrDefReqDocId());

            userDefinedService.updateUserDefinedReference(userDefinedMasterVO);

            // Master
            this.insertUserDefinedApplyMaster(surveyReplyMasterVO);

            // Detail
            for(SurveyReplyVO surveyReplDetailVO : saveVO.getInsertList()) {
                surveyReplDetailVO.setUsrDefReqDocId(saveVO.getUsrDefReqDocId());
                surveyReplDetailVO.setDlrCd(dlrCd);

                this.insertUserDefinedApplyDetail(surveyReplDetailVO);
            }
        }
    }
}