package chn.bhmc.dms.mob.api.crm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cmm.service.RegularExpressionService;
import chn.bhmc.dms.mob.api.crm.dao.CrmCustomerRelInfoDAO;
import chn.bhmc.dms.mob.api.crm.service.CrmCustomerRelInfoService;
import chn.bhmc.dms.mob.api.crm.vo.CustomerRelInfoSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.CustomerRelInfoVO;


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
@Service("CrmcustomerRelInfoService")
public class CrmCustomerRelInfoServiceImpl extends HService implements CrmCustomerRelInfoService {


    /*
     * 고객연계인 관리 DAO
     */
    @Resource(name="CrmcustomerRelInfoDAO")
    CrmCustomerRelInfoDAO CrmcustomerRelInfoDAO;

    /*
     * 정규식 관리 서비스
     */
    @Resource(name="regularExpressionService")
    RegularExpressionService regularExpressionService;


    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoService#selectCustomerRelInfoByConditionCnt(chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO)
     */
    @Override
    public int selectCustomerRelInfoByConditionCnt(CustomerRelInfoSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return CrmcustomerRelInfoDAO.selectCustomerRelInfoByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerRefInfoService#selectCustomerRelInfoByCondition(chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO)
     */
    @Override
    public List<CustomerRelInfoVO> selectCustomerRelInfoByCondition(CustomerRelInfoSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return CrmcustomerRelInfoDAO.selectCustomerRelInfoByCondition(searchVO);
    }




}
