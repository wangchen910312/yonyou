package chn.bhmc.dms.cmm.sci.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.cmm.sci.vo.SurveyReplyVO;
import chn.bhmc.dms.cmm.sci.vo.UserDefinedDetailVO;
import chn.bhmc.dms.cmm.sci.vo.UserDefinedMasterVO;
import chn.bhmc.dms.cmm.sci.vo.UserDefinedSearchVO;
import chn.bhmc.dms.cmm.sci.vo.UserDefinedTargetVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : UserDefinedDAO.java
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

@Mapper("userDefinedDAO")
public interface UserDefinedDAO {
    public int insertUserDefinedMaster(UserDefinedMasterVO userDefinedMasterVO);

    public int updateUserDefinedMaster(UserDefinedMasterVO userDefinedMasterVO);

    public int updateUserDefinedReference(UserDefinedMasterVO userDefinedMasterVO);

    public int deleteUserDefinedMaster(UserDefinedMasterVO userDefinedMasterVO);

    // Target 추가
    public int insertUserDefinedTarget(UserDefinedTargetVO userDefinedTargetVO);

    // Target 삭제
    public int deleteUserDefinedTarget(UserDefinedTargetVO userDefinedTargetVO);

    // 문항 추가
    public int insertUserDefinedDetail(UserDefinedDetailVO userDefinedDetailVO);

    // 문항 삭제
    public int deleteUserDefinedDetail(UserDefinedDetailVO userDefinedDetailVO);

    public UserDefinedMasterVO selectUserDefinedMasterByKey(UserDefinedSearchVO searchVO);

    public List<UserDefinedMasterVO> selectUserDefinedMasterByCondition(UserDefinedSearchVO searchVO);

    public int selectUserDefinedMasterByConditionCnt(UserDefinedSearchVO searchVO);

    // DropDown 선택 된 Target List
    public List<UserDefinedTargetVO> selectUserDefinedTargetList(UserDefinedSearchVO searchVO);

    public List<UserDefinedTargetVO> selectUserDefinedTargetByCondition(UserDefinedSearchVO searchVO);

    public int selectUserDefinedTargetByConditionCnt(UserDefinedSearchVO searchVO);

    public List<UserDefinedDetailVO> selectUserDefinedDetailByCondition(UserDefinedSearchVO searchVO);

    public int selectUserDefinedDetailByConditionCnt(UserDefinedSearchVO searchVO);

    public List<SurveyReplyVO> selectSurveyAnswerMasterByCondition(UserDefinedSearchVO searchVO);

    public SurveyReplyVO selectSurveyAnswerSubByKey(UserDefinedSearchVO searchVO);

    public List<SurveyReplyVO> selectSurveyAnswerSubByCondition(UserDefinedSearchVO searchVO);

    public int selectSurveyAnswerByConditionCnt(UserDefinedSearchVO searchVO);
}