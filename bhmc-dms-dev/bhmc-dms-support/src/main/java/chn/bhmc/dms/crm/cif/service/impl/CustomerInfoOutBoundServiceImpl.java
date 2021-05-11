package chn.bhmc.dms.crm.cif.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.exception.BizException;
import able.com.service.HService;
import able.com.util.fmt.StringUtil;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeTxtSearchVO;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService;
import chn.bhmc.dms.crm.cif.service.dao.CustomerInfoDAO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoVO;
import chn.bhmc.dms.crm.cmm.service.RegularExpressionService;
import chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtOutBoundService;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtVO;
import chn.bhmc.dms.sal.cnt.service.ContractReOutBoundService;
import chn.bhmc.dms.sal.veh.service.VehicleMasterService;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterVO;
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
@Service("customerInfoOutBoundService")
public class CustomerInfoOutBoundServiceImpl extends HService implements CustomerInfoOutBoundService {

    /*
     * 고객정보 관리 DAO
     */
    @Resource(name="customerInfoDAO")
    CustomerInfoDAO customerInfoDAO;

    /**
     * Customer Member Management
     */
    @Resource(name="custNoIdgenService")
    EgovIdGnrService custNoIdgenService;

    /**
     * RegularExpressionService
     */
    @Resource(name="regularExpressionService")
    RegularExpressionService regularExpressionService;

    /**
     * vehicleMasterService
     */
    @Resource(name="vehicleMasterService")
    VehicleMasterService vehicleMasterService;

    /**
     * contractReOutBoundService
     */
    @Resource(name="contractReOutBoundService")
    ContractReOutBoundService contractReOutBoundService;

    /**
     * 판매기회 관리 서비스(OutBound)
     */
    @Resource(name="salesOpptProcessMgmtOutBoundService")
    SalesOpptProcessMgmtOutBoundService salesOpptProcessMgmtOutBoundService;

    /**
     * commonCode Management
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;


    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService#selectCustomerInfoByConditionCnt(chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO)
     */
    @Override
    public int selectCustomerInfoByConditionCnt(CustomerInfoSearchVO searchVO) throws Exception {

        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return customerInfoDAO.selectCustomerInfoByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService#selectCustomerInfoByCondition(chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO)
     */
    @Override
    public List<CustomerInfoVO> selectCustomerInfoByCondition(CustomerInfoSearchVO searchVO) throws Exception {

        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return customerInfoDAO.selectCustomerInfoByCondition(searchVO);

    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService#selectCustomerListByConditionCnt(chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO)
     */
    @Override
    public int selectCustomerListByConditionCnt(CustomerInfoSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        searchVO.setsMembershipStan(LoginUtil.getMembershipPolicy());

        return customerInfoDAO.selectCustomerListByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService#selectCustomerListByCondition(chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO)
     */
    @Override
    public List<CustomerInfoVO> selectCustomerListByCondition(CustomerInfoSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        searchVO.setsMembershipStan(LoginUtil.getMembershipPolicy());

        return customerInfoDAO.selectCustomerListByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService#insertCustomer(chn.bhmc.dms.crm.cif.vo.CustomerInfoVO)
     */
    @Override
    public CustomerInfoVO insertCustomer(CustomerInfoVO customerInfoVO) throws Exception {
        try {

            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */
            if (StringUtils.isEmpty(customerInfoVO.getDlrCd())){customerInfoVO.setDlrCd(LoginUtil.getDlrCd());}
            if (StringUtils.isEmpty(customerInfoVO.getRegUsrId())){customerInfoVO.setRegUsrId(LoginUtil.getUserId());}
            if (StringUtils.isNotBlank(customerInfoVO.getSsnCrnNo())){customerInfoVO.setSsnCrnNo(StringUtils.upperCase(customerInfoVO.getSsnCrnNo()));} //모든 증서번호는 대문자 처리.

            int resultCnt = 0;
            String regExpRlt = "";

            //핸드폰 번호 제한 걸기 11자리 안 되면 리턴
            if ("01".equals(customerInfoVO.getCustTp())) {
                if (StringUtils.isNotEmpty(customerInfoVO.getHpNo())) {

                    if (customerInfoVO.getHpNo().length() <= 10) {
                        throw processException("crm.info.hpno11DigitRequired");
                    }

                    // hpNo
                    regExpRlt = regularExpressionService.selectRegularExpressionByHpNo(customerInfoVO.getHpNo());
                    if ("FALSE".equals(regExpRlt)){
                        throw processException("crm.info.regExpHpNo"); // 이동전화 번호가 규칙에 맞지 않습니다.
                    }
                }
            }

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
                if("01".equals(customerInfoVO.getMathDocTp())) {
                    if (customerInfoVO.getSsnCrnNo().length() == 15) {
                        regExpRlt = regularExpressionService.selectRegularExpressionByRegiNo15Digit(customerInfoVO.getSsnCrnNo());
                        if ("FALSE".equals(regExpRlt)){
                            throw processException("crm.info.regExpSsnCrnNo"); // 신분증이 규칙에 맞지 않습니다.
                        }

                    } else if (customerInfoVO.getSsnCrnNo().length() == 18) {
                        regExpRlt = regularExpressionService.selectRegularExpressionByRegiNo18Digit(customerInfoVO.getSsnCrnNo());
                        if ("FALSE".equals(regExpRlt)){
                            throw processException("crm.info.regExpSsnCrnNo"); // 신분증이 규칙에 맞지 않습니다.
                        }
                    } else {
                        throw processException("crm.info.regExpSsnCrnNo"); // 신분증이 규칙에 맞지 않습니다.
                    }
                } else if("08".equals(customerInfoVO.getMathDocTp())) {
                    regExpRlt = regularExpressionService.selectRegularExpressionByCorpNo(customerInfoVO.getSsnCrnNo());
                    if ("FALSE".equals(regExpRlt)){
                        throw processException("crm.info.regExpSsnCrnNo"); // 법인번호가 규칙에 맞지 않습니다.
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
           customerInfoReqValueChk(customerInfoVO);

            CustomerInfoSearchVO searchVO = new CustomerInfoSearchVO();
            searchVO.setsDlrCd(customerInfoVO.getDlrCd());
            searchVO.setsCustNm(customerInfoVO.getCustNm());
            searchVO.setsHpNo(customerInfoVO.getHpNo());
            searchVO.setsOfficeTelNo(customerInfoVO.getOfficeTelNo());
            searchVO.setsCustTp(customerInfoVO.getCustTp());
            searchVO.setsCustCd("01");//고객이 신규일 경우 잠재고객임.
            searchVO.setsMathDocTp(customerInfoVO.getMathDocTp());
            searchVO.setsSsnCrnNo(customerInfoVO.getSsnCrnNo());

            // 핸드폰 또는 회사번호 (중복)
            CustomerInfoVO obj = selectCustDupByKey(searchVO);
            if(obj != null) {
                if(StringUtil.nullConvert(customerInfoVO.getCustCollSrcCd()) == "02"){
                    throw processException("crm.info.dupMsg", new String[]{"H"});
                } else {
                    throw processException("crm.info.dupMsg", new String[]{messageSource.getMessage("global.lbl.hpNo", null, LocaleContextHolder.getLocale())});
                }

            }

            // 증거유형 + 증거번호 ( 중복 )
            if (StringUtils.isNotBlank(searchVO.getsMathDocTp()) && StringUtils.isNotBlank(searchVO.getsSsnCrnNo()) ) {
                obj = selectCustMathDocDupByKey(searchVO);
                if(obj != null) {
                    if(StringUtil.nullConvert(customerInfoVO.getCustCollSrcCd()) == "02"){
                        throw processException("crm.info.dupMsg", new String[]{"S"});
                    } else {
                        throw processException("crm.info.dupMsg", new String[]{messageSource.getMessage("global.lbl.ssnCrnNo", null, LocaleContextHolder.getLocale())});
                    }
                }
            }

            // 고객번호 채번한다.
            String custNo = selectNextCustNo();
            customerInfoVO.setCustNo(custNo);
            customerInfoVO.setCustCd("01");//고객이 신규일 경우 잠재고객임.

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

            // 고객신규등록 페이지 외 다른 모듈에서 고객을 신규등록하는 경우 판매고문을 넣지 않는다.
            customerInfoVO.setMngScId("");
            // 신규 고객을 생성한다.
            selectCustomerCodeValidChk(customerInfoVO);
            resultCnt = customerInfoDAO.insertCustomer(customerInfoVO);
            if(resultCnt < 1){
                throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("global.info.customer", null, LocaleContextHolder.getLocale())});
            }

            return customerInfoVO;
        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService#updateCustomer(chn.bhmc.dms.crm.cif.vo.CustomerInfoVO)
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
            String emailNm      = customerInfoVO.getEmailNm();

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
            if (StringUtils.isNotBlank(customerInfoVO.getSsnCrnNo())){customerInfoVO.setSsnCrnNo(StringUtils.upperCase(customerInfoVO.getSsnCrnNo()));} //모든 증서번호는 대문자 처리.

            // 고객번호 확인
            if (StringUtils.isEmpty(custNo)){
                throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("global.lbl.custNo", null, LocaleContextHolder.getLocale())});
            }

            //핸드폰 번호 제한 걸기 11자리 안 되면 리턴
//            if ("01".equals(custTp)) {
//            }
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

            /*
             * ==============================================
             *  정규식 체크 - 시작
             * ==============================================
             */

            // emailNm
            if (StringUtils.isNotEmpty(emailNm)) {
                regExpRlt = regularExpressionService.selectRegularExpressionByEmail(emailNm);
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
                if("01".equals(customerInfoVO.getMathDocTp())) {
                    if (customerInfoVO.getSsnCrnNo().length() == 15) {
                        regExpRlt = regularExpressionService.selectRegularExpressionByRegiNo15Digit(customerInfoVO.getSsnCrnNo());
                        if ("FALSE".equals(regExpRlt)){
                            throw processException("crm.info.regExpSsnCrnNo"); // 신분증이 규칙에 맞지 않습니다.
                        }

                    } else if (customerInfoVO.getSsnCrnNo().length() == 18) {
                        regExpRlt = regularExpressionService.selectRegularExpressionByRegiNo18Digit(customerInfoVO.getSsnCrnNo());
                        if ("FALSE".equals(regExpRlt)){
                            throw processException("crm.info.regExpSsnCrnNo"); // 신분증이 규칙에 맞지 않습니다.
                        }
                    } else {
                        throw processException("crm.info.regExpSsnCrnNo"); // 신분증이 규칙에 맞지 않습니다.
                    }
                } else if("08".equals(customerInfoVO.getMathDocTp())) {
                    regExpRlt = regularExpressionService.selectRegularExpressionByCorpNo(customerInfoVO.getSsnCrnNo());
                    if ("FALSE".equals(regExpRlt)){
                        throw processException("crm.info.regExpSsnCrnNo"); // 법인번호가 규칙에 맞지 않습니다.
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
            searchVO.setsDlrCd(customerInfoVO.getDlrCd());
            searchVO.setsCustNo(custNo);

            if ("LEADOPPTPROC".equals(commandTp)
                    || ("UPDFROMCONTRACT".equals(commandTp))
                    || ("SERVICE".equals(commandTp))
                    ) {
                CustomerInfoVO bfCustInfoVO = new CustomerInfoVO();

                bfCustInfoVO = customerInfoDAO.selectCustomerInfoByKey(searchVO);

                custCd = bfCustInfoVO.getCustCd();
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
                    //mathDocTp = bfCustInfoVO.getMathDocTp();
                    oldMathDocTp = bfCustInfoVO.getMathDocTp();
                    //ssnCrnNo = bfCustInfoVO.getSsnCrnNo();
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
             * UPDFROMCONTRACT : 계약 :
             * CONTRACT : 계약(인도)
             * BLUEMEMBER : 블루멤버십 업데이트
             * LEADOPPTPROC : 판매기회관리
             * SHOWROOM : 전시장유동량
             * CARMASTER : 차량마스터관리
             * SERVICE : 소유자/방문자 정보 업데이트
             */
            if ((StringUtils.isEmpty(commandTp))
                    || ("LEADOPPTPROC".equals(commandTp))
                    || ("UPDFROMCONTRACT".equals(commandTp))
                    || ("SERVICE".equals(commandTp))
                    ) {

                // Required Value check
                boolean reqValueChk = false;
                reqValueChk = customerInfoReqValueChk(customerInfoVO);

                CustomerInfoVO obj = null;

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
                    // 핸드폰
                    //if( (!custNm.equals(oldCustNm)) || (!hpNo.equals(oldHpNo)) ){
                    if(!hpNo.equals(oldHpNo)) {
                        obj = selectCustDupByKey(searchVO);
                    }
                } else {
                    // 구매담당자 핸드폰
                    //if( (!custNm.equals(oldCustNm)) || (!officeTelNo.equals(oldHpNo)) ){
                    if(!hpNo.equals(oldHpNo)) {
                        obj = selectCustDupByKey(searchVO);
                    }
                }

                if (obj != null) {
                    //throw processException("global.info.already");
                    throw processException("crm.info.dupMsg", new String[]{messageSource.getMessage("global.lbl.hpNo", null, LocaleContextHolder.getLocale())});
                }

                // 증거유형 + 증거번호
                if( (!mathDocTp.equals(oldMathDocTp)) || (!ssnCrnNo.equals(oldSsnCrnNo)) ){
                    obj = selectCustMathDocDupByKey(searchVO);
                }

                if (obj != null) {
                    //throw processException("global.info.already");
                    throw processException("crm.info.dupMsg", new String[]{messageSource.getMessage("global.lbl.ssnCrnNo", null, LocaleContextHolder.getLocale())});
                }
            }

            // 고객 타입정의 하여 업데이트 (잠재/보유/타사보유)
            custCd = selectCustomerCustCd(customerInfoVO);
            customerInfoVO.setCustCd(custCd);

            // 유일정보 수정 가능 여부 판단
            String ableToEditSsn = selectAbleToEditSsnCrnNo(customerInfoVO.getDlrCd(), customerInfoVO.getCustNo());

            if ( "N".equals(ableToEditSsn) ) {
                customerInfoVO.setMathDocTp(null);
                customerInfoVO.setMathDocTpC(null);
                customerInfoVO.setSsnCrnNo(null);
                customerInfoVO.setSsnCrnNoC(null);
            }

            selectCustomerCodeValidChk(customerInfoVO);
            resultCnt = customerInfoDAO.updateCustomer(customerInfoVO);

            if (resultCnt < 1){
                throw processException("global.err.updateFailedParam", new String[]{messageSource.getMessage("global.info.customer", null, LocaleContextHolder.getLocale())});
            } else {

                /**
                 * 고객 페이지 외 다른 페이지에서 고객 등록 시 그룹/태드/취미 정보를 받지 않음.
                 */
            }

            // 고객쪽 업데이트 후 판매정보 업데이트를 위한 서비스 호출
            contractReOutBoundService.updateContractCustInfo(customerInfoVO.getCustNo(), customerInfoVO.getDlrCd());

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

        if ("01".equals(customerInfoVO.getCustTp())) {

            if (StringUtils.isEmpty(customerInfoVO.getCustNm())) {
                throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("global.lbl.custNm", null, LocaleContextHolder.getLocale())});
            }
            if (StringUtils.isEmpty(customerInfoVO.getHpNo())) {
                throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("global.lbl.hpNo", null, LocaleContextHolder.getLocale())});
            }
            if (StringUtils.isEmpty(customerInfoVO.getPrefCommMthCd())) {
                customerInfoVO.setPrefCommMthCd("01"); //핸드폰번호가 있고 주요연락방법이 없는 경우 핸드폰으로 한다.
                //throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("crm.lbl.prefCommMthCd", null, LocaleContextHolder.getLocale())});
            }
            if (StringUtils.isEmpty(customerInfoVO.getPrefCommNo())) {
                customerInfoVO.setPrefCommNo(customerInfoVO.getHpNo()); //핸드폰번호가 있고 주요연락번호가 없는 경우 핸드폰 번호로 한다.
                //throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("crm.lbl.prefCommNo", null, LocaleContextHolder.getLocale())});
            }
        } else if ("02".equals(customerInfoVO.getCustTp())) {
            if (StringUtils.isEmpty(customerInfoVO.getCustNm())) {
                throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("crm.lbl.corporation", null, LocaleContextHolder.getLocale())});
            }

            //            if (StringUtils.isEmpty(customerInfoVO.getOfficeTelNo())) {
//                throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("global.lbl.officeTelNo", null, LocaleContextHolder.getLocale())});
//            }
            if (StringUtils.isEmpty(customerInfoVO.getPurcMngNm())) {
                throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("crm.lbl.corpPurcMng", null, LocaleContextHolder.getLocale())});
            }
            if (StringUtils.isEmpty(customerInfoVO.getHpNo())) {
                throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("global.lbl.hpNo", null, LocaleContextHolder.getLocale())});
            }
        }

        if ("02".equals(customerInfoVO.getCustCd())) {
            if (StringUtils.isEmpty(customerInfoVO.getMathDocTp())) {
                throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("global.lbl.mathDocTp", null, LocaleContextHolder.getLocale())});
            }
            if (StringUtils.isEmpty(customerInfoVO.getSsnCrnNo()) ) {
                throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("global.lbl.ssnCrnNo", null, LocaleContextHolder.getLocale())});
            }
        }

        // 증거유형 + 증거번호 ( 항목 체크 )
        if ((StringUtils.isNotBlank(customerInfoVO.getMathDocTp()) && StringUtils.isEmpty(customerInfoVO.getSsnCrnNo()))
            || (StringUtils.isEmpty(customerInfoVO.getMathDocTp()) && StringUtils.isNotBlank(customerInfoVO.getSsnCrnNo())) ) {
            throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("crm.info.certiInfo", null, LocaleContextHolder.getLocale())});
        }

        return true;

    }

    /**
     * Key에 해당하는 고객 정보를 조회한다.
     * 고객타입(custCd)가 잠재(01), 보유(02)에 따라 체크 로직 다름
     * 잠재(01)인 경유 잠재고객 내에서만 중복을 체크 한다. (타사보유고객(03) 포함)
     * 보유(02)인 경우 중복을 체크하지 않는다.
     * @param CustomerInfoVO customerInfoVO (고객명 + 핸드폰)
     * @return 조회한 고객 정보
     */
    @Override
    public CustomerInfoVO selectCustDupByKey(CustomerInfoSearchVO searchVO) throws Exception {
        try {

            if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}
            if (StringUtils.isEmpty(searchVO.getsDlrCd())){  searchVO.setsDlrCd(LoginUtil.getDlrCd());  }

            if(StringUtils.isNotEmpty(searchVO.getsHpNo())){
                String regExpRlt = "";
                if (searchVO.getsHpNo().length() != 11) {
                    throw processException("crm.info.hpno11DigitRequired");
                }

             // hpNo
                regExpRlt = regularExpressionService.selectRegularExpressionByHpNo(searchVO.getsHpNo());
                if ("FALSE".equals(regExpRlt)){
                    throw processException("crm.info.regExpHpNo"); // 이동전화 번호가 규칙에 맞지 않습니다.
                }
            }

            // CustCd(잠재,보유) 정보가 안 넘어오는 경우 고객을 다시 조회하여 CustCd를 셋팅한다.
            String custCd = searchVO.getsCustCd();

            // 고객 타입정의 하여 업데이트 (잠재/보유/타사보유)
            if (StringUtils.isNotEmpty(searchVO.getsCustNo()) ) {
                CustomerInfoVO customerVO = new CustomerInfoVO();
                customerVO.setCustNo(searchVO.getsCustNo());
                custCd = selectCustomerCustCd(customerVO);
            } else {
                custCd = "01";
            }

            // 잠재고객
            // 개인 : 핸드폰
            // 법인 : 구매담당자 핸드폰
            if (("01".equals(custCd))
                    || ("03".equals(custCd))
                    ) { // 잠재고객 또는 타사보유고객
                return customerInfoDAO.selectCustDupByKey(searchVO);
            }
            return null;
        } catch (Exception e) {
            throw new BizException(e.getMessage());
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
            if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}
            if (StringUtils.isEmpty(searchVO.getsDlrCd())){  searchVO.setsDlrCd(LoginUtil.getDlrCd());}
            if (StringUtils.isNotBlank(searchVO.getsSsnCrnNo())){searchVO.setsSsnCrnNo(StringUtils.upperCase(searchVO.getsSsnCrnNo()));} //모든 증서번호는 대문자 처리.
            String regExpRlt = "TRUE";
            // ssnCrnNo
            if (StringUtils.isNotEmpty(searchVO.getsSsnCrnNo())) {
                if("01".equals(searchVO.getsMathDocTp())) {
                    if (searchVO.getsSsnCrnNo().length() == 15) {
                        regExpRlt = regularExpressionService.selectRegularExpressionByRegiNo15Digit(searchVO.getsSsnCrnNo());
                        if ("FALSE".equals(regExpRlt)){
                            throw processException("crm.info.regExpSsnCrnNo"); // 증서번호가 규칙에 맞지 않습니다.
                        }

                    } else if (searchVO.getsSsnCrnNo().length() == 18) {
                        regExpRlt = regularExpressionService.selectRegularExpressionByRegiNo18Digit(searchVO.getsSsnCrnNo());
                        if ("FALSE".equals(regExpRlt)){
                            throw processException("crm.info.regExpSsnCrnNo"); // 증서번호가 규칙에 맞지 않습니다.
                        }
                    } else {
                        throw processException("crm.info.regExpSsnCrnNo"); // 증서번호가 규칙에 맞지 않습니다.
                    }
                } else if("08".equals(searchVO.getsMathDocTp())) {
                    regExpRlt = regularExpressionService.selectRegularExpressionByCorpNo(searchVO.getsSsnCrnNo());
                    if ("FALSE".equals(regExpRlt)){
                        throw processException("crm.info.regExpSsnCrnNo"); // 증서번호가 규칙에 맞지 않습니다.
                    }
                } else if("10".equals(searchVO.getsMathDocTp())) {
                    if (searchVO.getsSsnCrnNo().length() != 18) {
                        throw processException("crm.info.lengthCheckMsg", new String[]{messageSource.getMessage("global.lbl.ssnCrnNo", null, LocaleContextHolder.getLocale())});
                    }
                }
            }

            // 증거유형 + 증거번호
            CustomerInfoVO obj = customerInfoDAO.selectCustMathDocDupByKey(searchVO);
//            if (obj == null) {
//                throw processException("global.info.ableToDo"); // 등록가능합니다.
//            }
            return obj;
        } catch (Exception e) {
            //throw processException("global.info.failedMsg", new String[]{messageSource.getMessage("crm.info.custDup", null, LocaleContextHolder.getLocale())});
            throw new BizException(e.getMessage());
        }

    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService#selectCustMathDocDupByKeyCnt(chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO)
     */
    @Override
    public int selectCustMathDocDupByKeyCnt(CustomerInfoSearchVO searchVO) throws Exception {
        try {
            if (StringUtils.isEmpty(searchVO.getsDlrCd())){  searchVO.setsDlrCd(LoginUtil.getDlrCd());  }
            if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}
            // 증거유형 + 증거번호
            return customerInfoDAO.selectCustMathDocDupByKeyCnt(searchVO);
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
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoService#updateBlueMemberCustomer(chn.bhmc.dms.crm.cif.vo.CustomerInfoVO)
     */
    @Override
    public int updateBlueMemberCustomer(CustomerInfoVO customerInfoVO) throws Exception {
        try {
            if (StringUtils.isEmpty(customerInfoVO.getDlrCd())) {customerInfoVO.setDlrCd(LoginUtil.getDlrCd());  }
            if (StringUtils.isEmpty(customerInfoVO.getUpdtUsrId())){customerInfoVO.setUpdtUsrId(LoginUtil.getUserId());}

            selectCustomerCodeValidChk(customerInfoVO);
            return customerInfoDAO.updateCustomer(customerInfoVO);

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService#selectCustDupByKeyCnt(chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO)
     */
    @Override
    public int selectCustDupByKeyCnt(CustomerInfoSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){  searchVO.setsDlrCd(LoginUtil.getDlrCd());  }
        return customerInfoDAO.selectCustDupByKeyCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService#selectCustomerCustCd(chn.bhmc.dms.crm.cif.vo.CustomerInfoVO)
     */
    @Override
    public String selectCustomerCustCd(CustomerInfoVO customerInfoVO) throws Exception {

        String custCd = "01";
        if (StringUtils.isNotEmpty(customerInfoVO.getCustNo())) {
            VehicleMasterSearchVO vehicleMasterSearchVO = new VehicleMasterSearchVO();
            vehicleMasterSearchVO.setsCustNo(customerInfoVO.getCustNo());
            vehicleMasterSearchVO.setsUseYn("Y");
            List<VehicleMasterVO> vehicleMasterVO = vehicleMasterService.selectVehicleCustCntSearch(vehicleMasterSearchVO);

            if (vehicleMasterVO.size() !=0) {
                if (vehicleMasterVO.get(0).getnCnt() > 0){
                    custCd = "02";
                } else {
                    if (vehicleMasterVO.get(0).getoCnt() > 0) {
                        custCd = "03";
                    }
                }
            }
        }

        return custCd;
    }

    /*
     * 고객조회 팝업 > 차량정보 기준 고객 목록
     */
    @Override
    public List<CustomerInfoVO> selectCustomerAndCarInfoByCondition(CustomerInfoSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        searchVO.setsMembershipStan(LoginUtil.getMembershipPolicy());

        return customerInfoDAO.selectCustomerAndCarInfoByCondition(searchVO);
    }

    /*
     * 고객조회 팝업 > 차량정보 기준 고객 목록 수량
     */
    @Override
    public int selectCustomerAndCarInfoByConditionCnt(CustomerInfoSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        searchVO.setsMembershipStan(LoginUtil.getMembershipPolicy());

        return customerInfoDAO.selectCustomerAndCarInfoByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService#selectCustomerAndPconInfoByConditionCnt(chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO)
     */
    @Override
    public int selectCustomerAndPconInfoByConditionCnt(CustomerInfoSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        searchVO.setsMembershipStan(LoginUtil.getMembershipPolicy());

        return customerInfoDAO.selectCustomerAndPconInfoByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService#selectCustomerAndPconInfoByCondition(chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO)
     */
    @Override
    public List<CustomerInfoVO> selectCustomerAndPconInfoByCondition(CustomerInfoSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        searchVO.setsMembershipStan(LoginUtil.getMembershipPolicy());

        return customerInfoDAO.selectCustomerAndPconInfoByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService#multiCustomerMngScAssign(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiCustomerMngScAssign(BaseSaveVO<CustomerInfoVO> obj) throws Exception {

        String usrId = LoginUtil.getUserId();

        for(CustomerInfoVO customerInfoVO : obj.getUpdateList()) {
            customerInfoVO.setUpdtUsrId(usrId);
            customerInfoDAO.updateCustomerMngScAssign(customerInfoVO);

            // 판매기회 업데이트
            SalesOpptProcessMgmtVO salesOpptProcessMgmtVO = new SalesOpptProcessMgmtVO();
            salesOpptProcessMgmtVO.setDlrCd(customerInfoVO.getDlrCd());
            salesOpptProcessMgmtVO.setCustNo(customerInfoVO.getCustNo());
            salesOpptProcessMgmtVO.setMngScId(customerInfoVO.getMngScId());
            salesOpptProcessMgmtOutBoundService.updateSalesOpptFromOutService(salesOpptProcessMgmtVO);

            // 판매고문 업데이트 후 판매쪽 업데이를 위한 서비스 호출
            contractReOutBoundService.updateContractCustInfo(customerInfoVO.getCustNo(), customerInfoVO.getDlrCd());
        }
    }

    /*
     * @see chn.bhmc.dms.crm.cmm.service.CrmCommonService#selectRegularExpressionByHpNo(java.lang.String, java.lang.String)
     */
    @Override
    public String selectAbleToEditSsnCrnNo(String dlrCd, String custNo) throws Exception {

        return customerInfoDAO.selectAbleToEditSsnCrnNo(dlrCd, custNo);
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService#selectCustomerCodeValidChk(chn.bhmc.dms.crm.cif.vo.CustomerInfoVO)
     */
    @Override
    public String selectCustomerCodeValidChk(CustomerInfoVO customerInfoVO) throws Exception {
        try {

            int chkCodeCnt = 0;

            CommonCodeTxtSearchVO codeSearchVO = new CommonCodeTxtSearchVO();

            // 고객코드 (CUST_CD)
            if ( StringUtils.isNotBlank(customerInfoVO.getCustCd()) ) {
                codeSearchVO.setsCmmGrpCd("CRM023");
                codeSearchVO.setsCmmCd(customerInfoVO.getCustCd());
                chkCodeCnt = commonCodeService.selectCommonCodeTxtsByConditionCnt(codeSearchVO);
                if (chkCodeCnt == 0) {
                    throw processException("crm.info.TpNotCommCode", new String[]{messageSource.getMessage("global.lbl.custCd", null, LocaleContextHolder.getLocale())});
                }
            }

            // 고객유형
            if ( StringUtils.isNotBlank(customerInfoVO.getCustTp()) ) {
                codeSearchVO.setsCmmGrpCd("CRM001");
                codeSearchVO.setsCmmCd(customerInfoVO.getCustTp());
                chkCodeCnt = commonCodeService.selectCommonCodeTxtsByConditionCnt(codeSearchVO);
                if (chkCodeCnt == 0) {
                    throw processException("crm.info.TpNotCommCode", new String[]{messageSource.getMessage("global.lbl.custTp", null, LocaleContextHolder.getLocale())});
                }
            }

            // 선호연락방법코드
            if ( StringUtils.isNotBlank(customerInfoVO.getPrefCommMthCd()) ) {
                codeSearchVO.setsCmmGrpCd("CRM022");
                codeSearchVO.setsCmmCd(customerInfoVO.getPrefCommMthCd());
                chkCodeCnt = commonCodeService.selectCommonCodeTxtsByConditionCnt(codeSearchVO);
                if (chkCodeCnt == 0) {
                    throw processException("crm.info.TpNotCommCode", new String[]{messageSource.getMessage("global.lbl.prefCommMthCd", null, LocaleContextHolder.getLocale())});
                }
            }

            // 우선연락방식
            if ( StringUtils.isNotBlank(customerInfoVO.getPrefContactMthCd()) ) {
                codeSearchVO.setsCmmGrpCd("CRM038");
                codeSearchVO.setsCmmCd(customerInfoVO.getPrefContactMthCd());
                chkCodeCnt = commonCodeService.selectCommonCodeTxtsByConditionCnt(codeSearchVO);
                if (chkCodeCnt == 0) {
                    throw processException("crm.info.TpNotCommCode", new String[]{messageSource.getMessage("crm.lbl.prefContactMthCd", null, LocaleContextHolder.getLocale())});
                }
            }

            // 우선연락시간
            if ( StringUtils.isNotBlank(customerInfoVO.getPrefContactTimeCd()) ) {
                codeSearchVO.setsCmmGrpCd("CRM027");
                codeSearchVO.setsCmmCd(customerInfoVO.getPrefContactTimeCd());
                chkCodeCnt = commonCodeService.selectCommonCodeTxtsByConditionCnt(codeSearchVO);
                if (chkCodeCnt == 0) {
                    throw processException("crm.info.TpNotCommCode", new String[]{messageSource.getMessage("crm.lbl.prefContactTime", null, LocaleContextHolder.getLocale())});
                }
            }

            // 직업코드
            if ( StringUtils.isNotBlank(customerInfoVO.getJobCd()) ) {
                codeSearchVO.setsCmmGrpCd("CRM002");
                codeSearchVO.setsCmmCd(customerInfoVO.getJobCd());
                chkCodeCnt = commonCodeService.selectCommonCodeTxtsByConditionCnt(codeSearchVO);
                if (chkCodeCnt == 0) {
                    throw processException("crm.info.TpNotCommCode", new String[]{messageSource.getMessage("global.lbl.job", null, LocaleContextHolder.getLocale())});
                }
            }

            // 회사유형
            if ( StringUtils.isNotBlank(customerInfoVO.getCmpTp()) ) {
                codeSearchVO.setsCmmGrpCd("CRM032");
                codeSearchVO.setsCmmCd(customerInfoVO.getCmpTp());
                chkCodeCnt = commonCodeService.selectCommonCodeTxtsByConditionCnt(codeSearchVO);
                if (chkCodeCnt == 0) {
                    throw processException("crm.info.TpNotCommCode", new String[]{messageSource.getMessage("global.lbl.cmpTp", null, LocaleContextHolder.getLocale())});
                }
            }

            // 회사규모내용
//            if ( StringUtils.isNotBlank(customerInfoVO.getCmpScaleCont()) ) {
//                codeSearchVO.setsCmmGrpCd("CRM026");
//                codeSearchVO.setsCmmCd(customerInfoVO.getCmpScaleCont());
//                chkCodeCnt = commonCodeService.selectCommonCodeTxtsByConditionCnt(codeSearchVO);
//                if (chkCodeCnt == 0) {
//                    throw processException("crm.info.TpNotCommCode", new String[]{messageSource.getMessage("global.lbl.cmpScale", null, LocaleContextHolder.getLocale())});
//                }
//            }

            // 증서유형
            if ( StringUtils.isNotBlank(customerInfoVO.getMathDocTp()) ) {
                codeSearchVO.setsCmmGrpCd("CRM024");
                codeSearchVO.setsCmmCd(customerInfoVO.getMathDocTp());
                chkCodeCnt = commonCodeService.selectCommonCodeTxtsByConditionCnt(codeSearchVO);
                if (chkCodeCnt == 0) {
                    throw processException("crm.info.TpNotCommCode", new String[]{messageSource.getMessage("global.lbl.mathDocTp", null, LocaleContextHolder.getLocale())});
                }
            }

            // 고객확보유형
            if ( StringUtils.isNotBlank(customerInfoVO.getCustHoldTp()) ) {
                codeSearchVO.setsCmmGrpCd("CRM095");  // 판매기회 리드출처 CRM008
                codeSearchVO.setsCmmCd(customerInfoVO.getCustHoldTp());
                chkCodeCnt = commonCodeService.selectCommonCodeTxtsByConditionCnt(codeSearchVO);
                if (chkCodeCnt == 0) {
                    throw processException("crm.info.TpNotCommCode", new String[]{messageSource.getMessage("crm.lbl.custSource", null, LocaleContextHolder.getLocale())});
                }
            }

            // 성별
            if ( StringUtils.isNotBlank(customerInfoVO.getSexCd()) ) {
                chkCodeCnt = 0;
                codeSearchVO.setsCmmGrpCd("COM017");
                codeSearchVO.setsCmmCd(customerInfoVO.getSexCd());
                chkCodeCnt = commonCodeService.selectCommonCodeTxtsByConditionCnt(codeSearchVO);
                if (chkCodeCnt == 0) {
                    throw processException("crm.info.TpNotCommCode", new String[]{messageSource.getMessage("global.lbl.sex", null, LocaleContextHolder.getLocale())});
                }
            }

            // 결혼코드
            if ( StringUtils.isNotBlank(customerInfoVO.getMarryCd()) ) {
                chkCodeCnt = 0;
                codeSearchVO.setsCmmGrpCd("CRM028");
                codeSearchVO.setsCmmCd(customerInfoVO.getMarryCd());
                chkCodeCnt = commonCodeService.selectCommonCodeTxtsByConditionCnt(codeSearchVO);
                if (chkCodeCnt == 0) {
                    throw processException("crm.info.TpNotCommCode", new String[]{messageSource.getMessage("global.lbl.marryYn", null, LocaleContextHolder.getLocale())});
                }
            }

            // 학력코드
            if ( StringUtils.isNotBlank(customerInfoVO.getAcCareerCd()) ) {
                chkCodeCnt = 0;
                codeSearchVO.setsCmmGrpCd("CRM012");
                codeSearchVO.setsCmmCd(customerInfoVO.getAcCareerCd());
                chkCodeCnt = commonCodeService.selectCommonCodeTxtsByConditionCnt(codeSearchVO);
                if (chkCodeCnt == 0) {
                    throw processException("crm.info.TpNotCommCode", new String[]{messageSource.getMessage("global.lbl.acCareerCd", null, LocaleContextHolder.getLocale())});
                }
            }

            // 소득레벨코드
            if ( StringUtils.isNotBlank(customerInfoVO.getIncomeLvlCd()) ) {
                chkCodeCnt = 0;
                codeSearchVO.setsCmmGrpCd("CRM013");
                codeSearchVO.setsCmmCd(customerInfoVO.getIncomeLvlCd());
                chkCodeCnt = commonCodeService.selectCommonCodeTxtsByConditionCnt(codeSearchVO);
                if (chkCodeCnt == 0) {
                    throw processException("crm.info.TpNotCommCode", new String[]{messageSource.getMessage("global.lbl.incomeLvlCd", null, LocaleContextHolder.getLocale())});
                }
            }

            // 업종
            if ( StringUtils.isNotBlank(customerInfoVO.getBizcondCd()) ) {
                chkCodeCnt = 0;
                codeSearchVO.setsCmmGrpCd("CRM031");
                codeSearchVO.setsCmmCd(customerInfoVO.getBizcondCd());
                chkCodeCnt = commonCodeService.selectCommonCodeTxtsByConditionCnt(codeSearchVO);
                if (chkCodeCnt == 0) {
                    throw processException("crm.info.TpNotCommCode", new String[]{messageSource.getMessage("global.lbl.bizCondition", null, LocaleContextHolder.getLocale())});
                }
            }

            // 혈액형
            if ( StringUtils.isNotBlank(customerInfoVO.getBloodTp()) ) {
                chkCodeCnt = 0;
                codeSearchVO.setsCmmGrpCd("CRM036");
                codeSearchVO.setsCmmCd(customerInfoVO.getBloodTp());
                chkCodeCnt = commonCodeService.selectCommonCodeTxtsByConditionCnt(codeSearchVO);
                if (chkCodeCnt == 0) {
                    throw processException("crm.info.TpNotCommCode", new String[]{messageSource.getMessage("global.lbl.bloodTp", null, LocaleContextHolder.getLocale())});
                }
            }

            // 중국띠코드
            if ( StringUtils.isNotBlank(customerInfoVO.getChinaZodiacSignCd()) ) {
                chkCodeCnt = 0;
                codeSearchVO.setsCmmGrpCd("CRM034");
                codeSearchVO.setsCmmCd(customerInfoVO.getChinaZodiacSignCd());
                chkCodeCnt = commonCodeService.selectCommonCodeTxtsByConditionCnt(codeSearchVO);
                if (chkCodeCnt == 0) {
                    throw processException("crm.info.TpNotCommCode", new String[]{messageSource.getMessage("global.lbl.chinaZodiacSign", null, LocaleContextHolder.getLocale())});
                }
            }

            // 직무코드
            if ( StringUtils.isNotBlank(customerInfoVO.getDutyCd()) ) {
                chkCodeCnt = 0;
                codeSearchVO.setsCmmGrpCd("CRM037");
                codeSearchVO.setsCmmCd(customerInfoVO.getDutyCd());
                chkCodeCnt = commonCodeService.selectCommonCodeTxtsByConditionCnt(codeSearchVO);
                if (chkCodeCnt == 0) {
                    throw processException("crm.info.TpNotCommCode", new String[]{messageSource.getMessage("global.lbl.jobNm", null, LocaleContextHolder.getLocale())});
                }
            }

            // 별자리
            if ( StringUtils.isNotBlank(customerInfoVO.getZodiacSignCd()) ) {
                chkCodeCnt = 0;
                codeSearchVO.setsCmmGrpCd("CRM035");
                codeSearchVO.setsCmmCd(customerInfoVO.getZodiacSignCd());
                chkCodeCnt = commonCodeService.selectCommonCodeTxtsByConditionCnt(codeSearchVO);
                if (chkCodeCnt == 0) {
                    throw processException("crm.info.TpNotCommCode", new String[]{messageSource.getMessage("global.lbl.zodiacSign", null, LocaleContextHolder.getLocale())});
                }
            }

            // 블루멤버십 등급
            if ( StringUtils.isNotBlank(customerInfoVO.getBlueGradeNm()) ) {
                chkCodeCnt = 0;
                codeSearchVO.setsCmmGrpCd("CRM806");
                codeSearchVO.setsCmmCd(customerInfoVO.getBlueGradeNm());
                chkCodeCnt = commonCodeService.selectCommonCodeTxtsByConditionCnt(codeSearchVO);
                if (chkCodeCnt == 0) {
                    throw processException("crm.info.TpNotCommCode", new String[]{messageSource.getMessage("global.lbl.BlueMbrShipReg", null, LocaleContextHolder.getLocale())});
                }
            }

            // 고객수집유형코드
            if ( StringUtils.isNotBlank(customerInfoVO.getCustCollSrcCd()) ) {
                chkCodeCnt = 0;
                codeSearchVO.setsCmmGrpCd("CRM042");
                codeSearchVO.setsCmmCd(customerInfoVO.getCustCollSrcCd());
                chkCodeCnt = commonCodeService.selectCommonCodeTxtsByConditionCnt(codeSearchVO);
                if (chkCodeCnt == 0) {
                    throw processException("crm.info.TpNotCommCode", new String[]{messageSource.getMessage("crm.lbl.custCollSrc", null, LocaleContextHolder.getLocale())});
                }
            }

        } catch(Exception e){
            throw new BizException(e.getMessage());
        }
        return null;
    }

}
