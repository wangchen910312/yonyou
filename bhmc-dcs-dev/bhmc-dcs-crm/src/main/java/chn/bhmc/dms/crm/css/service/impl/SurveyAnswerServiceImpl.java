package chn.bhmc.dms.crm.css.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.i18n.ReloadableDataSourceResourceBundleMessageSource;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.css.service.SurveyAnswerService;
import chn.bhmc.dms.crm.css.service.dao.SurveyAnswerDAO;
import chn.bhmc.dms.crm.css.vo.SurveyAnswerSearchVO;
import chn.bhmc.dms.crm.css.vo.SurveyAnswerVO;
import chn.bhmc.dms.crm.css.vo.SurveySatisFactionSearchVO;
import chn.bhmc.dms.crm.css.vo.SurveySatisFactionVO;

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

@Service("surveyAnswerService")
public class SurveyAnswerServiceImpl extends HService implements SurveyAnswerService {

    /**
     * 설문 템플릿 관리 DAO
     */
	@Resource(name="surveyAnswerDAO")
	SurveyAnswerDAO surveyAnswerDAO;

	/**
     * 메시지 관리
     */
	@Resource(name="dataSourceMessageSource")
    ReloadableDataSourceResourceBundleMessageSource dataSourceMessageSource;

    /**
     * 설문 보기 목록 수량 조회
     */
    @Override
    public int selectSurveyAnswersByConditionCnt(SurveyAnswerSearchVO searchVO) throws Exception {
        // TODO Auto-generated method stub
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsPltCd(LoginUtil.getPltCd());
        return surveyAnswerDAO.selectSurveyAnswersByConditionCnt(searchVO);
    }

    /**
     * 설문 보기 목록 조회
     */
    @Override
    public List<SurveyAnswerVO> selectSurveyAnswersByCondition(SurveyAnswerSearchVO searchVO)
            throws Exception {
        // TODO Auto-generated method stub
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsPltCd(LoginUtil.getPltCd());
        return surveyAnswerDAO.selectSurveyAnswersByCondition(searchVO);
    }

    /**
     * 설문 보기 등록/수정/삭제 처리
     */
    @Override
    public void multiSurveyAnswers(BaseSaveVO<SurveyAnswerVO> obj) throws Exception {

        String userId = LoginUtil.getUserId();

        for(SurveyAnswerVO surveyAnswerVO : obj.getInsertList()){
            surveyAnswerVO.setRegUsrId(userId);
            surveyAnswerVO.setDlrCd(LoginUtil.getDlrCd());
            insertSurveyAnswer(surveyAnswerVO);
        }

        for(SurveyAnswerVO surveyAnswerVO : obj.getUpdateList()){
            surveyAnswerVO.setUpdtUsrId(userId);
            updateSurveyAnswer(surveyAnswerVO);
        }

        for(SurveyAnswerVO surveyAnswerVO : obj.getDeleteList()){
            deleteSurveyAnswer(surveyAnswerVO);
        }
    }

    /**
     * 설문 보기 등록
     */
    @Override
    public int insertSurveyAnswer(SurveyAnswerVO surveyAnswerVO) throws Exception {
        /*SurveyAnswerVO obj = selectSurveyAnswerByKey(surveyAnswerVO.getSubyTmplSeq());

        if(obj != null) {
            throw processException("global.err.duplicate");
        }*/

        dataSourceMessageSource.clearCache();

        return surveyAnswerDAO.insertSurveyAnswer(surveyAnswerVO);
    }

    /**
     * 설문 보기 수정
     */
    @Override
    public int updateSurveyAnswer(SurveyAnswerVO surveyAnswerVO) throws Exception {
        dataSourceMessageSource.clearCache();
        return surveyAnswerDAO.updateSurveyAnswer(surveyAnswerVO);
    }

    /**
     * 설문 보기 삭제
     */
    @Override
    public int deleteSurveyAnswer(SurveyAnswerVO surveyAnswerVO) throws Exception {
        dataSourceMessageSource.clearCache();
        return surveyAnswerDAO.deleteSurveyAnswer(surveyAnswerVO);
    }

    /**
     * 설문 질문삭제시 하위 답변정보를 삭제한다.
     */
    @Override
    public int deleteSurveyQestAnswer(SurveyAnswerVO surveyAnswerVO) throws Exception {
        dataSourceMessageSource.clearCache();

        return surveyAnswerDAO.deleteSurveyQestAnswer(surveyAnswerVO);
    }

    /**
     * 설문템플릿 삭제시 설문템플릿 일련번호만으로 해당 설문템플릿과 연계된 답변을 모두 삭제한다.
     */
    @Override
    public int deleteSurveyQestAnswerTotal(SurveyAnswerVO surveyAnswerVO) throws Exception {
        dataSourceMessageSource.clearCache();

        return surveyAnswerDAO.deleteSurveyQestAnswerTotal(surveyAnswerVO);
    }

    /**
     * 설문 미리보기 답변 목록 조회
     */
    @Override
    public List<SurveySatisFactionVO> selectSurveyAnswerViewByCondition(SurveySatisFactionSearchVO searchVO) throws Exception {
        return surveyAnswerDAO.selectSurveyAnswerViewByCondition(searchVO);
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
