package chn.bhmc.dms.crm.mcm.service;

import java.util.List;

import chn.bhmc.dms.crm.mcm.vo.CampaignResultSaveVO;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.crm.mcm.vo.CampaignResultSearchVO;
import chn.bhmc.dms.crm.mcm.vo.CampaignResultVO;

/**
 * 캠페인결과 관리 서비스
 *
 * @author hyoung jun an
 * @since 2016. 3. 4.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.04         hyoung jun an            최초 생성
 * </pre>
 */

public interface CampaignResultService {

    /**
     * 캠페인결과 관리 목록 수량 조회
     * @param searchVO - 조회 조건을 포함하는 CampaignResultSearchVO
     * @return
     */
    public int selectCampaignResultMgmtsByConditionCnt(CampaignResultSearchVO searchVO) throws Exception;

    /**
     * 캠페인결과 관리 목록 조회
     * @param searchVO - 조회 조건을 포함하는 CampaignResultSearchVO
     * @return 조회 목록
     */
    public List<CampaignResultVO> selectCampaignResultMgmtsByCondition(CampaignResultSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 캠페인결과 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignResultSearchVO
     * @return
     */
    public int selectCampaignResultsByConditionCnt(CampaignResultSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 캠페인결과 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignResultSearchVO
     * @return 조회 목록
     */
    public List<CampaignResultVO> selectCampaignResultsByCondition(CampaignResultSearchVO searchVO) throws Exception;





    /**
     * 조회 조건에 해당하는 캠페인결과(목표) 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignResultSearchVO
     * @return
     */
    public int selectGoalResultsByConditionCnt(CampaignResultSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 캠페인결과(목표) 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignResultSearchVO
     * @return 조회 목록
     */
    public List<CampaignResultVO> selectGoalResultsByCondition(CampaignResultSearchVO searchVO) throws Exception;

    /**
     * 캠페인결과(목표) 정보를 등록/수정/삭제 처리한다.
     * @param saveVO
     */
    public void multiGoalResults(BaseSaveVO<CampaignResultVO> saveVO) throws Exception;

    /**
     * 캠페인결과(목표) 정보를 수정한다.
     * @param campaignResultVO - 수정할 정보가 담긴 CampaignResultVO
     * @return 수정된 목록수
     */
    public int updateGoalResult(CampaignResultVO campaignResultVO) throws Exception;



    /**
     * 설문 마케팅캠페인코드 조회
     * @param CampaignResultSearchVO
     *
     */
    public CampaignResultVO selectSurveyMakCdByKey(CampaignResultSearchVO searchVO) throws Exception;

    /**
     * 설문에 응답한 답변들을 등록 처리한다.(업체평가)
     * @param campaignResultVO
     */
    public void multiCampaign01AnswerSurveys(CampaignResultSaveVO saveVO) throws Exception;

    /**
     * 설문 응답 정보를 등록한다.
     * @param campaignResultVO - 등록할 정보가 담긴 CampaignResultVO
     * @return 등록된 목록수
     */
    public int insertCampaignAnswerSurvey(CampaignResultVO campaignResultVO) throws Exception;





    /**
     * 조회 조건에 해당하는 캠페인결과(담당자 의견) 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignResultSearchVO
     * @return CampaignResultVO
     */
    CampaignResultVO selectPrsnContByKey(CampaignResultSearchVO searchVO) throws Exception;

    /**
     * 캠페인결과(담당자 의견) 정보를 등록한다.
     * @param visitCustomerVO - 등록할 정보가 담긴 CampaignResultVO
     * @return 등록된 목록수
     */
    public int insertPrsnCont(CampaignResultVO visitCustomerVO) throws Exception;

    /**
     * 캠페인결과(담당자 의견) 정보를 수정한다.
     * @param visitCustomerVO - 수정할 정보가 담긴 CampaignResultVO
     * @return 수정된 목록수
     */
    public int updatePrsnCont(CampaignResultVO visitCustomerVO) throws Exception;


    /**
     * 캠페인 기본목표에 대한 결과값을 계산처리 한다.
     */
    public CampaignResultVO selectCrmDefultTargSum(CampaignResultVO campaignResultVO) throws Exception;
}