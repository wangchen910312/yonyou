package chn.bhmc.dms.crm.css.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.crm.css.vo.SurveyAnswerSearchVO;
import chn.bhmc.dms.crm.css.vo.SurveyAnswerVO;
import chn.bhmc.dms.crm.css.vo.SurveySatisFactionSearchVO;
import chn.bhmc.dms.crm.css.vo.SurveySatisFactionVO;

/**
 * 설문 보기 서비스
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

public interface SurveyAnswerService {

    /**
     * 조회 조건에 해당하는 설문 보기정보 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SurveyAnswerSearchVO
     * @return
     */
    public int selectSurveyAnswersByConditionCnt(SurveyAnswerSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 설문 보기 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SurveyAnswerSearchVO
     * @return 조회 목록
     */
    public List<SurveyAnswerVO> selectSurveyAnswersByCondition(SurveyAnswerSearchVO searchVO) throws Exception;

    /**
     * 설문 보기 정보를 등록/수정/삭제 처리한다.
     * @param SurveySatisFactionVO
     */
    public void multiSurveyAnswers(BaseSaveVO<SurveyAnswerVO> surveySatisFactionVO) throws Exception;

    /**
     * 설문 보기 정보를 등록한다.
     * @param surveySatisFactionVO - 등록할 정보가 담긴 SurveyAnswerVO
     * @return 등록된 목록수
     */
    public int insertSurveyAnswer(SurveyAnswerVO surveyAnswerVO) throws Exception;

    /**
     * 설문 보기 정보를 수정한다.
     * @param surveySatisFactionVO - 수정할 정보가 담긴 SurveyAnswerVO
     * @return 수정된 목록수
     */
    public int updateSurveyAnswer(SurveyAnswerVO surveyAnswerVO) throws Exception;

    /**
     * 설문 보기 정보를 삭제한다.
     * @param surveySatisFactionVO - 삭제할 정보가 담긴 SurveyAnswerVO
     * @return 삭제된 목록수
     */
    public int deleteSurveyAnswer(SurveyAnswerVO surveyAnswerVO) throws Exception;

    /**
     * 설문 질문삭제시 하위 답변정보를 삭제한다.
     * @param surveySatisFactionVO - 삭제할 정보가 담긴 SurveyAnswerVO
     * @return 삭제된 목록수
     */
    public int deleteSurveyQestAnswer(SurveyAnswerVO surveyAnswerVO) throws Exception;

    /**
     * 설문템플릿 삭제시 설문템플릿 일련번호만으로 해당 설문템플릿과 연계된 답변을 모두 삭제한다.
     * @param surveySatisFactionVO - 삭제할 정보가 담긴 SurveyAnswerVO
     * @return 삭제된 목록수
     */
    public int deleteSurveyQestAnswerTotal(SurveyAnswerVO surveyAnswerVO) throws Exception;

    /**
     * 설문 미리보기 답변 목록 조회
     * @param testDriveResvVO
     *
     */
    public List<SurveySatisFactionVO> selectSurveyAnswerViewByCondition(SurveySatisFactionSearchVO searchVO) throws Exception;
}
