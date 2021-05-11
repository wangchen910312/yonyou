package chn.bhmc.dms.crm.mcm.service.dao;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.mcm.vo.MarketingCampaignVO;

/**
 * 마케팅 캠페인 복사에 관한 데이터처리 매퍼 클래스
 *
 * @author in moon lee
 * @since 2017.02.11
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2017.02.11         in moon lee            최초 생성
 * </pre>
 */

@Mapper("marketingCampaignCopyDAO")
public interface MarketingCampaignCopyDAO {


    /**
     * 마케팅 정보 복사 : 기본정보
     * @param MarketingCampaignVO -  sMakNo, sCopyNewMakCd
     * @return 등록된 목록수
     */
    public int copyMarketingCampaign(MarketingCampaignVO marketingCampaignVO) throws Exception;

    /**
     * 마케팅 캠페인 복사 : 목표
     * @param MarketingCampaignVO -  sMakNo, sCopyNewMakCd
     * @return 등록된 목록수
     */
    public int copyMarketingCampaignGoal(MarketingCampaignVO marketingCampaignVO) throws Exception;

    /**
     * 마케팅 캠페인 복사 : 대상 > 추출실행 목록 목표
     * @param MarketingCampaignVO -  sMakNo, sCopyNewMakCd
     * @return 등록된 목록수
     */
    public int copyMarketingCampaignTarget(MarketingCampaignVO marketingCampaignVO) throws Exception;

    /**
     * 마케팅 캠페인 복사 : 예산 > 예산(위안)정보
     * @param MarketingCampaignVO -  sMakNo, sCopyNewMakCd
     * @return 등록된 목록수
     */
    public int copyMarketingCampaignBudget(MarketingCampaignVO marketingCampaignVO) throws Exception;

}