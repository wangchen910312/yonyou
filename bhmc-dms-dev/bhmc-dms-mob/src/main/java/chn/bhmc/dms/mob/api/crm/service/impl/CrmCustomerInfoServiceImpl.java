package chn.bhmc.dms.mob.api.crm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.api.crm.dao.CrmCustomerInfoDAO;
import chn.bhmc.dms.mob.api.crm.service.CrmCustomerInfoService;
import chn.bhmc.dms.mob.api.crm.vo.CustomerInfoSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.CustomerInfoVO;

/**
 * 고객그룹관리 관리 서비스 구현 클래스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 4.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.05         Kyo Jin Lee            최초 생성
 *
 */
@Service("CrmcustomerInfoService")
public class CrmCustomerInfoServiceImpl extends HService implements CrmCustomerInfoService{

    /*
     * 고객정보 관리 DAO
     */
    @Resource(name="CrmcustomerInfoDAO")
    CrmCustomerInfoDAO CrmcustomerInfoDAO;

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoService#selectCustomerInfoHistoryByConditionCnt(chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO)
     */
    @Override
    public int selectCustomerInfoHistoryByConditionCnt(CustomerInfoSearchVO searchVO) throws Exception {

        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return CrmcustomerInfoDAO.selectCustomerInfoHistoryByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoService#selectCustomerInfoHistoryByCondition(chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO)
     */
    @Override
    public List<CustomerInfoVO> selectCustomerInfoHistoryByCondition(CustomerInfoSearchVO searchVO) throws Exception {

        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return CrmcustomerInfoDAO.selectCustomerInfoHistoryByCondition(searchVO);

    }

}
