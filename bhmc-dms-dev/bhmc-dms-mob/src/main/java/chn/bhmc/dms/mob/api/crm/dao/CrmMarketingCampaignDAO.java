package chn.bhmc.dms.mob.api.crm.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.crm.vo.MarketingCampaignSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.MarketingCampaignVO;

/**
 * 마케팅 캠페인에 관한 데이터처리 매퍼 클래스
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

@Mapper("CrmmarketingCampaignDAO")
public interface CrmMarketingCampaignDAO {


    /**
     * 조회 조건에 해당하는 마케팅 캠페인 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return
     */
    public int selectMarketingCampaignsByConditionCnt(MarketingCampaignSearchVO searchVO) throws Exception;
    
    /**
     * 조회 조건에 해당하는 마케팅 캠페인 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return 조회 목록
     */
    public List<MarketingCampaignVO> selectMarketingCampaignsByCondition(MarketingCampaignSearchVO searchVO) throws Exception;
    
    /**
     * 마케팅 캠페인 상세조회
     * @param marketingCampaignVO
     */
    public MarketingCampaignVO selectMarketingCampaignByKey(MarketingCampaignSearchVO searchVO) throws Exception;
    
    /**
     * 조회 조건에 해당하는 마케팅 캠페인(목표) 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return
     */
    public int selectGoalsByConditionCnt(MarketingCampaignSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 마케팅 캠페인(목표) 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return 조회 목록
     */
    public List<MarketingCampaignVO> selectGoalsByCondition(MarketingCampaignSearchVO searchVO) throws Exception;
    
    /**
     * 유형 Sub 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
     */
    public List<MarketingCampaignVO> selectMakTpCdListByCondition(MarketingCampaignSearchVO searchVO);


}