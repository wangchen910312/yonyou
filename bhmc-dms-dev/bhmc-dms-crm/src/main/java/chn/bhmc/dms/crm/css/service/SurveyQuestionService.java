package chn.bhmc.dms.crm.css.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.crm.css.vo.SurveyQuestionSearchVO;
import chn.bhmc.dms.crm.css.vo.SurveyQuestionVO;
import chn.bhmc.dms.crm.css.vo.SurveySatisFactionSearchVO;
import chn.bhmc.dms.crm.css.vo.SurveySatisFactionVO;
import chn.bhmc.dms.crm.mcm.vo.CampaignResultSearchVO;
import chn.bhmc.dms.crm.mcm.vo.CampaignResultVO;

/**
 * 설문 질문 서비스
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

public interface SurveyQuestionService {

    /**
     * 조회 조건에 해당하는 설문 질문정보 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SurveyQuestionSearchVO
     * @return
     */
    public int selectSurveyQuestionsByConditionCnt(SurveyQuestionSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 설문 질문 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SurveyQuestionSearchVO
     * @return 조회 목록
     */
    public List<SurveyQuestionVO> selectSurveyQuestionsByCondition(SurveyQuestionSearchVO searchVO) throws Exception;

    /**
     * 설문 질문 정보를 등록/수정/삭제 처리한다.
     * @param SurveySatisFactionVO
     */
    public void multiSurveyQuestions(BaseSaveVO<SurveyQuestionVO> surveySatisFactionVO) throws Exception;

    /**
     * 설문 질문 정보를 등록한다.
     * @param surveySatisFactionVO - 등록할 정보가 담긴 SurveyQuestionVO
     * @return 등록된 목록수
     */
    public int insertSurveyQuestion(SurveyQuestionVO surveyQuestionVO) throws Exception;

    /**
     * 설문 질문 정보를 수정한다.
     * @param surveySatisFactionVO - 수정할 정보가 담긴 SurveyQuestionVO
     * @return 수정된 목록수
     */
    public int updateSurveyQuestion(SurveyQuestionVO surveyQuestionVO) throws Exception;

    /**
     * 설문 질문 정보를 삭제한다.
     * @param surveySatisFactionVO - 삭제할 정보가 담긴 SurveyQuestionVO
     * @return 삭제된 목록수
     */
    public int deleteSurveyQuestion(SurveyQuestionVO surveyQuestionVO) throws Exception;

    /**
     * 설문템플릿 삭제시 설문템플릿 일련번호만으로 해당 설문템플릿과 연계된 질문을 모두 삭제한다.
     * @param surveySatisFactionVO - 삭제할 정보가 담긴 SurveyQuestionVO
     * @return 삭제된 목록수
     */
    public int deleteSurveyQuestionTotal(SurveyQuestionVO surveyQuestionVO) throws Exception;

    /**
     * 설문 미리보기 질문 목록 조회
     * @param surveySatisFactionSearchVO
     *
     */
    public List<SurveySatisFactionVO>  selectSurveyQuestionViewByCondition(SurveySatisFactionSearchVO searchVO) throws Exception;

    /**
     * 설문 답변 목록 조회
     * @param CampaignResultSearchVO
     *
     */
    public List<CampaignResultVO>  selectSurveyAnswerByCondition(CampaignResultSearchVO searchVO) throws Exception;

}
