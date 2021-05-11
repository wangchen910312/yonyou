package chn.bhmc.dms.crm.cif.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.exception.BizException;
import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.core.support.eai.EaiClient;
import chn.bhmc.dms.core.support.eai.EaiSimpleMessage;
import chn.bhmc.dms.core.support.eai.schema.CommDMSDoc;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cif.service.CustomerInfoService;
import chn.bhmc.dms.crm.cif.service.CustomerInfoUpdateService;
import chn.bhmc.dms.crm.cif.service.dao.CustomerInfoUpdtReqDAO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoUpdtReqSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoUpdtReqVO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoVO;

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
@Service("customerInfoUpdateService")
public class CustomerInfoUpdateServiceImpl extends HService implements CustomerInfoUpdateService {

    /**
     * CustomerInfoService
     */
    @Resource(name="customerInfoService")
    CustomerInfoService customerInfoService;

    /**
     * CustomerInfoUpdtReqDAO
     */
    @Resource(name="customerInfoUpdtReqDAO")
    CustomerInfoUpdtReqDAO customerInfoUpdtReqDAO;

    /**
     * CustomerInfoUpdtReqDAO
     */
    @Resource(name="eaiClient")
    EaiClient eaiClient;

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoUpdateService#selectCustomerInfoReqByConditionCnt(chn.bhmc.dms.crm.cif.vo.CustomerInfoUpdtReqSearchVO)
     */
    @Override
    public int selectCustomerInfoReqByConditionCnt(CustomerInfoUpdtReqSearchVO searchVO) throws Exception {
        //if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return customerInfoUpdtReqDAO.selectCustomerInfoReqByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoUpdateService#selectCustomerInfoReqByCondition(chn.bhmc.dms.crm.cif.vo.CustomerInfoUpdtReqSearchVO)
     */
    @Override
    public List<CustomerInfoUpdtReqVO> selectCustomerInfoReqByCondition(CustomerInfoUpdtReqSearchVO searchVO)
            throws Exception {
        //if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsLangCd())){searchVO.setsLangCd(LoginUtil.getLangCd());}
        return customerInfoUpdtReqDAO.selectCustomerInfoReqByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoUpdateService#insertCustomerInfoReq(chn.bhmc.dms.crm.cif.vo.CustomerInfoUpdtReqVO)
     */
    @Override
    public int insertCustomerInfoReq(CustomerInfoUpdtReqVO customerInfoUpdtReqVO) throws Exception {
        try {
            int updateCnt = 0;
            //int custReqSeq = 0;
            if (StringUtils.isEmpty(customerInfoUpdtReqVO.getDlrCd())) { customerInfoUpdtReqVO.setDlrCd(LoginUtil.getDlrCd()); }
            if (StringUtils.isEmpty(customerInfoUpdtReqVO.getRegUsrId())) { customerInfoUpdtReqVO.setRegUsrId(LoginUtil.getUserId()); }

            // 고객정보를 업데이트 한다. (자동)
            /**
             * DCS의 유일정보 인증을 거친 후 승인이 나면 해당 정보를 업데이트 한다.
             * 단, 고객타입(CUST_CD)이 잠재고객(01)인 경우는 바로 업데이트 한다.
             */
            if ("01".equals(customerInfoUpdtReqVO.getCustCd())) {   //잠재고객(01)

                CustomerInfoVO customerInfoVO = new CustomerInfoVO();
                customerInfoVO.setCustNo(customerInfoUpdtReqVO.getCustNo());
                customerInfoVO.setCustCd(customerInfoUpdtReqVO.getCustCd());
                customerInfoVO.setCustNm(customerInfoUpdtReqVO.getCustNm());
                customerInfoVO.setHpNo(customerInfoUpdtReqVO.getHpNo());
                customerInfoVO.setOfficeTelNo(customerInfoUpdtReqVO.getOfficeTelNo());
                customerInfoVO.setMathDocTp(customerInfoUpdtReqVO.getMathDocTp());
                customerInfoVO.setSsnCrnNo(customerInfoUpdtReqVO.getSsnCrnNo());
                customerInfoVO.setCustTp(customerInfoUpdtReqVO.getCustTp());
                customerInfoVO.setOldHpNo(customerInfoUpdtReqVO.getOldHpNo());
                customerInfoVO.setOldCustNm(customerInfoUpdtReqVO.getOldCustNm());
                customerInfoVO.setOldMathDocTp(customerInfoUpdtReqVO.getOldMathDocTp());
                customerInfoVO.setOldSsnCrnNo(customerInfoUpdtReqVO.getOldSsnCrnNo());
                customerInfoVO.setPrefCommMthCd(customerInfoUpdtReqVO.getPrefCommMthCd());
                customerInfoVO.setPrefCommNo(customerInfoUpdtReqVO.getPrefCommMthCd());

                customerInfoService.updateCustomer(customerInfoVO);
                customerInfoUpdtReqVO.setStatCd("02");  // 승인(자동)
                updateCnt = customerInfoUpdtReqDAO.insertCustomerInfoReq(customerInfoUpdtReqVO);

                //custReqSeq = customerInfoUpdtReqVO.getSeq();


            } else {
                customerInfoUpdtReqVO.setStatCd("01");  // 심사요청
                //customerInfoUpdtReqVO.setReqDt(new Date());
                updateCnt = customerInfoUpdtReqDAO.insertCustomerInfoReq(customerInfoUpdtReqVO);

                // 인터페이스 테이블 insert
                if (updateCnt != 0) {
                    updateCnt = customerInfoUpdtReqDAO.insertCustomerInfoReqToDcs(customerInfoUpdtReqVO);
                }

            }

            return updateCnt;

        } catch(Exception e) {
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoUpdateService#updateCustomerInfoReq(chn.bhmc.dms.crm.cif.vo.CustomerInfoUpdtReqVO)
     */
    @Override
    public int updateCustomerInfoReq(CustomerInfoUpdtReqVO customerInfoUpdtReqVO) throws Exception {
        //if (StringUtils.isEmpty(customerInfoUpdtReqVO.getDlrCd())) { customerInfoUpdtReqVO.setDlrCd(LoginUtil.getDlrCd()); }
        if (StringUtils.isEmpty(customerInfoUpdtReqVO.getRegUsrId())) { customerInfoUpdtReqVO.setRegUsrId(LoginUtil.getUserId()); }

        int rltCnt = 0;
        rltCnt = customerInfoUpdtReqDAO.updateCustomerInfoReq(customerInfoUpdtReqVO);

        if (rltCnt > 0) {
            customerInfoUpdtReqDAO.insertCustomerInfoReqToDms(customerInfoUpdtReqVO);
        }

        return rltCnt;
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoUpdateService#selectCustomerInfoReqCallEai()
     */
    @Override
    public Data selectCustomerInfoReqCallEai() throws Exception {
        //EAI 호출
        CommDMSDoc custInfoReqRltToDms = new EaiSimpleMessage.Builder()
                                    .ifId("CRM421")
                                    .company("H")
                                    .sender("CRM")
                                    .build()
                                    .buildCommDMSDoc();
        eaiClient.sendRequest(custInfoReqRltToDms);
        return null;
    }


}
