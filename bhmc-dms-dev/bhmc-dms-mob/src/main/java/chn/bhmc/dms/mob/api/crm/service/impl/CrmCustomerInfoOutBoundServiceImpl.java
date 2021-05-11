package chn.bhmc.dms.mob.api.crm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import chn.bhmc.dms.mob.api.crm.dao.CrmCustomerInfoDAO;
import able.com.service.HService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.api.crm.vo.CustomerInfoVO;
import chn.bhmc.dms.mob.api.crm.service.CrmCustomerInfoOutBoundService;
import chn.bhmc.dms.mob.api.crm.vo.CustomerInfoSearchVO;


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
@Service("CrmcustomerInfoOutBoundService")
public class CrmCustomerInfoOutBoundServiceImpl extends HService implements CrmCustomerInfoOutBoundService {

    /*
     * 고객정보 관리 DAO
     */
    @Resource(name="CrmcustomerInfoDAO")
    CrmCustomerInfoDAO CrmcustomerInfoDAO;

    
    @Override
    public List<CustomerInfoVO> selectCustomerAndCarInfoByCondition(CustomerInfoSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        searchVO.setsMembershipStan(LoginUtil.getMembershipPolicy());

        return CrmcustomerInfoDAO.selectCustomerAndCarInfoByCondition(searchVO);
    }
    
    @Override
    public int selectCustomerAndCarInfoByConditionCnt(CustomerInfoSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        searchVO.setsMembershipStan(LoginUtil.getMembershipPolicy());

        return CrmcustomerInfoDAO.selectCustomerAndCarInfoByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService#selectCustomerListByConditionCnt(chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO)
     */
    @Override
    public int selectCustomerListByConditionCnt(CustomerInfoSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        searchVO.setsMembershipStan(LoginUtil.getMembershipPolicy());

        return CrmcustomerInfoDAO.selectCustomerListByConditionCnt(searchVO);
    }
    
    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService#selectCustomerListByCondition(chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO)
     */
    @Override
    public List<CustomerInfoVO> selectCustomerListByCondition(CustomerInfoSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        searchVO.setsMembershipStan(LoginUtil.getMembershipPolicy());

        return CrmcustomerInfoDAO.selectCustomerListByCondition(searchVO);
    }
    
    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService#selectCustomerInfoByConditionCnt(chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO)
     */
    @Override
    public int selectCustomerInfoByConditionCnt(CustomerInfoSearchVO searchVO) throws Exception {

        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return CrmcustomerInfoDAO.selectCustomerInfoByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService#selectCustomerInfoByCondition(chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO)
     */
    @Override
    public List<CustomerInfoVO> selectCustomerInfoByCondition(CustomerInfoSearchVO searchVO) throws Exception {

        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return CrmcustomerInfoDAO.selectCustomerInfoByCondition(searchVO);

    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService#selectCustomerInfoByConditionCnt(chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO)
     */
    @Override
    public int selectCustomerByConditionCnt(CustomerInfoSearchVO searchVO) throws Exception {

        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return CrmcustomerInfoDAO.selectCustomerByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService#selectCustomerInfoByCondition(chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO)
     */
    @Override
    public List<CustomerInfoVO> selectCustomerByCondition(CustomerInfoSearchVO searchVO) throws Exception {

        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return CrmcustomerInfoDAO.selectCustomerByCondition(searchVO);

    }

}
