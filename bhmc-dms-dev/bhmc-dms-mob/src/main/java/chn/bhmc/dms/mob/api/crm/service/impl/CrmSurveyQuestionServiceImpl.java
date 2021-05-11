package chn.bhmc.dms.mob.api.crm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.css.service.SurveyAnswerService;
import chn.bhmc.dms.mob.api.crm.dao.CrmSurveyQuestionDAO;
import chn.bhmc.dms.mob.api.crm.service.CrmSurveyQuestionService;
import chn.bhmc.dms.mob.api.crm.vo.SurveySatisFactionSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.SurveySatisFactionVO;

/**
 * 설문질문 서비스 구현 클래스
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

@Service("CrmsurveyQuestionService")
public class CrmSurveyQuestionServiceImpl extends HService implements CrmSurveyQuestionService {

    /**
     * 설문 질문 DAO
     */
	@Resource(name="CrmsurveyQuestionDAO")
	CrmSurveyQuestionDAO CrmsurveyQuestionDAO;

	/**
     * 설문 답변 서비스
     */
    @Resource(name="surveyAnswerService")
    SurveyAnswerService surveyAnswerService;

    /**
     * 설문 미리보기 질문 목록 조회
     */
    @Override
    public List<SurveySatisFactionVO> selectSurveyQuestionViewByCondition(SurveySatisFactionSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return CrmsurveyQuestionDAO.selectSurveyQuestionViewByCondition(searchVO);
    }

    /**
     * 설문 질문 조회
     */
    /*@Override
    public SurveyQuestionVO selectSurveyQuestionByKey(int subyTmplSeq, int subyTmplQestSeq) throws Exception {
        return surveyQuestionDAO.selectSurveyQuestionByKey( Integer.toString(subyTmplSeq),Integer.toString(subyTmplQestSeq));
    }*/

}
