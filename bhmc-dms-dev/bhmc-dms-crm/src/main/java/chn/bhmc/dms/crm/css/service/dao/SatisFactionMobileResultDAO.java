package chn.bhmc.dms.crm.css.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.css.vo.SatisFactionMobileResultSearchVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionMobileResultVO;
import chn.bhmc.dms.crm.css.vo.SurveySatisFactionSearchVO;
import chn.bhmc.dms.crm.css.vo.SurveySatisFactionVO;

/**
 * 만족도설문결과에 관한 데이터처리 매퍼 클래스
 *
 * @author hyun ho kim
 * @since 2016. 03. 18.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.18         hyun ho kim            최초 생성
 * </pre>
 */

@Mapper("satisFactionMobileResultDAO")
public interface SatisFactionMobileResultDAO {

    /**
     * 설문 응답  정보를 등록한다.
     * @param satisFactionMobileResultVO - 등록할 정보가 담긴 SatisFactionMobileResultVO
     * @return 등록된 목록수
     */
    public int insertSurveyResult(SatisFactionMobileResultVO SatisFactionMobileResultVO) throws Exception;


    /**
     * 만족도설문 결과 등록을 위한 시퀀스 추출
     * @param satisFactionMobileResultVO - 등록할 정보가 담긴 SatisFactionMobileResultVO
     * @return 등록된 목록수
     */
    public int selectStsfIvstRsltSeq(SatisFactionMobileResultSearchVO satisFactionMobileResultSearchVO) throws Exception;

    /**
     * 만족도설문 결과 등록을 위한 시퀀스 추출
     * @param satisFactionMobileResultVO - 등록할 정보가 담긴 SatisFactionMobileResultVO
     * @return 등록된 목록수
     */
    public int selectUseSurvey(SatisFactionMobileResultSearchVO satisFactionMobileResultSearchVO) throws Exception;

    /**
     * 설문결과 응답한 문항까지 있는지 확인여부
     * @param satisFactionMobileSearchVO - 조회할 정보가 담긴 SatisFactionMobileResultSearchVO
     * @return 확인여부
     */
    public int selectUseSurveyDetail(SatisFactionMobileResultSearchVO searchVO) throws Exception;

    /**
     * 만족도 조사결과 현황에서 조회 조건에 해당하는 설문결과 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SatisFactionMobileResultSearchVO
     * @return
     */
    public int selectSatisFactionPresentsByConditionCnt(SatisFactionMobileResultSearchVO searchVO) throws Exception;

    /**
     * 만족도 조사결과 현황에서 조회 조건에 해당하는 설문결과 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SatisFactionMobileResultSearchVO
     * @return 조회 목록
     */
    public List<SatisFactionMobileResultVO> selectSatisFactionPresentsByCondition(SatisFactionMobileResultSearchVO searchVO) throws Exception;

    /**
     * 만족도 조사결과 현황에서 설문항목 상세결과  정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SatisFactionMobileResultSearchVO
     * @return 조회 목록
     */
    public List<SatisFactionMobileResultVO> selectSurveyResultsByCondition(SatisFactionMobileResultSearchVO searchVO) throws Exception;

    /**
     * 만족도 조사결과 현황의 낮은점수 처리를 수정한다.
     * @param satisFactionMonileResultVO - 수정할 정보가 담긴 SatisFactionMobileResultVO
     * @return 수정된 목록수
     */
    public int updateSatisFactionPresent(SatisFactionMobileResultVO satisFactionMobileResultVO) throws Exception;

    /**
     * 만족도 조사 현황에서 대상자목록  총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SatisFactionMobileResultSearchVO
     * @return
     */
    public int selectSurveyCustResultsByConditionCnt(SatisFactionMobileResultSearchVO searchVO) throws Exception;

    /**
     * 만족도 조사 현황에서 대상자목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SatisFactionMobileResultSearchVO
     * @return 조회 목록
     */
    public List<SatisFactionMobileResultVO> selectSurveyCustResultsByCondition(SatisFactionMobileResultSearchVO searchVO) throws Exception;


    /**
     * 추출한 대상자를 등록한다.
     * @param satisFactionMobileResultVO - 등록할 정보가 담긴 SatisFactionMobileResultVO
     * @return 등록된 목록수
     */
    public int insertSatisFactionManageTargExtUsr(SatisFactionMobileResultVO satisFactionMobileResultVO) throws Exception;

    /**
     * 대상자 정보를 삭제한다.
     * @param satisFactionMonileResultVO - 삭제할 정보가 담긴 SatisFactionMobileResultVO
     * @return 삭제된 목록수
     */
    public int deleteSatisFactionMobileResult(SatisFactionMobileResultVO satisFactionMobileResultVO) throws Exception;

    /** 20170705 이인문 사용안함
     * 만족도 조사 대상자의 콜센터 결과를 업데이트 한다.
     * @param satisFactionMonileResultVO - 수정할 정보가 담긴 SatisFactionMobileResultVO
     * @return 수정된 목록수
     */
//    public int updateCallCenRslt(SatisFactionMobileResultVO satisFactionMobileResultVO) throws Exception;

    /**
     * 만족도 조사결과 무효처리를 한다.
     * @param satisFactionMobileResultVO
     * @return 수정된 목록수
     */
    public int updateStsfResultInvalidity(SatisFactionMobileResultVO satisFactionMobileResultVO) throws Exception;

    /**
     * 설문 응답 점수 정보를 수정한다.
     * @param satisFactionMonileVO - 수정할 정보가 담긴 SatisFactionMobileVO
     * @return 수정된 목록수
     */
    public int updateSurveyResultScore(SatisFactionMobileResultVO satisFactionMobileResultVO) throws Exception;

    /**
     * 만족도 조사 낮은점수 관리 처리
     * @param resultVO - 만족도 조사결과 현황 SatisFactionMobileResultVO
     * @return
     */
    public int updateVocResult(SatisFactionMobileResultVO SatisFactionMobileResultVO) throws Exception;

    /**
     * 콜센터 콜처리완료여부(CALL_PROC_END_YN)가 Y 이면 콜내용(CALL_CONT)을 각 업무 콜센터결과내용(CALL_CEN_RSLT_CONT) 에 업데이트 해준다.
     *
     * @param satisFactionMobileResultVO
     * @return
     */
    public int updateCallCenRsltCont(SatisFactionMobileResultVO satisFactionMobileResultVO);

    /**
     * 만족도 조사 객관식 답안결과 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SatisFactionMobileResultSearchVO
     * @return 조회 목록
     */
    public List<SurveySatisFactionVO> selectShortQuestionResultsByCondition(SurveySatisFactionSearchVO searchVO) throws Exception;

    /**
     * 만족도 조사 주관식 답안결과 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SatisFactionMobileResultSearchVO
     * @return
     */
    public int selectMultipleQuestionResultsByConditionCnt(SatisFactionMobileResultSearchVO searchVO) throws Exception;

    /**
     * 만족도 조사 주관식 답안결과 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SatisFactionMobileResultSearchVO
     * @return 조회 목록
     */
    public List<SatisFactionMobileResultVO> selectMultipleQuestionResultsByCondition(SatisFactionMobileResultSearchVO searchVO) throws Exception;


    // 만족도 조사 질문 목록
    public List<String> selectSurveyResultDtlHeaderByCondition(SatisFactionMobileResultSearchVO searchVO) throws Exception;


    /**
     * 만족도 조사 결과 대상자 정보 목록
     * @param searchVO
     * @return 만족도 조사 결과 대상자 정보 목록
     */
    public int selectSurveyResultDtlInfoByConditionCnt(SatisFactionMobileResultSearchVO searchVO) throws Exception;

    /**
     * 만족도 조사 결과 대상자 정보 목록
     * @param searchVO
     * @return 만족도 조사 결과 대상자 정보 목록
     */
    public List<SatisFactionMobileResultVO> selectSurveyResultDtlInfoByCondition(SatisFactionMobileResultSearchVO searchVO) throws Exception;

    /**
     * 만족도 조사 답변 목록
     * @param searchVO
     * @return 만족도 조사 답변 목록
     */
    public List<SatisFactionMobileResultVO> selectSurveyResultDtlByCondition(SatisFactionMobileResultSearchVO searchVO) throws Exception;

    /**
     * 만족도 조사 결과 정보
     * @param searchVO
     * @return 만족도 조사 결과 정보
     */
    public SatisFactionMobileResultVO selectSurveyResultInfoByKey(SatisFactionMobileResultSearchVO searchVO) throws Exception;


}
