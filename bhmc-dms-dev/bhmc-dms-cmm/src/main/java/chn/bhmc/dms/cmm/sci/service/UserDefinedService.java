package chn.bhmc.dms.cmm.sci.service;

import java.util.List;

import chn.bhmc.dms.cmm.sci.vo.SurveyReplyVO;
import chn.bhmc.dms.cmm.sci.vo.UserDefinedDetailVO;
import chn.bhmc.dms.cmm.sci.vo.UserDefinedMasterVO;
import chn.bhmc.dms.cmm.sci.vo.UserDefinedSaveVO;
import chn.bhmc.dms.cmm.sci.vo.UserDefinedSearchVO;
import chn.bhmc.dms.cmm.sci.vo.UserDefinedTargetVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : UserDefinedService.java
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

public interface UserDefinedService {
    int insertUserDefinedMaster(UserDefinedMasterVO userDefinedMasterVO) throws Exception;

    int updateUserDefinedMaster(UserDefinedMasterVO userDefinedMasterVO) throws Exception;

    int updateUserDefinedReference(UserDefinedMasterVO userDefinedMasterVO) throws Exception;

    void deleteUserDefinedMaster(UserDefinedSaveVO saveVO) throws Exception;

    int insertUserDefinedTarget(UserDefinedTargetVO userDefinedTargetVO) throws Exception;

    int deleteUserDefinedTarget(UserDefinedTargetVO userDefinedTargetVO) throws Exception;

    int insertUserDefinedDetail(UserDefinedDetailVO userDefinedDetailVO) throws Exception;

    int deleteUserDefinedDetail(UserDefinedDetailVO userDefinedDetailVO) throws Exception;

    UserDefinedMasterVO selectUserDefinedMasterByKey(UserDefinedSearchVO searchVO) throws Exception;

    List<UserDefinedMasterVO> selectUserDefinedMasterByCondition(UserDefinedSearchVO searchVO) throws Exception;

    int selectUserDefinedMasterByConditionCnt(UserDefinedSearchVO searchVO) throws Exception;

    // DropDown 선택 된 Target List
    List<UserDefinedTargetVO> selectUserDefinedTargetList(UserDefinedSearchVO searchVO) throws Exception;

    List<UserDefinedTargetVO> selectUserDefinedTargetByCondition(UserDefinedSearchVO searchVO) throws Exception;

    int selectUserDefinedTargetByConditionCnt(UserDefinedSearchVO searchVO) throws Exception;

    List<UserDefinedDetailVO> selectUserDefinedDetailByCondition(UserDefinedSearchVO searchVO) throws Exception;

    int selectUserDefinedDetailByConditionCnt(UserDefinedSearchVO searchVO) throws Exception;

    List<SurveyReplyVO> selectSurveyAnswerMasterByCondition(UserDefinedSearchVO searchVO) throws Exception;

    List<SurveyReplyVO> selectSurveyAnswerSubByCondition(UserDefinedSearchVO searchVO) throws Exception;

    SurveyReplyVO selectSurveyAnswerSubByKey(UserDefinedSearchVO searchVO) throws Exception;

    int selectSurveyAnswerByConditionCnt(UserDefinedSearchVO searchVO) throws Exception;

    void multiUserDefined(UserDefinedSaveVO saveVO) throws Exception;
}