package chn.bhmc.dms.crm.cif.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.exception.BizException;
import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.support.excel.ExcelUploadError;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cif.service.CustomerGroupService;
import chn.bhmc.dms.crm.cif.service.CustomerInfoService;
import chn.bhmc.dms.crm.cif.service.dao.CustomerGroupDAO;
import chn.bhmc.dms.crm.cif.service.dao.CustomerInfoDAO;
import chn.bhmc.dms.crm.cif.service.dao.CustomerInfoUpdtReqDAO;
import chn.bhmc.dms.crm.cif.service.dao.CustomerRelInfoDAO;
import chn.bhmc.dms.crm.cif.vo.CustomerGroupVO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoUpdtReqVO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoVO;
import chn.bhmc.dms.crm.cif.vo.CustomerRelInfoVO;
import chn.bhmc.dms.crm.cmm.service.AddressInfoService;
import chn.bhmc.dms.crm.cmm.vo.AddressInfoVO;
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
public class CustomerInfoServiceImpl extends HService implements CustomerInfoService {

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

    /**
     * CustomerInfoUpdtReqDAO
     */
    @Resource(name="customerInfoUpdtReqDAO")
    CustomerInfoUpdtReqDAO customerInfoUpdtReqDAO;

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoService#selectCustomerInfoByConditionCnt(chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO)
     */
    @Override
    public int selectCustomerInfoByConditionCnt(CustomerInfoSearchVO searchVO) throws Exception {

        //boolean isManager = LoginUtil.hasRole("manager");
        boolean isManager = true;

        // dlrCd, pltCd 체크해서 기본 셋팅 시작

        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        //if (StringUtils.isEmpty(searchVO.getsPltCd())) {searchVO.setsPltCd(LoginUtil.getPltCd());}

        if (isManager) {
            // return customerInfoDAO.selectMasterCustomerInfoByConditionCnt(searchVO);
            return customerInfoDAO.selectCustomerInfoByConditionCnt(searchVO);
        } else {
            return customerInfoDAO.selectCustomerInfoByConditionCnt(searchVO);
        }

    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoService#selectCustomerInfoByCondition(chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO)
     */
    @Override
    public List<CustomerInfoVO> selectCustomerInfoByCondition(CustomerInfoSearchVO searchVO) throws Exception {

        //boolean isManager = LoginUtil.hasRole("manager");
        boolean isManager = true;

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        //if (StringUtils.isEmpty(searchVO.getsPltCd())) {searchVO.setsPltCd(LoginUtil.getPltCd());}

        if (isManager) {
            //return customerInfoDAO.selectMasterCustomerInfoByCondition(searchVO);
            return customerInfoDAO.selectCustomerInfoByCondition(searchVO);
        } else {
            return customerInfoDAO.selectCustomerInfoByCondition(searchVO);
        }

    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoService#selectCustomerInfoHistoryByConditionCnt(chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO)
     */
    @Override
    public int selectCustomerInfoHistoryByConditionCnt(CustomerInfoSearchVO searchVO) throws Exception {

        //boolean isManager = LoginUtil.hasRole("manager");
        boolean isManager = true;

        // dlrCd, pltCd 체크해서 기본 셋팅 시작

        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        //if (StringUtils.isEmpty(searchVO.getsPltCd())) {searchVO.setsPltCd(LoginUtil.getPltCd());}

        if (isManager) {
            // return customerInfoDAO.selectMasterCustomerInfoByConditionCnt(searchVO);
            return customerInfoDAO.selectCustomerInfoHistoryByConditionCnt(searchVO);
        } else {
            return customerInfoDAO.selectCustomerInfoHistoryByConditionCnt(searchVO);
        }

    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoService#selectCustomerInfoHistoryByCondition(chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO)
     */
    @Override
    public List<CustomerInfoVO> selectCustomerInfoHistoryByCondition(CustomerInfoSearchVO searchVO) throws Exception {

        //boolean isManager = LoginUtil.hasRole("manager");
        boolean isManager = true;

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        //if (StringUtils.isEmpty(searchVO.getsPltCd())) {searchVO.setsPltCd(LoginUtil.getPltCd());}

        if (isManager) {
            //return customerInfoDAO.selectMasterCustomerInfoByCondition(searchVO);
            return customerInfoDAO.selectCustomerInfoHistoryByCondition(searchVO);
        } else {
            return customerInfoDAO.selectCustomerInfoHistoryByCondition(searchVO);
        }

    }


    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoService#insertCustomer(chn.bhmc.dms.crm.cif.vo.CustomerInfoVO)
     */
    @SuppressWarnings("unused")
    @Override
    public CustomerInfoVO insertCustomer(CustomerInfoVO customerInfoVO) throws Exception {

        try {
            int resultCnt = 0;

            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */
            if (StringUtils.isEmpty(customerInfoVO.getDlrCd())){customerInfoVO.setDlrCd(LoginUtil.getDlrCd());}
            if (StringUtils.isEmpty(customerInfoVO.getRegUsrId())){customerInfoVO.setRegUsrId(LoginUtil.getUserId());}

            // Required Value check
            boolean reqValueChk = false;
            reqValueChk = customerInfoReqValueChk(customerInfoVO);

            CustomerInfoSearchVO searchVO = new CustomerInfoSearchVO();
            searchVO.setsDlrCd(customerInfoVO.getDlrCd());
            searchVO.setsCustNm(customerInfoVO.getCustNm());
            searchVO.setsHpNo(customerInfoVO.getHpNo());
            searchVO.setsOfficeTelNo(customerInfoVO.getOfficeTelNo());
            searchVO.setsCustTp(customerInfoVO.getCustTp());
            searchVO.setsMathDocTp(customerInfoVO.getMathDocTp());
            searchVO.setsSsnCrnNo(customerInfoVO.getSsnCrnNo());
/*
            if (StringUtil.isNullToString(customerInfoVO.getMathDocTp()) != null) {
                searchVO.setsMathDocTp(customerInfoVO.getMathDocTp());
            }

            if (StringUtils.isNotBlank(customerInfoVO.getSsnCrnNo())) { searchVO.setsSsnCrnNo(customerInfoVO.getSsnCrnNo()); };
            if (StringUtils.isNotBlank(customerInfoVO.getCustTp())) { searchVO.setsCustTp(customerInfoVO.getCustTp()); };*/

            // 핸드폰 또는 회사번호
            CustomerInfoVO obj = selectCustDupByKey(searchVO);
            if(obj != null) {
                throw processException("global.info.already");  // throw processException("global.lbl.no");
            }

            // 증거유형 + 증거번호
            if ((StringUtils.isNotBlank(searchVO.getsMathDocTp()) && StringUtils.isEmpty(searchVO.getsSsnCrnNo()))
                || (StringUtils.isEmpty(searchVO.getsMathDocTp()) && StringUtils.isNotBlank(searchVO.getsSsnCrnNo())) ) {
                throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("global.info.customer", null, LocaleContextHolder.getLocale())});
            }
            if (StringUtils.isNotBlank(searchVO.getsMathDocTp()) && StringUtils.isNotBlank(searchVO.getsSsnCrnNo()) ) {
                obj = selectCustMathDocDupByKey(searchVO);
                if(obj != null) {
                    throw processException("global.info.already");  // throw processException("global.lbl.no");
                }
            }

            // 고객번호 채번한다.
            String custNo = selectNextCustNo();
            customerInfoVO.setCustNo(custNo);

            // TODO [이교진] 권한체크를 한다. SA / TA
            //boolean isSc   = LoginUtil.hasRole("ROLE_SC");
            //boolean isSa   = LoginUtil.hasRole("ROLE_SA");
            boolean isSc   = true;
            boolean isSa   = true;

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
            customerInfoVO.setEmailReceiveYn("N");
            customerInfoVO.setHpNoInvldYn("N");
            customerInfoVO.setHpNoAddImposYn("N");
            customerInfoVO.setMergeYn("N");
            customerInfoVO.setVipYn("N");
            customerInfoVO.setEmailReturnYn("N");
            customerInfoVO.setBhmcYn("N");

            if (StringUtils.isBlank(customerInfoVO.getSmsReceiveYn())) { customerInfoVO.setSmsReceiveYn("N"); }
            if (StringUtils.isBlank(customerInfoVO.getTelReceiveYn())) { customerInfoVO.setTelReceiveYn("N"); }
            if (StringUtils.isBlank(customerInfoVO.getDmReceiveYn())) { customerInfoVO.setDmReceiveYn("N"); }
            if (StringUtils.isBlank(customerInfoVO.getFaxReceiveYn())) { customerInfoVO.setFaxReceiveYn("N"); }
            if (StringUtils.isBlank(customerInfoVO.getPerInfoAgreeYn())) { customerInfoVO.setPerInfoAgreeYn("N"); }
            if (StringUtils.isBlank(customerInfoVO.getPerInfoUseYn())) { customerInfoVO.setPerInfoUseYn("N"); }

            // 신규 고객을 생성한다.
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


    /**
     * 고객필수 값 체크
     * @param CustomerInfoVO
     * @return boolean
     */
    public boolean customerInfoReqValueChk(CustomerInfoVO customerInfoVO) throws Exception {

        if (StringUtils.isEmpty(customerInfoVO.getCustTp())) {
            throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("global.lbl.custTp", null, LocaleContextHolder.getLocale())});
        }

        if (StringUtils.isEmpty(customerInfoVO.getCustNm())) {
            throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("global.lbl.custNm", null, LocaleContextHolder.getLocale())});
        }

        if (customerInfoVO.getCustTp().equals("01")) {
            if (StringUtils.isEmpty(customerInfoVO.getHpNo())) {
                throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("global.lbl.hpNo", null, LocaleContextHolder.getLocale())});
            }
            if (StringUtils.isEmpty(customerInfoVO.getPrefCommMthCd())) {
                throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("global.lbl.prefCommMthCd", null, LocaleContextHolder.getLocale())});
            }
            if (StringUtils.isEmpty(customerInfoVO.getPrefCommNo())) {
                throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("global.lbl.prefCommNo", null, LocaleContextHolder.getLocale())});
            }
        } else if (customerInfoVO.getCustTp().equals("02")) {
            if (StringUtils.isEmpty(customerInfoVO.getOfficeTelNo())) {
                throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("global.lbl.officeTelNo", null, LocaleContextHolder.getLocale())});
            }
        }

        if (customerInfoVO.getCustCd().equals("02")) {
            if (StringUtils.isEmpty(customerInfoVO.getMathDocTp())) {
                throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("global.lbl.mathDocTp", null, LocaleContextHolder.getLocale())});
            }
            if (StringUtils.isEmpty(customerInfoVO.getSsnCrnNo()) ) {
                throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("global.lbl.ssnCrnNo", null, LocaleContextHolder.getLocale())});
            }
        }

        return true;

    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoService#updateCustomer(chn.bhmc.dms.crm.cif.vo.CustomerInfoVO)
     */
    @SuppressWarnings("unused")
    @Override
    public CustomerInfoVO updateCustomer(CustomerInfoVO customerInfoVO) throws Exception {
        try {
            int resultCnt       = 0;
            String commandTp    = customerInfoVO.getCommandTp();
            String custNo       = customerInfoVO.getCustNo();
            String custNm       = customerInfoVO.getCustNm();
            String hpNo         = customerInfoVO.getHpNo();
            String officeTelNo  = customerInfoVO.getOfficeTelNo();
            String mathDocTp    = customerInfoVO.getMathDocTp();
            String ssnCrnNo     = customerInfoVO.getSsnCrnNo();
            String custTp       = customerInfoVO.getCustTp();

            String oldCustNm    = customerInfoVO.getOldCustNm();
            String oldHpNo      = customerInfoVO.getOldHpNo();
            String oldMathDocTp = customerInfoVO.getOldMathDocTp();
            String oldSsnCrnNo  = customerInfoVO.getOldSsnCrnNo();


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
            /********************************************************************************************************
            ********************************************************************************************************
            ********************************************************************************************************
             * TODO CommandTp : ASSIGN  인경우 validation 체크 안하고 그냥 업데이트문만 실행하도록 변경 해주세요
             ********************************************************************************************************
            ********************************************************************************************************
            ********************************************************************************************************/

            /**
             * CommandTp에 따라 검증 진행
             * null : 고객등록
             * ASSIGN : 고객 배정
             * CONTRACT : 계약
             * BLUEMEMBER : 블루멤버십 업데이트
             */
            if (StringUtils.isEmpty(commandTp)) {
                // Required Value check
                boolean reqValueChk = false;
                reqValueChk = customerInfoReqValueChk(customerInfoVO);

                CustomerInfoVO obj = null;

                CustomerInfoSearchVO searchVO = new CustomerInfoSearchVO();
                searchVO.setsCustNm(custNm);
                searchVO.setsHpNo(hpNo);
                searchVO.setsOfficeTelNo(officeTelNo);
                searchVO.setsMathDocTp(mathDocTp);
                searchVO.setsSsnCrnNo(ssnCrnNo);
                searchVO.setsCustTp(custTp);

                searchVO.setsOldCustNm(oldCustNm);
                searchVO.setsOldHpNo(oldHpNo);
                searchVO.setsOldMathDocTp(oldMathDocTp);
                searchVO.setsOldSsnCrnNo(oldSsnCrnNo);

                if ( custTp.equals("01")) {
                    // 고객명 + 핸드폰
                    //if( (!custNm.equals(oldCustNm)) || (!hpNo.equals(oldHpNo)) ){
                    if(!hpNo.equals(oldHpNo)) {
                        obj = selectCustDupByKey(searchVO);
                    }
                } else {
                    // 고객명 + 대표전화
                    //if( (!custNm.equals(oldCustNm)) || (!officeTelNo.equals(oldHpNo)) ){
                    if(!officeTelNo.equals(oldHpNo)) {
                        obj = selectCustDupByKey(searchVO);
                    }
                }

                if (obj != null) {
                    throw processException("global.info.already");
                }

                // 증거유형 + 증거번호
                if( (!mathDocTp.equals(oldMathDocTp)) || (!ssnCrnNo.equals(oldSsnCrnNo)) ){
                    obj = selectCustMathDocDupByKey(searchVO);
                }

                if (obj != null) {
                    throw processException("global.info.already");
                }
            }

            // TODO [이교진] 권한체크를 한다. SA / TA
            //boolean isSc   = LoginUtil.hasRole("ROLE_SC");
            boolean isSc = true;

            if (isSc) {
                // 고객 정보를 업데이트 한다.
                resultCnt = customerInfoDAO.updateCustomer(customerInfoVO);
            } else {
                // 마스터 고객 정보를 업데이트 한다.
                //resultCnt = customerInfoDAO.updateMasterCustomer(customerInfoVO);
                resultCnt = customerInfoDAO.updateCustomer(customerInfoVO);
            }

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


            return customerInfoVO;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /**
     * Key에 해당하는 고객 정보를 조회한다.
     * @param CustomerInfoVO customerInfoVO (고객명 + 핸드폰)
     * @return 조회한 고객 정보
     */
    @Override
    public CustomerInfoVO selectCustDupByKey(CustomerInfoSearchVO searchVO) throws Exception {
        try {

            if (StringUtils.isEmpty(searchVO.getsDlrCd())){  searchVO.setsDlrCd(LoginUtil.getDlrCd());  }
            // 고객명 + 핸드폰
            return customerInfoDAO.selectCustDupByKey(searchVO);
        } catch (Exception e) {
            throw processException("global.info.failedMsg", new String[]{messageSource.getMessage("crm.info.custDup", null, LocaleContextHolder.getLocale())});
        }

    }

    /**
     * Key에 해당하는 고객 정보를 조회한다.
     * @param CustomerInfoVO customerInfoVO (증거유형 + 증거번호)
     * @return 조회한 고객 정보
     */
    @Override
    public CustomerInfoVO selectCustMathDocDupByKey(CustomerInfoSearchVO searchVO) throws Exception {
        try {
            if (StringUtils.isEmpty(searchVO.getsDlrCd())){  searchVO.setsDlrCd(LoginUtil.getDlrCd());  }
            // 증거유형 + 증거번호
            return customerInfoDAO.selectCustMathDocDupByKey(searchVO);
        } catch (Exception e) {
            throw processException("global.info.failedMsg", new String[]{messageSource.getMessage("crm.info.custDup", null, LocaleContextHolder.getLocale())});
        }

    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoService#selectNextCustNo()
     */
    @Override
    public String selectNextCustNo() throws Exception {
        try {
            //String custNo = customerInfoDAO.selectNextCustNo();
            String custNo = custNoIdgenService.getNextStringId();

            if (StringUtils.isEmpty(custNo)) {
                throw processException("global.err.idgen", new String[]{messageSource.getMessage("global.lbl.custNo", null, LocaleContextHolder.getLocale())});
            }

            return custNo;

        } catch (Exception e) {
            throw processException("global.err.idgen", new String[]{messageSource.getMessage("global.lbl.custNo", null, LocaleContextHolder.getLocale())});
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
    @SuppressWarnings("unused")
    @Override
    public List<CustomerInfoVO> selectCustDupCheck(List<CustomerInfoVO> list) throws Exception {

        try {
            CustomerInfoVO customerInfoVO = new CustomerInfoVO();
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
                customerInfoVO = new CustomerInfoVO();
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
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoService#updateCustomerInfoReq(chn.bhmc.dms.crm.cif.vo.CustomerInfoUpdtReqVO)
     */
    @Override
    public int insertCustomerInfoReq(CustomerInfoUpdtReqVO customerInfoUpdtReqVO) throws Exception {

        try {
            int updateCnt = 0;
            if (StringUtils.isEmpty(customerInfoUpdtReqVO.getDlrCd())) { customerInfoUpdtReqVO.setDlrCd(LoginUtil.getDlrCd()); }
            if (StringUtils.isEmpty(customerInfoUpdtReqVO.getRegUsrId())) { customerInfoUpdtReqVO.setRegUsrId(LoginUtil.getUserId()); }

            // 고객정보를 업데이트 한다. (자동)
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

            updateCustomer(customerInfoVO);

            if (customerInfoVO != null) {
                updateCnt = customerInfoUpdtReqDAO.insertCustomerInfoReq(customerInfoUpdtReqVO);
            }

            return updateCnt;

        } catch(Exception e) {
            throw new BizException(e.getMessage());
        }

    }




}
