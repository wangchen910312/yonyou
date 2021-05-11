package chn.bhmc.dms.crm.cif.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cif.service.CustomerRelInfoService;
import chn.bhmc.dms.crm.cif.service.dao.CustomerRelInfoDAO;
import chn.bhmc.dms.crm.cif.vo.CustomerRelInfoVO;


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
@Service("customerRelInfoService")
public class CustomerRelInfoServiceImpl extends HService implements CustomerRelInfoService {


    /*
     * 고객연계인 관리 DAO
     */
    @Resource(name="customerRelInfoDAO")
    CustomerRelInfoDAO customerRelInfoDAO;


    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoService#selectCustomerRelInfoByConditionCnt(chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO)
     */
    @Override
    public int selectCustomerRelInfoByConditionCnt(CustomerRelInfoVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getDlrCd())){searchVO.setDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getPltCd())) {searchVO.setPltCd(LoginUtil.getPltCd());}

        return customerRelInfoDAO.selectCustomerRelInfoByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerRefInfoService#selectCustomerRelInfoByCondition(chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO)
     */
    @Override
    public List<CustomerRelInfoVO> selectCustomerRelInfoByCondition(CustomerRelInfoVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getDlrCd())){searchVO.setDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getPltCd())) {searchVO.setPltCd(LoginUtil.getPltCd());}

        return customerRelInfoDAO.selectCustomerRelInfoByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoService#multiCustomerRelChg(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiCustomerRelChg(BaseSaveVO<CustomerRelInfoVO> obj) throws Exception {
        String userId = LoginUtil.getUserId();

        for(CustomerRelInfoVO customerRelInfoVO : obj.getInsertList()){
            customerRelInfoVO.setRegUsrId(userId);

            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */
            if (StringUtils.isEmpty(customerRelInfoVO.getDlrCd())){customerRelInfoVO.setDlrCd(LoginUtil.getDlrCd());}
            if (StringUtils.isEmpty(customerRelInfoVO.getPltCd())) {customerRelInfoVO.setPltCd(LoginUtil.getPltCd());}

            customerRelInfoDAO.insertCustomerRel(customerRelInfoVO);
        }

        for(CustomerRelInfoVO customerRelInfoVO : obj.getUpdateList()){

            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */
            if (StringUtils.isEmpty(customerRelInfoVO.getDlrCd())){customerRelInfoVO.setDlrCd(LoginUtil.getDlrCd());}
            if (StringUtils.isEmpty(customerRelInfoVO.getPltCd())) {customerRelInfoVO.setPltCd(LoginUtil.getPltCd());}
            customerRelInfoVO.setUpdtUsrId(userId);
            customerRelInfoDAO.updateCustomerRel(customerRelInfoVO);
        }

        for(CustomerRelInfoVO customerRelInfoVO : obj.getDeleteList()){

            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */
            if (StringUtils.isEmpty(customerRelInfoVO.getDlrCd())){customerRelInfoVO.setDlrCd(LoginUtil.getDlrCd());}
            if (StringUtils.isEmpty(customerRelInfoVO.getPltCd())) {customerRelInfoVO.setPltCd(LoginUtil.getPltCd());}
            customerRelInfoDAO.deleteCustomerRel(customerRelInfoVO);
        }

    }




}
