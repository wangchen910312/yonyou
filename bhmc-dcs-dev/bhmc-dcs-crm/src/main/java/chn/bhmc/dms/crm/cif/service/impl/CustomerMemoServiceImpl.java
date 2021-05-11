package chn.bhmc.dms.crm.cif.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cif.service.CustomerMemoService;
import chn.bhmc.dms.crm.cif.service.dao.CustomerMemoDAO;
import chn.bhmc.dms.crm.cif.vo.CustomerMemoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerMemoVO;


/**
 * 메모 관리 서비스 구현 클래스
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
@Service("customerMemoService")
public class CustomerMemoServiceImpl extends HService implements CustomerMemoService {

    /*
     * 고객연계인 관리 DAO
     */
    @Resource(name="customerMemoDAO")
    CustomerMemoDAO customerMemoDAO;

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerMemoService#selectCustomerMemoByConditionCnt(chn.bhmc.dms.crm.cif.vo.CustomerMemoSearchVO)
     */
    @Override
    public int selectCustomerMemoByConditionCnt(CustomerMemoSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return customerMemoDAO.selectCustomerMemoByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerMemoService#selectCustomerMemoByCondition(chn.bhmc.dms.crm.cif.vo.CustomerMemoSearchVO)
     */
    @Override
    public List<CustomerMemoVO> selectCustomerMemoByCondition(CustomerMemoSearchVO searchVO) throws Exception {
        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return customerMemoDAO.selectCustomerMemoByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerMemoService#multiCustomerMemoChg(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiCustomerMemoChg(BaseSaveVO<CustomerMemoVO> obj) throws Exception {
        String userId = LoginUtil.getUserId();

        for(CustomerMemoVO customerMemoVO : obj.getInsertList()){
            customerMemoVO.setRegUsrId(userId);

            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */
            if (StringUtils.isEmpty(customerMemoVO.getDlrCd())){customerMemoVO.setDlrCd(LoginUtil.getDlrCd());}

            customerMemoDAO.insertCustomerMemo(customerMemoVO);
        }

        for(CustomerMemoVO customerMemoVO : obj.getUpdateList()){

            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */
            if (StringUtils.isEmpty(customerMemoVO.getDlrCd())){customerMemoVO.setDlrCd(LoginUtil.getDlrCd());}
            customerMemoVO.setUpdtUsrId(userId);
            customerMemoDAO.updateCustomerMemo(customerMemoVO);
        }

        for(CustomerMemoVO customerMemoVO : obj.getDeleteList()){

            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */
            if (StringUtils.isEmpty(customerMemoVO.getDlrCd())){customerMemoVO.setDlrCd(LoginUtil.getDlrCd());}
            customerMemoDAO.deleteCustomerMemo(customerMemoVO);
        }

    }




}
