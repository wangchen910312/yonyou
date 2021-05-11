package chn.bhmc.dms.crm.mcm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.crm.mcm.vo.CampaignResultSearchVO;
import chn.bhmc.dms.crm.mcm.vo.CampaignResultVO;

/**
 * 캠페인결과에 관한 데이터처리 매퍼 클래스
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

@Mapper("campaignResultDAO")
public interface CampaignResultDAO {

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
     * 캠페인결과(목표) 정보를 수정한다.
     * @param campaignResultVO - 수정할 정보가 담긴 CampaignResultVO
     * @return 수정된 목록수
     */
    public int updateGoalResult(CampaignResultVO campaignResultVO) throws Exception;





    /**
     * Key에 해당하는 설문조사 key 정보를 조회한다.
     * @param sSeq - 만족도 일련번호
     * @return 조회한 설문조사 key 정보
     */
    public CampaignResultVO selectSurveyByKey(@Param("sDlrCd") String sDlrCd, @Param("sPltCd") String sPltCd,  @Param("sSeq") int sSeq) throws Exception;

    /**
     * 설문 키에 해당하는 마케팅캠페인코드 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignResultSearchVO
     * @return 조회 목록
     */
    public CampaignResultVO selectSurveyMakCdByKey(CampaignResultSearchVO searchVO) throws Exception;

    /**
     * 설문 키에 해당하는 설문 질문 미리보기 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignResultSearchVO
     * @return 조회 목록
     */
    public List<CampaignResultVO> selectSurveyQuestionByCondition(CampaignResultSearchVO searchVO) throws Exception;

    /**
     * 설문 키에 해당하는 설문 답변 미리보기 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignResultSearchVO
     * @return 조회 목록
     */
    public List<CampaignResultVO> selectSurveyAnswerByCondition(CampaignResultSearchVO searchVO) throws Exception;

    /**
     * 설문 응답  정보를 등록한다.
     * @param campaignResultVO - 등록할 정보가 담긴 CampaignResultVO
     * @return 등록된 목록수
     */
    public int insertCampaignAnswerSurvey(CampaignResultVO campaignResultVO) throws Exception;

    /**
     * 마케팅 캠페인(업체평가 OR 영업사원 설문) 정보를 등록한다
     * @param campaignResultVO - 등록할 정보가 담긴 CampaignResultVO
     * @return 등록된 목록수
     */
    public int insertCropSaleEmpSurvey(CampaignResultVO campaignResultVO) throws Exception;





    /**
     * 조회 조건에 해당하는 캠페인결과(담당자 의견) 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignResultSearchVO
     * @return CampaignResultVO
     */
    public CampaignResultVO selectPrsnContByKey(CampaignResultSearchVO searchVO);

    /**
     * 캠페인결과(담당자 의견) 정보를 등록한다.
     * @param campaignResultVO - 등록할 정보가 담긴 CampaignResultVO
     * @return 등록된 목록수
     */
    public int insertPrsnCont(CampaignResultVO campaignResultVO) throws Exception;

    /**
     * 캠페인결과(담당자 의견) 정보를 수정한다.
     * @param campaignResultVO - 수정할 정보가 담긴 CampaignResultVO
     * @return 수정된 목록수
     */
    public int updatePrsnCont(CampaignResultVO campaignResultVO) throws Exception;

    /**
     * 캠페인 기본목표에 대한 결과값을 계산처리 한다.
     */
    public List<CampaignResultVO> selectCrmDefultTargSum(CampaignResultVO campaignResultVO) throws Exception;
}