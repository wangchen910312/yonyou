package chn.bhmc.dms.crm.css.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.i18n.ReloadableDataSourceResourceBundleMessageSource;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.css.service.SurveyAnswerService;
import chn.bhmc.dms.crm.css.service.SurveyQuestionService;
import chn.bhmc.dms.crm.css.service.dao.SurveyQuestionDAO;
import chn.bhmc.dms.crm.css.vo.SurveyAnswerVO;
import chn.bhmc.dms.crm.css.vo.SurveyQuestionSearchVO;
import chn.bhmc.dms.crm.css.vo.SurveyQuestionVO;
import chn.bhmc.dms.crm.css.vo.SurveySatisFactionSearchVO;
import chn.bhmc.dms.crm.css.vo.SurveySatisFactionVO;

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

@Service("surveyQuestionService")
public class SurveyQuestionServiceImpl extends HService implements SurveyQuestionService {

    /**
     * 설문 질문 DAO
     */
	@Resource(name="surveyQuestionDAO")
	SurveyQuestionDAO surveyQuestionDAO;

	/**
     * 설문 답변 서비스
     */
    @Resource(name="surveyAnswerService")
    SurveyAnswerService surveyAnswerService;


	/**
     * 메시지 관리
     */
	@Resource(name="dataSourceMessageSource")
    ReloadableDataSourceResourceBundleMessageSource dataSourceMessageSource;

    /**
     * 설문 질문 목록 수량 조회
     */
    @Override
    public int selectSurveyQuestionsByConditionCnt(SurveyQuestionSearchVO searchVO) throws Exception {
        // TODO Auto-generated method stub
        return surveyQuestionDAO.selectSurveyQuestionsByConditionCnt(searchVO);
    }

    /**
     * 설문 질문 목록 조회
     */
    @Override
    public List<SurveyQuestionVO> selectSurveyQuestionsByCondition(SurveyQuestionSearchVO searchVO)
            throws Exception {
        // TODO Auto-generated method stub
        return surveyQuestionDAO.selectSurveyQuestionsByCondition(searchVO);
    }

    /**
     * 설문 질문 등록/수정/삭제 처리
     */
    @Override
    public void multiSurveyQuestions(BaseSaveVO<SurveyQuestionVO> obj) throws Exception {

        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();

        for(SurveyQuestionVO surveyQuestionVO : obj.getInsertList()){
            surveyQuestionVO.setRegUsrId(userId);
            surveyQuestionVO.setDlrCd(dlrCd);
            if(surveyQuestionVO.getQestTpCd().equals("03")){
                //주관식일 경우 가중치값 0으로 셋팅
                surveyQuestionVO.setQestWgtVal(0);
            }
            insertSurveyQuestion(surveyQuestionVO);
        }

        for(SurveyQuestionVO surveyQuestionVO : obj.getUpdateList()){
            surveyQuestionVO.setUpdtUsrId(userId);
            if(surveyQuestionVO.getQestTpCd().equals("03")){//주관식일경우
                //1. 주관식으로 변경이 하위 답변들 모두 삭제
                SurveyAnswerVO surveyAnswerVo = new SurveyAnswerVO();
                surveyAnswerVo.setSubyTmplSeq(surveyQuestionVO.getSubyTmplSeq());
                surveyAnswerVo.setSubyTmplQestSeq(surveyQuestionVO.getSubyTmplQestSeq());
                surveyAnswerVo.setDlrCd(surveyQuestionVO.getDlrCd());
                surveyAnswerService.deleteSurveyQestAnswer(surveyAnswerVo);

                //2. 주관식일 경우 가중치값 0으로 셋팅
                surveyQuestionVO.setQestWgtVal(0);
            }
            updateSurveyQuestion(surveyQuestionVO);
        }

        for(SurveyQuestionVO surveyQuestionVO : obj.getDeleteList()){
            //1. 질문에 포함된 하위 답변문항 우선삭제
            SurveyAnswerVO surveyAnswerVo = new SurveyAnswerVO();
            surveyAnswerVo.setDlrCd(surveyQuestionVO.getDlrCd());
            surveyAnswerVo.setSubyTmplSeq(surveyQuestionVO.getSubyTmplSeq());
            surveyAnswerVo.setSubyTmplQestSeq(surveyQuestionVO.getSubyTmplQestSeq());
            surveyAnswerService.deleteSurveyQestAnswer(surveyAnswerVo);

            //2. 질문삭제
            deleteSurveyQuestion(surveyQuestionVO);
        }
    }

    /**
     * 설문 질문 등록
     */
    @Override
    public int insertSurveyQuestion(SurveyQuestionVO surveyQuestionVO) throws Exception {
        /*SurveyQuestionVO obj = selectSurveyQuestionByKey(surveyQuestionVO.getSubyTmplSeq());

        if(obj != null) {
            throw processException("global.err.duplicate");
        }*/

        dataSourceMessageSource.clearCache();

        return surveyQuestionDAO.insertSurveyQuestion(surveyQuestionVO);
    }

    /**
     * 설문 질문 수정
     */
    @Override
    public int updateSurveyQuestion(SurveyQuestionVO surveyQuestionVO) throws Exception {
        dataSourceMessageSource.clearCache();
        return surveyQuestionDAO.updateSurveyQuestion(surveyQuestionVO);
    }

    /**
     * 설문 질문 삭제
     */
    @Override
    public int deleteSurveyQuestion(SurveyQuestionVO surveyQuestionVO) throws Exception {
        dataSourceMessageSource.clearCache();
        return surveyQuestionDAO.deleteSurveyQuestion(surveyQuestionVO);
    }

    /**
     * 설문템플릿 삭제시 설문템플릿 일련번호만으로 해당 설문템플릿과 연계된 질문을 모두 삭제한다.
     */
    @Override
    public int deleteSurveyQuestionTotal(SurveyQuestionVO surveyQuestionVO) throws Exception {
        dataSourceMessageSource.clearCache();
        return surveyQuestionDAO.deleteSurveyQuestionTotal(surveyQuestionVO);
    }


    /**
     * 설문 미리보기 질문 목록 조회
     */
    @Override
    public List<SurveySatisFactionVO> selectSurveyQuestionViewByCondition(SurveySatisFactionSearchVO searchVO) throws Exception {
        return surveyQuestionDAO.selectSurveyQuestionViewByCondition(searchVO);
    }

    /**
     * 설문 질문 조회
     */
    /*@Override
    public SurveyQuestionVO selectSurveyQuestionByKey(int subyTmplSeq, int subyTmplQestSeq) throws Exception {
        return surveyQuestionDAO.selectSurveyQuestionByKey( Integer.toString(subyTmplSeq),Integer.toString(subyTmplQestSeq));
    }*/

}
