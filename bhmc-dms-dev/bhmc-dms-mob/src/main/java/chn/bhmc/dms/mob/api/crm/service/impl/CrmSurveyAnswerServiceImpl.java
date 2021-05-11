package chn.bhmc.dms.mob.api.crm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.mob.api.crm.dao.CrmSurveyAnswerDAO;
import chn.bhmc.dms.mob.api.crm.service.CrmSurveyAnswerService;
import chn.bhmc.dms.mob.api.crm.vo.SurveySatisFactionSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.SurveySatisFactionVO;

/**
 * 설문보기 서비스 구현 클래스
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

@Service("CrmsurveyAnswerService")
public class CrmSurveyAnswerServiceImpl extends HService implements CrmSurveyAnswerService {

    /**
     * 설문 템플릿 관리 DAO
     */
	@Resource(name="CrmsurveyAnswerDAO")
	CrmSurveyAnswerDAO CrmsurveyAnswerDAO;

    /**
     * 설문 미리보기 답변 목록 조회
     */
    @Override
    public List<SurveySatisFactionVO> selectSurveyAnswerViewByCondition(SurveySatisFactionSearchVO searchVO) throws Exception {
        return CrmsurveyAnswerDAO.selectSurveyAnswerViewByCondition(searchVO);
    }

    /**
     * 설문 보기 조회
     */
    /*@Override
    public SurveyAnswerVO selectSurveyAnswerByKey(int subyTmplSeq, int subyTmplQestSeq) throws Exception {
        return surveyAnswerDAO.selectSurveyAnswerByKey( Integer.toString(subyTmplSeq),Integer.toString(subyTmplQestSeq));
    }*/

    /*private void settingDrlInfo( LoginUtil loginUtil ,SurveyAnswerSearchVO searchVO, SurveyAnswerVO saveVO ){

    }*/

}
