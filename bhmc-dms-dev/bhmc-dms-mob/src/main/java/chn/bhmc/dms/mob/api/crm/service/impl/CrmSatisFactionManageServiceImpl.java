package chn.bhmc.dms.mob.api.crm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cmm.service.CrmTargExtractService;
import chn.bhmc.dms.crm.css.service.SatisFactionMobileResultService;
import chn.bhmc.dms.crm.css.service.SatisFactionTargExtractService;
import chn.bhmc.dms.crm.mcm.service.CampaignActionService;
import chn.bhmc.dms.mob.api.crm.dao.CrmSatisFactionManageDAO;
import chn.bhmc.dms.mob.api.crm.service.CrmSatisFactionManageService;
import chn.bhmc.dms.mob.api.crm.vo.SatisFactionManageSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.SatisFactionManageVO;
import chn.bhmc.dms.mob.api.crm.vo.SatisFactionMobileSearchVO;


/**
 * 만족도조사 관리 서비스 구현 클래스
 *
 * @author hyun ho kim
 * @since 2016. 03. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.11         hyun ho kim            최초 생성
 * </pre>
 */

@Service("CrmsatisFactionManageService")
public class CrmSatisFactionManageServiceImpl extends HService implements CrmSatisFactionManageService {

    /**
     * 설문 템플릿 관리 DAO
     */
    @Resource(name="CrmsatisFactionManageDAO")
    CrmSatisFactionManageDAO CrmsatisFactionManageDAO;

    /**
     * 콜센터 이관(대상자) 서비스
     */
    @Resource(name="campaignActionService")
    CampaignActionService campaignActionService;

    /**
     * 만족도 설문조사 대상자 서비스
     */
    @Resource(name="satisFactionMobileResultService")
    SatisFactionMobileResultService satisFactionMobileResultService;

    /**
     * 대상자추출 서비스
     */
    @Resource(name="crmTargExtractService")
    CrmTargExtractService crmTargExtractService;

    /**
     * 대상자추출 서비스
     */
    @Resource(name="satisFactionTargExtractService")
    SatisFactionTargExtractService satisFactionTargExtractService;


    /**
     * 조회 조건에 해당하는 만족도 조사명 kendoDropDownList 구성목록을 조회한다.
     */
    @Override
    public List<SatisFactionManageVO> selectStsfIvstNmsByCondition(SatisFactionManageSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return CrmsatisFactionManageDAO.selectStsfIvstNmsByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public SatisFactionManageVO selectSurveyCdByKey(SatisFactionMobileSearchVO schMobileVO) throws Exception {
        if (StringUtils.isEmpty(schMobileVO.getsDlrCd())){schMobileVO.setsDlrCd(LoginUtil.getDlrCd());}
        return CrmsatisFactionManageDAO.selectSurveyCdByKey(schMobileVO);
    }
}