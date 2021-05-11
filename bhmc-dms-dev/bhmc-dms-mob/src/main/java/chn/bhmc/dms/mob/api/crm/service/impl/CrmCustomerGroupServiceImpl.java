package chn.bhmc.dms.mob.api.crm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.api.crm.dao.CrmCustomerGroupDAO;
import chn.bhmc.dms.mob.api.crm.service.CrmCustomerGroupService;
import chn.bhmc.dms.mob.api.crm.vo.CustomerGroupSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.CustomerGroupVO;

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
@Service("CrmcustomerGroupService")
public class CrmCustomerGroupServiceImpl extends HService implements CrmCustomerGroupService {

    /**
     * 고객그룹 관리 DAO
     */
	@Resource(name="CrmcustomerGroupDAO")
	CrmCustomerGroupDAO CrmcustomerGroupDAO;

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerGroupService#selectCustomerGroupByCondition(chn.bhmc.dms.crm.cif.vo.CustomerGroupSearchVO)
     */
    @Override
    public List<CustomerGroupVO> selectCustomerGroupByCondition(CustomerGroupSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        //if (StringUtils.isEmpty(searchVO.getsPltCd())) {searchVO.setsPltCd(LoginUtil.getPltCd());}

        return CrmcustomerGroupDAO.selectCustomerGroupByCondition(searchVO);
    }
    
    /**
     * {@inheritDoc}
     */
    @Override
    public List<CustomerGroupVO> selectCustomerGroupByKey(String custNo, String grpTp, String dlrCd, String pltCd) throws Exception {
        CustomerGroupVO customerGroupVO = new CustomerGroupVO();
        customerGroupVO.setCustNo(custNo);
        customerGroupVO.setGrpTp(grpTp);
        customerGroupVO.setDlrCd(dlrCd);
        customerGroupVO.setPltCd(pltCd);
        return CrmcustomerGroupDAO.selectCustomerGroupByKey(customerGroupVO);
    }

}
