package chn.bhmc.dms.crm.cif.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.exception.BizException;
import able.com.service.HService;
import able.com.vo.HMap;

import org.apache.commons.lang3.StringUtils;
import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.support.excel.ExcelUploadError;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.crm.cif.service.CustomerGroupService;
import chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService;
import chn.bhmc.dms.crm.cif.service.CustomerInfoService;
import chn.bhmc.dms.crm.cif.service.dao.CustomerGroupDAO;
import chn.bhmc.dms.crm.cif.service.dao.CustomerInfoDAO;
import chn.bhmc.dms.crm.cif.service.dao.CustomerRelInfoDAO;
import chn.bhmc.dms.crm.cif.vo.CustomerGroupVO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoVO;
import chn.bhmc.dms.crm.cif.vo.CustomerRelInfoVO;
import chn.bhmc.dms.crm.cmm.service.AddressInfoService;
import chn.bhmc.dms.crm.cmm.service.RegularExpressionService;
import chn.bhmc.dms.crm.cmm.vo.AddressInfoVO;
import chn.bhmc.dms.sal.cnt.service.ContractReOutBoundService;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

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
@Service("customerInfoService")
public class CustomerInfoServiceImpl extends HService implements CustomerInfoService, JxlsSupport{

    /*
     * 고객정보 관리 DAO
     */
    @Resource(name="customerInfoDAO")
    CustomerInfoDAO customerInfoDAO;

    /*
     * 고객정보 관리 DAO
     */
    @Resource(name="customerGroupDAO")
    CustomerGroupDAO customerGroupDAO;

    /*
     * 고객연계인 관리 DAO
     */
    @Resource(name="customerRelInfoDAO")
    CustomerRelInfoDAO customerRelInfoDAO;

    /**
     * Group Management Service
     */
    @Resource(name="customerGroupService")
    CustomerGroupService customerGroupService;

    /**
     * Customer Member Management
     */
    @Resource(name="custNoIdgenService")
    EgovIdGnrService custNoIdgenService;

    /**
     * Address Management
     */
    @Resource(name="addressInfoService")
    AddressInfoService addressInfoService;

    @Resource(name="customerInfoOutBoundService")
    CustomerInfoOutBoundService customerInfoOutBoundService;

    /**
     * RegularExpressionService
     */
    @Resource(name="regularExpressionService")
    RegularExpressionService regularExpressionService;

    /**
     * ContractReOutBoundService
     */
    @Resource(name="contractReOutBoundService")
    ContractReOutBoundService contractReOutBoundService;

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoService#selectCustomerInfoByConditionCnt(chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO)
     */
    @Override
    public int selectCustomerInfoByConditionCnt1(CustomerInfoSearchVO searchVO) throws Exception {

        // dlrCd, pltCd 체크해서 기본 셋팅 시작
//        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}
//        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return customerInfoDAO.selectCustomerInfoByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoService#selectCustomerInfoByCondition(chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO)
     */
    @Override
    public List<CustomerInfoVO> selectCustomerInfoByCondition1(CustomerInfoSearchVO searchVO) throws Exception {

//        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}
//        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return customerInfoDAO.selectCustomerInfoByCondition(searchVO);

    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoService#selectCustomerInfoHistoryByConditionCnt(chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO)
     */
    @Override
    public int selectCustomerInfoHistoryByConditionCnt(CustomerInfoSearchVO searchVO) throws Exception {

        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return customerInfoDAO.selectCustomerInfoHistoryByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoService#selectCustomerInfoHistoryByCondition(chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO)
     */
    @Override
    public List<CustomerInfoVO> selectCustomerInfoHistoryByCondition(CustomerInfoSearchVO searchVO) throws Exception {

        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return customerInfoDAO.selectCustomerInfoHistoryByCondition(searchVO);

    }


    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoService#insertCustomer(chn.bhmc.dms.crm.cif.vo.CustomerInfoVO)
     */
    @Override
    public CustomerInfoVO insertCustomer(CustomerInfoVO customerInfoVO) throws Exception {

        try {

            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */
            if (StringUtils.isEmpty(customerInfoVO.getDlrCd())){customerInfoVO.setDlrCd(LoginUtil.getDlrCd());}
            if (StringUtils.isEmpty(customerInfoVO.getRegUsrId())){customerInfoVO.setRegUsrId(LoginUtil.getUserId());}

            int resultCnt = 0;
            String regExpRlt = "";

            //핸드폰 번호 제한 걸기 11자리 안 되면 리턴
            if (StringUtils.isNotEmpty(customerInfoVO.getHpNo())) {

                if (customerInfoVO.getHpNo().length() <= 10) {
                    throw processException("crm.info.hpno11DigitRequired");
                }

                regExpRlt = regularExpressionService.selectRegularExpressionByHpNo(customerInfoVO.getHpNo());
                if ("FALSE".equals(regExpRlt)){
                    throw processException("crm.info.regExpHpNo"); // 이동전화 번호가 규칙에 맞지 않습니다.
                }
            }
//            if ("01".equals(customerInfoVO.getCustTp())) {
//
//            }


            /*
             * ==============================================
             *  정규식 체크 - 시작
             * ==============================================
             */

            // emailNm
            if (StringUtils.isNotEmpty(customerInfoVO.getEmailNm())) {
                regExpRlt = regularExpressionService.selectRegularExpressionByEmail(customerInfoVO.getEmailNm());
                if ("FALSE".equals(regExpRlt)){
                    throw processException("crm.info.regExpEmail"); // 이메일이 규칙에 맞지 않습니다.
                }
            }

            // telNo
            if (StringUtils.isNotEmpty(customerInfoVO.getTelNo())) {
                regExpRlt = regularExpressionService.selectRegularExpressionByTelNo(customerInfoVO.getTelNo());
                if ("FALSE".equals(regExpRlt)){
                    throw processException("crm.info.regExpTelNo"); // 전화번호가 규칙에 맞지 않습니다.
                }
            }

            // officeTelNo
            if (StringUtils.isNotEmpty(customerInfoVO.getOfficeTelNo())) {
                regExpRlt = regularExpressionService.selectRegularExpressionByTelNo(customerInfoVO.getOfficeTelNo());
                if ("FALSE".equals(regExpRlt)){
                    throw processException("crm.info.regExpTelNo"); // 전화번호가 규칙에 맞지 않습니다.
                }
            }
            // ssnCrnNo
            if (StringUtils.isNotEmpty(customerInfoVO.getSsnCrnNo())) {
                customerInfoVO.setSsnCrnNo(StringUtils.upperCase(customerInfoVO.getSsnCrnNo()));
                if ( customerInfoVO.getSsnCrnNo().length() > 30 ){      // {증서번호}는 {30글자}를 초과할 수 없습니다.
                    throw processException("crm.info.maxInfoChk", new String[]{
                            messageSource.getMessage("global.lbl.ssnCrnNo", null, LocaleContextHolder.getLocale())
                            ,messageSource.getMessage("crm.info.ssnCrnNoMaxLenChk", null, LocaleContextHolder.getLocale())
                    });
                }

                if("01".equals(customerInfoVO.getMathDocTp())) {
                    if (customerInfoVO.getSsnCrnNo().length() == 15) {
                        regExpRlt = regularExpressionService.selectRegularExpressionByRegiNo15Digit(customerInfoVO.getSsnCrnNo());
                        if ("FALSE".equals(regExpRlt)){
                            //throw processException("crm.info.regExpRegiNo"); // 신분증이 규칙에 맞지 않습니다.
                            throw processException("crm.info.regExpSsnCrnNo"); // 증거번호가 규칙에 맞지 않습니다.
                        }

                    } else if (customerInfoVO.getSsnCrnNo().length() == 18) {
                        regExpRlt = regularExpressionService.selectRegularExpressionByRegiNo18Digit(customerInfoVO.getSsnCrnNo());
                        if ("FALSE".equals(regExpRlt)){
                            //throw processException("crm.info.regExpRegiNo"); // 신분증이 규칙에 맞지 않습니다.
                            throw processException("crm.info.regExpSsnCrnNo"); // 증거번호가 규칙에 맞지 않습니다.
                        }
                    } else {
                        //throw processException("crm.info.regExpRegiNo"); // 신분증이 규칙에 맞지 않습니다.
                        throw processException("crm.info.regExpSsnCrnNo"); // 증거번호가 규칙에 맞지 않습니다.
                    }
                } else if("08".equals(customerInfoVO.getMathDocTp())) {
                    regExpRlt = regularExpressionService.selectRegularExpressionByCorpNo(customerInfoVO.getSsnCrnNo());
                    if ("FALSE".equals(regExpRlt)){
                        //throw processException("crm.info.regExpCorpNo"); // 법인번호가 규칙에 맞지 않습니다.
                        throw processException("crm.info.regExpSsnCrnNo"); // 증거번호가 규칙에 맞지 않습니다.
                    }
                } else if("10".equals(customerInfoVO.getMathDocTp())) {
                    if (customerInfoVO.getSsnCrnNo().length() != 18) {
                        throw processException("crm.info.lengthCheckMsg", new String[]{messageSource.getMessage("global.lbl.ssnCrnNo", null, LocaleContextHolder.getLocale())});
                    }
                }
            }

            /*
             * ==============================================
             *  정규식 체크 - 끝
             * ==============================================
             */

            // Required Value check
//            boolean reqValueChk = customerInfoOutBoundService.customerInfoReqValueChk(customerInfoVO);
            customerInfoOutBoundService.customerInfoReqValueChk(customerInfoVO);

            CustomerInfoSearchVO searchVO = new CustomerInfoSearchVO();
            searchVO.setsDlrCd(customerInfoVO.getDlrCd());
            searchVO.setsCustNm(customerInfoVO.getCustNm());
            searchVO.setsHpNo(customerInfoVO.getHpNo());
            searchVO.setsOfficeTelNo(customerInfoVO.getOfficeTelNo());
            searchVO.setsCustTp(customerInfoVO.getCustTp());
            searchVO.setsMathDocTp(customerInfoVO.getMathDocTp());
            searchVO.setsSsnCrnNo(customerInfoVO.getSsnCrnNo());
            searchVO.setsCustCd(customerInfoVO.getCustCd());

            // 핸드폰 또는 회사번호 (중복)
            CustomerInfoVO obj = customerInfoOutBoundService.selectCustDupByKey(searchVO);
            if(obj != null) {
                //throw processException("global.info.already");  // throw processException("global.lbl.no");
                throw processException("crm.info.dupMsg", new String[]{messageSource.getMessage("global.lbl.hpNo", null, LocaleContextHolder.getLocale())});
            }

            // 증거유형 + 증거번호 ( 중복 )
            if (StringUtils.isNotBlank(searchVO.getsMathDocTp()) && StringUtils.isNotBlank(searchVO.getsSsnCrnNo()) ) {
                obj = customerInfoOutBoundService.selectCustMathDocDupByKey(searchVO);
                if(obj != null) {
                    //throw processException("global.info.already");  // throw processException("global.lbl.no");
                    throw processException("crm.info.dupMsg", new String[]{messageSource.getMessage("global.lbl.ssnCrnNo", null, LocaleContextHolder.getLocale())});
                }
            }

            // 고객번호 채번한다.
            String custNo = customerInfoOutBoundService.selectNextCustNo();
            customerInfoVO.setCustNo(custNo);

            //boolean isSc   = LoginUtil.hasRole("ROLE_SC");
            //boolean isSa   = LoginUtil.hasRole("ROLE_SA");
            boolean isSc   = false;
            boolean isSa   = false;

            if( isSc ){
                customerInfoVO.setMngScId(LoginUtil.getUserId());
            }

            if( isSa ){
                customerInfoVO.setMngTecId(LoginUtil.getUserId());
            }

            // Default Value Setting
            customerInfoVO.setDelYn("N");
            customerInfoVO.setDisuseYn("N");
            customerInfoVO.setDmReturnYn("N");
            customerInfoVO.setHpNoInvldYn("N");
            customerInfoVO.setHpNoAddImposYn("N");
            customerInfoVO.setMergeYn("N");
            customerInfoVO.setVipYn("N");
            customerInfoVO.setEmailReturnYn("N");
            customerInfoVO.setBhmcYn("N");

            if (StringUtils.isBlank(customerInfoVO.getSmsReceiveYn())) { customerInfoVO.setSmsReceiveYn("N"); }
            if (StringUtils.isBlank(customerInfoVO.getHpNoReceiveYn())) { customerInfoVO.setHpNoReceiveYn("N"); }
            if (StringUtils.isBlank(customerInfoVO.getTelReceiveYn())) { customerInfoVO.setTelReceiveYn("N"); }
            if (StringUtils.isBlank(customerInfoVO.getEmailReceiveYn())) { customerInfoVO.setEmailReceiveYn("N"); }
            if (StringUtils.isBlank(customerInfoVO.getDmReceiveYn())) { customerInfoVO.setDmReceiveYn("N"); }
            if (StringUtils.isBlank(customerInfoVO.getFaxReceiveYn())) { customerInfoVO.setFaxReceiveYn("N"); }
            if (StringUtils.isBlank(customerInfoVO.getPerInfoAgreeYn())) { customerInfoVO.setPerInfoAgreeYn("Y"); }
            if (StringUtils.isBlank(customerInfoVO.getPerInfoUseYn())) { customerInfoVO.setPerInfoUseYn("N"); }
            if (StringUtils.isBlank(customerInfoVO.getCustCd())) { customerInfoVO.setCustCd("01"); }

            /*
             *  신규 등록하는 사용자가 판매고문이 된다.
             *  '고객신규등록' 화면에서만 '판매고문'을 로그인 사용자로 함.
             *  '전시장'에서 등록시 '판매고문'을 '책임자'로 함.
             *  '판매기회'에서 신규로 등록하는 경우 '판매고문'을 셋팅하지 않음.
             */

            if ( StringUtils.isEmpty(customerInfoVO.getMngScIdIsNull()) ) {
                if ( StringUtils.isEmpty(customerInfoVO.getMngScId()) ) {
                    customerInfoVO.setMngScId(LoginUtil.getUserId());
                }
            } else {
                customerInfoVO.setMngScId(null);
            }

            // 신규 고객을 생성한다.
            customerInfoOutBoundService.selectCustomerCodeValidChk(customerInfoVO);
            resultCnt = customerInfoDAO.insertCustomer(customerInfoVO);
            if(resultCnt < 1){
                throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("global.info.customer", null, LocaleContextHolder.getLocale())});
            } else {
                // 그룹 등록 셋팅 시작 grpTp : 001
                BaseSaveVO<CustomerGroupVO> customerGroupVO = new BaseSaveVO<CustomerGroupVO>();
                // 그룹 등록 셋팅 시작 grpTp : 001
                if(customerInfoVO.getGroupDS().size() >= 1){
                    customerInfoVO.getGroupDS().get(0).setCustNo(custNo);
                    customerGroupVO.setInsertList(customerInfoVO.getGroupDS());
                    customerGroupService.multiCustomerGroupInfo(customerGroupVO);
                }
                // 그룹 등록 셋팅 끝

                // 태그 정보 셋팅 시작 grpTp : 002
                if(customerInfoVO.getTagDS().size() >= 1){
                    customerInfoVO.getTagDS().get(0).setCustNo(customerInfoVO.getCustNo());
                    customerGroupVO.setInsertList(customerInfoVO.getTagDS());
                    customerGroupService.multiCustomerGroupInfo(customerGroupVO);
                }
                // 태그 정보 셋팅 끝

                // 취미 정보 셋팅 시작 grpTp : 003
                if(customerInfoVO.getHobbyDS().size() >= 1){
                    customerInfoVO.getHobbyDS().get(0).setCustNo(customerInfoVO.getCustNo());
                    customerGroupVO.setInsertList(customerInfoVO.getHobbyDS());
                    customerGroupService.multiCustomerGroupInfo(customerGroupVO);
                }
                // 취미 정보 셋팅 끝
            }

            return customerInfoVO;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }

    }


    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoService#                                                                                                                                                                                                                                                                            omer(chn.bhmc.dms.crm.cif.vo.CustomerInfoVO)
     */
    @Override
    public CustomerInfoVO updateCustomer(CustomerInfoVO customerInfoVO) throws Exception {
        try {


            CustomerInfoSearchVO searchVO = new CustomerInfoSearchVO();

            int resultCnt       = 0;
            String commandTp    = customerInfoVO.getCommandTp();
            String custNo       = customerInfoVO.getCustNo();
            String custNm       = customerInfoVO.getCustNm();
            String hpNo         = customerInfoVO.getHpNo();
            String officeTelNo  = customerInfoVO.getOfficeTelNo();
            String mathDocTp    = customerInfoVO.getMathDocTp();
            String ssnCrnNo     = customerInfoVO.getSsnCrnNo();
            String custTp       = customerInfoVO.getCustTp();
            String custCd       = customerInfoVO.getCustCd();

            String oldCustNm    = customerInfoVO.getOldCustNm();
            String oldHpNo      = customerInfoVO.getOldHpNo();
            String oldMathDocTp = customerInfoVO.getOldMathDocTp();
            String oldSsnCrnNo  = customerInfoVO.getOldSsnCrnNo();

            String regExpRlt = "";

            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */
            if (StringUtils.isEmpty(customerInfoVO.getDlrCd())){customerInfoVO.setDlrCd(LoginUtil.getDlrCd());}

            /*
             * Update User Id
             */
            if (StringUtils.isEmpty(customerInfoVO.getUpdtUsrId())){customerInfoVO.setUpdtUsrId(LoginUtil.getUserId());}

            // 고객번호 확인
            if (StringUtils.isEmpty(custNo)){
                throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("global.lbl.custNo", null, LocaleContextHolder.getLocale())});
            }

            //핸드폰 번호 제한 걸기 11자리~13자리
            if (StringUtils.isNotEmpty(hpNo)) {

                if (hpNo.length() <= 10) {
                    throw processException("crm.info.hpno11DigitRequired");
                }

                //정규식 체크 (hpNo)
                regExpRlt = regularExpressionService.selectRegularExpressionByHpNo(hpNo);
                if ("FALSE".equals(regExpRlt)){
                    throw processException("crm.info.regExpHpNo"); // 이동전화 번호가 규칙에 맞지 않습니다.
                }
            }
//            if ("01".equals(custTp)) {
//            }

            /*
             * ==============================================
             *  정규식 체크 - 시작
             * ==============================================
             */

            // emailNm
            if (StringUtils.isNotEmpty(customerInfoVO.getEmailNm())) {
                regExpRlt = regularExpressionService.selectRegularExpressionByEmail(customerInfoVO.getEmailNm());
                if ("FALSE".equals(regExpRlt)){
                    throw processException("crm.info.regExpEmail"); // 이메일이 규칙에 맞지 않습니다.
                }
            }

            // telNo
            if (StringUtils.isNotEmpty(customerInfoVO.getTelNo())) {
                regExpRlt = regularExpressionService.selectRegularExpressionByTelNo(customerInfoVO.getTelNo());
                if ("FALSE".equals(regExpRlt)){
                    throw processException("crm.info.regExpTelNo"); // 전화번호가 규칙에 맞지 않습니다.
                }
            }

            // officeTelNo
            if (StringUtils.isNotEmpty(customerInfoVO.getOfficeTelNo())) {
                regExpRlt = regularExpressionService.selectRegularExpressionByTelNo(customerInfoVO.getOfficeTelNo());
                if ("FALSE".equals(regExpRlt)){
                    throw processException("crm.info.regExpTelNo"); // 전화번호가 규칙에 맞지 않습니다.
                }
            }
            // ssnCrnNo
            if (StringUtils.isNotEmpty(customerInfoVO.getSsnCrnNo())) {

                if ( customerInfoVO.getSsnCrnNo().length() > 30 ){      // {증서번호}는 {30글자}를 초과할 수 없습니다.
                    throw processException("crm.info.maxInfoChk", new String[]{
                            messageSource.getMessage("global.lbl.ssnCrnNo", null, LocaleContextHolder.getLocale())
                            ,messageSource.getMessage("crm.info.ssnCrnNoMaxLenChk", null, LocaleContextHolder.getLocale())
                    });
                }

                if("01".equals(customerInfoVO.getMathDocTp())) {
                    if (customerInfoVO.getSsnCrnNo().length() == 15) {
                        regExpRlt = regularExpressionService.selectRegularExpressionByRegiNo15Digit(customerInfoVO.getSsnCrnNo());
                        if ("FALSE".equals(regExpRlt)){
                            //throw processException("crm.info.regExpRegiNo"); // 신분증이 규칙에 맞지 않습니다.
                            throw processException("crm.info.regExpSsnCrnNo"); // 증거번호가 규칙에 맞지 않습니다.
                        }

                    } else if (customerInfoVO.getSsnCrnNo().length() == 18) {
                        regExpRlt = regularExpressionService.selectRegularExpressionByRegiNo18Digit(customerInfoVO.getSsnCrnNo());
                        if ("FALSE".equals(regExpRlt)){
                            //throw processException("crm.info.regExpRegiNo"); // 신분증이 규칙에 맞지 않습니다.
                            throw processException("crm.info.regExpSsnCrnNo"); // 증거번호가 규칙에 맞지 않습니다.
                        }
                    } else {
                        //throw processException("crm.info.regExpRegiNo"); // 신분증이 규칙에 맞지 않습니다.
                        throw processException("crm.info.regExpSsnCrnNo"); // 증거번호가 규칙에 맞지 않습니다.
                    }
                } else if("08".equals(customerInfoVO.getMathDocTp())) {
                    regExpRlt = regularExpressionService.selectRegularExpressionByCorpNo(customerInfoVO.getSsnCrnNo());
                    if ("FALSE".equals(regExpRlt)){
                        //throw processException("crm.info.regExpCorpNo"); // 법인번호가 규칙에 맞지 않습니다.
                        throw processException("crm.info.regExpSsnCrnNo"); // 증거번호가 규칙에 맞지 않습니다.
                    }
                } else if("10".equals(customerInfoVO.getMathDocTp())) {
                    if (customerInfoVO.getSsnCrnNo().length() != 18) {
                        throw processException("crm.info.lengthCheckMsg", new String[]{messageSource.getMessage("global.lbl.ssnCrnNo", null, LocaleContextHolder.getLocale())});
                    }
                }


            }

            /*
             * ==============================================
             *  정규식 체크 - 끝
             * ==============================================
             */

            /**
             * 업무에 따라 이전값을 셋팅 (CommandTp)
             *
             */

            if ("LEADOPPTPROC".equals(commandTp)) {
                searchVO.setsDlrCd(customerInfoVO.getDlrCd());
                searchVO.setsCustNo(custNo);
                CustomerInfoVO bfCustInfoVO = new CustomerInfoVO();

                bfCustInfoVO = customerInfoDAO.selectCustomerInfoByKey(searchVO);

                customerInfoVO.setPrefCommMthCd(bfCustInfoVO.getPrefCommMthCd());
                customerInfoVO.setPrefCommNo(bfCustInfoVO.getPrefCommNo());

                oldHpNo = bfCustInfoVO.getHpNo();
                oldMathDocTp = bfCustInfoVO.getMathDocTp();
                oldSsnCrnNo = bfCustInfoVO.getSsnCrnNo();


                if ("02".equals(custTp)) {
                    //oldHpNo = bfCustInfoVO.getOfficeTelNo();
                    oldHpNo = bfCustInfoVO.getHpNo();
                    oldMathDocTp = bfCustInfoVO.getMathDocTp();
                    oldSsnCrnNo = bfCustInfoVO.getSsnCrnNo();
                } else {
                    mathDocTp = bfCustInfoVO.getMathDocTp();
                    oldMathDocTp = bfCustInfoVO.getMathDocTp();
                    ssnCrnNo = bfCustInfoVO.getSsnCrnNo();
                    oldSsnCrnNo = bfCustInfoVO.getSsnCrnNo();
                }

                /*
                custNm       = bfCustInfoVO.getCustNm();
                hpNo         = customerInfoVO.getHpNo();
                officeTelNo  = customerInfoVO.getOfficeTelNo();
                mathDocTp    = customerInfoVO.getMathDocTp();
                ssnCrnNo     = customerInfoVO.getSsnCrnNo();
                custTp       = customerInfoVO.getCustTp();

                oldCustNm    = customerInfoVO.getOldCustNm();
                oldHpNo      = customerInfoVO.getOldHpNo();
                oldMathDocTp = customerInfoVO.getOldMathDocTp();
                oldSsnCrnNo  = customerInfoVO.getOldSsnCrnNo();
                */
            }

            /**
             * CommandTp에 따라 검증 진행
             * null : 고객등록
             * ASSIGN : 고객 배정
             * CONTRACT : 계약
             * BLUEMEMBER : 블루멤버십 업데이트
             * LEADOPPTPROC : 판매기회관리
             * SHOWROOM : 전시장유동량
             */
            if ((StringUtils.isEmpty(commandTp))
                    || ("LEADOPPTPROC".equals(commandTp))
                    ) {
                // Required Value check
//                boolean reqValueChk = false;
                customerInfoOutBoundService.customerInfoReqValueChk(customerInfoVO);

                CustomerInfoVO obj = null;

                searchVO.setsCustNo(custNo);
                searchVO.setsCustNm(custNm);
                searchVO.setsHpNo(hpNo);
                searchVO.setsOfficeTelNo(officeTelNo);
                searchVO.setsMathDocTp(mathDocTp);
                searchVO.setsSsnCrnNo(ssnCrnNo);
                searchVO.setsCustTp(custTp);
                searchVO.setsCustCd(custCd);

                searchVO.setsOldCustNm(oldCustNm);
                searchVO.setsOldHpNo(oldHpNo);
                searchVO.setsOldMathDocTp(oldMathDocTp);
                searchVO.setsOldSsnCrnNo(oldSsnCrnNo);

                if ( "01".equals(custTp)) {
                    // 고객명 + 핸드폰
                    //if( (!custNm.equals(oldCustNm)) || (!hpNo.equals(oldHpNo)) ){
                    if(!(hpNo.equals(oldHpNo))) {
                        obj = customerInfoOutBoundService.selectCustDupByKey(searchVO);
                    }
                } else {
                    // 고객명 + 구매담당자 핸드폰번호
                    //if( (!custNm.equals(oldCustNm)) || (!officeTelNo.equals(oldHpNo)) ){
                    if(!(hpNo.equals(oldHpNo))) {
                        obj = customerInfoOutBoundService.selectCustDupByKey(searchVO);
                    }
                }

                if (obj != null) {
                    //throw processException("global.info.already");
                    throw processException("crm.info.dupMsg", new String[]{messageSource.getMessage("global.lbl.hpNo", null, LocaleContextHolder.getLocale())});
                }

                // 증거유형 + 증거번호
//                if( !(mathDocTp.equals(oldMathDocTp)) || !(ssnCrnNo.equals(oldSsnCrnNo)) ){
//                    obj = customerInfoOutBoundService.selectCustMathDocDupByKey(searchVO);
//                }
                if (StringUtils.isNotBlank(mathDocTp) && StringUtils.isNotBlank(ssnCrnNo)) {
                    obj = customerInfoOutBoundService.selectCustMathDocDupByKey(searchVO);
                }

                if (obj != null) {
                    //throw processException("global.info.already");
                    throw processException("crm.info.dupMsg", new String[]{messageSource.getMessage("global.lbl.ssnCrnNo", null, LocaleContextHolder.getLocale())});
                }
            }

            // 고객 타입정의 하여 업데이트 (잠재/보유/타사보유)
            custCd = customerInfoOutBoundService.selectCustomerCustCd(customerInfoVO);
            customerInfoVO.setCustCd(custCd);

            // 유일정보 수정 가능 여부 판단
            String ableToEditSsn = customerInfoOutBoundService.selectAbleToEditSsnCrnNo(customerInfoVO.getDlrCd(), customerInfoVO.getCustNo());

            if ( "N".equals(ableToEditSsn) ) {
                customerInfoVO.setMathDocTp(null);
                customerInfoVO.setMathDocTpC(null);
                customerInfoVO.setSsnCrnNo(null);
                customerInfoVO.setSsnCrnNoC(null);
            }

            // 명시된 코드값이외의 값이 들어오는지 체크
            customerInfoOutBoundService.selectCustomerCodeValidChk(customerInfoVO);
            resultCnt = customerInfoDAO.updateCustomer(customerInfoVO);

            if (resultCnt < 1){
                throw processException("global.err.updateFailedParam", new String[]{messageSource.getMessage("global.info.customer", null, LocaleContextHolder.getLocale())});
            } else {

                // 그룹 등록 셋팅 시작 grpTp : 001
                BaseSaveVO<CustomerGroupVO> customerGroupVO = new BaseSaveVO<CustomerGroupVO>();
                if(customerInfoVO.getGroupDS().size() >= 1){
                    customerInfoVO.getGroupDS().get(0).setCustNo(customerInfoVO.getCustNo());
                    customerGroupVO.setInsertList(customerInfoVO.getGroupDS());
                    customerGroupService.multiCustomerGroupInfo(customerGroupVO);
                }
                // 그룹 등록 셋팅 끝

                // 태그 정보 셋팅 시작 grpTp : 002
                if(customerInfoVO.getTagDS().size() >= 1){
                    customerInfoVO.getTagDS().get(0).setCustNo(customerInfoVO.getCustNo());
                    customerGroupVO.setInsertList(customerInfoVO.getTagDS());
                    customerGroupService.multiCustomerGroupInfo(customerGroupVO);
                }
                // 태그 정보 셋팅 끝

                // 취미 정보 셋팅 시작 grpTp : 003
                if(customerInfoVO.getHobbyDS().size() >= 1){
                    customerInfoVO.getHobbyDS().get(0).setCustNo(customerInfoVO.getCustNo());
                    customerGroupVO.setInsertList(customerInfoVO.getHobbyDS());
                    customerGroupService.multiCustomerGroupInfo(customerGroupVO);
                }
                // 취미 정보 셋팅 끝
            }

            // 고객쪽 업데이트 후 판매정보 업데이트를 위한 서비스 호출
            contractReOutBoundService.updateContractCustInfo(customerInfoVO.getCustNo(), customerInfoVO.getDlrCd());

            return customerInfoVO;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoService#multiCustomerRelChg(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiCustomerRelChg(BaseSaveVO<CustomerRelInfoVO> obj) throws Exception {
        String userId = LoginUtil.getUserId();

        for(CustomerRelInfoVO customerRelInfoVO : obj.getInsertList()){
            customerRelInfoVO.setRegUsrId(userId);
            customerRelInfoDAO.insertCustomerRel(customerRelInfoVO);
        }

        for(CustomerRelInfoVO customerRelInfoVO : obj.getUpdateList()){
            customerRelInfoVO.setRegUsrId(userId);
            customerRelInfoDAO.updateCustomerRel(customerRelInfoVO);
        }

        for(CustomerRelInfoVO customerRelInfoVO : obj.getDeleteList()){
            customerRelInfoDAO.deleteCustomerRel(customerRelInfoVO);
        }

    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoService#multiCustomerInfo(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiCustomerInfo(BaseSaveVO<CustomerInfoVO> obj) throws Exception {
        /*
        for(CustomerInfoVO customerInfoVO : obj.getInsertList()) {
            insertAddressInfo(customerInfoVO);
        }
        */

        for(CustomerInfoVO customerInfoVO : obj.getUpdateList()) {
            updateCustomer(customerInfoVO);
        }

        /*
        for(CustomerInfoVO customerInfoVO : obj.getDeleteList()) {
            deleteAddressInfo(customerInfoVO);
        }
        */

    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoService#selectCustDupCntByKey(java.lang.String, java.lang.String, java.lang.String)
     */
    @Override
    public int selectCustDupCntByKey(String dlrCd, String custNm, String hpNo) throws Exception {

        if (StringUtils.isEmpty(dlrCd)){  dlrCd = LoginUtil.getDlrCd();  }
        return customerInfoDAO.selectCustDupCntByKey(dlrCd, custNm, hpNo);
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoService#selectCustDupCheck(java.util.List)
     */
    @Override
    public List<CustomerInfoVO> selectCustDupCheck(List<CustomerInfoVO> list) throws Exception {

        try {
            List<ExcelUploadError> errors = new ArrayList<ExcelUploadError>();
            List<CustomerInfoVO> resultList = new ArrayList<CustomerInfoVO>();
            int totErrCnt = 0;
            int custCnt = 0;
            String msg;
            String custNm;
            String hpNo;
            String dlrCd = LoginUtil.getDlrCd();

            // Duplication Customer Check
            for(int i = 0, listLen = list.size(); i < listLen ; i++){
                errors         = new ArrayList<ExcelUploadError>();

                if (list.get(i).getErrorCount() > 0 ) {
                    totErrCnt = totErrCnt + 1;
                    resultList.add(list.get(i));
                } else {
                    list.get(i).setDlrCd(LoginUtil.getDlrCd());

                    custNm = list.get(i).getCustNm();
                    hpNo = list.get(i).getHpNo();

                    custCnt = selectCustDupCntByKey(dlrCd, custNm, hpNo);

                    if (custCnt > 0) {
                        msg = messageSource.getMessage(
                                "crm.info.custDup"
                                , new String[]{
                                        messageSource.getMessage("global.info.alreadyCont", null, LocaleContextHolder.getLocale())
                                }
                                , LocaleContextHolder.getLocale()
                            );

                        errors.add(new ExcelUploadError(i, 0, list.get(i).getCustNm(), msg));

                        list.get(i).setErrors(errors);
                        list.get(i).setErrorCount(1);

                        totErrCnt = totErrCnt + 1;
                        resultList.add(list.get(i));

                        continue;
                    } else {
                        resultList.add(list.get(i));
                    }
                }
            }

            return resultList;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoService#multiCustomerUploadFileSave(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiCustomerUploadFileSave(BaseSaveVO<CustomerInfoVO> obj) throws Exception {
        try {

            String userId = LoginUtil.getUserId();
            String custNo = "";
            for(CustomerInfoVO customerInfoVO : obj.getInsertList()){
                CustomerInfoVO custVO = new CustomerInfoVO();
                customerInfoVO.setRegUsrId(userId);

                /*
                 * dlrCd, pltCd 체크해서 기본 셋팅 시작
                 */
                if (StringUtils.isEmpty(customerInfoVO.getDlrCd())){customerInfoVO.setDlrCd(LoginUtil.getDlrCd());}

                customerInfoVO.setCustTp("01");
                customerInfoVO.setCustCd("01");
                custVO = insertCustomer(customerInfoVO);
                custNo = custVO.getCustNo();

                if (StringUtils.isNotEmpty(custNo)) {

                    AddressInfoVO addressInfoVO = new AddressInfoVO();

                    addressInfoVO.setDlrCd(customerInfoVO.getDlrCd());
                    addressInfoVO.setRefTableNm("CR_0101T");
                    addressInfoVO.setrefKeyNm(custNo);
                    addressInfoVO.setSungNm(customerInfoVO.getSungNm());
                    addressInfoVO.setCityNm(customerInfoVO.getCityNm());
                    addressInfoVO.setDistNm(customerInfoVO.getDistNm());
                    addressInfoVO.setAddrDetlCont(customerInfoVO.getAddrDetlCont());
                    addressInfoVO.setZipCd(customerInfoVO.getZipCd());
                    addressInfoVO.setAddrTp("10");   // CRM033 주소유형
                    addressInfoVO.setFlagYn("Y");
                    addressInfoVO.setRegUsrId(userId);

                    addressInfoService.insertAddressInfo(addressInfoVO);

                }
            }

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoService#selectCustomerInfoByKey(chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO)
     * 고객 단건 조회
     * DLR_CD
     * CUST_NO
     */
    @Override
    public CustomerInfoVO selectCustomerInfoByKey(CustomerInfoSearchVO searchVO) throws Exception {

        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return customerInfoDAO.selectCustomerInfoByKey(searchVO);
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initJxlsContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        String sExcelTp = "";
        if (StringUtils.isNotEmpty((String)params.get("sExcelTp"))) {
            sExcelTp = (String)params.get("sExcelTp");
            params.remove("sExcelTp");
        }

        CustomerInfoSearchVO searchVO = new CustomerInfoSearchVO();
        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        if ( !"null".equals((String)params.get("sCommand")) ) {
            if ("TAGSEARCH".equals(params.get("sCommand").toString()) ) {
                String[] sTagDs = params.get("tagDS").toString().split(",");
                List<String> tagDs = new ArrayList<String>();
                for(int i=0; sTagDs.length > i; i++) {
                    tagDs.add(sTagDs[i]);
                }
                searchVO.setTagDS(tagDs);
            }
        }

        if ( !"null".equals((String)params.get("sSaleDtFrom")) ) {
            searchVO.setsSaleDtFrom(DateUtil.convertToDate((String)params.get("sSaleDtFrom")));
        }

        if ( !"null".equals((String)params.get("sSaleDtTo")) ) {
            searchVO.setsSaleDtTo(DateUtil.convertToDate((String)params.get("sSaleDtTo")));
        }

        if ( !"null".equals((String)params.get("sRoDtFrom")) ) {
            searchVO.setsRoDtFrom(DateUtil.convertToDate((String)params.get("sRoDtFrom")));
        }

        if ( !"null".equals((String)params.get("sRoDtTo")) ) {
            searchVO.setsRoDtTo(DateUtil.convertToDate((String)params.get("sRoDtTo")));
        }
        //20200825 tjx 添加创建时间筛选条件
        if ( !"null".equals((String)params.get("sRegDtFrom")) ) {
            searchVO.setsRegDtFrom(DateUtil.convertToDate((String)params.get("sRegDtFrom")));
        }
        if ( !"null".equals((String)params.get("sRegDtTo")) ) {
            searchVO.setsRegDtTo(DateUtil.convertToDate((String)params.get("sRegDtTo")));
        }
        List<CustomerInfoVO> list = null;
        int listSize = 0;
        if (StringUtils.isNotEmpty(sExcelTp)) {
            if ("CustomerInfoMgmtList".equals(sExcelTp)) {  // 고객정보관리

                if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}
                if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
                searchVO.setsMembershipStan(LoginUtil.getMembershipPolicy());

                listSize = customerInfoDAO.selectCustomerListByConditionCnt(searchVO);
                if (listSize > 0){
                    list = customerInfoDAO.selectCustomerListExcelExportByCondition(searchVO);
                }
            }
        }

        context.putVar("items", list);

    }

}
