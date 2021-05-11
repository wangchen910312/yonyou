package chn.bhmc.dms.mob.api.crm.service;

import java.util.List;

import chn.bhmc.dms.mob.api.crm.vo.SurveySatisFactionSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.SurveySatisFactionVO;

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

public interface CrmSurveyAnswerService {

    /**
     * 설문 미리보기 답변 목록 조회
     * @param testDriveResvVO
     *
     */
    public List<SurveySatisFactionVO> selectSurveyAnswerViewByCondition(SurveySatisFactionSearchVO searchVO) throws Exception;
}
