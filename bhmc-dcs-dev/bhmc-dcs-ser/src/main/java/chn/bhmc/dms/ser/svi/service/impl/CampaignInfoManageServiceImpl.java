package chn.bhmc.dms.ser.svi.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.ser.svi.service.CampaignInfoManageService;
import chn.bhmc.dms.ser.svi.service.dao.CampaignInfoManageDAO;
import chn.bhmc.dms.ser.svi.vo.CampaignDetailVO;
import chn.bhmc.dms.ser.svi.vo.CampaignMasterVO;
import chn.bhmc.dms.ser.svi.vo.CampaignSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CampaignInfoManageServiceImpl.java
 * @Description : 캠페인 정보 관리 구현 클래스
 * @author Kwon Ki Hyun
 * @since 2016. 2. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 19.     Kwon Ki Hyun     최초 생성
 * </pre>
 */
@Service("campaignInfoManageService")
public class CampaignInfoManageServiceImpl extends HService implements CampaignInfoManageService{

    @Resource(name="campaignInfoManageDAO")
    CampaignInfoManageDAO campaignInfoManageDAO;
    /*
     * {@inheritDoc}
     */
    @Override
    public int selectCampaignInfoManagesByConditionCnt(CampaignSearchVO searchVO) throws Exception {
        
//        searchVO.setsCrStartDt(DateUtil.getDate(searchVO.getsCrStartDt(), "yyyy-mm-dd", "yyyymmdd"));
//        searchVO.setsCrEndDt(DateUtil.getDate(searchVO.getsCrEndDt(), "yyyy-mm-dd", "yyyymmdd"));

        return campaignInfoManageDAO.selectCampaignInfoManagesByConditionCnt(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<CampaignMasterVO> selectCampaignInfoManagesByCondition(CampaignSearchVO searchVO) throws Exception {
        
        // TODO [권기현] 언어관련 설정
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
         return campaignInfoManageDAO.selectCampaignInfoManagesByCondition(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public int selectCampaignInfosDetailByConditionCnt(CampaignSearchVO searchVO) throws Exception {

        return campaignInfoManageDAO.selectCampaignInfosDetailByConditionCnt(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<CampaignDetailVO> selectCampaignInfosDetailByCondition(CampaignSearchVO searchVO) throws Exception {
        
        return campaignInfoManageDAO.selectCampaignInfosDetailByCondition(searchVO);
    }
    
    
    
    
    
    

}
