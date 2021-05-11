package chn.bhmc.dms.crm.css.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.mcm.vo.CampaignResultSearchVO;
import chn.bhmc.dms.crm.mcm.vo.CampaignResultVO;

import chn.bhmc.dms.crm.css.vo.SurveyQuestionSearchVO;
import chn.bhmc.dms.crm.css.vo.SurveyQuestionVO;
import chn.bhmc.dms.crm.css.vo.SurveySatisFactionSearchVO;
import chn.bhmc.dms.crm.css.vo.SurveySatisFactionVO;

/**
 * 설문 질문 관리에 관한 데이터처리 매퍼 클래스
 *
 * @author hyun ho kim
 * @since 2016. 3. 4.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.04         hyun ho kim            최초 생성
 * </pre>
 */

@Mapper("surveyQuestionDAO")
public interface SurveyQuestionDAO {

    /**
     * 조회 조건에 해당하는 설문 질문정보 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SurveySatisFactionSearchVO
     * @return
     */
    public int selectSurveyQuestionsByConditionCnt(SurveyQuestionSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 설문 질문정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는SurveySatisFactionSearchVO
     * @return 조회 목록
     */
    public List<SurveyQuestionVO> selectSurveyQuestionsByCondition(SurveyQuestionSearchVO searchVO) throws Exception;

    /**
     * 설문 질문  정보를 등록한다.
     * @param surveyQuestionVO - 등록할 정보가 담긴 SurveyQuestionVO
     * @return 등록된 목록수
     */
    public int insertSurveyQuestion(SurveyQuestionVO surveyQuestionVO) throws Exception;

    /**
     * 설문 질문 정보를 수정한다.
     * @param surveyQuestionVO - 수정할 정보가 담긴 SurveyQuestionVO
     * @return 수정된 목록수
     */
    public int updateSurveyQuestion(SurveyQuestionVO surveyQuestionVO) throws Exception;

    /**
     * 설문 질문 정보를 삭제한다.
     * @param surveyQuestionVO - 삭제할 정보가 담긴 SurveyQuestionVO
     * @return 삭제된 목록수
     */
    public int deleteSurveyQuestion(SurveyQuestionVO surveyQuestionVO) throws Exception;

    /**
     * 설문템플릿 삭제시 설문템플릿 일련번호만으로 해당 설문템플릿과 연계된 질문을 모두 삭제한다.
     * @param surveyQuestionVO - 삭제할 정보가 담긴 SurveyQuestionVO
     * @return 삭제된 목록수
     */
    public int deleteSurveyQuestionTotal(SurveyQuestionVO surveyQuestionVO) throws Exception;


    /**
     * 설문 키에 해당하는 설문 질문 미리보기 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SurveySatisFactionSearchVO
     * @return 조회 목록
     */
    public List<SurveySatisFactionVO> selectSurveyQuestionViewByCondition(SurveySatisFactionSearchVO searchVO) throws Exception;

    /**
     * 설문 답변 목록 조회
     * @param CampaignResultSearchVO
     *
     */
    public List<CampaignResultVO> selectSurveyAnswerByCondition(CampaignResultSearchVO searchVO) throws Exception;

}
