package chn.bhmc.dms.crm.cif.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cif.service.CustomerRelInfoService;
import chn.bhmc.dms.crm.cif.service.dao.CustomerRelInfoDAO;
import chn.bhmc.dms.crm.cif.vo.CustomerRelInfoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerRelInfoVO;
import chn.bhmc.dms.crm.cmm.service.RegularExpressionService;


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

        return customerRelInfoDAO.selectCustomerRelInfoByConditionCnt(searchVO);
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

            insertCustomerRelInfo(customerRelInfoVO);
        }

        for(CustomerRelInfoVO customerRelInfoVO : obj.getUpdateList()){

            updateCustomerRelInfo(customerRelInfoVO);

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

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerRelInfoService#insertCustomerRelInfo(chn.bhmc.dms.crm.cif.vo.CustomerRelInfoVO)
     */
    @Override
    public int insertCustomerRelInfo(CustomerRelInfoVO customerRelInfoVO) throws Exception {

        if (StringUtils.isEmpty(customerRelInfoVO.getDlrCd())){customerRelInfoVO.setDlrCd(LoginUtil.getDlrCd());}

//        CustomerRelInfoSearchVO customerRelInfoSearchVO = new CustomerRelInfoSearchVO();
//        customerRelInfoSearchVO.setsPconCustNo(customerRelInfoVO.getPconCustNo());
//        customerRelInfoSearchVO.setsPconTp(customerRelInfoVO.getPconTp());
//        customerRelInfoSearchVO.setsDlrCd(customerRelInfoVO.getDlrCd());
//        customerRelInfoSearchVO.setsUpperCustNo(customerRelInfoVO.getUpperCustNo());

//        int relCustCnt = customerRelInfoDAO.selectCustomerRelInfoByConditionCnt(customerRelInfoSearchVO);
//        if (relCustCnt > 0) {
//            throw processException("crm.info.dupMsg", new String[]{messageSource.getMessage("global.lbl.relCustInfo", null, LocaleContextHolder.getLocale())});
//        }

        if (StringUtils.isEmpty(customerRelInfoVO.getUpperCustNo())) {
            throw processException("global.info.required.field", new String[]{messageSource.getMessage("global.lbl.custNo", null, LocaleContextHolder.getLocale())});
        }

        if (StringUtils.isEmpty(customerRelInfoVO.getRelNm()) && StringUtils.isEmpty(customerRelInfoVO.getPconCustNo()) ) {
            throw processException("global.info.required.field", new String[]{messageSource.getMessage("crm.lbl.relCustNm", null, LocaleContextHolder.getLocale())});
        }

        String regExpRlt = "";
        if (StringUtils.isNotEmpty(customerRelInfoVO.getTelNo())) {
            // 1. 전화번호 telNo
            regExpRlt = regularExpressionService.selectRegularExpressionByTelNo(customerRelInfoVO.getTelNo());
            if ("FALSE".equals(regExpRlt)){
                throw processException("crm.info.regExpTelNo"); // 전화번호가 규칙에 맞지 않습니다.
            }
        }
        // 2. 핸드폰 번호 hpNo
        if (StringUtils.isNotEmpty(customerRelInfoVO.getHpNo())) {
            // 1. 전화번호 telNo
            regExpRlt = regularExpressionService.selectRegularExpressionByHpNo(customerRelInfoVO.getHpNo());
            if ("FALSE".equals(regExpRlt)){
                throw processException("crm.info.regExpHpNo"); // 이동전화 번호가 규칙에 맞지 않습니다.
            }
        }

        if (StringUtils.isEmpty(customerRelInfoVO.getRegUsrId())){customerRelInfoVO.setRegUsrId(LoginUtil.getUserId());}
        if (StringUtils.isEmpty(customerRelInfoVO.getUpdtUsrId())){customerRelInfoVO.setUpdtUsrId(LoginUtil.getUserId());}

        return customerRelInfoDAO.insertCustomerRel(customerRelInfoVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerRelInfoService#updateCustomerRelInfo(chn.bhmc.dms.crm.cif.vo.CustomerRelInfoVO)
     */
    @Override
    public int updateCustomerRelInfo(CustomerRelInfoVO customerRelInfoVO) throws Exception {

        if (StringUtils.isEmpty(customerRelInfoVO.getDlrCd())){customerRelInfoVO.setDlrCd(LoginUtil.getDlrCd());}

//        CustomerRelInfoSearchVO customerRelInfoSearchVO = new CustomerRelInfoSearchVO();
//        customerRelInfoSearchVO.setsPconCustNo(customerRelInfoVO.getPconCustNo());
//        customerRelInfoSearchVO.setsPconTp(customerRelInfoVO.getPconTp());
//        customerRelInfoSearchVO.setsDlrCd(customerRelInfoVO.getDlrCd());
//        customerRelInfoSearchVO.setsUpperCustNo(customerRelInfoVO.getUpperCustNo());

//        int relCustCnt = customerRelInfoDAO.selectCustomerRelInfoByConditionCnt(customerRelInfoSearchVO);
//        if (relCustCnt > 0) {
//            throw processException("crm.info.dupMsg", new String[]{messageSource.getMessage("global.lbl.relCustInfo", null, LocaleContextHolder.getLocale())});
//        }

        if (StringUtils.isEmpty(customerRelInfoVO.getUpperCustNo())) {
            throw processException("global.info.required.field", new String[]{messageSource.getMessage("global.lbl.custNo", null, LocaleContextHolder.getLocale())});
        }

        if (StringUtils.isEmpty(customerRelInfoVO.getRelNm())) {
            throw processException("global.info.required.field", new String[]{messageSource.getMessage("crm.lbl.relCustNm", null, LocaleContextHolder.getLocale())});
        }

        String regExpRlt = "";
        if (StringUtils.isNotEmpty(customerRelInfoVO.getTelNo())) {
            // 1. 전화번호 telNo
            regExpRlt = regularExpressionService.selectRegularExpressionByTelNo(customerRelInfoVO.getTelNo());
            if ("FALSE".equals(regExpRlt)){
                throw processException("crm.info.regExpTelNo"); // 전화번호가 규칙에 맞지 않습니다.
            }
        }
        // 2. 핸드폰 번호 hpNo
        if (StringUtils.isNotEmpty(customerRelInfoVO.getHpNo())) {
            // 1. 전화번호 telNo
            regExpRlt = regularExpressionService.selectRegularExpressionByHpNo(customerRelInfoVO.getHpNo());
            if ("FALSE".equals(regExpRlt)){
                throw processException("crm.info.regExpHpNo"); // 이동전화 번호가 규칙에 맞지 않습니다.
            }
        }

        if (StringUtils.isEmpty(customerRelInfoVO.getUpdtUsrId())){customerRelInfoVO.setUpdtUsrId(LoginUtil.getUserId());}

        return customerRelInfoDAO.updateCustomerRel(customerRelInfoVO);
    }




}
