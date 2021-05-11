package chn.bhmc.dms.crm.cif.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cif.service.CustomerGroupService;
import chn.bhmc.dms.crm.cif.service.dao.CustomerGroupDAO;
import chn.bhmc.dms.crm.cif.vo.CustomerGroupSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerGroupVO;

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
@Service("customerGroupService")
public class CustomerGroupServiceImpl extends HService implements CustomerGroupService {

    /**
     * 고객그룹 관리 DAO
     */
	@Resource(name="customerGroupDAO")
	CustomerGroupDAO customerGroupDAO;

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectCustomerGroupByConditionCnt(CustomerGroupSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        //if (StringUtils.isEmpty(searchVO.getsPltCd())) {searchVO.setsPltCd(LoginUtil.getPltCd());}

        return customerGroupDAO.selectCustomerGroupByConditionCnt(searchVO);
    }

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

        return customerGroupDAO.selectCustomerGroupByCondition(searchVO);
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
        return customerGroupDAO.selectCustomerGroupByKey(customerGroupVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerGroupService#multiCustomerGroup(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiCustomerGroup(BaseSaveVO<CustomerGroupVO> obj) throws Exception {
        String userId = LoginUtil.getUserId();

        for(CustomerGroupVO customerGroupVO : obj.getInsertList()){
            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */
            if (StringUtils.isEmpty(customerGroupVO.getDlrCd())){customerGroupVO.setDlrCd(LoginUtil.getDlrCd());}
            //if (StringUtils.isEmpty(customerGroupVO.getPltCd())) {customerGroupVO.setPltCd(LoginUtil.getPltCd());}
            customerGroupVO.setUsrId(userId);
            customerGroupVO.setRegUsrId(userId);


            customerGroupDAO.insertCustomerGroup(customerGroupVO);
        }

        for(CustomerGroupVO customerGroupVO : obj.getUpdateList()){
            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */
            if (StringUtils.isEmpty(customerGroupVO.getDlrCd())){customerGroupVO.setDlrCd(LoginUtil.getDlrCd());}
            //if (StringUtils.isEmpty(customerGroupVO.getPltCd())) {customerGroupVO.setPltCd(LoginUtil.getPltCd());}
            customerGroupVO.setRegUsrId(userId);

            customerGroupDAO.updateCustomerGroup(customerGroupVO);
        }

        for(CustomerGroupVO customerGroupVO : obj.getDeleteList()){
            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */
            if (StringUtils.isEmpty(customerGroupVO.getDlrCd())){customerGroupVO.setDlrCd(LoginUtil.getDlrCd());}
            //if (StringUtils.isEmpty(customerGroupVO.getPltCd())) {customerGroupVO.setPltCd(LoginUtil.getPltCd());}

            customerGroupDAO.deleteCustomerGroup(customerGroupVO);
        }
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerGroupService#multiCustomerGroup(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiCustomerGroupInfo(BaseSaveVO<CustomerGroupVO> obj) throws Exception {
        String userId = LoginUtil.getUserId();

        if (obj.getInsertList().size() >= 1){
            String custNo   = obj.getInsertList().get(0).getCustNo();
            String grpTp    = obj.getInsertList().get(0).getGrpTp();
            String dlrCd    = obj.getInsertList().get(0).getDlrCd();
            String pltCd    = obj.getInsertList().get(0).getPltCd();

            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */
            if (StringUtils.isEmpty(dlrCd)) { dlrCd = LoginUtil.getDlrCd(); }

            if (StringUtils.isEmpty(pltCd)) { pltCd = LoginUtil.getPltCd(); }

            // 기존에 그룹,태그를 삭제 한다.
            customerGroupDAO.deleteCustomerGroupInfo(custNo, grpTp, dlrCd, pltCd);

            for(CustomerGroupVO customerGroupVO : obj.getInsertList()){

                /*
                 * dlrCd, pltCd 체크해서 기본 셋팅 시작
                 */
                if (StringUtils.isEmpty(customerGroupVO.getDlrCd())) {customerGroupVO.setDlrCd(LoginUtil.getDlrCd());}
                //if (StringUtils.isEmpty(customerGroupVO.getPltCd())) {customerGroupVO.setPltCd(LoginUtil.getPltCd());}

                customerGroupVO.setUsrId(userId);
                customerGroupVO.setRegUsrId(userId);
                customerGroupVO.setCustNo(custNo);

                customerGroupDAO.insertCustomerGroupInfo(customerGroupVO);
            }
        }


/*
        for(CustomerGroupVO customerGroupVO : obj.getUpdateList()){
            customerGroupVO.setRegUsrId(userId);
            customerGroupDAO.updateCustomerGroup(customerGroupVO);
        }
        for(CustomerGroupVO customerGroupVO : obj.getDeleteList()){
            customerGroupDAO.deleteCustomerGroup(customerGroupVO);
        }
*/
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerGroupService#multiCustomerGroup(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiCustomerGroupChg(BaseSaveVO<CustomerGroupVO> obj) throws Exception {
        String userId = LoginUtil.getUserId();

        /*
        for(CustomerGroupVO customerGroupVO : obj.getInsertList()){
            customerGroupVO.setUsrId(userId);
            customerGroupVO.setRegUsrId(userId);
            customerGroupDAO.insertCustomerGroup(customerGroupVO);
        }
        for(CustomerGroupVO customerGroupVO : obj.getDeleteList()){
            customerGroupDAO.deleteCustomerGroup(customerGroupVO);
        }
        */

        for(CustomerGroupVO customerGroupVO : obj.getUpdateList()){

            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */
            if (StringUtils.isEmpty(customerGroupVO.getDlrCd())){customerGroupVO.setDlrCd(LoginUtil.getDlrCd());}
            //if (StringUtils.isEmpty(customerGroupVO.getPltCd())) {customerGroupVO.setPltCd(LoginUtil.getPltCd());}

            customerGroupVO.setRegUsrId(userId);

            customerGroupDAO.updateCustomerGroupChg(customerGroupVO);
        }

    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerGroupService#selectCustomerInGroupByConditionCnt(chn.bhmc.dms.crm.cif.vo.CustomerGroupSearchVO)
     */
    @Override
    public int selectCustomerInGroupByConditionCnt(CustomerGroupSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        //if (StringUtils.isEmpty(searchVO.getsPltCd())) {searchVO.setsPltCd(LoginUtil.getPltCd());}

        String userId = LoginUtil.getUserId();
        searchVO.setsUsrId(userId);
        return customerGroupDAO.selectCustomerInGroupByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerGroupService#selectCustomerInGroupByCondition(chn.bhmc.dms.crm.cif.vo.CustomerGroupSearchVO)
     */
    @Override
    public List<CustomerGroupVO> selectCustomerInGroupByCondition(CustomerGroupSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        //if (StringUtils.isEmpty(searchVO.getsPltCd())) {searchVO.setsPltCd(LoginUtil.getPltCd());}

        String userId = LoginUtil.getUserId();
        searchVO.setsUsrId(userId);
        return customerGroupDAO.selectCustomerInGroupByCondition(searchVO);
    }

}
