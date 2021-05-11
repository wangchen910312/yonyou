package chn.bhmc.dms.crm.cif.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.exception.BizException;
import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService;
import chn.bhmc.dms.crm.cif.service.dao.CustomerInfoDAO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoVO;
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

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService#selectCustomerInfoByConditionCnt(chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO)
     */
    @Override
    public int selectCustomerInfoByConditionCnt(CustomerInfoSearchVO searchVO) throws Exception {
        // dlrCd, pltCd 체크해서 기본 셋팅 시작
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return customerInfoDAO.selectCustomerInfoByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService#selectCustomerInfoByCondition(chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO)
     */
    @Override
    public List<CustomerInfoVO> selectCustomerInfoByCondition(CustomerInfoSearchVO searchVO) throws Exception {

        // dlrCd, pltCd 체크해서 기본 셋팅 시작
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return customerInfoDAO.selectCustomerInfoByCondition(searchVO);

    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService#insertCustomer(chn.bhmc.dms.crm.cif.vo.CustomerInfoVO)
     */
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
            searchVO.setsMathDocTp(customerInfoVO.getMathDocTp());
            searchVO.setsSsnCrnNo(customerInfoVO.getSsnCrnNo());
            searchVO.setsCustTp(customerInfoVO.getCustTp());

            // 고객명+핸드폰
            CustomerInfoVO obj = selectCustDupByKey(searchVO);
            if(obj != null) {
                throw processException("global.info.already");  // throw processException("global.lbl.no");
            }

            // 증거유형 + 증거번호
            if ((StringUtils.isNotEmpty(searchVO.getsMathDocTp()) && StringUtils.isEmpty(searchVO.getsSsnCrnNo()))
                || (StringUtils.isEmpty(searchVO.getsMathDocTp()) && StringUtils.isNotEmpty(searchVO.getsSsnCrnNo())) ) {
                throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("global.info.customer", null, LocaleContextHolder.getLocale())});
            }
            if (StringUtils.isNotEmpty(searchVO.getsMathDocTp()) && StringUtils.isNotEmpty(searchVO.getsSsnCrnNo()) ) {
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
                /**
                 * 고객 페이지 외 다른 페이지에서 고객 등록 시 그룹/태드/취미 정보를 받지 않음.
                 */
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

            resultCnt = customerInfoDAO.updateCustomer(customerInfoVO);

            if (resultCnt < 1){
                throw processException("global.err.updateFailedParam", new String[]{messageSource.getMessage("global.info.customer", null, LocaleContextHolder.getLocale())});
            } else {

                /**
                 * 고객 페이지 외 다른 페이지에서 고객 등록 시 그룹/태드/취미 정보를 받지 않음.
                 */
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


}
