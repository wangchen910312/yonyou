package chn.bhmc.dms.crm.css.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.i18n.ReloadableDataSourceResourceBundleMessageSource;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.css.service.SatisFactionMobileResultService;
import chn.bhmc.dms.crm.css.service.SurveyAnswerService;
import chn.bhmc.dms.crm.css.service.SurveyQuestionService;
import chn.bhmc.dms.crm.css.service.SurveySatisFactionService;
import chn.bhmc.dms.crm.css.service.dao.SurveySatisFactionDAO;
import chn.bhmc.dms.crm.css.vo.SatisFactionMobileResultSearchVO;
import chn.bhmc.dms.crm.css.vo.SurveyAnswerVO;
import chn.bhmc.dms.crm.css.vo.SurveyQuestionVO;
import chn.bhmc.dms.crm.css.vo.SurveySatisFactionSearchVO;
import chn.bhmc.dms.crm.css.vo.SurveySatisFactionVO;

/**
 * 설문 템플릿 관리 서비스 구현 클래스
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

@Service("surveySatisFactionService")
public class SurveySatisFactionServiceImpl extends HService implements SurveySatisFactionService {

    /**
     * 설문 템플릿 관리 DAO
     */
	@Resource(name="surveySatisFactionDAO")
	SurveySatisFactionDAO surveySatisFactionDAO;

	/**
     * 메시지 관리
     */
	@Resource(name="dataSourceMessageSource")
    ReloadableDataSourceResourceBundleMessageSource dataSourceMessageSource;

	/**
     * 설문 질문 서비스
     */
    @Resource(name="surveyQuestionService")
    SurveyQuestionService surveyQuestionService;

    /**
     * 설문 보기 서비스
     */
    @Resource(name="surveyAnswerService")
    SurveyAnswerService surveyAnswerService;

    /**
     * 설문 결과 서비스
     */
    @Resource(name="satisFactionMobileResultService")
    SatisFactionMobileResultService satisFactionMobileResultService;

    /**
     * 설문 템플릿 목록 수량 조회
     */
    @Override
    public int selectSurveySatisFactionsByConditionCnt(SurveySatisFactionSearchVO searchVO) throws Exception {
        return surveySatisFactionDAO.selectSurveySatisFactionsByConditionCnt(searchVO);
    }

    /**
     * 설문 테플릿 목록 조회
     */
    @Override
    public List<SurveySatisFactionVO> selectSurveySatisFactionsByCondition(SurveySatisFactionSearchVO searchVO) throws Exception {
        return surveySatisFactionDAO.selectSurveySatisFactionsByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void multiSurveySatisFactions(BaseSaveVO<SurveySatisFactionVO> obj) throws Exception {

        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();

        for(SurveySatisFactionVO surveySatisFactionVO : obj.getInsertList()){
            surveySatisFactionVO.setRegUsrId(userId);
            surveySatisFactionVO.setDlrCd(dlrCd);
            insertSurveySatisFaction(surveySatisFactionVO);
        }

        for(SurveySatisFactionVO surveySatisFactionVO : obj.getUpdateList()){
            surveySatisFactionVO.setUpdtUsrId(userId);

            //해당 설문지를 사용한 결과가 있는지 확인 후 없다면 수정
            if(selectUseSurvey(surveySatisFactionVO) == 0 ){
                updateSurveySatisFaction(surveySatisFactionVO);
            }
        }

        for(SurveySatisFactionVO surveySatisFactionVO : obj.getDeleteList()){
            //해당 설문지를 사용한 결과가 있는지 확인 후 없다면 삭제
            if(selectUseSurvey(surveySatisFactionVO) == 0 ){
                //1. 답변 삭제
                SurveyAnswerVO surveyAnswerVO = new SurveyAnswerVO();
                surveyAnswerVO.setSubyTmplSeq(surveySatisFactionVO.getSubyTmplSeq());
                surveyAnswerVO.setDlrCd(surveySatisFactionVO.getDlrCd());
                surveyAnswerService.deleteSurveyQestAnswerTotal(surveyAnswerVO);

                //2. 질문 삭제
                SurveyQuestionVO surveyQuestionVO = new SurveyQuestionVO();
                surveyQuestionVO.setSubyTmplSeq(surveySatisFactionVO.getSubyTmplSeq());
                surveyQuestionVO.setDlrCd(surveySatisFactionVO.getDlrCd());
                surveyQuestionService.deleteSurveyQuestionTotal(surveyQuestionVO);

                //3. 설문지 삭제
                deleteSurveySatisFaction(surveySatisFactionVO);
            }
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int insertSurveySatisFaction(SurveySatisFactionVO surveySatisFactionVO) throws Exception {

        /*SurveySatisFactionVO obj = selectSurveySatisFactionByKey(surveySatisFactionVO.getSubyTmplSeq());

        if(obj != null) {
            throw processException("global.err.duplicate");
        }*/

        dataSourceMessageSource.clearCache();

        return surveySatisFactionDAO.insertSurveySatisFaction(surveySatisFactionVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public SurveySatisFactionVO selectSurveySatisFactionByKey(SurveySatisFactionSearchVO searchVO) throws Exception {
        return surveySatisFactionDAO.selectSurveySatisFactionByKey(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateSurveySatisFaction(SurveySatisFactionVO surveySatisFactionVO) throws Exception {
        dataSourceMessageSource.clearCache();
        return surveySatisFactionDAO.updateSurveySatisFaction(surveySatisFactionVO);
    }

    /*
     * @see chn.bhmc.dms.crm.css.service.SurveySatisFactionService#selectSurveyTmplsByCondition(chn.bhmc.dms.crm.css.vo.SurveySatisFactionSearchVO)
     */
    @Override
    public List<SurveySatisFactionVO> selectSurveyTmplsByCondition(SurveySatisFactionSearchVO searchVO) throws Exception {
        return surveySatisFactionDAO.selectSurveyTmplsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.css.service.SurveySatisFactionService#deleteSurveySatisFaction(chn.bhmc.dms.crm.css.vo.SurveySatisFactionVO)
     */
    @Override
    public int deleteSurveySatisFaction(SurveySatisFactionVO surveySatisFactionVO) throws Exception {
        dataSourceMessageSource.clearCache();
        return surveySatisFactionDAO.deleteSurveySatisFaction(surveySatisFactionVO);
    }

    public int selectUseSurvey(SurveySatisFactionVO surveySatisFactionVO) throws Exception{
        SatisFactionMobileResultSearchVO searchVO = new SatisFactionMobileResultSearchVO();
        searchVO.setsSubyTmplSeq(surveySatisFactionVO.getSubyTmplSeq());
        searchVO.setsDlrCd(surveySatisFactionVO.getDlrCd());
        int cnt = satisFactionMobileResultService.selectUseSurvey(searchVO);
        return cnt;
    }




}
