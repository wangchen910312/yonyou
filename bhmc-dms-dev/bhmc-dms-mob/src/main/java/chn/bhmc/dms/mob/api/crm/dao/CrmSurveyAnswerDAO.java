package chn.bhmc.dms.mob.api.crm.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.crm.vo.SurveySatisFactionSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.SurveySatisFactionVO;

/**
 * 설문 보기 관리에 관한 데이터처리 매퍼 클래스
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

@Mapper("CrmsurveyAnswerDAO")
public interface CrmSurveyAnswerDAO {

    /**
     * 설문 키에 해당하는 설문 답변 미리보기 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SurveySatisFactionSearchVO
     * @return 조회 목록
     */
    public List<SurveySatisFactionVO> selectSurveyAnswerViewByCondition(SurveySatisFactionSearchVO searchVO) throws Exception;

}
