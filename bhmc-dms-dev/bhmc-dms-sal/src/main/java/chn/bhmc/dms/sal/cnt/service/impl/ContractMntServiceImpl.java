package chn.bhmc.dms.sal.cnt.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.sal.veh.vo.VehicleMasterSearchVO;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO;
import chn.bhmc.dms.crm.cmm.service.AddressInfoService;
import chn.bhmc.dms.crm.cmm.vo.AddressInfoSearchVO;
import chn.bhmc.dms.crm.cmm.vo.AddressInfoVO;
import chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtOutBoundService;
import chn.bhmc.dms.crm.cso.service.dao.SalesOpptProcessMgmtDAO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtVO;
import chn.bhmc.dms.sal.aap.service.AapInfoService;
import chn.bhmc.dms.sal.aap.vo.AapInfoSearchVO;
import chn.bhmc.dms.sal.aap.vo.AapInfoVO;
import chn.bhmc.dms.sal.acc.service.AccessoryItemSalesService;
import chn.bhmc.dms.sal.acc.vo.AccessoryItemSalesItemVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryItemSalesSaveVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryItemSalesSearchVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryItemSalesVO;
import chn.bhmc.dms.sal.acu.service.ContBeforeMngService;
import chn.bhmc.dms.sal.acu.vo.ContBeforeMngSearchVO;
import chn.bhmc.dms.sal.acu.vo.ContBeforeMngVO;
import chn.bhmc.dms.sal.cnt.service.ContractMntService;
import chn.bhmc.dms.sal.cnt.service.dao.ContractMntDAO;
import chn.bhmc.dms.sal.cnt.vo.ChnInfoVO;
import chn.bhmc.dms.sal.cnt.vo.ContractMntSaveVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReGoodsVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReIncVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReSaveVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReSearchVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReVO;
import chn.bhmc.dms.sal.cnt.vo.ContractSearchVO;
import chn.bhmc.dms.sal.dlv.service.ContDeliveryMngService;
import chn.bhmc.dms.sal.dlv.vo.ContDeliverySearchVO;
import chn.bhmc.dms.sal.fim.service.FincInfoMngService;
import chn.bhmc.dms.sal.fim.vo.FincInfoMngVO;
import chn.bhmc.dms.sal.fin.service.PayInfoService;
import chn.bhmc.dms.sal.fin.vo.PayInfoDetailVO;
import chn.bhmc.dms.sal.fin.vo.PayInfoSearchVO;
import chn.bhmc.dms.sal.fin.vo.PayInfoVO;
import chn.bhmc.dms.sal.inc.service.IncJoinInfoService;
import chn.bhmc.dms.sal.inc.vo.IncJoinInfoSaveVO;
import chn.bhmc.dms.sal.inc.vo.IncJoinInfoVO;
import chn.bhmc.dms.sal.usc.service.PurcEvalService;
import chn.bhmc.dms.sal.usc.vo.PurcEvalSearchVO;
import chn.bhmc.dms.sal.usc.vo.PurcEvalVO;
import chn.bhmc.dms.sal.veh.service.VehicleMasterService;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterVO;

/**
 * @ClassName   : ContractMntServiceImpl
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

@Service("contractMntService")
public class ContractMntServiceImpl extends HService implements ContractMntService {

    /**
     * 계약 DAO 선언
     */
    @Resource(name="contractMntDAO")
    ContractMntDAO contractMntDAO;

    /**
     * 금융관리 서비스
     */
    @Resource(name="fincInfoMngService")
    FincInfoMngService fincInfoMngService;

    /**
     * 보험관리 서비스
     */
    @Resource(name="incJoinInfoService")
    IncJoinInfoService incJoinInfoService;

    /**
     * CRM 판매기회 관리 서비스
     */
    @Resource(name="salesOpptProcessMgmtOutBoundService")
    SalesOpptProcessMgmtOutBoundService salesOpptProcessMgmtOutBoundService;

    /**
     * 소매판매 주문번호 생성 id gen
     */
    @Resource(name="retailContractOrdNoIdgenService")
    TableIdGenService retailContractOrdNoIdgenService;

    /**
     * 경품정보관리 서비스
     */
    //@Resource(name="accessoryMngService")
    //AccessoryMngService accessoryMngService;
    /**
     * 용품판매관리 서비스
     */
    @Resource(name="accessoryItemSalesService")
    AccessoryItemSalesService accessoryItemSalesService;

    /**
     * 대행업무 서비스
     */
//    @Resource(name="aapMngService")
//    AapMngService aapMngService;
    @Resource(name="aapInfoService")
    AapInfoService aapInfoService;


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
     * 중고차 매입서비스
     */
    @Resource(name="purcEvalService")
    PurcEvalService purcEvalService;

    /**
     * 수납 서비스
     */
    @Resource(name="payInfoService")
    PayInfoService payInfoService;

    /**
     * 예약판매 서비스
     */
    @Resource(name="contBeforeMngService")
    ContBeforeMngService contBeforeMngService;

    /**
     * 시스템 컨피그 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 출고 서비스
     */
    @Resource(name="contDeliveryMngService")
    ContDeliveryMngService contDeliveryMngService;

    /**
     * 차량마스터 서비스
     */
    @Resource(name="vehicleMasterService")
    VehicleMasterService vehicleMasterService;

    @Resource(name="salesOpptProcessMgmtDAO")
    SalesOpptProcessMgmtDAO salesOpptProcessMgmtDAO;
    
    /**
     * 조회 조건에 해당하는 계약목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return 조회 목록
     */
    @Override
    public List<ContractReVO> selectContractResByCondition(ContractReSearchVO searchVO) throws Exception{
        return contractMntDAO.selectContractResByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 계약목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return
     */
    @Override
    public int selectContractResByConditionCnt(ContractReSearchVO searchVO) throws Exception{
        return contractMntDAO.selectContractResByConditionCnt(searchVO);
    }

    /**
     * 계약목록(V.3) 목록 갯수 조회
     */
    @Override
    public int selectContractMntsByConditionCnt(ContractReSearchVO searchVO) throws Exception{
        return contractMntDAO.selectContractMntsByConditionCnt(searchVO);
    }
    /**
     * 계약목록(V.3) 목록 조회
     */
    @Override
    public List<ContractReVO> selectContractMntsByCondition(ContractReSearchVO searchVO) throws Exception{
        return contractMntDAO.selectContractMntsByCondition(searchVO);
    }

    /**
     * 계약저장시 유효성 체크를 한다.
     * @return
     */
    private void validationContractChk(ContractReSaveVO saveVO, String multiFlag ) throws Exception{
        ContractReVO cntVO = saveVO.getContractReVO();

        Date contDt = cntVO.getContractDt();
        SimpleDateFormat simpleformat = new SimpleDateFormat("yyyy-MM-dd");
        Date toDay = simpleformat.parse(DateUtil.getDate("yyyy-MM-dd"));

        if( StringUtils.isEmpty(cntVO.getDlrCd()) ){
            // [딜러코드]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.dlrCd", null, LocaleContextHolder.getLocale())});
        };
        if(  contDt == null ){
            // [계약일자]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.contractDt", null, LocaleContextHolder.getLocale())});
        };
        if( "create".equals(multiFlag) && contDt.before(toDay) ){
            // {계약일자}은 {현재일자}보다 작을 수 없습니다.
            throw processException("sal.info.CheckDateForm", new String[]{ messageSource.getMessage("global.lbl.contractDt", null, LocaleContextHolder.getLocale()) , messageSource.getMessage("sal.lbl.toDay", null, LocaleContextHolder.getLocale()) });
        }
        if( StringUtils.isEmpty(cntVO.getCustCd()) ){
            // [고객]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.customer", null, LocaleContextHolder.getLocale())});
        };
        if( StringUtils.isEmpty(cntVO.getCustTp()) ){
            // [고객]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.custTp", null, LocaleContextHolder.getLocale())});
        };
        if( StringUtils.isEmpty(cntVO.getCustNm()) ){
            // [고객명]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.custNm", null, LocaleContextHolder.getLocale())});
        };
        if( StringUtils.isEmpty(cntVO.getSsnCrnTp()) ){
            // [신분증유형]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("sal.lbl.ssnCrnTp", null, LocaleContextHolder.getLocale())});
        };
        if( StringUtils.isEmpty(cntVO.getSsnCrnNo()) ){
            // [신분증번호]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("sal.lbl.ssnCrnNo", null, LocaleContextHolder.getLocale())});
        };
        if( StringUtils.isEmpty(cntVO.getContractStatCd()) ){
            // [계약상태]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.contractStat", null, LocaleContextHolder.getLocale())});
        };
        if( StringUtils.isEmpty(cntVO.getContractTp()) ){
            // [계약유형]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.contractType", null, LocaleContextHolder.getLocale())});
        };
        if( StringUtils.isEmpty(cntVO.getCarlineCd()) ){
            // [차종]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.carLine", null, LocaleContextHolder.getLocale())});
        };
        /*
        if( StringUtils.isEmpty(cntVO.getFscCd()) ){
            // [모델]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.model", null, LocaleContextHolder.getLocale())});
        };
        if( StringUtils.isEmpty(cntVO.getModelCd()) ){
            // [모델]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.model", null, LocaleContextHolder.getLocale())});
        };
        if( StringUtils.isEmpty(cntVO.getOcnCd()) ){
            // [OCN]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.ocn", null, LocaleContextHolder.getLocale())});
        };
        if( StringUtils.isEmpty(cntVO.getExtColorCd()) ){
            // [외장색]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.extColor", null, LocaleContextHolder.getLocale())});
        };
        if( StringUtils.isEmpty(cntVO.getIntColorCd()) ){
            // [내장색]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.intColor", null, LocaleContextHolder.getLocale())});
        };
        */
        if( "update".equals(multiFlag) ){
            chkUpdate(cntVO);
        }

        // 이상출고 신청건 유무 판단.
        if( StringUtils.isNotBlank(cntVO.getContractNo()) ){
            ContDeliverySearchVO searchEtVO = new ContDeliverySearchVO();
            searchEtVO.setsDlrCd(cntVO.getDlrCd());
            searchEtVO.setsContractNo(cntVO.getContractNo());
            if(contDeliveryMngService.selectContractExceptionStatByConditionCnt(searchEtVO) > 0){
                // 현재차량은 이상출고신청중입니다. 심사처리를 기다려주십시오
                throw processException("sal.info.contExceptionStatCheckMsg");
            }
        }
    }

    /**
     * CRM 고객정보 저장.
     */
    private void updateCustInfo(ContractReVO cntVO) throws Exception{

        CustomerInfoSearchVO cSearchVO = new CustomerInfoSearchVO();
        cSearchVO.setsDlrCd(cntVO.getDlrCd());
        cSearchVO.setsCustNo(cntVO.getCustCd());
        if(customerInfoOutBoundService.selectCustomerInfoByConditionCnt(cSearchVO) == 0){
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.customer", null, LocaleContextHolder.getLocale())});
        }

        /*// 고객정보는 CRM 수정불가로 변경.[2017.04.20 령연 요청]
        CustomerInfoVO infoVO = new CustomerInfoVO();
        infoVO.setCommandTp("UPDFROMCONTRACT");
        infoVO.setDlrCd(cntVO.getDlrCd());
        infoVO.setCustNo(cntVO.getCustCd());
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
        addrSearchVO.setsRefKeyNm(cntVO.getCustCd());
        addrSearchVO.setsAddrTp(cntVO.getAddrTp());
        addrSearchVO.setsFlagYn("Y");
        int cnt = addressInfoService.selectAddressInfoByConditionCnt(addrSearchVO);

        AddressInfoVO addrInfoVO = new AddressInfoVO();
        addrInfoVO.setRefTableNm("CR_0101T");
        addrInfoVO.setrefKeyNm(cntVO.getCustCd());
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
                //|| StringUtils.isNotEmpty(addrInfoVO.getAddrTp())
        ){
            if(cnt > 0){
                addressInfoService.updateAddressInfoOnCustNo(addrInfoVO);
            }else{
                addrInfoVO.setDlrCd(LoginUtil.getDlrCd());
                addrInfoVO.setFlagYn("Y");
                addrInfoVO.setUseYn("Y");
                addrInfoVO.setRegUsrId(LoginUtil.getUserId());
                addressInfoService.insertAddressInfo(addrInfoVO);
            }
        }
    }

    /**
     * 계약을 생성/저장 한다.
     */
    @Override
    public String multiContractMnts(ContractReSaveVO saveVO) throws Exception{
        VehicleMasterVO vmVO = null;
        ContBeforeMngVO cntBeforeVO = null;

        String contractNo = "";
        String contCustTp   = "";
        String contSsnCrnNo = "";       // 계약자:신분증번호
        String contSsnCrnTp = "";       // 계약자:신분증유형
        String contCustNm   = "";       // 계약자:성명
        String contTelNo1   = "";       // 계약자:연락처

        ContractReVO cntVO = saveVO.getContractReVO();
        cntVO.setRegUsrId(LoginUtil.getUserId());     // 생성자
        cntVO.setUpdtUsrId(LoginUtil.getUserId());    // 수정자

        if(StringUtils.isEmpty(cntVO.getContractNo())){
            saveVO.setMultiFlag("create");
        }else{
            saveVO.setMultiFlag("update");
        }

        validationContractChk(saveVO, saveVO.getMultiFlag());

        updateCustInfo(cntVO);

        if( "create".equals(saveVO.getMultiFlag()) ){   // 생성

            /**
             * 계약번호(키생성)
             * B + 년월 + 5자리seq
             * carline을 넣어서 id gen 을 시킬시, Prefix를 재호출로 넣어줘야 줌.
             */
            synchronized (retailContractOrdNoIdgenService) {
                ((RetailContractOrdNoIdGenStrategy)retailContractOrdNoIdgenService.getStrategy()).setCarlineCd(cntVO.getCarlineCd());
                ((RetailContractOrdNoTableNameStrategy)retailContractOrdNoIdgenService.getTableNameStrategy()).setCarlineCd(cntVO.getCarlineCd());
                contractNo = retailContractOrdNoIdgenService.getNextStringId();
            }

            // 주문번호를 넣는다.
            cntVO.setContractNo(contractNo);

            // SA_0201T : 계약 헤더 저장
            contractMntDAO.insertContract(cntVO);

            // SA_0202 : 계약고객 저장
            cntVO.setPartnerTp("C");          // 계약자
            contractMntDAO.insertContractCustomer(cntVO);
            contCustTp   = cntVO.getCustTp();       // 계약자:고객유형
            contSsnCrnNo = cntVO.getSsnCrnNo();     // 계약자:신분증번호
            contSsnCrnTp = cntVO.getSsnCrnTp();     // 계약자:신분증유형
            contCustNm   = cntVO.getCustNm();       // 계약자:성명
            contTelNo1   = cntVO.getTelNo1();       // 계약자:연락처

            // SA_0202 : 실운전자 저장
            cntVO.setPartnerTp("D");          // 실운전자
            cntVO.setCustCd(cntVO.getDrvCustCd());     // 고객코드
            cntVO.setCustTp(cntVO.getDrvCustTp());     // 고객유형
            cntVO.setCustNm(cntVO.getDrvCustNm());     // 고객명
            cntVO.setTelNo1(cntVO.getDrvTelNo1());     // 고객연락처1
            cntVO.setTelNo2(cntVO.getDrvTelNo2());     // 고객연락처2
            cntVO.setEmailNm(cntVO.getDrvEmailNm());   // 이메일주소
            cntVO.setTaxPayNo(cntVO.getDrvTaxPayNo()); // 납세번호
            cntVO.setDrvPurcMngNm(cntVO.getDrvPurcMngNm()); // 구매담당자명
            cntVO.setSsnCrnNo( cntVO.getDrvSsnCrnNo() );    // 신분증번호
            cntVO.setZipCd(cntVO.getDrvZipCd());            // 우편번호
            cntVO.setSsnCrnTp( cntVO.getDrvSsnCrnTp() );    // 신분증유형
            cntVO.setAddrTp( cntVO.getDrvAddrTp());         // 주소유형
            cntVO.setSungCd( cntVO.getDrvSungCd());         // 성코드
            cntVO.setSungNm( cntVO.getDrvSungNm());         //
            cntVO.setCityCd( cntVO.getDrvCityCd());         // 도시
            cntVO.setCityNm( cntVO.getDrvCityNm());         //
            cntVO.setDistCd( cntVO.getDrvDistCd());         // 지역
            cntVO.setDistNm( cntVO.getDrvDistNm());         //
            cntVO.setAddrNm( cntVO.getDrvAddrNm());         // 주소명
            cntVO.setAddrDetlCont( cntVO.getDrvAddrDetlCont());     // 주소상세내용
            contractMntDAO.insertContractCustomer(cntVO);

            // SA_0205 : 중고차 저장
            if("Y".equals(cntVO.getUatcCarPurcYn())){
                PurcEvalVO purcVO = new PurcEvalVO();
                purcVO.setDlrCd(cntVO.getDlrCd());
                //purcVO.setExchYn(cntVO.getUatcCarPurcYn());      // 치환여부 변경하지 말것. (2017.04.09 구상우)
                purcVO.setPurcNo(cntVO.getPurcNo());
                purcVO.setVinNo(cntVO.getUsrVinNo());
                //purcVO.setPurcTotAmt(cntVO.getUsrSbstAmt());     // 매입금액 역저장 안함.(2017.03.20 여령)
                purcVO.setContractNo(cntVO.getContractNo());
                // 중고차 평가매입 : SA_0241T
                // 계약번호, vin , 치환금액
                purcEvalService.saveContractPurcEval(purcVO);

                contractMntDAO.insertUsedCar(cntVO);
            }


            // 보험 내역 등록
            if("A".equals(cntVO.getIncAapTp())){
                // SA_0221T : 보험헤더
                contractMntDAO.insertIncHead(cntVO);

                ContractReSearchVO searchVO = new ContractReSearchVO();
                contractMntDAO.deleteIncAll(cntVO);
                // SA_0222T : 보험아이템
                for(ContractReIncVO incVO : saveVO.getIncVO().getInsertIncList()){
                    incVO.setDlrCd(LoginUtil.getDlrCd());
                    incVO.setContractNo(contractNo);

                    searchVO.setsDlrCd(incVO.getDlrCd());
                    searchVO.setsContractNo(incVO.getContractNo());
                    searchVO.setsIncTp(incVO.getIncTp());
                    if( contractMntDAO.selectIncListsByConditionCnt(searchVO) > 0){
                        throw processException("global.err.duplicate");
                    }
                    incVO.setRegUsrId(LoginUtil.getUserId());     // 사용자
                    incVO.setUpdtUsrId(LoginUtil.getUserId());    // 사용자
                    contractMntDAO.insertInc(incVO);
                }
                for(ContractReIncVO incVO : saveVO.getIncVO().getUpdateIncList()){
                    searchVO.setsDlrCd(incVO.getDlrCd());
                    searchVO.setsContractNo(incVO.getContractNo());
                    searchVO.setsIncTp(incVO.getIncTp());
                    if( contractMntDAO.selectIncListsByConditionCnt(searchVO) > 0){
                        throw processException("global.err.duplicate");
                    }

                    incVO.setRegUsrId(LoginUtil.getUserId());     // 사용자
                    incVO.setUpdtUsrId(LoginUtil.getUserId());    // 사용자
                    contractMntDAO.updateInc(incVO);
                }
                for(ContractReIncVO incVO : saveVO.getIncVO().getDeleteIncList()){
                    contractMntDAO.deleteInc(incVO);
                }

            }

            // SA_0223T : 계약-금융서비스
            if("Y".equals(cntVO.getFincReqYn())){
                contractMntDAO.insertFinc(cntVO);

                // SA_0233T : 금융서비스
                FincInfoMngVO fincVO = new FincInfoMngVO();
                fincVO.setDlrCd(cntVO.getDlrCd());
                fincVO.setFincReqDt(cntVO.getFincReqDt());
                fincVO.setFincStatCd("01");         // 신청상태.
                fincVO.setReqDataCollcEndYn("Y");   // 최초 : 신청자료 제출여부 Y로 요청. 2017-05-23 령연.
                fincVO.setContractNo(cntVO.getContractNo());
                fincVO.setCarlineCd(cntVO.getCarlineCd());
                fincVO.setFscCd(cntVO.getFscCd());
                fincVO.setModelCd(cntVO.getModelCd());
                fincVO.setOcnCd(cntVO.getOcnCd());
                fincVO.setExtColorCd(cntVO.getExtColorCd());
                fincVO.setIntColorCd(cntVO.getIntColorCd());
                fincVO.setVinNo(cntVO.getVinNo());
                fincVO.setCustTp(contCustTp);
                fincVO.setMathDocTp(contSsnCrnTp);
                fincVO.setSsnCrnNo(contSsnCrnNo);
                fincVO.setPublNm(contCustNm);
                fincVO.setTelNo1(contTelNo1);
                fincVO.setFincCmpCd(cntVO.getFincCmpCd() );
                fincVO.setFincItemCd(cntVO.getFincItemCd());
                fincVO.setFincReqAmt(cntVO.getFincReqAmt());
                fincVO.setFincEndDt(cntVO.getFincEndDt());
                fincVO.setFincLoanFeeAmt(cntVO.getFincFeeAmt());
                fincVO.setFincRpayPrid(cntVO.getFincRpayPrid());
                fincVO.setFincLoanRate(cntVO.getFincLoadRate());
                fincVO.setRegUsrId(cntVO.getRegUsrId());
                fincVO.setUpdtUsrId(cntVO.getUpdtUsrId());
                fincVO.setFincBurdAmt(cntVO.getFincBurdAmt());
                fincInfoMngService.insertFincMng(fincVO);
            }

            // SA_0451T : 수납헤더 생성
            //insertContractPayinfo(cntVO);

        }else{

            contractNo = cntVO.getContractNo();

            // SA_0201T : 계약 헤더 수정
            contractMntDAO.updateContract(cntVO);

            // SA_0202T : 계약고객 수정
            cntVO.setPartnerTp("C");          // 계약자
            //contractMntDAO.updateContractCustomer(cntVO);
            contractMntDAO.updateContractCustomerAddr(cntVO);
            contCustTp   = cntVO.getCustTp();       // 계약자:고객유형
            contSsnCrnNo = cntVO.getSsnCrnNo();     // 계약자:신분증번호
            contSsnCrnTp = cntVO.getSsnCrnTp();     // 계약자:신분증유형
            contCustNm   = cntVO.getCustNm();       // 계약자:성명
            contTelNo1   = cntVO.getTelNo1();       // 계약자:연락처

            // SA_0202T : 실운전자 저장
            cntVO.setPartnerTp("D");          // 실운전자
            cntVO.setCustCd(cntVO.getDrvCustCd());     // 고객코드
            cntVO.setCustTp(cntVO.getDrvCustTp());     // 고객유형
            cntVO.setCustNm(cntVO.getDrvCustNm());     // 고객명
            cntVO.setTelNo1(cntVO.getDrvTelNo1());     // 고객연락처1
            cntVO.setTelNo2(cntVO.getDrvTelNo2());     // 고객연락처2
            cntVO.setEmailNm(cntVO.getDrvEmailNm());   // 이메일주소
            cntVO.setTaxPayNo(cntVO.getDrvTaxPayNo()); // 납세번호

            cntVO.setSsnCrnNo( cntVO.getDrvSsnCrnNo() );    // 신분증번호
            cntVO.setZipCd(cntVO.getDrvZipCd());            // 우편번호
            cntVO.setSsnCrnTp( cntVO.getDrvSsnCrnTp() );    // 신분증유형
            cntVO.setAddrTp( cntVO.getDrvAddrTp() );        // 주소유형
            cntVO.setSungCd( cntVO.getDrvSungCd());         // 성코드
            cntVO.setSungNm( cntVO.getDrvSungNm());         //
            cntVO.setCityCd( cntVO.getDrvCityCd());         // 도시
            cntVO.setCityNm( cntVO.getDrvCityNm());         //
            cntVO.setDistCd( cntVO.getDrvDistCd());         // 지역
            cntVO.setDistNm( cntVO.getDrvDistNm());         //
            cntVO.setAddrNm( cntVO.getDrvAddrNm());         // 주소명
            cntVO.setAddrDetlCont( cntVO.getDrvAddrDetlCont());     // 주소상세내용
            if(contractMntDAO.selectContractCustomersChkByConditionCnt(cntVO) > 0){
                //contractMntDAO.updateContractCustomer(cntVO);
                contractMntDAO.updateContractCustomerAddr(cntVO);
            }else{
                contractMntDAO.insertContractCustomer(cntVO);
            }

            // SA_0205T : 중고차 수정
            if("Y".equals(cntVO.getUatcCarPurcYn())){

                if( !cntVO.getBeforPurcNo().equals(cntVO.getPurcNo()) ){
                    PurcEvalVO purcVO = new PurcEvalVO();
                    purcVO.setDlrCd(cntVO.getDlrCd());
                    //purcVO.setExchYn(cntVO.getUatcCarPurcYn());       // 치환여부 변경하지 말것. (2017.04.09 구상우)
                    purcVO.setPurcNo(cntVO.getPurcNo());
                    purcVO.setVinNo(cntVO.getUsrVinNo());
                    //purcVO.setPurcTotAmt(cntVO.getUsrSbstAmt());     // 매입금액 역저장 안함.(2017.03.20 여령)
                    purcVO.setContractNo(cntVO.getContractNo());

                    if( "".equals(cntVO.getBeforPurcNo()) ){
                        // 중고차 평가매입 : SA_0241T  - 최초
                        purcEvalService.saveContractPurcEval(purcVO);
                    }else{
                        purcVO.setPurcNo(cntVO.getBeforPurcNo());
                        purcEvalService.initContractPurcEval(purcVO);

                        purcVO = new PurcEvalVO();
                        purcVO.setDlrCd(cntVO.getDlrCd());
                        //purcVO.setExchYn(cntVO.getUatcCarPurcYn());         // 치환여부 변경하지 말것. (2017.04.09 구상우)
                        purcVO.setVinNo(cntVO.getUsrVinNo());
                        //purcVO.setPurcTotAmt(cntVO.getUsrSbstAmt());     // 매입금액 역저장 안함.(2017.03.20 여령)
                        purcVO.setContractNo(cntVO.getContractNo());
                        purcVO.setPurcNo(cntVO.getPurcNo());
                        purcEvalService.saveContractPurcEval(purcVO);
                    }
                }

                // 최초저장 시, 중고차 저장을 안했을 경우.
                if(contractMntDAO.selectUsedCarCnt(cntVO) > 0){
                    contractMntDAO.updateUsedCar(cntVO);
                }else{
                    contractMntDAO.insertUsedCar(cntVO);
                }

            }else{
                PurcEvalVO purcVO = new PurcEvalVO();
                purcVO.setDlrCd(cntVO.getDlrCd());
                purcVO.setContractNo(cntVO.getContractNo());
                purcEvalService.deleteContractPurcEval(purcVO);

                // 수정 시, 체크를 해제했을 경우 지움
                contractMntDAO.deleteUsedCar(cntVO);
            }

            // 보험 내역 수정
            if("A".equals(cntVO.getIncAapTp())){
                // 최초저장 시, 보험헤더 저장을 했을 경우.
                if(contractMntDAO.selectIncHeadCnt(cntVO) > 0){
                    chkIncUpdate(cntVO);
                    contractMntDAO.updateIncHead(cntVO);
                }else{
                    contractMntDAO.insertIncHead(cntVO);
                }

                ContractReSearchVO searchVO = new ContractReSearchVO();
                contractMntDAO.deleteIncAll(cntVO);
                // SA_0222T : 보험아이템
                for(ContractReIncVO incVO : saveVO.getIncVO().getInsertIncList()){
                    incVO.setDlrCd(LoginUtil.getDlrCd());
                    incVO.setContractNo(contractNo);

                    searchVO.setsDlrCd(incVO.getDlrCd());
                    searchVO.setsContractNo(incVO.getContractNo());
                    searchVO.setsIncTp(incVO.getIncTp());
                    if( contractMntDAO.selectIncListsByConditionCnt(searchVO) > 0){
                        throw processException("global.err.duplicate");
                    }
                    incVO.setRegUsrId(LoginUtil.getUserId());
                    incVO.setUpdtUsrId(LoginUtil.getUserId());
                    contractMntDAO.insertInc(incVO);
                }
                for(ContractReIncVO incVO : saveVO.getIncVO().getUpdateIncList()){
                    searchVO.setsDlrCd(incVO.getDlrCd());
                    searchVO.setsContractNo(incVO.getContractNo());
                    searchVO.setsIncTp(incVO.getIncTp());
                    if( contractMntDAO.selectIncListsByConditionCnt(searchVO) > 0){
                        throw processException("global.err.duplicate");
                    }
                    incVO.setRegUsrId(LoginUtil.getUserId());
                    incVO.setUpdtUsrId(LoginUtil.getUserId());
                    contractMntDAO.updateInc(incVO);
                }
                for(ContractReIncVO incVO : saveVO.getIncVO().getDeleteIncList()){
                    contractMntDAO.deleteInc(incVO);
                }

            }else{
                contractMntDAO.deleteIncHead(cntVO);
                contractMntDAO.deleteIncAll(cntVO);
            }

            // SA_0233T : 금융서비스
            FincInfoMngVO fincVO = new FincInfoMngVO();
            fincVO.setDlrCd(cntVO.getDlrCd());
            fincVO.setContractNo(cntVO.getContractNo());
            List<FincInfoMngVO> fnList = fincInfoMngService.selectFincNoSearch(fincVO);
            if(fnList.size() > 0){
                fincVO.setFincNo( fnList.get(0).getFincNo() );  // 금융번호
            }

            // SA_0223T : 계약-금융서비스 수정
            if("Y".equals(cntVO.getFincReqYn())){
                // SA_0223T : 최초저장 시, 금융헤더 저장을 했을 경우.
                if(contractMntDAO.selectFincCnt(cntVO) > 0){
                    contractMntDAO.updateFinc(cntVO);
                }else{
                    contractMntDAO.insertFinc(cntVO);
                }

                // SA_0233T : 금융서비스
                fincVO.setFincReqDt(cntVO.getFincReqDt());
                fincVO.setFincStatCd("01");         // 신청상태.
                fincVO.setReqDataCollcEndYn("Y");   // 생성시 : 신청자료 제출여부 Y로 요청. 2017-05-23 령연.
                fincVO.setCarlineCd(cntVO.getCarlineCd());
                fincVO.setFscCd(cntVO.getFscCd());
                fincVO.setModelCd(cntVO.getModelCd());
                fincVO.setOcnCd(cntVO.getOcnCd());
                fincVO.setExtColorCd(cntVO.getExtColorCd());
                fincVO.setIntColorCd(cntVO.getIntColorCd());
                fincVO.setVinNo(cntVO.getVinNo());
                fincVO.setCustTp(contCustTp);
                fincVO.setMathDocTp(contSsnCrnTp);
                fincVO.setSsnCrnNo(contSsnCrnNo);
                fincVO.setPublNm(contCustNm);
                fincVO.setTelNo1(contTelNo1);
                fincVO.setFincCmpCd(cntVO.getFincCmpCd() );
                fincVO.setFincItemCd(cntVO.getFincItemCd());
                fincVO.setFincReqAmt(cntVO.getFincReqAmt());
                fincVO.setFincEndDt(cntVO.getFincEndDt());
                fincVO.setFincLoanFeeAmt(cntVO.getFincFeeAmt());
                fincVO.setFincRpayPrid(cntVO.getFincRpayPrid());
                fincVO.setFincLoanRate(cntVO.getFincLoadRate());
                fincVO.setInstIntrRate(cntVO.getInstIntrRate());
                fincVO.setGrteIncAmt(cntVO.getGrteIncAmt());
                fincVO.setRegUsrId(cntVO.getRegUsrId());
                fincVO.setUpdtUsrId(cntVO.getUpdtUsrId());
                fincVO.setFincBurdAmt(cntVO.getFincBurdAmt());
                if(fnList.size() > 0){
                    fincInfoMngService.updateFincMng(fincVO);
                }else{
                    fincInfoMngService.insertFincMng(fincVO);
                }

            }else{
                // 금융서비스 신청을 체크 안했을 시.
                contractMntDAO.deleteFinc(cntVO);

                if(fnList.size() > 0){
                    // SA_0233T : 금융서비스 - 삭제
                    fincInfoMngService.deleteFincMng(fincVO);
                }
            }

            //SA_0451T : 수납헤더
            //updateContractPayinfo(cntVO);
        }

        // SA_0209T 예약판매 변경
        if( !cntVO.getBeBeforeNo().equals(cntVO.getBeforeNo()) ){
            cntBeforeVO = new ContBeforeMngVO();
            cntBeforeVO.setUpdtUsrId(cntVO.getUpdtUsrId());
            cntBeforeVO.setDlrCd(cntVO.getDlrCd());
            cntBeforeVO.setBeforeNo(cntVO.getBeforeNo());
            cntBeforeVO.setContractNo(cntVO.getContractNo());

            ContBeforeMngSearchVO beforeSearchVO = new ContBeforeMngSearchVO();
            beforeSearchVO.setsGb("C");
            beforeSearchVO.setsContractNo(cntVO.getContractNo());
            beforeSearchVO.setsDlrCd(cntVO.getDlrCd());
            beforeSearchVO.setsBeforeNo(cntVO.getBeforeNo());
            if(contBeforeMngService.selectContBeforeMngsByConditionCnt(beforeSearchVO) > 0){
                // 최초저장
                if("".equals(cntVO.getBeBeforeNo())){
                    contBeforeMngService.changeStat(cntBeforeVO);
                }else{

                    if( !"".equals(cntVO.getBeforeNo()) ){
                        contBeforeMngService.changeStat(cntBeforeVO);
                    }
                    cntBeforeVO.setBeforeNo(cntVO.getBeBeforeNo());
                    cntBeforeVO.setContractNo(null);
                    contBeforeMngService.changeStat(cntBeforeVO);
                }
            }else{
                // 예약판매 문서번호가 없습니다.
                throw processException("sal.info.nonBeforeNo");
            }
        }

        // SA_0121T 임시배정 변경
        if( !cntVO.getBeforVinNo().equals(cntVO.getVinNo()) ){
            vmVO = new VehicleMasterVO();      //  차량마스터 VO
            vmVO.setDlrCd(cntVO.getDlrCd());
            vmVO.setUpdtUsrId(cntVO.getUpdtUsrId());
            vmVO.setRegUsrId(cntVO.getRegUsrId());

            // 임시배정 최초저장
            if(  "".equals(cntVO.getBeforVinNo()) ){
                vmVO.setVinNo(cntVO.getVinNo());
                vmVO.setOwnStatCd("A");            // 배정
                contractMntDAO.updateCarAssign(vmVO);
            }else{
                 /**
                  * *임시배정 변경*
                  * 1. 임시 배정을 변경할 시.
                  * 2. 기존 임시 배정을 취소했을 시.
                  **/
                if( !"".equals(cntVO.getVinNo()) ){
                    // ㄱ 신규 VIN NO 으로 배정
                    vmVO.setVinNo(cntVO.getVinNo());
                    vmVO.setOwnStatCd("A");            // 배정
                    contractMntDAO.updateCarAssign(vmVO);
                }

                // ㄴ 기존 배정 취소
                vmVO.setVinNo(cntVO.getBeforVinNo());
                vmVO.setOwnStatCd("O");       // 미배정
                contractMntDAO.updateCarAssign(vmVO);
            }
        }

        // SA_0204T. - 저장 직전의 내용과 비교.
        ContractReSearchVO goodsSearch = new ContractReSearchVO();
        goodsSearch.setsDlrCd(cntVO.getDlrCd());
        goodsSearch.setsContractNo(cntVO.getContractNo());
        List<ContractReGoodsVO> beGoodsList = contractMntDAO.selectGoodsListsByCondition(goodsSearch);
        // SA_0204T : 용품
        for(ContractReGoodsVO goodsVO : saveVO.getGoodsVO().getInsertGoodsList()){
            goodsVO.setDlrCd(LoginUtil.getDlrCd());
            goodsVO.setContractNo(contractNo);
            goodsVO.setRegUsrId(LoginUtil.getUserId());
            goodsVO.setUpdtUsrId(LoginUtil.getUserId());
            contractMntDAO.insertGoods(goodsVO);
        }
        for(ContractReGoodsVO goodsVO : saveVO.getGoodsVO().getUpdateGoodsList()){
            chkGoodsUpdateItem(cntVO, beGoodsList, goodsVO);
            goodsVO.setRegUsrId(LoginUtil.getUserId());
            goodsVO.setUpdtUsrId(LoginUtil.getUserId());
            contractMntDAO.updateGoods(goodsVO);
        }
        for(ContractReGoodsVO goodsVO : saveVO.getGoodsVO().getDeleteGoodsList()){
            chkGoodsUpdateItem(cntVO, beGoodsList, goodsVO);
            contractMntDAO.deleteGoods(goodsVO);
        }

        // SA_0217T : 대행업무
        AapInfoVO aapVO = new AapInfoVO();
        aapVO.setDlrCd(cntVO.getDlrCd());
        aapVO.setContractNo(cntVO.getContractNo());
        aapInfoService.deleteContractAapInfo(aapVO);
        if( "A".equals(cntVO.getRegTp()) ){
            AapInfoSearchVO aapSearchVO = null;
            for(AapInfoVO aVO : saveVO.getAapsVO().getInsertList()){
                aapSearchVO = new AapInfoSearchVO();
                aapSearchVO.setsDlrCd(LoginUtil.getDlrCd());
                aapSearchVO.setsContractNo(contractNo);
                aapSearchVO.setsAapWorkTp(aVO.getAapWorkTp());
                if(aapInfoService.selectAapInfoSearchsByConditionCnt(aapSearchVO) > 0){
                    throw processException("global.err.duplicate");
                }
                aVO.setDlrCd(LoginUtil.getDlrCd());
                aVO.setContractNo(contractNo);
                aVO.setRegUsrId(LoginUtil.getUserId());
                aVO.setUpdtUsrId(LoginUtil.getUserId());
                aapInfoService.insertContractAapInfo(aVO);
            }
        }

        //프로시저추가 - 계약저장 : DCS data보정
        contractMntDAO.procDlrRetailContract(cntVO);

        return contractNo;
    }

    // 계약의 DB변경내역 체크
    private void chkUpdate(ContractReVO cntVO) throws Exception{
        ContractReSearchVO searchVO = new ContractReSearchVO();
        searchVO.setsDlrCd(cntVO.getDlrCd());
        searchVO.setsContractNo(cntVO.getContractNo());
        List<String> list = contractMntDAO.selectContractUpdtCheck(searchVO);

        if(list != null && list.size() > 0){
            if(!cntVO.getUpdtDtStr().equals(list.get(0))){
                String[] ExceptionMsg = new String[3];
                ExceptionMsg[0] = messageSource.getMessage("global.lbl.update", null, LocaleContextHolder.getLocale());
                ExceptionMsg[1] = messageSource.getMessage("global.lbl.contract", null, LocaleContextHolder.getLocale());
                ExceptionMsg[2] = messageSource.getMessage("global.btn.search", null, LocaleContextHolder.getLocale());
                throw processException("global.info.reTryInfo", ExceptionMsg);
            }
        }
    }

    // 계약보험의 DB변경내역 체크
    private void chkIncUpdate(ContractReVO cntVO) throws Exception{
        // 계약 생성시만 체크. SA_0221T
        if("20".equals(cntVO.getContractStatCd())){

            ContractReSearchVO searchVO = new ContractReSearchVO();
            searchVO.setsDlrCd(cntVO.getDlrCd());
            searchVO.setsContractNo(cntVO.getContractNo());
            List<ContractReVO> list = contractMntDAO.selectIncHead(searchVO);
            if(list != null && list.size() > 0){
                if(!cntVO.getIncUpdtDtStr().equals(list.get(0).getIncUpdtDtStr())){
                    String[] ExceptionMsg = new String[3];
                    ExceptionMsg[0] = messageSource.getMessage("global.lbl.update", null, LocaleContextHolder.getLocale());
                    ExceptionMsg[1] = messageSource.getMessage("global.lbl.insurance", null, LocaleContextHolder.getLocale());
                    ExceptionMsg[2] = messageSource.getMessage("global.btn.search", null, LocaleContextHolder.getLocale());
                    throw processException("global.info.reTryInfo", ExceptionMsg);
                }
            }
        }
    }

    // 용품Item별 DB변경내역 체크
    private void chkGoodsUpdateItem(ContractReVO cntVO, List<ContractReGoodsVO> beGoodsList, ContractReGoodsVO goodsVO) throws Exception{
        String[] ExceptionMsg = new String[3];

        // 계약 생성시만 체크. SA_0204T
        if("20".equals(cntVO.getContractStatCd())){
            if(beGoodsList != null){
                for(ContractReGoodsVO beVO : beGoodsList){
                    if(beVO.getSeq() == goodsVO.getSeq()){
                        if(!beVO.getUpdtDtStr().equals(goodsVO.getUpdtDtStr())){
                            ExceptionMsg[0] = messageSource.getMessage("global.lbl.update", null, LocaleContextHolder.getLocale());
                            ExceptionMsg[1] = messageSource.getMessage("sal.lbl.goods", null, LocaleContextHolder.getLocale());
                            ExceptionMsg[2] = messageSource.getMessage("global.btn.search", null, LocaleContextHolder.getLocale());
                            throw processException("global.info.reTryInfo", ExceptionMsg);
                        }
                    }
                }
            }
        }
    }

    /**
     * 계약 승인확정 한다.
     */
    public String approval (ContractReVO contVO) throws Exception{

        if( StringUtils.isEmpty(contVO.getContractNo() ) ){
            // [계약번호]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.contractNo", null, LocaleContextHolder.getLocale())});
        }

        if( StringUtils.isEmpty(contVO.getContractStatCd() ) ){
            // [계약상태]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.contractStat", null, LocaleContextHolder.getLocale())});
        }
        selectContractUsedCarIsCheck(contVO.getDlrCd(), contVO.getContractNo());

        contVO.setUpdtUsrId(LoginUtil.getUserId());
        contractMntDAO.approval(contVO);

        if("20".equals(contVO.getContractStatCd())){

            ContractReSearchVO searchVO = new ContractReSearchVO();
            searchVO.setsDlrCd( contVO.getDlrCd() );
            searchVO.setsContractNo( contVO.getContractNo() );

            // 계약내역을 불러옴.
            ContractReVO cVO = contractMntDAO.selectContractResByCondition(searchVO).get(0);

            if(cVO.getRealPayAmt() <= 0){
                // [실제지불금액]을(를) 확인하여 주세요.
                throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("sal.lbl.realPayAmt", null, LocaleContextHolder.getLocale())});
            }

            // 보험생성
            if( "A".equals(cVO.getIncAapTp()) ){

                 /**
                  *  보험 관리내역 삭제
                  *  SA_0216T-header , SA_0253T-detail
                  *  저장/수정시, 무조건 지우고 저장하기로 구상우과장께서 BHMC와 결정함.
                  */
                //incJoinInfoService.deleteContractSaleIncInfo(contVO.getContractNo());
                IncJoinInfoSaveVO itemSaveVO = new IncJoinInfoSaveVO();

                // SA_0216T : 보험가입정보 - insert
                IncJoinInfoVO incVO = new IncJoinInfoVO();
                incVO.setIncNo(incJoinInfoService.selectContractIncNo(contVO.getContractNo()));
                incVO.setDlrCd(cVO.getDlrCd());
                incVO.setCarlineCd( cVO.getCarlineCd()  );
                incVO.setFscCd(cVO.getFscCd());
                incVO.setModelCd( cVO.getModelCd()  );
                incVO.setVinNo( cVO.getVinNo() );
                incVO.setSaleId( cVO.getSaleEmpNo() );
                incVO.setIncExpcTotAmt( cVO.getIncExpcAmt() );      //예상총금액
                incVO.setRealIncTotAmt( cVO.getRealIncAmt() );      //실보험총금액
                incVO.setIncFeeTotAmt( cVO.getRealIncFeeAmt() );    //보험수수료
                incVO.setFrcIncAmt( cVO.getFrcIncAmt() );
                incVO.setBusIncAmt( cVO.getBusIncAmt() );
                incVO.setTransTaxAmt( cVO.getTransIncTaxAmt() );
                incVO.setIncJoinDt( cVO.getIncJoinDt() );
                incVO.setCustNo( cVO.getCustCd() );
                incVO.setCustTp( cVO.getCustTp() );
                incVO.setCustTelNo( cVO.getTelNo1() );
                incVO.setContractNo( cVO.getContractNo() );
                incVO.setCustSsnCrnTp( cVO.getSsnCrnTp() );
                incVO.setCustSsnCrnNo( cVO.getSsnCrnNo() );
                incVO.setIncProfitNm( cVO.getIncProfitNm() );           //수혜자
                incVO.setIncCmpCd( cVO.getIncCmpCd() );                 //보험회사
                incVO.setIncCustNm( cVO.getIncCustNm() );
                incVO.setIncCustTelNo( cVO.getIncCustTelNo() );
                incVO.setNcarDstinCd("N");                              //자사차-신차
                incVO.setCarBrandCd("N");                               //브랜드- 자사차 여부와 동일하게 처리하는 것으로 변경.[2017-06-05]
                incVO.setIncPconCustNm( cVO.getIncPconCustNm() );       //연계인
                incVO.setIncPconCustTelNo( cVO.getIncPconCustTelNo() ); //연계인전화번호
                incVO.setFinImplyYn(StringUtils.isEmpty(cVO.getFinImplyYn()) ? "N" : cVO.getFinImplyYn()); //재무수납포함여부
                incVO.setImplyYn(cVO.getImplyYn());
                incVO.setRemark( cVO.getIncRemark() );
                incVO.setFincYn( cVO.getFincReqYn() );
                incVO.setFincCmpCd( cVO.getFincCmpCd() );
                incVO.setIncStat("10");                                 //저장상태
                incVO.setIncCs("01");                                   //신보험

                // 보험 헤더
                itemSaveVO.setIncJoinInfoVO(incVO);

                // SA_0253T : 보험가입아이템 - insert
                BaseSaveVO<IncJoinInfoVO> incItemSaveDS = new BaseSaveVO<IncJoinInfoVO>();
               List<IncJoinInfoVO> insertIncItemList = incItemSaveDS.getInsertList();

                // SA_0222T : 계약-보험내역(Item)을 불러온다.
                List<ContractReIncVO> incItemList = contractMntDAO.selectIncListsByCondition(searchVO);

                IncJoinInfoVO insertItemVO     = null;
                for(ContractReIncVO incItemVO : incItemList){
                    insertItemVO = new IncJoinInfoVO();
                    insertItemVO.setRegUsrId(LoginUtil.getUserId());
                    insertItemVO.setUpdtUsrId(LoginUtil.getUserId());
                    insertItemVO.setDlrCd( incItemVO.getDlrCd());
                    insertItemVO.setIncTp( incItemVO.getIncTp() );
                    insertItemVO.setIncExpcAmt( incItemVO.getIncExpcAmt() );
                    insertItemVO.setRealIncAmt( incItemVO.getRealIncAmt() );
                    insertItemVO.setIncPrid( incItemVO.getIncPrid() );
                    insertItemVO.setIncStartDt( incItemVO.getIncStartDt() );
                    insertItemVO.setIncEndDt(incItemVO.getIncEndDt() );
                    insertItemVO.setRemark(incItemVO.getRemark() );
                    insertItemVO.setIncAmt(incItemVO.getValRecAmt() );
                    insertIncItemList.add(insertItemVO);
                }
                itemSaveVO.setIncDtlVO( incItemSaveDS );    // 보험 item
                itemSaveVO.setContract(true);
                incJoinInfoService.multiSaveIncJoinInfo(itemSaveVO);
            }else{
                // 보험 관리내역 삭제
                incJoinInfoService.deleteContractSaleIncInfo(contVO.getContractNo());
            }

            // 용품확정 정보 -> 용품관리 테이블 저장.
            if(contractMntDAO.selectGoodsListsByConditionCnt(searchVO) > 0){

                AccessoryItemSalesSearchVO accSearchVO = new AccessoryItemSalesSearchVO();
                accSearchVO.setsDlrCd( contVO.getDlrCd() );
                accSearchVO.setsSaleContractNo( contVO.getContractNo() );

                String goodsContractNo = "";
                List<AccessoryItemSalesVO> accList =  accessoryItemSalesService.selectAccessoryItemSalesByCondition(accSearchVO);
                if(accList != null && accList.size() > 0){
                    for(AccessoryItemSalesVO accVO : accList){
                        if( !"10".equals(accVO.getContractStatCd()) ){
                            // 출고된 용품으로 인해 변경이 불가능합니다.
                            throw processException("sal.error.contAccessoryImportMsg");
                        }
                    }
                    goodsContractNo = accList.get(0).getGoodsContractNo();

                    // 기존 경품 내역을 삭제 후 저장요청.(구차장) ->  sync를 위해서 삭제처리가 아닌 update처리
                    //accessoryItemSalesService.deleteContractSaleAccessoryItemSales(contVO.getContractNo());

                    AccessoryItemSalesVO itemVO = new AccessoryItemSalesVO();
                    itemVO.setGoodsContractNo(goodsContractNo);
                    itemVO.setDlrCd(contVO.getDlrCd());
                    accessoryItemSalesService.deleteContractAccessoryItemSalesItem(itemVO);
                }else{
                    goodsContractNo = "";
                }

                AccessoryItemSalesSaveVO accessorySaveVO = new AccessoryItemSalesSaveVO();
                AccessoryItemSalesVO accessoryHeadVO = new AccessoryItemSalesVO();

                accessoryHeadVO.setRegUsrId(LoginUtil.getUserId());     // 생성자
                accessoryHeadVO.setUpdtUsrId(LoginUtil.getUserId());    // 수정자
                accessoryHeadVO.setDlrCd(cVO.getDlrCd());
                accessoryHeadVO.setGoodsContractNo(goodsContractNo);    // 용품문서번호

                // SA_0261T : 경품판매 헤더 정보
                accessoryHeadVO.setGoodsTp("03");                 // 용품유형 : SAL158 - 03:용품
                accessoryHeadVO.setContractCustNo( cVO.getContractCustNo() );
                accessoryHeadVO.setContractCustTp( cVO.getCustTp() );
                accessoryHeadVO.setTelNo( cVO.getTelNo1() );
                accessoryHeadVO.setPconCustNo(cVO.getPurcMngNm());
                accessoryHeadVO.setCarBrandCd("N");                    // 브랜드 :  COM019 - N:현대
                accessoryHeadVO.setCarlineCd( cVO.getCarlineCd() );
                accessoryHeadVO.setFscCd( cVO.getFscCd() );
                accessoryHeadVO.setModelCd( cVO.getModelCd() );
                accessoryHeadVO.setOcnCd( cVO.getOcnCd() );
                accessoryHeadVO.setExtColorCd( cVO.getExtColorCd() );
                accessoryHeadVO.setIntColorCd( cVO.getIntColorCd() );
                accessoryHeadVO.setVinNo( cVO.getVinNo() );
                accessoryHeadVO.setSaleContractNo( cVO.getContractNo() );
                accessoryHeadVO.setGoodsRealAmt( cVO.getGoodsAmt() );     // 용품실제금액
                accessoryHeadVO.setCustPayAmt( cVO.getGoodsAmt() );       // 고객지불금액
                accessoryHeadVO.setContractStatCd("10");                  // 저장상태
                accessoryHeadVO.setDcApproveYn("N");

                // SA_0204T : 계약용품정보 조회
                List<ContractReGoodsVO> goodsItemList  = contractMntDAO.selectGoodsListsByCondition(searchVO);
                List<AccessoryItemSalesItemVO> insertGoodsItemList =  accessorySaveVO.getInsertList();
                AccessoryItemSalesItemVO accessoryItemVO = null;

                double tDcAmt = 0;
                for(ContractReGoodsVO goodsItemVO : goodsItemList){
                    accessoryItemVO = new AccessoryItemSalesItemVO();
                    accessoryItemVO.setRegUsrId(LoginUtil.getUserId());
                    accessoryItemVO.setUpdtUsrId(LoginUtil.getUserId());
                    accessoryItemVO.setDlrCd( goodsItemVO.getDlrCd() );
                    accessoryItemVO.setGoodsCd( goodsItemVO.getGoodsCd() );
                    accessoryItemVO.setGoodsNm( goodsItemVO.getGoodsNm() );
                    accessoryItemVO.setGoodsCnt( goodsItemVO.getGoodsCnt() );
                    accessoryItemVO.setGoodsUnitCd( goodsItemVO.getGoodsUnitCd() );
                    accessoryItemVO.setRetlPrc( goodsItemVO.getGoodsPrc() );
                    accessoryItemVO.setDcRate( goodsItemVO.getDcRate() );
                    accessoryItemVO.setDcAmt( goodsItemVO.getDcAmt() );
                    accessoryItemVO.setSaleAmt( goodsItemVO.getGoodsAmt() );
                    accessoryItemVO.setRetlTotAmt(goodsItemVO.getRealGoodsAmt());
                    accessoryItemVO.setEqipCostAmt( goodsItemVO.getEqipCostAmt() );
                    accessoryItemVO.setTotAmt( goodsItemVO.getTotAmt() );
                    accessoryItemVO.setExpcEqipDt(goodsItemVO.getExpcEqipDt());
                    accessoryItemVO.setEqipPrsnId(goodsItemVO.getEqipPrsnId());
                    accessoryItemVO.setPkgItemCd( goodsItemVO.getPkgItemCd() );
                    accessoryItemVO.setGrStrgeCd( goodsItemVO.getGrStrgeCd() );
                    accessoryItemVO.setGiStrgeCd( goodsItemVO.getGiStrgeCd() );
                    accessoryItemVO.setMvtDocYyMm(goodsItemVO.getMvtDocYyMm());
                    accessoryItemVO.setMvtDocNo(goodsItemVO.getMvtDocNo());
                    accessoryItemVO.setMvtDocLineNo(goodsItemVO.getMvtDocLineNo());
                    accessoryItemVO.setExpcGiEndDt(goodsItemVO.getExpcGiEndDt());
                    accessoryItemVO.setEqipPrsnId(goodsItemVO.getEqipPrsnId());
                    accessoryItemVO.setRealDlDt(goodsItemVO.getRealDlDt());
                    accessoryItemVO.setExpcEqipDt(goodsItemVO.getExpcEqipDt());
                    accessoryItemVO.setEqipEndDt(goodsItemVO.getEqipEndDt());
                    accessoryItemVO.setStatCd(goodsItemVO.getStatCd());

                    // 증정금액
                    tDcAmt    += goodsItemVO.getDcAmt() * goodsItemVO.getGoodsCnt();

                    insertGoodsItemList.add(accessoryItemVO);
                }

                // 나머지 헤더정보 계산하여 저장
                accessoryHeadVO.setPrenAmt( tDcAmt );                   // 증정금액
                accessoryHeadVO.setAddPrenAmt(0.0);                     // 추가증정금액

                accessorySaveVO.setAccessoryItemSalesVO(accessoryHeadVO);     // 경품 Header정보 저장
                accessorySaveVO.setContractSave(true);                        // 계약에서 저장
                accessoryItemSalesService.multiAccessoryItemSales(accessorySaveVO);

            }else{
                accessoryItemSalesService.deleteContractSaleAccessoryItemSales(contVO.getContractNo());
            }

            //대행업무 SA_0264T
            /*
            AapMngVO aapVO = new AapMngVO();
            aapVO.setDlrCd(contVO.getDlrCd());
            aapVO.setContractNo(contVO.getContractNo());
            aapMngService.deleteContractAapMng(aapVO);
            if( "A".equals(cVO.getRegTp()) ){
                aapVO.setAapDt( cVO.getContractDt() );
                aapVO.setAapWrkDstinCd("01");
                aapVO.setVinNo( cVO.getVinNo() );
                aapVO.setCarlineCd( cVO.getCarlineCd() );
                aapVO.setModelCd( cVO.getModelCd() );
                aapVO.setOcnCd( cVO.getOcnCd() );
                aapVO.setCustNo( cVO.getCustCd() );
                aapVO.setCustNm( cVO.getCustNm() );
                aapVO.setCustTp( cVO.getCustTp() );
                aapVO.setCstAmt(0.0);
                aapVO.setProfitAmt(0.0);
                aapVO.setAapAmt(0.0);
                aapVO.setRegPreAmt( cVO.getRegPreAmt() );
                aapVO.setRealRegAmt( cVO.getRealRegAmt() );
                aapVO.setRegFeeAmt( cVO.getRegFeeAmt() );
                aapVO.setRegExpcDt( cVO.getRegExpcDt() );
                aapVO.setPurcTaxPreAmt( cVO.getPurcTaxPreAmt() );
                aapVO.setRealPurcTaxAmt( cVO.getRealPurcTaxAmt() );
                aapVO.setRegUsrId( LoginUtil.getUserId() );
                aapVO.setUpdtUsrId( LoginUtil.getUserId() );
                aapMngService.insertAapMng( aapVO );
            }
            */

            //SA_0451T : 수납헤더
            updateContractPayinfo(cVO);
        }

        //프로시저추가 - 계약생성 : DCS data보정
        contractMntDAO.procDlrRetailContract(contVO);

        return contVO.getContractNo();
    }

    /**
     * 계약 생성.
     * @param contVO
     * @return
     * @throws Exception
     */
    @Override
    public String approvalContractMnts(ContractReSaveVO saveVO) throws Exception{
        String contractNo = "";
        ContractReVO contVO = saveVO.getContractReVO();

        // 저장
        contractNo = multiContractMnts(saveVO);
        // 생성
        contVO.setContractStatCd("20");
        approval(contVO);

        return contractNo;
    }

    /**
     * 계약을 삭제(승인전) 한다.
     */
    public String deleteContract (ContractReVO contVO) throws Exception{
        if( StringUtils.isEmpty(contVO.getDlrCd())){
            contVO.setDlrCd(LoginUtil.getDlrCd());
        }
        if( StringUtils.isEmpty(contVO.getContractNo() ) ){
            // [계약번호]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.contractNo", null, LocaleContextHolder.getLocale())});
        }
        contVO.setUpdtUsrId(LoginUtil.getUserId());

        // 이상출고 신청건 유무 판단.
        ContDeliverySearchVO searchEtVO = new ContDeliverySearchVO();
        searchEtVO.setsDlrCd(contVO.getDlrCd());
        searchEtVO.setsContractNo(contVO.getContractNo());
        if(contDeliveryMngService.selectContractExceptionStatByConditionCnt(searchEtVO) > 0){
            // 현재차량은 이상출고신청중입니다. 심사처리를 기다려주십시오
            throw processException("sal.info.contExceptionStatCheckMsg");
        }

        ContractReSearchVO sVO = new ContractReSearchVO();
        sVO.setsDlrCd( contVO.getDlrCd() );
        sVO.setsContractNo( contVO.getContractNo() );

        // 용품내역
        /*
        if(contractMntDAO.selectGoodsListsByConditionCnt(sVO) > 0){
            AccessoryItemSalesSearchVO accSearchVO = new AccessoryItemSalesSearchVO();
            accSearchVO.setsDlrCd( contVO.getDlrCd() );
            accSearchVO.setsSaleContractNo( contVO.getContractNo() );

            List<AccessoryItemSalesVO> accList =  accessoryItemSalesService.selectAccessoryItemSalesByCondition(accSearchVO);

            if(accList != null && accList.size() > 0){
                for(AccessoryItemSalesVO accVO : accList){
                    if( !"50".equals(accVO.getContractStatCd())
                            && !"60".equals(accVO.getContractStatCd()) ){
                        // 계약번호:xxx, 진행중인 용품으로 인해 변경이 불가능합니다.
                        throw processException("sal.error.contractAccessoryImportMsg", new String[]{contVO.getContractNo()});
                    }
                }
            }
        }
         */
        
        // 임시배정 차량 취소.
        ContractReVO cntVO = contractMntDAO.selectContractResByCondition(sVO).get(0);

        if(cntVO != null
                && !"10".equals(cntVO.getContractStatCd()) ){
             // 해당 내역은 계약 상태가 아닙니다.
             throw processException("global.info.stateNotMsg", new String[]{messageSource.getMessage("global.lbl.contract", null, LocaleContextHolder.getLocale())});
        }

        // 예약판매을 계약에서 분리.
        if(cntVO != null && cntVO.getBeforeNo() != null && !"".equals(cntVO.getBeforeNo())){

            // SA_0209T 예약판매 변경
            ContBeforeMngVO cntBeforeVO = new ContBeforeMngVO();
            cntBeforeVO.setDlrCd(contVO.getDlrCd());
            cntBeforeVO.setUpdtUsrId(LoginUtil.getUserId());
            cntBeforeVO.setBeforeNo(cntVO.getBeforeNo());
            cntBeforeVO.setContractNo(null);
            contBeforeMngService.changeStat(cntBeforeVO);

            double realPayAmt = cntVO.getRealPayAmt() != null ? cntVO.getRealPayAmt() : 0.0;
            double beforeAmt = cntVO.getReservContAmt() != null ? cntVO.getReservContAmt() : 0.0;

            cntVO.setBeforeNo(null);
            cntVO.setReservContAmt(0.00);

            if("Y".equals(cntVO.getBeforeImplyYn())){
                cntVO.setRealPayAmt(realPayAmt+beforeAmt);
            }else{
                cntVO.setRealPayAmt(realPayAmt);
            }
            contractMntDAO.updateContractBefore(cntVO);

            // TOBE : 수납은 계약생성시 생성으로 변경 요청
            // 수납이 계약생성에서 생성될 시, 수납 변경은 삭제.
            updateContractPayinfo(cntVO);
        }

        ContractReVO chkVO = contractMntDAO.selectContractCancelEtcWorkCheck(contVO.getDlrCd(), contVO.getContractNo()).get(0);

        // 차량상태 체크
        if("Y".equals(chkVO.getVinYn())){

            // 출고된 차량은 삭제 할수 없습니다.
            VehicleMasterSearchVO vinSearchVO = new VehicleMasterSearchVO();
            vinSearchVO.setsDlrCd(contVO.getDlrCd());
            vinSearchVO.setsVinNo(chkVO.getVinNo());
            List<VehicleMasterVO> vList = vehicleMasterService.selectVehicleMasterByCondition(vinSearchVO);
            if(vList != null && vList.size() > 0){
                if("70".equals(vList.get(0).getCarStatCd())){
                    throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.vinSts", null, LocaleContextHolder.getLocale())});
                }
            }
        }

        // 대출체크 TOBE : 계약생성으로 변경 될시 삭제
        if("Y".equals(chkVO.getFincYn())){
            //throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("sal.title.fincProductMngt", null, LocaleContextHolder.getLocale())});
        }

        // 수납체크 TOBE : 계약생성으로 변경 될시 삭제
        if("Y".equals(chkVO.getPayYn())){
            //throw processException("sal.lbl.salesPaymentCheckMsg");
        }

        // 중고차 초기화
        if("Y".equals(cntVO.getUatcCarPurcYn())){
            PurcEvalVO purcVO = new PurcEvalVO();
            purcVO.setDlrCd(cntVO.getDlrCd());
            purcVO.setPurcNo(cntVO.getPurcNo());
            purcEvalService.initContractPurcEval(purcVO);
        }


        if(cntVO != null && !"".equals(cntVO.getVinNo()) ){
            VehicleMasterVO vmVO = new VehicleMasterVO();
            vmVO.setOwnStatCd("O");
            vmVO.setUpdtUsrId(LoginUtil.getUserId());
            vmVO.setRegUsrId(LoginUtil.getUserId());
            vmVO.setDlrCd( cntVO.getDlrCd() );
            vmVO.setVinNo( cntVO.getVinNo() );
            contractMntDAO.updateCarAssign(vmVO);
        }

        contractMntDAO.deleteContract(contVO);

        /**
         *  판매기회 계약건은 취소여부를 CRM 판매기회쪽으로 보내준다.
         */
        ContractReSearchVO searchVO = new ContractReSearchVO();
        searchVO.setsDlrCd(contVO.getDlrCd());
        searchVO.setsContractNo( contVO.getContractNo() );
        ContractReVO cnVO = contractMntDAO.selectContractResByCondition( searchVO ).get(0);

        if( StringUtils.isEmpty(cnVO.getBeforeNo()) && cnVO.getSaleOpptNo() != null && !"".equals(cnVO.getSaleOpptNo())){
            SalesOpptProcessMgmtVO opptVO = new SalesOpptProcessMgmtVO();
            opptVO.setDlrCd( cnVO.getDlrCd() );
            opptVO.setSeq( cnVO.getSaleOpptNo() );
            opptVO.setcSeq( cnVO.getSaleOpptSeq() );
            opptVO.setLeadStatCd("09");
            opptVO.setMngScId(cnVO.getSaleEmpNo());
            opptVO.setFailCauCd("08");
            salesOpptProcessMgmtOutBoundService.updateSalesOpptProcessMgmt(opptVO);
            
            //liuxueying  add 插入cr_0218is_fms start 
            SalesOpptProcessMgmtVO salesOpptProcessMgmtVO = new SalesOpptProcessMgmtVO();
	        salesOpptProcessMgmtVO.setDlrCd(contVO.getDlrCd());
	        salesOpptProcessMgmtVO.setContractNo( contVO.getContractNo());
	        salesOpptProcessMgmtVO.setRemark("05");
	        salesOpptProcessMgmtDAO.insertContNoticeToFms(salesOpptProcessMgmtVO);
	      //liuxueying  add 插入cr_0218is_fms start 
        }

        //프로시저추가 - 계약삭제 : DCS data보정
        contractMntDAO.procDlrRetailContract(contVO);
        return contVO.getContractNo();
    }

    /**
     * 계약을 삭제(승인후) 한다.
     */
    public String cancelContract (ContractReVO contVO) throws Exception{
        if( StringUtils.isEmpty(contVO.getDlrCd())){
            contVO.setDlrCd(LoginUtil.getDlrCd());
        }
        if( StringUtils.isEmpty(contVO.getContractNo() ) ){
            // [계약번호]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.contractNo", null, LocaleContextHolder.getLocale())});
        }
        contVO.setUpdtUsrId(LoginUtil.getUserId());

        //이상출고 신청건 유무 판단.
        ContDeliverySearchVO searchEtVO = new ContDeliverySearchVO();
        searchEtVO.setsDlrCd(contVO.getDlrCd());
        searchEtVO.setsContractNo(contVO.getContractNo());
        if(contDeliveryMngService.selectContractExceptionStatByConditionCnt(searchEtVO) > 0){
            // 현재차량은 이상출고신청중입니다. 심사처리를 기다려주십시오
            throw processException("sal.info.contExceptionStatCheckMsg");
        }

        ContractReSearchVO sVO = new ContractReSearchVO();
        sVO.setsDlrCd( contVO.getDlrCd() );
        sVO.setsContractNo( contVO.getContractNo() );

        // 용품내역
        /*
        if(contractMntDAO.selectGoodsListsByConditionCnt(sVO) > 0){
            AccessoryItemSalesSearchVO accSearchVO = new AccessoryItemSalesSearchVO();
            accSearchVO.setsDlrCd( contVO.getDlrCd() );
            accSearchVO.setsSaleContractNo( contVO.getContractNo() );

            List<AccessoryItemSalesVO> accList =  accessoryItemSalesService.selectAccessoryItemSalesByCondition(accSearchVO);

            if(accList != null && accList.size() > 0){
                for(AccessoryItemSalesVO accVO : accList){
                    if( !"50".equals(accVO.getContractStatCd())
                            && !"60".equals(accVO.getContractStatCd()) ){
                        // 계약번호:xxx, 진행중인 용품으로 인해 변경이 불가능합니다.
                        throw processException("sal.error.contractAccessoryImportMsg", new String[]{contVO.getContractNo()});
                    }
                }
            }
        }
         */
        
        ContractReVO cntVO = contractMntDAO.selectContractResByCondition(sVO).get(0);

        if(cntVO != null
           && !"20".equals(cntVO.getContractStatCd()) ){
            // 해당 내역은 계약 상태가 아닙니다.
            throw processException("global.info.stateNotMsg", new String[]{messageSource.getMessage("global.lbl.contract", null, LocaleContextHolder.getLocale())});
        }

        // 예약판매을 계약에서 분리.
        if(cntVO != null && cntVO.getBeforeNo() != null && !"".equals(cntVO.getBeforeNo()) ){

            // SA_0209T 예약판매 변경
            ContBeforeMngVO cntBeforeVO = new ContBeforeMngVO();
            cntBeforeVO.setUpdtUsrId(LoginUtil.getUserId());
            cntBeforeVO.setDlrCd(contVO.getDlrCd());
            cntBeforeVO.setBeforeNo(cntVO.getBeforeNo());
            cntBeforeVO.setContractNo(null);
            contBeforeMngService.changeStat(cntBeforeVO);

            double realPayAmt = cntVO.getRealPayAmt() != null ? cntVO.getRealPayAmt() : 0.0;
            double beforeAmt = cntVO.getReservContAmt() != null ? cntVO.getReservContAmt() : 0.0;

            cntVO.setBeforeNo(null);
            cntVO.setReservContAmt(0.00);

            if("Y".equals(cntVO.getBeforeImplyYn())){
                cntVO.setRealPayAmt(realPayAmt+beforeAmt);
            }else{
                cntVO.setRealPayAmt(realPayAmt);
            }
            contractMntDAO.updateContractBefore(cntVO);
            updateContractPayinfo(cntVO);
        }

        ContractReVO chkVO = contractMntDAO.selectContractCancelEtcWorkCheck(contVO.getDlrCd(), contVO.getContractNo()).get(0);

        // 차량상태 체크
        if("Y".equals(chkVO.getVinYn())){

            // 출고된 차량은 삭제 할수 없습니다.
            VehicleMasterSearchVO vinSearchVO = new VehicleMasterSearchVO();
            vinSearchVO.setsDlrCd(contVO.getDlrCd());
            vinSearchVO.setsVinNo(chkVO.getVinNo());
            List<VehicleMasterVO> vList = vehicleMasterService.selectVehicleMasterByCondition(vinSearchVO);
            if(vList != null && vList.size() > 0){
                if("70".equals(vList.get(0).getCarStatCd())){
                    throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.vinSts", null, LocaleContextHolder.getLocale())});
                }
            }
        }

        // 보험체크
        if("Y".equals(chkVO.getIncYn())){
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("sal.menu.insInfoReg", null, LocaleContextHolder.getLocale())});
        }

        // 용품체크
        if("Y".equals(chkVO.getGoodsYn())){
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("sal.menu.accessorySale", null, LocaleContextHolder.getLocale())});
        }

        // 대출체크
        if("Y".equals(chkVO.getFincYn())){
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("sal.title.fincProductMngt", null, LocaleContextHolder.getLocale())});
        }

        // 수납체크
        if("Y".equals(chkVO.getPayYn())){
            throw processException("sal.lbl.salesPaymentCheckMsg");
        }

        // 중고차 초기화
        if("Y".equals(cntVO.getUatcCarPurcYn())){
            PurcEvalVO purcVO = new PurcEvalVO();
            purcVO.setDlrCd(cntVO.getDlrCd());
            purcVO.setPurcNo(cntVO.getPurcNo());
            purcEvalService.initContractPurcEval(purcVO);
        }

        // 임시배정 차량 취소.
        if(cntVO != null && !"".equals(cntVO.getVinNo()) ){
            VehicleMasterVO vmVO = new VehicleMasterVO();
            vmVO.setOwnStatCd("O");
            vmVO.setUpdtUsrId(LoginUtil.getUserId());
            vmVO.setRegUsrId(LoginUtil.getUserId());
            vmVO.setDlrCd( cntVO.getDlrCd() );
            vmVO.setVinNo( cntVO.getVinNo() );
            contractMntDAO.updateCarAssign(vmVO);
        }

        contractMntDAO.cancelContract(contVO);

        /**
         *  판매기회 계약건은 취소여부를 CRM 판매기회쪽으로 보내준다.
         */
        if( StringUtils.isEmpty(cntVO.getBeforeNo())
                && cntVO.getSaleOpptNo() != null
                && !"".equals(cntVO.getSaleOpptNo())){
            SalesOpptProcessMgmtVO opptVO = new SalesOpptProcessMgmtVO();
            opptVO.setDlrCd( cntVO.getDlrCd() );
            opptVO.setSeq( cntVO.getSaleOpptNo() );
            opptVO.setcSeq( cntVO.getSaleOpptSeq() );
            opptVO.setLeadStatCd("09");
            opptVO.setMngScId(cntVO.getSaleEmpNo());
            opptVO.setFailCauCd("08");
            salesOpptProcessMgmtOutBoundService.updateSalesOpptProcessMgmt(opptVO);
            
            //liuxueying  add 插入cr_0218is_fms start 
            SalesOpptProcessMgmtVO salesOpptProcessMgmtVO = new SalesOpptProcessMgmtVO();
	        salesOpptProcessMgmtVO.setDlrCd(contVO.getDlrCd());
	        salesOpptProcessMgmtVO.setContractNo( contVO.getContractNo());
	        salesOpptProcessMgmtVO.setRemark("05");
	        salesOpptProcessMgmtDAO.insertContNoticeToFms(salesOpptProcessMgmtVO);
	      //liuxueying  add 插入cr_0218is_fms start 
        }

        //프로시저추가 - 계약해지 : DCS data보정
        contractMntDAO.procDlrRetailContract(contVO);
        return contVO.getContractNo();
    }

    /**
     * 계약을 취소, 삭제한다.
     */
    public int deleteContractMnt(ContractMntSaveVO saveVO) throws Exception{
        Date toDay = DateUtil.convertToDate(DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat")));

        // 계약을 삭제(승인전) 한다.
        for (ContractReVO deleteVO : saveVO.getDeleteList()){
            deleteVO.setUpdtUsrId(LoginUtil.getUserId());
            if(deleteVO.getContractDt() == null){
                deleteVO.setContractDt(toDay);
            }
            deleteContract(deleteVO);
        }

        // 계약을 취소(승인후) 한다.
        for (ContractReVO cancelVO :  saveVO.getCancelList()){
            cancelVO.setUpdtUsrId(LoginUtil.getUserId());
            if(cancelVO.getContractDt() == null){
                cancelVO.setContractDt(toDay);
            }
            cancelContract(cancelVO);
        }
        return 1;
    }

    /**
     * 계약별 보험내역 조회
     */
    @Override
    public int selectIncListsByConditionCnt(ContractReSearchVO searchVO) throws Exception{
        return contractMntDAO.selectIncListsByConditionCnt(searchVO);
    }
    @Override
    public List<ContractReIncVO> selectIncListsByCondition(ContractReSearchVO searchVO) throws Exception{
        return contractMntDAO.selectIncListsByCondition(searchVO);
    }

    /**
     * 계약별 용품 조회
     */
    @Override
    public int selectGoodsListsByConditionCnt(ContractReSearchVO searchVO) throws Exception{
        return contractMntDAO.selectGoodsListsByConditionCnt(searchVO);
    }
    @Override
    public List<ContractReGoodsVO> selectGoodsListsByCondition(ContractReSearchVO searchVO) throws Exception{
        return contractMntDAO.selectGoodsListsByCondition(searchVO);
    }

    /**
     * 계약별 대행업무 조회
     */
    @Override
    public int selectAapsListsByConditionCnt(ContractReSearchVO searchVO) throws Exception{
        return contractMntDAO.selectAapsListsByConditionCnt(searchVO);
    }
    @Override
    public List<AapInfoVO> selectAapsListsByCondition(ContractReSearchVO searchVO) throws Exception{
        return contractMntDAO.selectAapsListsByCondition(searchVO);
    }

    /**
     * 딜러 프로모션에 대한 할인 레벨을 조회한다. [계약생성 시 체크 확인]
     */
    @Override
    public int selectDlrDcLevelCnt(ContractReSearchVO searchVO) throws Exception{
        return contractMntDAO.selectDlrDcLevelCnt(searchVO);
    }
    @Override
    public List<ContractReVO> selectDlrDcLevel(ContractReSearchVO searchVO) throws Exception{
        return contractMntDAO.selectDlrDcLevel(searchVO);
    }

    /**
     * 미배정 차량 조회
     */
    @Override
    public int selectContractReVinNosByConditionCnt(ContractReSearchVO searchVO) throws Exception{
        return contractMntDAO.selectContractReVinNosByConditionCnt(searchVO);
    }
    @Override
    public List<VehicleMasterVO> selectContractReVinNosByCondition(ContractReSearchVO searchVO) throws Exception{
        return contractMntDAO.selectContractReVinNosByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 품목팝업(판매단가용) 총 갯수를 조회한다.
     *   : 부품모듈의 ItemMasterService 와 동일. SQL 동일.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
    @Override
    public int selectItemSalePrcPopupByConditionCnt(ContractReSearchVO searchVO) throws Exception {
        return contractMntDAO.selectItemSalePrcPopupByConditionCnt(searchVO);
    }
    @Override
    public List<ContractReGoodsVO> selectItemSalePrcPopupByCondition(ContractReSearchVO searchVO) throws Exception {
        return contractMntDAO.selectItemSalePrcPopupByCondition(searchVO);
    }

    /**
     * 계약 상태 조회(출고 처리시 조회)
     */
    @Override
    public String selectContractStatCd(ContractSearchVO searchVO) throws Exception{
        return contractMntDAO.selectContractStatCd(searchVO);
    }

    /**
     * 계약 수납생성.  SA_0451T
     * @param cntVO
     * @throws Exception
     */
    private void insertContractPayinfo(ContractReVO cntVO) throws Exception{
        //cntVO.setRealAmt( cntVO.getRealAmt() == null ? cntVO.getRealCarAmt():cntVO.getRealAmt());

        PayInfoVO payVO = new PayInfoVO();
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
        payInfoService.insertPayInfoHeader(payVO);
    }

    /**
     * 계약 수납정보 수정/저장
     * @param cntVO
     * @throws Exception
     */
    private void updateContractPayinfo(ContractReVO cntVO) throws Exception{
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
        PayInfoSearchVO paySerchVO = new PayInfoSearchVO();
        paySerchVO.setsDlrCd( cntVO.getDlrCd() );
        paySerchVO.setsJobTp("C");
        paySerchVO.setsJobContractNo(cntVO.getContractNo());
        PayInfoVO pVO = null;
        List<PayInfoVO> payList = payInfoService.selectPayInfosByCondition(paySerchVO);
        if(payList != null && payList.size() > 0){
            pVO = payList.get(0);

            PayInfoVO payVO = new PayInfoVO();
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
            payInfoService.updatePayInfoHeader(payVO);

            // 정산금액 재정비
            PayInfoDetailVO detailVO = new PayInfoDetailVO();
            detailVO.setFinDocNo(pVO.getFinDocNo());
            detailVO.setDlrCd(cntVO.getDlrCd());
            detailVO.setPaymentTp(paymentTp);
            detailVO.setUpdtUsrId(LoginUtil.getUserId());
            payInfoService.changePayInfo(detailVO);

        }else{
            insertContractPayinfo(cntVO);       // SA_0451T : 수납헤더 생성
        }
    }

    /**
     * 용품관리 내역을 계약에 반영하여 저장
     */
    @Override
    public int contractGoodsApply(ContractReVO contVO, List<ContractReGoodsVO> goodsItemVO) throws Exception{
        if( "".equals( contVO.getContractNo() ) ){ return 0; }

        ContractReSearchVO searchVO = new ContractReSearchVO();
        searchVO.setsDlrCd( contVO.getDlrCd() );
        searchVO.setsContractNo( contVO.getContractNo() );
        List<ContractReVO>  contList = contractMntDAO.selectContractResByCondition(searchVO);

        // 차량가격 재계산
        if(contList != null && contList.size() > 0){
            ContractReVO cntVO = contList.get(0);

            double realCarAmt = cntVO.getRealCarAmt() != null ? cntVO.getRealCarAmt() : 0.0 ;
            double beforeAmt = cntVO.getReservContAmt() != null ? cntVO.getReservContAmt() : 0.0 ;
            double goodsAmt = contVO.getGoodsAmt();
            double incAmt = cntVO.getIncAmt() != null ? cntVO.getIncAmt() : 0.0;
            double fincFeeAmt = cntVO.getFincFeeAmt() != null ? cntVO.getFincFeeAmt() : 0.0;
            double sbstAmt = cntVO.getSbstAmt() != null ? cntVO.getSbstAmt() : 0.0;
            double aapAmt  = cntVO.getAapAmt() != null ? cntVO.getAapAmt() : 0.0;
            //double dcAmt = cntVO.getPromotionAmt() != null ? cntVO.getPromotionAmt() : 0.0;
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

            cntVO.setRealAmt(realCarAmt);
            cntVO.setGoodsAmt(goodsAmt);
            cntVO.setRealPayAmt(realPayAmt);
            contractMntDAO.updateContractEach(cntVO);

            // 용품 갱신
            contractMntDAO.deleteContractGoods(searchVO);
            for(ContractReGoodsVO itemVO : goodsItemVO){
                if(StringUtils.isEmpty(itemVO.getDlrCd())){
                    itemVO.setDlrCd(LoginUtil.getDlrCd());
                }
                itemVO.setRegUsrId(LoginUtil.getUserId());     // 생성자
                itemVO.setUpdtUsrId(LoginUtil.getUserId());    // 수정자

                contractMntDAO.insertGoods(itemVO);
            }

            // 계약 수납처리
            updateContractPayinfo(cntVO);
        }

        return 1;
    }

    /**
     * 계약 용품 내역을 삭제한다.
     * @param deleteVO
     * @return
     * @throws Exception
     */
    public int deleteContractGoods(ContractReSearchVO deleteVO) throws Exception{
        return contractMntDAO.deleteContractGoods(deleteVO);
    }

    /**
     * 금융관리 내역을 계약에 반영하여 저장
     */
    @Override
    public int contractFincApply(ContractReVO contVO) throws Exception{
        if( StringUtils.isBlank( contVO.getContractNo() ) ){ return 0; }

        ContractReSearchVO searchVO = new ContractReSearchVO();
        searchVO.setsDlrCd( contVO.getDlrCd() );
        searchVO.setsContractNo( contVO.getContractNo() );
        List<ContractReVO>  contList = contractMntDAO.selectContractResByCondition(searchVO);

        // 차량가격 재계산
        if(contList != null && contList.size() > 0){
            ContractReVO cntVO = contList.get(0);

            double realCarAmt = cntVO.getRealCarAmt() != null ? cntVO.getRealCarAmt() : 0.0 ;
            double beforeAmt = cntVO.getReservContAmt() != null ? cntVO.getReservContAmt() : 0.0 ;
            double goodsAmt = cntVO.getGoodsAmt() != null ? cntVO.getGoodsAmt() : 0.0;
            double incAmt = cntVO.getIncAmt() != null ? cntVO.getIncAmt() : 0.0;
            double fincFeeAmt = contVO.getFincFeeAmt() != null ? contVO.getFincFeeAmt() : 0.0;
            double sbstAmt = cntVO.getSbstAmt() != null ? cntVO.getSbstAmt() : 0.0;
            double aapAmt  = cntVO.getAapAmt() != null ? cntVO.getAapAmt() : 0.0;
            //double dcAmt = cntVO.getPromotionAmt() != null ? cntVO.getPromotionAmt() : 0.0;
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

            cntVO.setRealAmt(realCarAmt);
            cntVO.setFincFeeAmt(fincFeeAmt);
            cntVO.setRealPayAmt(realPayAmt);
            contractMntDAO.updateContractEach(cntVO);

            // 금융 - 계약 update
            contractMntDAO.updateFincReverse(contVO);

            // 계약 수납처리
            updateContractPayinfo(cntVO);
        }

        return 1;
    }

    /**
     * 중고차매입관리 계약 반영
     */
    @Override
    public int updateContractUsedCar(ContractReVO sCntVO) throws Exception{
        if( StringUtils.isEmpty(sCntVO.getPurcNo())){
            // [매입번호]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("sal.lbl.documentNo", null, LocaleContextHolder.getLocale())});
        }

        if( StringUtils.isEmpty(sCntVO.getDlrCd()) ){
            sCntVO.setDlrCd(LoginUtil.getDlrCd());
        }

        ContractReSearchVO sVO = new ContractReSearchVO();

        // 계약에서 중고차 매입취소.
        if(StringUtils.isEmpty(sCntVO.getContractNo())){
            sVO.setsDlrCd(sCntVO.getDlrCd());
            sVO.setsPurcNo(sCntVO.getPurcNo());
            for(ContractReVO rVO : contractMntDAO.selectContractResByCondition(sVO)){
                contractMntDAO.deleteUsedCar(rVO);
                rVO.setUatcCarPurcYn("N");
                contractMntDAO.updateContractEach(rVO);

                contractUsedCarsApply(rVO);
            }
        }else{
            sVO.setsDlrCd(sCntVO.getDlrCd());
            sVO.setsContractNo(sCntVO.getContractNo());
            List<ContractReVO> cntList = contractMntDAO.selectContractResByCondition(sVO);

            if(cntList != null && cntList.size() > 0){
                ContractReVO cntVO = cntList.get(0);   // 대상계약

                if( StringUtils.isEmpty(cntVO.getPurcNo()) ){
                    // 기존매입번호의 계약 중고차내역을 지움
                    sVO.setsDlrCd(sCntVO.getDlrCd());
                    sVO.setsDlrCd(sCntVO.getPurcNo());
                    sVO.setsContractNo("");
                    for(ContractReVO rVO : contractMntDAO.selectContractResByCondition(sVO)){
                        contractMntDAO.deleteUsedCar(rVO);
                        rVO.setUatcCarPurcYn("N");
                        contractMntDAO.updateContractEach(rVO);

                        contractUsedCarsApply(rVO);
                    }

                    // 내역저장
                    cntVO.setUpdtUsrId(LoginUtil.getUserId());
                    cntVO.setRegUsrId(LoginUtil.getUserId());

                    cntVO.setUatcCarPurcYn("Y");
                    contractMntDAO.updateContractEach(cntVO);

                    cntVO.setUsrVinNo(sCntVO.getUsrVinNo());
                    cntVO.setUsrSbstAmt(sCntVO.getUsrSbstAmt());
                    cntVO.setPurcNo(sCntVO.getPurcNo());
                    contractMntDAO.insertUsedCar(cntVO);

                    contractUsedCarsApply(cntVO);

                }else{

                    if( !sCntVO.getPurcNo().equals( cntVO.getPurcNo() ) ){
                        // 다른 계약과 연계된 매입번호는 저장할 수 없습니다.
                       throw processException("sal.info.oitherPurcContractMsg");
                   }else{

                       cntVO.setUatcCarPurcYn("Y");
                       contractMntDAO.updateContractEach(cntVO);

                       cntVO.setUsrVinNo(sCntVO.getUsrVinNo());
                       cntVO.setUsrSbstAmt(sCntVO.getUsrSbstAmt());
                       cntVO.setPurcNo(sCntVO.getPurcNo());

                       // 최초저장 시, 중고차 저장을 안했을 경우.
                       if(contractMntDAO.selectUsedCarCnt(cntVO) > 0){
                           contractMntDAO.updateUsedCar(cntVO);
                       }else{
                           contractMntDAO.insertUsedCar(cntVO);
                       }

                       contractUsedCarsApply(cntVO);
                   }
                }
            }
        }

        return 1;
    }

    // 중고차량 계약금액 반영
    private void contractUsedCarsApply(ContractReVO sCntVO) throws Exception{
        ContractReSearchVO searchVO = new ContractReSearchVO();
        searchVO.setsDlrCd(sCntVO.getDlrCd());
        searchVO.setsContractNo(sCntVO.getContractNo());
        List<ContractReVO> contList = contractMntDAO.selectContractResByCondition(searchVO);

        if(contList != null && contList.size() > 0){
            ContractReVO contVO = contList.get(0);

            double realCarAmt = contVO.getRealCarAmt() != null ? contVO.getRealCarAmt() : 0.0 ;
            double beforeAmt = contVO.getReservContAmt() != null ? contVO.getReservContAmt() : 0.0 ;
            double goodsAmt = contVO.getGoodsAmt() != null ? contVO.getGoodsAmt() : 0.0;
            double incAmt = contVO.getIncAmt() != null ? contVO.getIncAmt() : 0.0;
            double fincFeeAmt = contVO.getFincFeeAmt() != null ? contVO.getFincFeeAmt() : 0.0;
            double sbstAmt =  contVO.getUsrSbstAmt() != null ? contVO.getUsrSbstAmt() : 0.0;
            double aapAmt  = contVO.getAapAmt() != null ? contVO.getAapAmt() : 0.0;
            //double dcAmt = contVO.getPromotionAmt() != null ? contVO.getPromotionAmt() : 0.0;
            double pointAmt = contVO.getPointAmt() != null ? contVO.getPointAmt() : 0.0;

            double realPayAmt = realCarAmt - beforeAmt + goodsAmt + incAmt + fincFeeAmt + sbstAmt + aapAmt + pointAmt;

            double subsidyAmt = 0;
            if("2".equals(contVO.getSbusTp())){
                subsidyAmt = contVO.getSubsidyAmt();
            }else if("3".equals(contVO.getSbusTp())){
                subsidyAmt = contVO.getSubsidyAmt();
                realCarAmt -= subsidyAmt;
            }

            realPayAmt -= subsidyAmt;

            contVO.setRealAmt(realCarAmt);
            contVO.setSbstAmt(sbstAmt);
            contVO.setRealPayAmt(realPayAmt);
            contractMntDAO.updateContractEach(contVO);
            updateContractPayinfo(contVO);
        }
    }

    /**
     * 기타업무 [완성]상태 조회 - 출고사용
     **/
    @Override
    public List<ContractReVO> selectContractEtcWorkCheck(String dlrCd, String contractNo) throws Exception{
        if(StringUtils.isEmpty(dlrCd)){
            dlrCd = LoginUtil.getDlrCd();
        }
        if(StringUtils.isEmpty(contractNo)){
            throw processException("global.info.confirmMsgParam", new String[]{ messageSource.getMessage("global.lbl.contractNo", null, LocaleContextHolder.getLocale()) });
        }

        return contractMntDAO.selectContractEtcWorkCheck(dlrCd, contractNo);
    }

    /**
     * 중고차 완성내역 상태 조회
     */
    @Override
    public String selectContractUsedCarCheck(String dlrCd, String contractNo) throws Exception{

        ContractReSearchVO searchVO = new ContractReSearchVO();
        searchVO.setsDlrCd( dlrCd );
        searchVO.setsContractNo(contractNo);
        List<ContractReVO>  contList = contractMntDAO.selectContractResByCondition(searchVO);
        ContractReVO cntVO = contList.get(0);

        String str = "Y";
        if("Y".equals(cntVO.getUatcCarPurcYn())){

            PurcEvalSearchVO purSearch = new PurcEvalSearchVO();
            purSearch.setsDlrCd(dlrCd);
            purSearch.setsPurcNo(cntVO.getPurcNo());
            List<PurcEvalVO> purcList = purcEvalService.selectPurcByCondition(purSearch);
            if(purcList != null && purcList.size() > 0){
                double eq = purcList.get(0).getPurcTotAmt() + cntVO.getSbstAmt();
                if(eq != 0.0){
                    str = "N";
                }
                if("05".equals(purcList.get(0).getPurcStatCd())){
                    str = "N";
                }
            }
        }
        return str;
    }

    /**
     * 중고차 완성내역 상태 조회
     */
    @Override
    public int selectContractUsedCarIsCheck(String dlrCd, String contractNo) throws Exception{
        ContractReSearchVO searchVO = new ContractReSearchVO();
        searchVO.setsDlrCd( dlrCd );
        searchVO.setsContractNo(contractNo);
        List<ContractReVO>  contList = contractMntDAO.selectContractResByCondition(searchVO);
        ContractReVO cntVO = contList.get(0);

        if("Y".equals(cntVO.getUatcCarPurcYn())){
            PurcEvalSearchVO purSearch = new PurcEvalSearchVO();
            purSearch.setsDlrCd(dlrCd);
            purSearch.setsPurcNo(cntVO.getPurcNo());
            List<PurcEvalVO> purcList = purcEvalService.selectPurcByCondition(purSearch);
            if(purcList != null && purcList.size() > 0){
                double eq = purcList.get(0).getPurcTotAmt() + cntVO.getSbstAmt();

                if(eq != 0.0){
                    throw processException("sal.error.usedCarChangeMsg");
                }
                if(!"Y".equals(purcList.get(0).getExchYn())){
                    throw processException("sal.error.usedCarChangeMsg");
                }
                if("05".equals(purcList.get(0).getPurcStatCd())){
                    throw processException("sal.error.usedCarStatCancleChange");
                }
            }
        }
        return 1;
    }

    /**
     *  임시 배정/임시 배정취소
     * @param saveVO
     * @throws Exception
     */
    @Override
    public void updateCarAssign(VehicleMasterVO saveVO) throws Exception{
        saveVO.setUpdtUsrId(LoginUtil.getUserId());
        saveVO.setRegUsrId(LoginUtil.getUserId());

        if(StringUtils.isBlank(saveVO.getDlrCd())){
            saveVO.setDlrCd(LoginUtil.getDlrCd());
        }
        if(StringUtils.isEmpty(saveVO.getVinNo())){
            throw processException("global.info.confirmMsgParam", new String[]{ messageSource.getMessage("global.lbl.vinNum", null, LocaleContextHolder.getLocale()) , messageSource.getMessage("sal.lbl.toDay", null, LocaleContextHolder.getLocale()) });
        }
        contractMntDAO.updateCarAssign(saveVO);
    }

    /**
     * 계약의 컬럼을 개별을 수정한다.
     * @param saveVO - 조회 조건을 포함하는 ContractVO
     * @return
     */
    @Override
    public int updateContractEach(ContractReVO saveVO) throws Exception{
        saveVO.setUpdtUsrId(LoginUtil.getUserId());
        saveVO.setRegUsrId(LoginUtil.getUserId());

        if(StringUtils.isBlank(saveVO.getDlrCd())){
            saveVO.setDlrCd(LoginUtil.getDlrCd());
        }

        contractMntDAO.updateContractEach(saveVO);
        return 1;
    }


    /**
     * 사용자의 채널유형 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    @Override
    public List<ChnInfoVO> selectSaleEmpChannelTupeSearch(ContractReSearchVO searchVO) throws Exception{
        return contractMntDAO.selectSaleEmpChannelTupeSearch(searchVO);
    }

    /**
     * 해당 딜러의 2급딜러를 조회한다.
     * @param dlrCd
     * @return
     * @throws Exception
     */
    @Override
    public List<ChnInfoVO> selectlvTwoDlrOrgsByCondition(String dlrCd) throws Exception{
        return contractMntDAO.selectlvTwoDlrOrgsByCondition(dlrCd);
    }

}
