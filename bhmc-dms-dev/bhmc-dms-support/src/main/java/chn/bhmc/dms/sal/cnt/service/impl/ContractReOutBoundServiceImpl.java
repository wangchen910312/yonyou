package chn.bhmc.dms.sal.cnt.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoVO;
import chn.bhmc.dms.sal.acu.service.ContBeforeMngOutBoundService;
import chn.bhmc.dms.sal.cnt.service.ContractReOutBoundService;
import chn.bhmc.dms.sal.cnt.service.dao.ContractReOutBoundDAO;
import chn.bhmc.dms.sal.cnt.vo.ContractReIncSupportVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReSupportSearchVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReSupportVO;
import chn.bhmc.dms.sal.fin.service.PayInfoOutBoundService;
import chn.bhmc.dms.sal.fin.vo.PayInfoOutBoundDetailVO;
import chn.bhmc.dms.sal.fin.vo.PayInfoOutBoundSearchVO;
import chn.bhmc.dms.sal.fin.vo.PayInfoOutBoundVO;
import chn.bhmc.dms.sal.inc.service.IncJoinInfoService;
import chn.bhmc.dms.sal.inc.vo.IncJoinInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ContractReServiceImpl
 * @Description : 계약
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

@Service("contractReOutBoundService")
public class ContractReOutBoundServiceImpl extends HService implements ContractReOutBoundService {

    /**
     * 소매판매 주문번호 생성 id gen
     */
    @Resource(name="retailContractOrdNoIdgenService")
    TableIdGenService retailContractOrdNoIdgenService;


    /**
     * 고객 필수정보
     */
    @Resource(name="customerInfoOutBoundService")
    CustomerInfoOutBoundService customerInfoOutBoundService;

    /**
     * 수납 서비스
     */
    @Resource(name="payInfoOutBoundService")
    PayInfoOutBoundService payInfoOutBoundService;

    /**
     * 계약 DAO 선언
     */
    @Resource(name="contractReOutBoundDAO")
    ContractReOutBoundDAO contractReOutBoundDAO;

    /**
     * 예약판매 서비스
     */
    @Resource(name="contBeforeMngOutBoundService")
    ContBeforeMngOutBoundService contBeforeMngOutBoundService;

    // 시스템 설정 서비스
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    // 보험서비스
    @Resource(name="incJoinInfoService")
    IncJoinInfoService incJoinInfoService;


    /**
     * 계약을 생성/저장 한다.
     */
    @Override
    public String saveOpptContracts(ContractReSupportVO saveVO) throws Exception{

        isOpptContract(saveVO);

        /*
        Date contDt = saveVO.getContractDt();
        SimpleDateFormat simpleformat = new SimpleDateFormat("yyyy-MM-dd");
        Date toDay = simpleformat.parse(DateUtil.getDate("yyyy-MM-dd"));
        if(  contDt == null ){
            // [계약일자]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.contractDt", null, LocaleContextHolder.getLocale())});
        };
        if( contDt.before(toDay) ){
            // {계약일자}은 {현재일자}보다 작을 수 없습니다.
            throw processException("sal.info.CheckDateForm", new String[]{ messageSource.getMessage("global.lbl.contractDt", null, LocaleContextHolder.getLocale()) , messageSource.getMessage("sal.lbl.toDay", null, LocaleContextHolder.getLocale()) });
        }
        */
        if( StringUtils.isEmpty(saveVO.getCarlineCd()) ){
            // [차종]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.carLine", null, LocaleContextHolder.getLocale())});
        }
        if( StringUtils.isEmpty(saveVO.getDlrCd()) ){
            // [딜러코드]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.dlrCd", null, LocaleContextHolder.getLocale())});
        };
        if( StringUtils.isEmpty(saveVO.getCustNo()) ){
            // [고객코드]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.customer", null, LocaleContextHolder.getLocale())});
        };
        if( StringUtils.isEmpty(saveVO.getCustTp()) ){
            // [고객유형]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.custTp", null, LocaleContextHolder.getLocale())});
        };
        if( StringUtils.isEmpty(saveVO.getCustNm()) ){
            // [고객명]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.custNm", null, LocaleContextHolder.getLocale())});
        };

        String contractNo = "";
        saveVO.setRegUsrId(LoginUtil.getUserId());     // 생성자
        saveVO.setUpdtUsrId(LoginUtil.getUserId());    // 수정자

        /**
         * 계약번호(키생성)
         * B + 년월 + 5자리seq
         * carline을 넣어서 id gen 을 시킬시, Prefix를 재호출로 넣어줘야 줌.
         */
        synchronized (retailContractOrdNoIdgenService) {
            ((RetailContractOrdNoIdGenStrategy)retailContractOrdNoIdgenService.getStrategy()).setCarlineCd(saveVO.getCarlineCd());
            ((RetailContractOrdNoTableNameStrategy)retailContractOrdNoIdgenService.getTableNameStrategy()).setCarlineCd(saveVO.getCarlineCd());
            contractNo = retailContractOrdNoIdgenService.getNextStringId();
        }

        saveVO.setContractNo(contractNo);
        saveVO.setContractCustNo(saveVO.getCustNo());
        saveVO.setCustCd(saveVO.getCustNo());

        Date toDay = DateUtil.convertToDate(DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat")));
        saveVO.setContractDt(toDay);

        // SA_0201T : 계약 헤더 저장
        contractReOutBoundDAO.insertOpptContract(saveVO);

        // SA_0202 : 계약고객 저장
        saveVO.setPartnerTp("C");          // 계약자
        contractReOutBoundDAO.insertContractCustomer(saveVO);
        saveVO.setPartnerTp("D");          // 운전자
        contractReOutBoundDAO.insertContractCustomer(saveVO);

        return contractNo;
    }

    /**
     * 진행중인 판매기회가 있는지 유무 체크
     */
    public void isOpptContract(ContractReSupportVO searchVO) throws Exception{

        if( StringUtils.isEmpty(searchVO.getSaleOpptNo()) ){
            // [판매기회번호]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.saleOpptSeq", null, LocaleContextHolder.getLocale())});
        };

        // 진행중인 판매기회가 있으면 계약 저장을 못하도록 함.
        if(contractReOutBoundDAO.selectOpptIngCountsByConditionCnt(searchVO) > 0 ){
            // [판매기회번호]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("sal.info.isopptContractChk", null, LocaleContextHolder.getLocale())});
        }
    }


    /**
     * 보험정보관리 내역을 계약에 반영하여 저장
     * @param saveVO
     * @throws Exception
     */
    @Override
    public int contractIncSave(ContractReSupportVO contVO, List<IncJoinInfoVO> incList) throws Exception{
        int valReturn = 0;
        if( "".equals( contVO.getContractNo() ) ){ return valReturn; }

        ContractReSupportSearchVO searchVO = new ContractReSupportSearchVO();
        searchVO.setsDlrCd( contVO.getDlrCd() );
        searchVO.setsContractNo( contVO.getContractNo() );
        List<ContractReSupportVO>  contList = contractReOutBoundDAO.selectContractResByCondition(searchVO);

        if(contList != null && contList.size() > 0){
            if("Y".equals(contList.get(0).getImplyYn())){
                double realCarAmt = contList.get(0).getRealCarAmt() != null ? contList.get(0).getRealCarAmt() : 0.0 ;
                double beforeAmt = contList.get(0).getReservContAmt() != null ? contList.get(0).getReservContAmt() : 0.0 ;
                double goodsAmt = contList.get(0).getGoodsAmt() != null ? contList.get(0).getGoodsAmt() : 0.0;

                double realIncTot = contVO.getRealIncAmt() != null ? contVO.getRealIncAmt() : 0.0;
                double incExpcTot = contVO.getIncExpcAmt() != null ? contVO.getIncExpcAmt() : 0.0;
                double incFreeTot = contVO.getIncFeeAmt() != null ? contVO.getIncFeeAmt() : 0.0;
                double incAmt = realIncTot>0?realIncTot+incFreeTot:incExpcTot+incFreeTot;

                double fincFeeAmt = contList.get(0).getFincFeeAmt() != null ? contList.get(0).getFincFeeAmt() : 0.0;
                double sbstAmt = contList.get(0).getSbstAmt() != null ? contList.get(0).getSbstAmt() : 0.0;
                double aapAmt  = contList.get(0).getAapAmt() != null ? contList.get(0).getAapAmt() : 0.0;
                //double dcAmt = contList.get(0).getPromotionAmt() != null ? contList.get(0).getPromotionAmt() : 0.0;
                double pointAmt = contList.get(0).getPointAmt() != null ? contList.get(0).getPointAmt() : 0.0;
                double realPayAmt = realCarAmt - beforeAmt + goodsAmt + incAmt + fincFeeAmt + sbstAmt + aapAmt + pointAmt;

                double subsidyAmt = 0;
                if("2".equals(contList.get(0).getSbusTp())){
                    subsidyAmt = contList.get(0).getSubsidyAmt();
                }else if("3".equals(contList.get(0).getSbusTp())){
                    subsidyAmt = contList.get(0).getSubsidyAmt();
                    realCarAmt -= subsidyAmt;
                }

                realPayAmt -= subsidyAmt;

                contList.get(0).setRealAmt(realCarAmt);
                contList.get(0).setIncAmt(incAmt);
                contList.get(0).setRealPayAmt(realPayAmt);
                contList.get(0).setDlrCd(contVO.getDlrCd());
                contList.get(0).setContractNo(contVO.getContractNo());
                contractReOutBoundDAO.updateContractIncPrice(contList.get(0));
                updateContractPayinfo(contractReOutBoundDAO.selectContractResByCondition(searchVO).get(0));
            }
            ContractReSupportVO updateVO = new ContractReSupportVO();
            updateVO.setDlrCd(contVO.getDlrCd());
            updateVO.setContractNo(contVO.getContractNo());

            // 계약 보험 삭제.
            contractReOutBoundDAO.deleteIncAll(updateVO);
            contractReOutBoundDAO.deleteIncHead(updateVO);

            // 보험헤더 저장
            contVO.setRegUsrId(LoginUtil.getUserId());
            contVO.setUpdtUsrId(LoginUtil.getUserId());
            contractReOutBoundDAO.insertIncHead(contVO);

            // 보험아이템 저장
            ContractReIncSupportVO incItem = null;
            for(IncJoinInfoVO itemVO : incList ){
                incItem = new ContractReIncSupportVO();
                incItem.setDlrCd(itemVO.getDlrCd());
                incItem.setContractNo(contVO.getContractNo());
                incItem.setIncTp(itemVO.getIncTp());
                incItem.setIncExpcAmt(itemVO.getIncExpcAmt());
                incItem.setRealIncAmt(itemVO.getRealIncAmt());
                incItem.setIncPrid(itemVO.getIncPrid());
                incItem.setIncStartDt(itemVO.getIncStartDt());
                incItem.setIncEndDt(itemVO.getIncEndDt());
                incItem.setRemark(itemVO.getRemark());
                incItem.setValRecAmt(itemVO.getIncAmt());
                incItem.setRegUsrId(LoginUtil.getUserId());
                incItem.setUpdtUsrId(LoginUtil.getUserId());
                contractReOutBoundDAO.insertInc(incItem);
            }

            valReturn = 1;
        }

        return valReturn;
    }


    /**
     * 보험정보관리의 퇴보로 인한 계약내역 지움.
     * @param saveVO
     * @throws Exception
     */
    @Override
    public int contractIncDelete(IncJoinInfoVO saveVO) throws Exception{
        if( "".equals( saveVO.getContractNo() ) ){ return 0; }


        ContractReSupportSearchVO searchVO = new ContractReSupportSearchVO();
        searchVO.setsDlrCd( saveVO.getDlrCd() );
        searchVO.setsContractNo( saveVO.getContractNo() );
        List<ContractReSupportVO>  contList = contractReOutBoundDAO.selectContractResByCondition(searchVO);

        if(contList != null && contList.size() > 0){
            if("Y".equals(contList.get(0).getImplyYn())){
                double realCarAmt = contList.get(0).getRealCarAmt() != null ? contList.get(0).getRealCarAmt() : 0.0 ;
                double beforeAmt = contList.get(0).getReservContAmt() != null ? contList.get(0).getReservContAmt() : 0.0 ;
                double goodsAmt = contList.get(0).getGoodsAmt() != null ? contList.get(0).getGoodsAmt() : 0.0;
                double incAmt = 0.0;
                double fincFeeAmt = contList.get(0).getFincFeeAmt() != null ? contList.get(0).getFincFeeAmt() : 0.0;
                double sbstAmt = contList.get(0).getSbstAmt() != null ? contList.get(0).getSbstAmt() : 0.0;
                double aapAmt  = contList.get(0).getAapAmt() != null ? contList.get(0).getAapAmt() : 0.0;
                //double dcAmt = contList.get(0).getPromotionAmt() != null ? contList.get(0).getPromotionAmt() : 0.0;
                double pointAmt = contList.get(0).getPointAmt() != null ? contList.get(0).getPointAmt() : 0.0;
                double realPayAmt = realCarAmt - beforeAmt + goodsAmt + incAmt + fincFeeAmt + sbstAmt + aapAmt + pointAmt;

                double subsidyAmt = 0;
                if("2".equals(contList.get(0).getSbusTp())){
                    subsidyAmt = contList.get(0).getSubsidyAmt();
                }else if("3".equals(contList.get(0).getSbusTp())){
                    subsidyAmt = contList.get(0).getSubsidyAmt();
                    realCarAmt -= subsidyAmt;
                }

                realPayAmt -= subsidyAmt;

                contList.get(0).setRealAmt(realCarAmt);
                contList.get(0).setIncAmt(incAmt);
                contList.get(0).setRealPayAmt(realPayAmt);
                contList.get(0).setDlrCd(contList.get(0).getDlrCd());
                contList.get(0).setContractNo(contList.get(0).getContractNo());
                contList.get(0).setIncAapTp("M");       // 본인
                contractReOutBoundDAO.updateContractIncPrice(contList.get(0));
                updateContractPayinfo(contList.get(0));
            }
            ContractReSupportVO updateVO = new ContractReSupportVO();
            updateVO.setDlrCd(saveVO.getDlrCd());
            updateVO.setContractNo(saveVO.getContractNo());

            // 계약 보험 삭제.
            contractReOutBoundDAO.deleteIncAll(updateVO);
            contractReOutBoundDAO.deleteIncHead(updateVO);
        }

        return 1;
    }

    /**
     * [CRM 조회용]:계약자 - 중고차 치환을 통한 계약자의 최신 차량정보
     * @param searchVO
     * @return
     * @throws Exception
     */
    @Override
    public List<ContractReSupportVO> selectCustContractUseCarInfoSearch(ContractReSupportSearchVO searchVO) throws Exception{
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return contractReOutBoundDAO.selectCustContractUseCarInfoSearch(searchVO);
    }


    /**
     * 판매 고객정보 update
     */
    @Override
    public int updateContractCustInfo(String custCd, String dlrCd) throws Exception{
        String sDlrCd = dlrCd;

        if( StringUtils.isEmpty(custCd) ){
            // [고객]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.customer", null, LocaleContextHolder.getLocale())});
        };

        if( StringUtils.isEmpty(sDlrCd) ){
            sDlrCd = LoginUtil.getDlrCd();
        };

        ContractReSupportSearchVO searchVO = new ContractReSupportSearchVO();
        searchVO.setsDlrCd(sDlrCd);
        searchVO.setsContractCustNo(custCd);
        List<ContractReSupportVO> cntList = contractReOutBoundDAO.selectContractResByCondition(searchVO);

        for(ContractReSupportVO vo : cntList){
            if( "10".equals(vo.getContractStatCd())
             || "20".equals(vo.getContractStatCd())){

                // 고객정보를 불러온다.
                CustomerInfoSearchVO cSearchVO = new CustomerInfoSearchVO();
                cSearchVO.setsDlrCd(dlrCd);
                cSearchVO.setsCustNo(custCd);
                cSearchVO.setsAddrTp("02");

                List<CustomerInfoVO>  custList = customerInfoOutBoundService.selectCustomerInfoByCondition(cSearchVO);

                if(custList != null && custList.size() > 0){
                    CustomerInfoVO custInfoVO = custList.get(0);

                    ContractReSupportVO cntVO = new ContractReSupportVO();
                    cntVO.setRegUsrId(LoginUtil.getUserId());
                    cntVO.setUpdtUsrId(LoginUtil.getUserId());

                    cntVO.setDlrCd(vo.getDlrCd());
                    cntVO.setContractNo(vo.getContractNo());
                    cntVO.setPartnerTp("C");          // 계약자
                    cntVO.setCustTp( custInfoVO.getCustTp() );
                    cntVO.setCustCd( custInfoVO.getCustNo() );
                    cntVO.setCustNm( custInfoVO.getCustNm()  );
                    cntVO.setTelNo1( custInfoVO.getHpNo() );
                    cntVO.setTelNo2( custInfoVO.getTelNo() );
                    cntVO.setEmailNm( custInfoVO.getEmailNm() );
                    cntVO.setSsnCrnNo( custInfoVO.getSsnCrnNo() );
                    cntVO.setZipCd( custInfoVO.getZipCd() );
                    cntVO.setSsnCrnTp( custInfoVO.getMathDocTp() );
                    cntVO.setSungCd( custInfoVO.getSungCd() );
                    cntVO.setCityCd( custInfoVO.getCityCd() );
                    cntVO.setDistCd( custInfoVO.getDistCd() );
                    cntVO.setSungNm( custInfoVO.getSungNm() );
                    cntVO.setCityNm( custInfoVO.getCityNm() );
                    cntVO.setDistNm( custInfoVO.getDistNm() );
                    cntVO.setAddrDetlCont( custInfoVO.getAddrDetlCont() );
                    cntVO.setAddrTp( StringUtils.isNotBlank(custInfoVO.getAddrTp())?custInfoVO.getAddrTp():"02");
                    cntVO.setTaxPayNo( custInfoVO.getTaxpayerNo() );
                    cntVO.setPurcMngNm( custInfoVO.getPurcMngNm() );
                    if(contractReOutBoundDAO.selectContractCustomersChkByConditionCnt(cntVO) > 0){
                        contractReOutBoundDAO.updateContractCustomer(cntVO);
                    }else{
                        contractReOutBoundDAO.insertContractCustomer(cntVO);
                    }

                    cntVO.setPartnerTp("D");          // 계약자
                    if(contractReOutBoundDAO.selectContractCustomersChkByConditionCnt(cntVO) > 0){
                        contractReOutBoundDAO.updateContractCustomer(cntVO);
                    }else{
                        contractReOutBoundDAO.insertContractCustomer(cntVO);
                    }

                    // 계약 판매인 변경
                    vo.setSaleEmpNo(custInfoVO.getMngScId());
                    contractReOutBoundDAO.updateContractEach(vo);

                    // 기타 업무 고객정보 변경.
                    if("20".equals(vo.getContractStatCd())){
                        if("A".equals(vo.getIncAapTp())){
                            IncJoinInfoVO incVO = new IncJoinInfoVO();
                            incVO.setDlrCd(vo.getDlrCd());
                            incVO.setContractNo(vo.getContractNo());
                            incVO.setSaleId( custInfoVO.getMngScId() );
                            incVO.setCustNo( custInfoVO.getCustNo() );
                            incVO.setCustTp( custInfoVO.getCustTp() );
                            incVO.setCustTelNo( custInfoVO.getHpNo() );
                            incVO.setCustSsnCrnTp( custInfoVO.getMathDocTp() );
                            incVO.setCustSsnCrnNo( custInfoVO.getSsnCrnNo() );
                            incVO.setUpdtUsrId(LoginUtil.getUserId());
                            incJoinInfoService.updateIncCustInfo(incVO);
                        }

                        ContractReSupportSearchVO cntSearch = new ContractReSupportSearchVO();
                        cntSearch.setsDlrCd(vo.getDlrCd());
                        cntSearch.setsContractNo(vo.getContractNo());
                        if(contractReOutBoundDAO.selectGoodsListsByConditionCnt(cntSearch) > 0){
                            ContractReSupportVO goodsVO = new ContractReSupportVO();
                            goodsVO.setDlrCd(vo.getDlrCd());
                            goodsVO.setContractNo(vo.getContractNo());
                            goodsVO.setContractCustNo(custInfoVO.getCustNo());
                            goodsVO.setCustTp(custInfoVO.getCustTp());
                            goodsVO.setTelNo1(custInfoVO.getHpNo());
                            goodsVO.setPurcMngNm(custInfoVO.getPurcMngNm());
                            goodsVO.setUpdtUsrId(LoginUtil.getUserId());
                            contractReOutBoundDAO.updateGoodsContractCust(goodsVO);
                        }

                        if("Y".equals(vo.getFincReqYn())){
                            ContractReSupportVO fincVO = new ContractReSupportVO();
                            fincVO.setDlrCd(vo.getDlrCd());
                            fincVO.setContractNo(vo.getContractNo());
                            fincVO.setCustNm(custInfoVO.getCustNm());
                            fincVO.setCustTp(custInfoVO.getCustTp());
                            fincVO.setSsnCrnTp(custInfoVO.getMathDocTp());
                            fincVO.setSsnCrnNo(custInfoVO.getSsnCrnNo());
                            fincVO.setTelNo1(custInfoVO.getHpNo());
                            fincVO.setUpdtUsrId(LoginUtil.getUserId());
                            contractReOutBoundDAO.updateFincContractCust(fincVO);
                        }
                    }

                }
            }
        }

        // 예약판매 변경
        contBeforeMngOutBoundService.updateContBeforeCustInfo(custCd, dlrCd);

        return 1;
    }

    /**
     * 계약 수납정보 수정/저장
     * @param cntVO
     * @throws Exception
     */
    private void updateContractPayinfo(ContractReSupportVO cntVO) throws Exception {
        // 계약화면에서 넘어온 데이터는 realAmt 가 null이 아님.
        //cntVO.setRealAmt( cntVO.getRealAmt() == null ? cntVO.getRealCarAmt():cntVO.getRealAmt());

        double realCarAmt = cntVO.getRealCarAmt() != null ? cntVO.getRealCarAmt() : 0.0 ;
        double beforeAmt = cntVO.getReservContAmt() != null ? cntVO.getReservContAmt() : 0.0 ;
        double goodsAmt = cntVO.getGoodsAmt() != null ? cntVO.getGoodsAmt() : 0.0;
        double incAmt = cntVO.getIncAmt() != null ? cntVO.getIncAmt() : 0.0;
        double fincFeeAmt = cntVO.getFincFeeAmt() != null ? cntVO.getFincFeeAmt() : 0.0;
        double sbstAmt = cntVO.getSbstAmt() != null ? cntVO.getSbstAmt() : 0.0;
        double aapAmt  = cntVO.getAapAmt() != null ? cntVO.getAapAmt() : 0.0;
        double dcAmt = cntVO.getPromotionAmt() != null ? cntVO.getPromotionAmt() : 0.0;
        double pointAmt = cntVO.getPointAmt() != null ? cntVO.getPointAmt() : 0.0;

        double realPayAmt = realCarAmt - beforeAmt + goodsAmt + incAmt + fincFeeAmt + sbstAmt + aapAmt + pointAmt;

        double subsidyAmt = 0;
        if("2".equals(cntVO.getSbusTp())){
            subsidyAmt = cntVO.getSubsidyAmt();
        }else if("3".equals(cntVO.getSbusTp())){
            subsidyAmt = cntVO.getSubsidyAmt();
            realCarAmt -= subsidyAmt;
        }
        realPayAmt -= subsidyAmt;


        // SA_0451T : 수납헤더 수정
        PayInfoOutBoundSearchVO paySerchVO = new PayInfoOutBoundSearchVO();
        paySerchVO.setsDlrCd( cntVO.getDlrCd() );
        paySerchVO.setsJobTp("C");
        paySerchVO.setsJobContractNo(cntVO.getContractNo());
        PayInfoOutBoundVO pVO = null;
        List<PayInfoOutBoundVO> payList = payInfoOutBoundService.selectPayInfosByCondition(paySerchVO);
        if(payList != null && payList.size() > 0){
            pVO = payList.get(0);

            PayInfoOutBoundVO payVO = new PayInfoOutBoundVO();
            payVO.setDlrCd( cntVO.getDlrCd() );
            payVO.setFinDocNo( pVO.getFinDocNo() );
            payVO.setJobTp("C");
            payVO.setJobContractNo(cntVO.getContractNo());
            payVO.setVinNo(cntVO.getVinNo());
            payVO.setCustTp(cntVO.getCustTp());     // 고객 운전자 = 계약자 동일로 변경.
            payVO.setCustNo(cntVO.getCustCd());
            payVO.setCustNm(cntVO.getCustNm());
            payVO.setManageEmpNo(cntVO.getSaleEmpNo());

            // 지불상태:01-미결, 02-수납완료
            String paymentTp = pVO.getPaymentTp();
            String compYn    = pVO.getCompYn();
            Date compDt      = pVO.getCompDt();
            if( "02".equals(paymentTp) ){
                if(realPayAmt != pVO.getRealPayAmt()){
                    paymentTp = "01";
                    compYn = "N";
                    compDt = null;
                }
                if(realCarAmt != pVO.getRealCarAmt()){
                    paymentTp = "01";
                    compYn = "N";
                    compDt = null;
                }
                if(goodsAmt != pVO.getGoodsAmt()){
                    paymentTp = "01";
                    compYn = "N";
                    compDt = null;
                }
                if(incAmt != pVO.getIncAmt()){
                    paymentTp = "01";
                    compYn = "N";
                    compDt = null;
                }
                if(fincFeeAmt != pVO.getFincAmt()){
                    paymentTp = "01";
                    compYn = "N";
                    compDt = null;
                }
                if(sbstAmt != pVO.getSbstAmt()){
                    paymentTp = "01";
                    compYn = "N";
                    compDt = null;
                }
                if(aapAmt != pVO.getAapAmt()){
                    paymentTp = "01";
                    compYn = "N";
                    compDt = null;
                }
                if(pointAmt != pVO.getPointAmt()){
                    paymentTp = "01";
                    compYn = "N";
                    compDt = null;
                }
                if(beforeAmt != payVO.getReservContAmt()){
                    paymentTp = "01";
                    compYn = "N";
                    compDt = null;
                }
            }

            payVO.setCompYn(compYn);
            payVO.setCompDt(compDt);
            payVO.setPaymentTp(paymentTp);
            payVO.setRealPayAmt(realPayAmt);
            payVO.setRealCarAmt(realCarAmt);
            payVO.setGoodsAmt(goodsAmt);
            payVO.setIncAmt(incAmt);
            payVO.setFincAmt(fincFeeAmt);
            payVO.setSbstAmt(sbstAmt);
            payVO.setAapAmt(aapAmt);
            payVO.setDcAmt(dcAmt);
            payVO.setPointAmt(pointAmt);
            payVO.setReservContAmt(beforeAmt);
            payVO.setRegUsrId(LoginUtil.getUserId());
            payVO.setUpdtUsrId(LoginUtil.getUserId());
            payInfoOutBoundService.updatePayInfoHeader(payVO);


            // 정산금액 재정비
            PayInfoOutBoundDetailVO detailVO = new PayInfoOutBoundDetailVO();
            detailVO.setFinDocNo(pVO.getFinDocNo());
            detailVO.setDlrCd(cntVO.getDlrCd());
            detailVO.setPaymentTp(paymentTp);
            detailVO.setUpdtUsrId(LoginUtil.getUserId());
            payInfoOutBoundService.changePayInfo(detailVO);

        }else{
            insertContractPayinfo(cntVO);       // SA_0451T : 수납헤더 생성
        }
    }

    /**
     * 계약 수납생성.
     * @param cntVO
     * @throws Exception
     */
    private void insertContractPayinfo(ContractReSupportVO cntVO) throws Exception{
        //cntVO.setRealAmt( cntVO.getRealAmt() == null ? cntVO.getRealCarAmt():cntVO.getRealAmt());

        PayInfoOutBoundVO payVO = new PayInfoOutBoundVO();
        payVO.setDlrCd( cntVO.getDlrCd() );
        payVO.setJobTp("C");
        payVO.setJobContractNo(cntVO.getContractNo());
        payVO.setVinNo(cntVO.getVinNo());
        payVO.setCustTp(cntVO.getCustTp());     // 고객 운전자 = 계약자 동일로 변경.
        payVO.setCustNo(cntVO.getCustCd());
        payVO.setCustNm(cntVO.getCustNm());
        payVO.setManageEmpNo(cntVO.getSaleEmpNo());
        payVO.setPaymentTp("01");                   // 미결

        double realCarAmt = cntVO.getRealCarAmt() != null ? cntVO.getRealCarAmt() : 0.0 ;
        double beforeAmt = cntVO.getReservContAmt() != null ? cntVO.getReservContAmt() : 0.0 ;
        double goodsAmt = cntVO.getGoodsAmt() != null ? cntVO.getGoodsAmt() : 0.0;
        double incAmt = cntVO.getIncAmt() != null ? cntVO.getIncAmt() : 0.0;
        double fincFeeAmt = cntVO.getFincFeeAmt() != null ? cntVO.getFincFeeAmt() : 0.0;
        double sbstAmt = cntVO.getSbstAmt() != null ? cntVO.getSbstAmt() : 0.0;
        double aapAmt  = cntVO.getAapAmt() != null ? cntVO.getAapAmt() : 0.0;
        double dcAmt = cntVO.getPromotionAmt() != null ? cntVO.getPromotionAmt() : 0.0;
        double pointAmt = cntVO.getPointAmt() != null ? cntVO.getPointAmt() : 0.0;

        double realPayAmt = realCarAmt - beforeAmt + goodsAmt + incAmt + fincFeeAmt + sbstAmt + aapAmt + pointAmt;

        double subsidyAmt = 0;
        if("2".equals(cntVO.getSbusTp())){
            subsidyAmt = cntVO.getSubsidyAmt();
        }else if("3".equals(cntVO.getSbusTp())){
            subsidyAmt = cntVO.getSubsidyAmt();
            realCarAmt -= subsidyAmt;
        }

        realPayAmt -= subsidyAmt;

        payVO.setRealPayAmt(realPayAmt);
        payVO.setTotPayAmt(0.00);
        payVO.setTotDcAmt(0.00);
        payVO.setProAmt(0.00);
        payVO.setRecvAmt(realPayAmt);
        payVO.setOverAmt(0.00);
        payVO.setRecpYn("N");
        payVO.setRealCarAmt(realCarAmt);
        payVO.setGoodsAmt(goodsAmt);
        payVO.setIncAmt(incAmt);
        payVO.setFincAmt(fincFeeAmt);
        payVO.setSbstAmt(sbstAmt);
        payVO.setAapAmt(aapAmt);
        payVO.setDcAmt(dcAmt);
        payVO.setPointAmt(pointAmt);
        payVO.setReservContAmt(beforeAmt);
        payVO.setRegUsrId(LoginUtil.getUserId());
        payVO.setUpdtUsrId(LoginUtil.getUserId());
        payInfoOutBoundService.insertPayInfoHeader(payVO);
    }

}
