package chn.bhmc.dms.mob.api.crm.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.api.crm.dao.CrmMarketingCampaignDAO;
import chn.bhmc.dms.mob.api.crm.service.CrmMarketingCampaignService;
import chn.bhmc.dms.mob.api.crm.vo.MarketingCampaignSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.MarketingCampaignVO;

/**
 * 마케팅 캠페인 관리 서비스 구현 클래스
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

@Service("CrmmarketingCampaignService")
public class CrmMarketingCampaignServiceImpl extends HService implements CrmMarketingCampaignService {

    public Map<String, Object> saveFileInfo;


    /**
     * 마케팅 캠페인 관리 DAO
     */
    @Resource(name="CrmmarketingCampaignDAO")
    CrmMarketingCampaignDAO CrmmarketingCampaignDAO;



    /**
     * 마케팅 캠페인 목록 조회
     */
    @Override
    public List<MarketingCampaignVO> selectMarketingCampaignsByCondition(MarketingCampaignSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())){searchVO.setsPltCd(LoginUtil.getPltCd());}

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        searchVO.setLangCd(langCd);

        return CrmmarketingCampaignDAO.selectMarketingCampaignsByCondition(searchVO);
        
       }      
        /**
         * 마케팅 캠페인 목록 수량 조회
         */
	   @Override
	   public int selectMarketingCampaignsByConditionCnt(MarketingCampaignSearchVO searchVO) throws Exception {
	
	        /*
	         * dlrCd, pltCd 체크해서 기본 셋팅 시작
	         */
	        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
	        if (StringUtils.isEmpty(searchVO.getsPltCd())){searchVO.setsPltCd(LoginUtil.getPltCd());}
	
	        return CrmmarketingCampaignDAO.selectMarketingCampaignsByConditionCnt(searchVO);
	    }
	   
	    /**
	     * 마케팅 캠페인 상세조회
	     */
	    @Override
	    public MarketingCampaignVO selectMarketingCampaignByKey(MarketingCampaignSearchVO searchVO) throws Exception {

	        /*
	         * dlrCd, pltCd 체크해서 기본 셋팅 시작
	         */
	        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
	        if (StringUtils.isEmpty(searchVO.getsPltCd())){searchVO.setsPltCd(LoginUtil.getPltCd());}

	        return CrmmarketingCampaignDAO.selectMarketingCampaignByKey(searchVO);
	    }

	    /**
	     * {@inheritDoc}
	     */
	    @Override
	    public List<MarketingCampaignVO> selectGoalsByCondition(MarketingCampaignSearchVO searchVO) throws Exception {

	        /*
	         * dlrCd, pltCd 체크해서 기본 셋팅 시작
	         */
	        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
	        if (StringUtils.isEmpty(searchVO.getsPltCd())){searchVO.setsPltCd(LoginUtil.getPltCd());}

	        String langCd = LocaleContextHolder.getLocale().getLanguage();
	        searchVO.setLangCd(langCd);

	        return CrmmarketingCampaignDAO.selectGoalsByCondition(searchVO);
	    }

	    /**
	     * {@inheritDoc}
	     */
	    @Override
	    public int selectGoalsByConditionCnt(MarketingCampaignSearchVO searchVO) throws Exception {

	        /*
	         * dlrCd, pltCd 체크해서 기본 셋팅 시작
	         */
	        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
	        if (StringUtils.isEmpty(searchVO.getsPltCd())){searchVO.setsPltCd(LoginUtil.getPltCd());}

	        return CrmmarketingCampaignDAO.selectGoalsByConditionCnt(searchVO);
	    }
	    
	    /**
	     * 유형 Sub 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
	     */
	    @Override
	    public List<MarketingCampaignVO> selectMakTpCdListByCondition(MarketingCampaignSearchVO searchVO) throws Exception {

	        String langCd = LocaleContextHolder.getLocale().getLanguage();
	        searchVO.setLangCd(langCd);

	        return CrmmarketingCampaignDAO.selectMakTpCdListByCondition(searchVO);
	    }



}
