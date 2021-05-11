package chn.bhmc.dms.cmm.sci.service;

import java.util.List;

import chn.bhmc.dms.cmm.sci.vo.SurveyReplySaveVO;
import chn.bhmc.dms.cmm.sci.vo.SurveyReplyVO;
import chn.bhmc.dms.cmm.sci.vo.UserDefinedApplyVO;
import chn.bhmc.dms.cmm.sci.vo.UserDefinedSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : UserDefinedApplyService.java
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

public interface UserDefinedApplyService {
    int insertUserDefinedApplyMaster(SurveyReplyVO saveVO) throws Exception;

    int insertUserDefinedApplyDetail(SurveyReplyVO saveVO) throws Exception;

    int updateUserDefinedApplyState (SurveyReplyVO saveVO) throws Exception;

    int updateUserDefinedApplyDetail(SurveyReplyVO saveVO) throws Exception;

    int selectUserDefinedApplyByKeyCnt(UserDefinedSearchVO searchVO) throws Exception;

    List<UserDefinedApplyVO> selectUserDefinedApplyByCondition(UserDefinedSearchVO searchVO) throws Exception;

    int selectUserDefinedApplyByConditionCnt(UserDefinedSearchVO searchVO) throws Exception;

    void multiUserDefined(SurveyReplySaveVO saveVO) throws Exception;
}