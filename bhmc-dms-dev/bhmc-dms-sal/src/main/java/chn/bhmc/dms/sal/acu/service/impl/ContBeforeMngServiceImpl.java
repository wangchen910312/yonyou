package chn.bhmc.dms.sal.acu.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO;
import chn.bhmc.dms.crm.cmm.service.AddressInfoService;
import chn.bhmc.dms.crm.cmm.vo.AddressInfoSearchVO;
import chn.bhmc.dms.crm.cmm.vo.AddressInfoVO;
import chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtOutBoundService;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtVO;
import chn.bhmc.dms.sal.acu.service.ContBeforeMngService;
import chn.bhmc.dms.sal.acu.service.dao.ContBeforeMngDAO;
import chn.bhmc.dms.sal.acu.vo.ContBeforeMngSaveVO;
import chn.bhmc.dms.sal.acu.vo.ContBeforeMngSearchVO;
import chn.bhmc.dms.sal.acu.vo.ContBeforeMngVO;
import chn.bhmc.dms.sal.fin.service.PayInfoService;
import chn.bhmc.dms.sal.fin.vo.PayInfoDetailVO;
import chn.bhmc.dms.sal.fin.vo.PayInfoSearchVO;
import chn.bhmc.dms.sal.fin.vo.PayInfoVO;

/**
 * @ClassName   : ContBeforeMngServiceImpl
 * @Description : 예약판매
 * @author
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 11.          최초 생성
 * </pre>
 */

@Service("contBeforeMngService")
public class ContBeforeMngServiceImpl extends HService implements ContBeforeMngService {

    /**
     * 예약판매 DAO 선언
     */
    @Resource(name="contBeforeMngDAO")
    ContBeforeMngDAO contBeforeMngDAO;


    /**
     * 예약판매 주문번호 생성 id gen
     */
    @Resource(name="contBeforeMngIdgenService")
    TableIdGenService contBeforeMngIdgenService;

    /**
     * 고객 필수정보
     */
    @Resource(name="customerInfoOutBoundService")
    CustomerInfoOutBoundService customerInfoOutBoundService;

    /**
     * 고객 주소정보
     */
    @Resource(name="addressInfoService")
    AddressInfoService addressInfoService;

    /**
     * 수납 서비스
     */
    @Resource(name="payInfoService")
    PayInfoService payInfoService;

    /**
     * CRM 판매기회 관리 서비스
     */
    @Resource(name="salesOpptProcessMgmtOutBoundService")
    SalesOpptProcessMgmtOutBoundService salesOpptProcessMgmtOutBoundService;


    /**
     * 조회 조건에 해당하는 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContBeforeMngSearchVO
     * @return
     */
    @Override
    public int selectContBeforeMngsByConditionCnt(ContBeforeMngSearchVO searchVO) throws Exception{
        return contBeforeMngDAO.selectContBeforeMngsByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContBeforeMngSearchVO
     * @return
     */
    @Override
    public List<ContBeforeMngVO> selectContBeforeMngsByCondition(ContBeforeMngSearchVO searchVO) throws Exception{
        return contBeforeMngDAO.selectContBeforeMngsByCondition(searchVO);
    }

    /**
     *  저장,완료 한다.
     */
    @Override
    public String multiContBeforeMngs(ContBeforeMngVO saveVO) throws Exception{

        if(StringUtils.isEmpty(saveVO.getDlrCd())){
            saveVO.setDlrCd(LoginUtil.getDlrCd());
        }

        if(  saveVO.getBeforeContractDt() == null){
            // [계약일자]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.contractDt", null, LocaleContextHolder.getLocale())});
        };
        if( StringUtils.isEmpty(saveVO.getCustNo()) ){
            // [고객]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.customer", null, LocaleContextHolder.getLocale())});
        };
        if( StringUtils.isEmpty(saveVO.getCustTp()) ){
            // [고객]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.custTp", null, LocaleContextHolder.getLocale())});
        };
        if( StringUtils.isEmpty(saveVO.getCustNm()) ){
            // [고객명]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.custNm", null, LocaleContextHolder.getLocale())});
        };
        if( StringUtils.isEmpty(saveVO.getCarlineCd()) ){
            // [차종]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.carLine", null, LocaleContextHolder.getLocale())});
        };
        /*
        if( StringUtils.isEmpty(saveVO.getModelCd()) ){
            // [모델]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.model", null, LocaleContextHolder.getLocale())});
        };
         */

        updateCustInfo(saveVO);

        String beforeNo = "";
        saveVO.setRegUsrId(LoginUtil.getUserId());     // 생성자
        saveVO.setUpdtUsrId(LoginUtil.getUserId());    // 수정자

        if("COMPLETE".equals(saveVO.getmFlag())){
            saveVO.setBeforeStatCd("20");
        }else{
            saveVO.setBeforeStatCd("10");
        }

        if(StringUtils.isBlank(saveVO.getBeforeNo())){
            // A + 년월 Seq
            beforeNo = contBeforeMngIdgenService.getNextStringId();
            saveVO.setBeforeNo(beforeNo);

            contBeforeMngDAO.insertContBeforeMng(saveVO);

            // 2017.03.28 예약판매 완료시에만 수납데이터 생성으로 변경
            if("Y".equals(saveVO.getImplyYn()) && "COMPLETE".equals(saveVO.getmFlag()) ){
                // SA_0451T : 수납헤더 생성
                insertBeforePayinfo(saveVO);
            }
        }else{
            beforeNo = saveVO.getBeforeNo();
            contBeforeMngDAO.updateContBeforeMng(saveVO);

            // 2017.03.28 예약판매 완료시에만 수납데이터 생성으로 변경
            if("COMPLETE".equals(saveVO.getmFlag())){
                if("Y".equals(saveVO.getImplyYn())){
                    //SA_0451T : 수납헤더
                    updateBeforePayinfo(saveVO);
                }else{
                    PayInfoSearchVO paySerchVO = new PayInfoSearchVO();
                    paySerchVO.setsDlrCd( saveVO.getDlrCd() );
                    paySerchVO.setsJobTp("B");
                    paySerchVO.setsJobContractNo(saveVO.getBeforeNo());
                    PayInfoVO pVO = null;
                    List<PayInfoVO> payList = payInfoService.selectPayInfosByCondition(paySerchVO);
                    if(payList != null && payList.size() > 0){
                        pVO = payList.get(0);
                        if(pVO.getTotPayAmt() != null && pVO.getTotPayAmt() > 0){
                            // 수납금액이 존재합니다.
                            throw processException("sal.info.payAmtChek");
                        }

                        payInfoService.deltePayinfoDetail(pVO);
                        payInfoService.deltePayinfoHeader(pVO);
                    }
                }
            }

        }

        return beforeNo;
    }

    /**
     * CRM 고객정보 저장.
     */
    private void updateCustInfo(ContBeforeMngVO cntVO) throws Exception{

        CustomerInfoSearchVO cSearchVO = new CustomerInfoSearchVO();
        cSearchVO.setsDlrCd(cntVO.getDlrCd());
        cSearchVO.setsCustNo(cntVO.getCustNo());
        if(customerInfoOutBoundService.selectCustomerInfoByConditionCnt(cSearchVO) == 0){
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.customer", null, LocaleContextHolder.getLocale())});
        }

        /*
        // 고객정보는 CRM 수정불가로 변경.[2017.04.20 령연 요청]
        CustomerInfoVO infoVO = new CustomerInfoVO();
        infoVO.setCommandTp("UPDFROMCONTRACT");
        infoVO.setDlrCd(cntVO.getDlrCd());
        infoVO.setCustNo(cntVO.getCustNo());
        infoVO.setCustNm(cntVO.getCustNm());
        infoVO.setCustTp(cntVO.getCustTp());
        infoVO.setMathDocTp(cntVO.getSsnCrnTp());
        infoVO.setSsnCrnNo(cntVO.getSsnCrnNo());
        if("02".equals(cntVO.getCustTp())){
            infoVO.setOfficeTelNo(cntVO.getTelNo1());
            infoVO.setPurcMngNm(cntVO.getPurcMngNm());
        }
        infoVO.setHpNo(cntVO.getTelNo1());
        infoVO.setTelNo(cntVO.getTelNo2());
        infoVO.setPrefCommNo(cntVO.getTelNo1());
        infoVO.setEmailNm(cntVO.getEmailNm());
        customerInfoOutBoundService.updateCustomer(infoVO);
        */

        AddressInfoSearchVO addrSearchVO = new AddressInfoSearchVO();
        addrSearchVO.setsDlrCd(cntVO.getDlrCd());
        addrSearchVO.setsRefTableNm("CR_0101T");
        addrSearchVO.setsRefKeyNm(cntVO.getCustNo());
        addrSearchVO.setsAddrTp(cntVO.getAddrTp());
        addrSearchVO.setsFlagYn("Y");
        int cnt = addressInfoService.selectAddressInfoByConditionCnt(addrSearchVO);

        AddressInfoVO addrInfoVO = new AddressInfoVO();
        addrInfoVO.setRefTableNm("CR_0101T");
        addrInfoVO.setrefKeyNm(cntVO.getCustNo());
        addrInfoVO.setAddrTp(cntVO.getAddrTp());
        addrInfoVO.setZipCd(cntVO.getZipCd());
        addrInfoVO.setSungCd(cntVO.getSungCd());
        addrInfoVO.setSungNm(cntVO.getSungNm());
        addrInfoVO.setCityCd(cntVO.getCityCd());
        addrInfoVO.setCityNm(cntVO.getCityNm());
        addrInfoVO.setDistCd(cntVO.getDistCd());
        addrInfoVO.setDistNm(cntVO.getDistNm());
        addrInfoVO.setAddrDetlCont(cntVO.getAddrDetlCont());

        // 성,시,구, zip, 주소유형 모두 다 없을 경우 저장 안함.
        if(StringUtils.isNotEmpty(addrInfoVO.getSungNm())
                || StringUtils.isNotEmpty(addrInfoVO.getCityNm())
                || StringUtils.isNotEmpty(addrInfoVO.getDistNm())
                || StringUtils.isNotEmpty(addrInfoVO.getZipCd())
        ){

            if(cnt > 0){
                addressInfoService.updateAddressInfoOnCustNo(addrInfoVO);
            }else{
                addrInfoVO.setFlagYn("Y");
                addrInfoVO.setUseYn("Y");
                addrInfoVO.setDlrCd(LoginUtil.getDlrCd());
                addrInfoVO.setRegUsrId(LoginUtil.getUserId());
                addressInfoService.insertAddressInfo(addrInfoVO);
            }
        }
    }

    /**
     * 완료한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    @Override
    public int changeStat(ContBeforeMngVO saveVO) throws Exception{
        return contBeforeMngDAO.changeStat(saveVO);
    }

    /**
     * 판매기회 일련번호 변경.
     * @param saveVO
     * @return
     * @throws Exception
     */
    @Override
    public int changeOpptSeq(ContBeforeMngVO saveVO) throws Exception{
        return contBeforeMngDAO.changeOpptSeq(saveVO);
    }


    /**
     * 삭제(승인전) 한다.
     */
    @Override
    public String deleteContBefore(ContBeforeMngVO beforeVO) throws Exception{
        beforeVO.setUpdtUsrId(LoginUtil.getUserId());
        beforeVO.setBeforeStatCd("90");

        if(StringUtils.isEmpty(beforeVO.getDlrCd())){
            beforeVO.setDlrCd(LoginUtil.getDlrCd());
        }
        if(StringUtils.isEmpty(beforeVO.getBeforeNo())){
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("sal.lbl.beforeNo", null, LocaleContextHolder.getLocale())});
        }

        PayInfoSearchVO paySerchVO = new PayInfoSearchVO();
        paySerchVO.setsDlrCd( beforeVO.getDlrCd() );
        paySerchVO.setsJobTp("B");
        paySerchVO.setsJobContractNo(beforeVO.getBeforeNo());
        PayInfoVO pVO = null;
        List<PayInfoVO> payList = payInfoService.selectPayInfosByCondition(paySerchVO);
        if(payList != null && payList.size() > 0){
            pVO = payList.get(0);
            if(pVO.getTotPayAmt() != null && pVO.getTotPayAmt() > 0){
                // 수납금액이 존재합니다.
                throw processException("sal.info.payAmtChek");
            }
        }

        // 판매기회 취소처리
        ContBeforeMngSearchVO searchVO = new ContBeforeMngSearchVO();
        searchVO.setsDlrCd(beforeVO.getDlrCd());
        searchVO.setsBeforeNo(beforeVO.getBeforeNo());
        List<ContBeforeMngVO> list = selectContBeforeMngsByCondition(searchVO);

        if(list != null && list.size()>0){
            ContBeforeMngVO bVO = list.get(0);

            if(!StringUtils.isBlank(bVO.getContractNo())){
                /**
                 * [TO-BE] 자동처리 발생시.
                 * 계약이 묶였다면, - 계약쪽 서비스 호출
                 * 1. 계약 예판번호 지움.
                 * 2. 계약금액 다시 계산
                 * 3. 계약의 수납 발생금액 변경
                 */

                // 계약건이 존재합니다.
                throw processException("sal.info.contractChkMsg");
            }

            beforeVO.setContractNo(null);
            contBeforeMngDAO.changeStat(beforeVO);

            if( bVO.getSaleOpptNo() != null && !"".equals(bVO.getSaleOpptNo())){
                SalesOpptProcessMgmtVO opptVO = new SalesOpptProcessMgmtVO();
                opptVO.setDlrCd( bVO.getDlrCd() );
                opptVO.setSeq( bVO.getSaleOpptNo() );
                opptVO.setcSeq( bVO.getSaleOpptSeq() );
                opptVO.setLeadStatCd("09");
                opptVO.setMngScId(bVO.getSaleEmpNo());
                opptVO.setFailCauCd("09");  // 예약판매취소(사유)
                salesOpptProcessMgmtOutBoundService.updateSalesOpptProcessMgmt(opptVO);
            }
        }

        return beforeVO.getBeforeNo();
    }

    /**
     * 취소(승인후) 한다.
     */
    @Override
    public String cancelContBefore(ContBeforeMngVO beforeVO) throws Exception{
        beforeVO.setUpdtUsrId(LoginUtil.getUserId());
        beforeVO.setBeforeStatCd("91");

        if(StringUtils.isEmpty(beforeVO.getDlrCd())){
            beforeVO.setDlrCd(LoginUtil.getDlrCd());
        }
        if(StringUtils.isEmpty(beforeVO.getBeforeNo())){
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("sal.lbl.beforeNo", null, LocaleContextHolder.getLocale())});
        }

        PayInfoSearchVO paySerchVO = new PayInfoSearchVO();
        paySerchVO.setsDlrCd( beforeVO.getDlrCd() );
        paySerchVO.setsJobTp("B");
        paySerchVO.setsJobContractNo(beforeVO.getBeforeNo());
        PayInfoVO pVO = null;
        List<PayInfoVO> payList = payInfoService.selectPayInfosByCondition(paySerchVO);
        if(payList != null && payList.size() > 0){
            pVO = payList.get(0);
            if(pVO.getTotPayAmt() != null && pVO.getTotPayAmt() > 0){
                // 수납금액이 존재합니다.
                throw processException("sal.info.payAmtChek");
            }
        }

        // 판매기회 취소처리
        ContBeforeMngSearchVO searchVO = new ContBeforeMngSearchVO();
        searchVO.setsDlrCd(beforeVO.getDlrCd());
        searchVO.setsBeforeNo(beforeVO.getBeforeNo());

        List<ContBeforeMngVO> list = selectContBeforeMngsByCondition(searchVO);
        if(list != null && list.size()>0){
            ContBeforeMngVO bVO = list.get(0);

            if(!StringUtils.isBlank(bVO.getContractNo())){
                /**
                 * [TO-BE] 자동처리 발생시.
                 * 계약이 묶였다면, - 계약쪽 서비스 호출
                 * 1. 계약 예판번호 지움.
                 * 2. 계약금액 다시 계산
                 * 3. 계약의 수납 발생금액 변경
                 */

                // 계약건이 존재합니다.
                throw processException("sal.info.contractChkMsg");
            }

            beforeVO.setContractNo(null);
            contBeforeMngDAO.changeStat(beforeVO);

            if( bVO.getSaleOpptNo() != null && !"".equals(bVO.getSaleOpptNo())){
                SalesOpptProcessMgmtVO opptVO = new SalesOpptProcessMgmtVO();
                opptVO.setDlrCd( bVO.getDlrCd() );
                opptVO.setSeq( bVO.getSaleOpptNo() );
                opptVO.setcSeq( bVO.getSaleOpptSeq() );
                opptVO.setLeadStatCd("09");
                opptVO.setMngScId(bVO.getSaleEmpNo());
                opptVO.setFailCauCd("09");  // 예약판매취소(사유)
                salesOpptProcessMgmtOutBoundService.updateSalesOpptProcessMgmt(opptVO);
            }
        }

        return beforeVO.getBeforeNo();
    }

    /**
     * 삭제(승인전), 취소(승인후) 한다.
     */
    @Override
    public int deleteContBeforeMng(ContBeforeMngSaveVO saveVO) throws Exception{

        // 삭제(승인전) 한다.
        for (ContBeforeMngVO deleteVO : saveVO.getDeleteList()){
            deleteContBefore(deleteVO);
        }

        // 취소(승인후) 한다.
        for (ContBeforeMngVO deleteVO : saveVO.getCancelList()){
            cancelContBefore(deleteVO);
        }

        return 1;
    }

    /**
     * 예약판매 수납생성.  SA_0451T
     * @param cntVO
     * @throws Exception
     */
    private void insertBeforePayinfo(ContBeforeMngVO beforeVO) throws Exception{
        PayInfoVO payVO = new PayInfoVO();
        payVO.setDlrCd( beforeVO.getDlrCd() );
        payVO.setJobTp("B");
        payVO.setJobContractNo(beforeVO.getBeforeNo());
        payVO.setVinNo(null);
        payVO.setCustTp(beforeVO.getCustTp());     // 고객 운전자 = 계약자 동일로 변경.
        payVO.setCustNo(beforeVO.getCustNo());
        payVO.setCustNm(beforeVO.getCustNm());
        payVO.setManageEmpNo(beforeVO.getSaleEmpNo());
        payVO.setPaymentTp("01");                   // 미결
        payVO.setRealPayAmt(beforeVO.getBeforeAmt());
        payVO.setTotPayAmt(0.00);
        payVO.setTotDcAmt(0.00);
        payVO.setProAmt(0.00);
        payVO.setRecvAmt(beforeVO.getBeforeAmt());
        payVO.setOverAmt(0.00);
        payVO.setRecpYn("N");
        payVO.setRegUsrId(LoginUtil.getUserId());
        payVO.setUpdtUsrId(LoginUtil.getUserId());
        payInfoService.insertPayInfoHeader(payVO);
    }

    /**
     * 예약판매 수납정보 수정/저장
     * @param cntVO
     * @throws Exception
     */
    private void updateBeforePayinfo(ContBeforeMngVO beforeVO) throws Exception{

        // SA_0451T : 수납헤더 수정
        PayInfoSearchVO paySerchVO = new PayInfoSearchVO();
        paySerchVO.setsDlrCd( beforeVO.getDlrCd() );
        paySerchVO.setsJobTp("B");
        paySerchVO.setsJobContractNo(beforeVO.getBeforeNo());
        PayInfoVO pVO = null;
        List<PayInfoVO> payList = payInfoService.selectPayInfosByCondition(paySerchVO);
        if(payList != null && payList.size() > 0){
            pVO = payList.get(0);

            PayInfoVO payVO = new PayInfoVO();
            payVO.setDlrCd( beforeVO.getDlrCd() );
            payVO.setFinDocNo( pVO.getFinDocNo() );
            payVO.setJobTp("B");
            payVO.setJobContractNo(beforeVO.getBeforeNo());
            payVO.setVinNo(null);
            payVO.setCustTp(beforeVO.getCustTp());     // 고객 운전자 = 계약자 동일로 변경.
            payVO.setCustNo(beforeVO.getCustNo());
            payVO.setCustNm(beforeVO.getCustNm());
            payVO.setManageEmpNo(beforeVO.getSaleEmpNo());

            // 지불상태:01-미결, 02-수납완료
            String paymentTp = pVO.getPaymentTp();
            String compYn    = pVO.getCompYn();
            Date compDt      = pVO.getCompDt();
            if( "02".equals(paymentTp) ){
                if(beforeVO.getBeforeAmt() != pVO.getRealPayAmt()){
                    paymentTp = "01";
                    compYn = "N";
                    compDt = null;
                }
            }
            payVO.setCompYn(compYn);
            payVO.setCompDt(compDt);
            payVO.setPaymentTp(paymentTp);
            payVO.setRealPayAmt(beforeVO.getBeforeAmt());
            payVO.setRegUsrId(LoginUtil.getUserId());
            payVO.setUpdtUsrId(LoginUtil.getUserId());
            payInfoService.updatePayInfoHeader(payVO);

            // 정산금액 재정비
            PayInfoDetailVO detailVO = new PayInfoDetailVO();
            detailVO.setFinDocNo(pVO.getFinDocNo());
            detailVO.setDlrCd(beforeVO.getDlrCd());
            detailVO.setPaymentTp(paymentTp);
            detailVO.setUpdtUsrId(LoginUtil.getUserId());
            payInfoService.changePayInfo(detailVO);

        }else{
            insertBeforePayinfo(beforeVO);       // SA_0451T : 수납헤더 생성
        }
    }
}
