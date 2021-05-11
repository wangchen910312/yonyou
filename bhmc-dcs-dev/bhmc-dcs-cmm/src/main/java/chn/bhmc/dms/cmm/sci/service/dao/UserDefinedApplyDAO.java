package chn.bhmc.dms.cmm.sci.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.cmm.sci.vo.SurveyReplyVO;
import chn.bhmc.dms.cmm.sci.vo.UserDefinedApplyVO;
import chn.bhmc.dms.cmm.sci.vo.UserDefinedSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : UserDefinedApplyDAO.java
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

@Mapper("userDefinedApplyDAO")
public interface UserDefinedApplyDAO {
    public int insertUserDefinedApplyMaster(SurveyReplyVO saveVO);

    public int insertUserDefinedApplyDetail(SurveyReplyVO saveVO);

    public int updateUserDefinedApplyState (SurveyReplyVO saveVO);

    public int updateUserDefinedApplyDetail(SurveyReplyVO saveVO);

    public int selectUserDefinedApplyByKeyCnt(UserDefinedSearchVO searchVO);

    public List<UserDefinedApplyVO> selectUserDefinedApplyByCondition(UserDefinedSearchVO searchVO);

    public int selectUserDefinedApplyByConditionCnt(UserDefinedSearchVO searchVO);
}