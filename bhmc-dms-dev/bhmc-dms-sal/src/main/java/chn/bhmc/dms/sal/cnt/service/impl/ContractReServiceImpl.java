package chn.bhmc.dms.sal.cnt.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtOutBoundService;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtVO;
import chn.bhmc.dms.sal.aap.service.AapMngService;
import chn.bhmc.dms.sal.aap.vo.AapMngVO;
import chn.bhmc.dms.sal.acc.service.AccessoryMngService;
import chn.bhmc.dms.sal.acc.vo.AccessoryMngItemVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryMngSaveVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryMngSearchVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryMngVO;
import chn.bhmc.dms.sal.cnt.service.ContractReService;
import chn.bhmc.dms.sal.cnt.service.dao.ContractReDAO;
import chn.bhmc.dms.sal.cnt.vo.ContractPayInfoVO;
import chn.bhmc.dms.sal.cnt.vo.ContractPromotionVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReGoodsVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReIncVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReOptionVO;
import chn.bhmc.dms.sal.cnt.vo.ContractRePayInfoSaveVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReSaveVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReSearchVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReVO;
import chn.bhmc.dms.sal.cnt.vo.ContractSearchVO;
import chn.bhmc.dms.sal.fim.service.FincInfoMngService;
import chn.bhmc.dms.sal.fim.vo.FincInfoMngVO;
import chn.bhmc.dms.sal.inc.service.IncJoinInfoService;
import chn.bhmc.dms.sal.inc.vo.IncJoinInfoSaveVO;
import chn.bhmc.dms.sal.inc.vo.IncJoinInfoVO;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterVO;

/**
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

@Service("contractReService")
public class ContractReServiceImpl extends HService implements ContractReService {

    /**
     * 계약 DAO 선언
     */
    @Resource(name="contractReDAO")
    ContractReDAO contractReDAO;

    @Resource(name="contractReService")
    ContractReService contractReService;

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
    @Resource(name="accessoryMngService")
    AccessoryMngService accessoryMngService;


    /**
     * 대행업무 서비스
     */
    @Resource(name="aapMngService")
    AapMngService aapMngService;


    /**
     * 조회 조건에 해당하는 계약목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return 조회 목록
     */
    @Override
    public List<ContractReVO> selectContractResByCondition(ContractReSearchVO searchVO) throws Exception{
        return contractReDAO.selectContractResByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 계약목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return
     */
    @Override
    public int selectContractResByConditionCnt(ContractReSearchVO searchVO) throws Exception{
        return contractReDAO.selectContractResByConditionCnt(searchVO);
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

    }


    /**
     * 계약을 생성/저장 한다.
     */
    @Override
    public String multiContracts(ContractReSaveVO saveVO) throws Exception{
        VehicleMasterVO vmVO = null;
        String contractNo = "";
        String contCustTp   = "";
        String contSsnCrnNo = "";       // 계약자:신분증번호
        String contSsnCrnTp = "";       // 계약자:신분증유형

        validationContractChk(saveVO, saveVO.getMultiFlag());

        ContractReVO cntVO = saveVO.getContractReVO();
        cntVO.setRegUsrId(LoginUtil.getUserId());     // 생성자
        cntVO.setUpdtUsrId(LoginUtil.getUserId());    // 수정자

        if(StringUtils.isEmpty(cntVO.getContractNo())){
            saveVO.setMultiFlag("create");
        }else{
            saveVO.setMultiFlag("update");
        }

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
            contractReDAO.insertContract(cntVO);

            // SA_0202 : 계약고객 저장
            cntVO.setPartnerTp("C");          // 계약자
            contractReDAO.insertContractCustomer(cntVO);
            contCustTp   = cntVO.getCustTp();       // 계약자:고객유형
            contSsnCrnNo = cntVO.getSsnCrnNo();     // 계약자:신분증번호
            contSsnCrnTp = cntVO.getSsnCrnTp();     // 계약자:신분증유형

            // SA_0202 : 실운전자 저장
            cntVO.setPartnerTp("D");          // 실운전자
            cntVO.setCustCd(cntVO.getDrvCustCd());     // 고객코드
            cntVO.setCustTp(cntVO.getDrvCustTp());     // 고객유형
            cntVO.setCustNm(cntVO.getDrvCustNm());     // 고객명
            cntVO.setTelNo1(cntVO.getDrvTelNo1());     // 고객연락처1
            cntVO.setTelNo2(cntVO.getDrvTelNo2());     // 고객연락처2
            cntVO.setEmailNm(cntVO.getDrvEmailNm());   // 이메일주소

            cntVO.setSsnCrnNo( cntVO.getDrvSsnCrnNo() );    // 신분증번호
            cntVO.setZipCd(cntVO.getDrvZipCd());            // 우편번호
            cntVO.setSsnCrnTp( cntVO.getDrvSsnCrnTp() );    // 신분증유형
            cntVO.setSungCd( cntVO.getDrvSungCd());         // 성코드
            cntVO.setSungNm( cntVO.getDrvSungNm());         //
            cntVO.setCityCd( cntVO.getDrvCityCd());         // 도시
            cntVO.setCityNm( cntVO.getDrvCityNm());         //
            cntVO.setDistCd( cntVO.getDrvDistCd());         // 지역
            cntVO.setDistNm( cntVO.getDrvDistNm());         //
            cntVO.setAddrNm( cntVO.getDrvAddrNm());         // 주소명
            cntVO.setAddrDetlCont( cntVO.getDrvAddrDetlCont());     // 주소상세내용
            contractReDAO.insertContractCustomer(cntVO);

            // SA_0205 : 중고차 저장
            if("Y".equals(cntVO.getUatcCarPurcYn())){
                contractReDAO.insertUsedCar(cntVO);
            }

            // SA_0217T : 탁송 저장
            if("C".equals( cntVO.getConsTp()) ){
                contractReDAO.insertCons(cntVO);
            }

            // SA_0220T : 번호판등록
            if("A".equals(cntVO.getRegTp())){
                contractReDAO.insertReg(cntVO);
            }

            // 보험 내역 등록
            if("A".equals(cntVO.getIncAapTp())){
                // SA_0221T : 보험헤더
                contractReDAO.insertIncHead(cntVO);

                ContractReSearchVO searchVO = new ContractReSearchVO();
                // SA_0222T : 보험아이템
                for(ContractReIncVO incVO : saveVO.getIncVO().getInsertIncList()){
                    incVO.setDlrCd(LoginUtil.getDlrCd());
                    incVO.setContractNo(contractNo);

                    searchVO.setsDlrCd(incVO.getDlrCd());
                    searchVO.setsContractNo(incVO.getContractNo());
                    searchVO.setsIncTp(incVO.getIncTp());
                    if( contractReDAO.selectIncListsByConditionCnt(searchVO) > 0){
                        throw processException("global.err.duplicate");
                    }
                    incVO.setRegUsrId(LoginUtil.getUserId());     // 사용자
                    incVO.setUpdtUsrId(LoginUtil.getUserId());    // 사용자
                    contractReDAO.insertInc(incVO);
                }
                for(ContractReIncVO incVO : saveVO.getIncVO().getUpdateIncList()){
                    searchVO.setsDlrCd(incVO.getDlrCd());
                    searchVO.setsContractNo(incVO.getContractNo());
                    searchVO.setsIncTp(incVO.getIncTp());
                    if( contractReDAO.selectIncListsByConditionCnt(searchVO) > 0){
                        throw processException("global.err.duplicate");
                    }

                    incVO.setRegUsrId(LoginUtil.getUserId());     // 사용자
                    incVO.setUpdtUsrId(LoginUtil.getUserId());    // 사용자
                    contractReDAO.updateInc(incVO);
                }
                for(ContractReIncVO incVO : saveVO.getIncVO().getDeleteIncList()){
                    contractReDAO.deleteInc(incVO);
                }

            }

            // SA_0223T : 계약-금융서비스
            if("Y".equals(cntVO.getFincReqYn())){
                contractReDAO.insertFinc(cntVO);

                // SA_0233T : 금융서비스
                FincInfoMngVO fincVO = new FincInfoMngVO();
                fincVO.setDlrCd(cntVO.getDlrCd());
                fincVO.setFincReqDt(cntVO.getFincReqDt());
                fincVO.setFincStatCd("01");     // 신청상태.
                fincVO.setContractNo(cntVO.getContractNo());
                fincVO.setCarlineCd(cntVO.getCarlineCd());
                fincVO.setModelCd(cntVO.getModelCd());
                fincVO.setOcnCd(cntVO.getOcnCd());
                fincVO.setExtColorCd(cntVO.getExtColorCd());
                fincVO.setIntColorCd(cntVO.getIntColorCd());
                fincVO.setCustTp(contCustTp);
                fincVO.setMathDocTp(contSsnCrnTp);
                fincVO.setSsnCrnNo(contSsnCrnNo);
                fincVO.setFincCmpCd(cntVO.getFincCmpCd() );
                fincVO.setFincItemCd(cntVO.getFincItemCd());
                fincVO.setFincReqAmt(cntVO.getFincReqAmt());
                fincVO.setFincEndDt(cntVO.getFincEndDt());
                fincVO.setFincLoanFeeAmt(cntVO.getFincFeeAmt());
                fincVO.setFincRpayPrid(cntVO.getFincRpayPrid());
                fincVO.setFincLoanRate(cntVO.getFincLoadRate());
                fincVO.setRegUsrId(cntVO.getRegUsrId());
                fincVO.setUpdtUsrId(cntVO.getUpdtUsrId());
                //fincVO.setFincItemKindCd(cntVO.getFincItemKindCd());
                fincInfoMngService.insertFincMng(fincVO);
            }

        }else{

            contractNo = cntVO.getContractNo();

            // SA_0201T : 계약 헤더 수정
            contractReDAO.updateContract(cntVO);

            // SA_0202T : 계약고객 수정
            cntVO.setPartnerTp("C");          // 계약자
            contractReDAO.updateContractCustomer(cntVO);
            contCustTp   = cntVO.getCustTp();       // 계약자:고객유형
            contSsnCrnNo = cntVO.getSsnCrnNo();     // 계약자:신분증번호
            contSsnCrnTp = cntVO.getSsnCrnTp();     // 계약자:신분증유형

            // SA_0202T : 실운전자 저장
            cntVO.setPartnerTp("D");          // 실운전자
            cntVO.setCustCd(cntVO.getDrvCustCd());     // 고객코드
            cntVO.setCustTp(cntVO.getDrvCustTp());     // 고객유형
            cntVO.setCustNm(cntVO.getDrvCustNm());     // 고객명
            cntVO.setTelNo1(cntVO.getDrvTelNo1());     // 고객연락처1
            cntVO.setTelNo2(cntVO.getDrvTelNo2());     // 고객연락처2
            cntVO.setEmailNm(cntVO.getDrvEmailNm());   // 이메일주소

            cntVO.setSsnCrnNo( cntVO.getDrvSsnCrnNo() );    // 신분증번호
            cntVO.setZipCd(cntVO.getDrvZipCd());            // 우편번호
            cntVO.setSsnCrnTp( cntVO.getDrvSsnCrnTp() );    // 신분증유형
            cntVO.setSungCd( cntVO.getDrvSungCd());         // 성코드
            cntVO.setSungNm( cntVO.getDrvSungNm());         //
            cntVO.setCityCd( cntVO.getDrvCityCd());         // 도시
            cntVO.setCityNm( cntVO.getDrvCityNm());         //
            cntVO.setDistCd( cntVO.getDrvDistCd());         // 지역
            cntVO.setDistNm( cntVO.getDrvDistNm());         //
            cntVO.setAddrNm( cntVO.getDrvAddrNm());         // 주소명
            cntVO.setAddrDetlCont( cntVO.getDrvAddrDetlCont());     // 주소상세내용
            if(contractReDAO.selectContractCustomersChkByConditionCnt(cntVO) > 0){
                contractReDAO.updateContractCustomer(cntVO);
            }else{
                contractReDAO.insertContractCustomer(cntVO);
            }

            // SA_0205T : 중고차 수정
            if("Y".equals(cntVO.getUatcCarPurcYn())){

                // 최초저장 시, 중고차 저장을 안했을 경우.
                if(contractReDAO.selectUsedCarCnt(cntVO) > 0){
                    contractReDAO.updateUsedCar(cntVO);
                }else{
                    contractReDAO.insertUsedCar(cntVO);
                }

            }else{
                // 수정 시, 체크를 해제했을 경우 지움
                contractReDAO.deleteUsedCar(cntVO);
            }

            // SA_0217T : 탁송 수정
            if("C".equals( cntVO.getConsTp()) ){
                // 최초저장 시, 탁송 저장을 안했을 경우.
                if(contractReDAO.selectConsCnt(cntVO) > 0){
                    contractReDAO.updateCons(cntVO);
                }else{
                    contractReDAO.insertCons(cntVO);
                }
            }else{
                // 수정 시, 체크를 해제했을 경우 지움
                contractReDAO.deleteCons(cntVO);
            }

            // SA_0220T : 번호판 수정
            if("A".equals(cntVO.getRegTp())){
                // 최초저장 시, 번호판 저장을 했을 경우.
                if(contractReDAO.selectRegCnt(cntVO) > 0){
                    contractReDAO.updateReg(cntVO);
                }else{
                    contractReDAO.insertReg(cntVO);
                }
            }else{
                // 수정 시, 체크를 해제했을 경우 지움
                contractReDAO.deleteReg(cntVO);
            }

            // 보험 내역 수정
            if("A".equals(cntVO.getIncAapTp())){
                // 최초저장 시, 보험헤더 저장을 했을 경우.
                if(contractReDAO.selectIncHeadCnt(cntVO) > 0){
                    contractReDAO.updateIncHead(cntVO);
                }else{
                    contractReDAO.insertIncHead(cntVO);
                }

                ContractReSearchVO searchVO = new ContractReSearchVO();
                // SA_0222T : 보험아이템
                for(ContractReIncVO incVO : saveVO.getIncVO().getInsertIncList()){
                    incVO.setDlrCd(LoginUtil.getDlrCd());
                    incVO.setContractNo(contractNo);

                    searchVO.setsDlrCd(incVO.getDlrCd());
                    searchVO.setsContractNo(incVO.getContractNo());
                    searchVO.setsIncTp(incVO.getIncTp());
                    if( contractReDAO.selectIncListsByConditionCnt(searchVO) > 0){
                        throw processException("global.err.duplicate");
                    }
                    incVO.setRegUsrId(LoginUtil.getUserId());
                    incVO.setUpdtUsrId(LoginUtil.getUserId());
                    contractReDAO.insertInc(incVO);
                }
                for(ContractReIncVO incVO : saveVO.getIncVO().getUpdateIncList()){
                    searchVO.setsDlrCd(incVO.getDlrCd());
                    searchVO.setsContractNo(incVO.getContractNo());
                    searchVO.setsIncTp(incVO.getIncTp());
                    /*if( contractReDAO.selectIncListsByConditionCnt(searchVO) > 0){
                        throw processException("global.err.duplicate");
                    }*/
                    incVO.setRegUsrId(LoginUtil.getUserId());
                    incVO.setUpdtUsrId(LoginUtil.getUserId());
                    contractReDAO.updateInc(incVO);
                }
                for(ContractReIncVO incVO : saveVO.getIncVO().getDeleteIncList()){
                    contractReDAO.deleteInc(incVO);
                }

            }else{
                contractReDAO.deleteIncHead(cntVO);
                contractReDAO.deleteIncAll(cntVO);
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
                if(contractReDAO.selectFincCnt(cntVO) > 0){
                    contractReDAO.updateFinc(cntVO);
                }else{
                    contractReDAO.insertFinc(cntVO);
                }

                // SA_0233T : 금융서비스
                fincVO.setFincReqDt(cntVO.getFincReqDt());
                fincVO.setFincStatCd("01");     // 신청상태.
                fincVO.setCarlineCd(cntVO.getCarlineCd());
                fincVO.setModelCd(cntVO.getModelCd());
                fincVO.setOcnCd(cntVO.getOcnCd());
                fincVO.setExtColorCd(cntVO.getExtColorCd());
                fincVO.setIntColorCd(cntVO.getIntColorCd());
                fincVO.setCustTp(contCustTp);
                fincVO.setMathDocTp(contSsnCrnTp);
                fincVO.setSsnCrnNo(contSsnCrnNo);
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
                //fincVO.setFincItemKindCd(cntVO.getFincItemKindCd());
                if(fnList.size() > 0){
                    fincInfoMngService.updateFincMng(fincVO);
                }else{
                    fincInfoMngService.insertFincMng(fincVO);
                }

            }else{
                // 금융서비스 신청을 체크 안했을 시.
                contractReDAO.deleteFinc(cntVO);

                if(fnList.size() > 0){
                    // SA_0233T : 금융서비스 - 삭제
                    fincInfoMngService.deleteFincMng(fincVO);
                }
            }

            // 법인프로모션금액이 없을 경우. [ 기 저장중이던 프로모션 지움. ]
            ContractPromotionVO promotionVO = new ContractPromotionVO();
            promotionVO.setDlrCd(cntVO.getDlrCd());
            promotionVO.setContractNo(cntVO.getContractNo());
            if ( cntVO.getCorpPromotionAmt() <= 0 ){
                promotionVO.setPromotionOwnCd("01");    // 법인
                contractReDAO.deleteContractAllPromotions(promotionVO);
            }else{
                // 할인가가 있으면서, 프로모션 수정사항이 발생한다면 - 기 저장중이던 프로모션 지움.
                if( saveVO.getCorpPromotionVO().getUpdateCorpPromotionList().size() > 0 ){
                    contractReDAO.deleteContractAllPromotions(promotionVO);
                }
            }

            // 딜러 프로모션금액이 없을 경우. [ 기 저장중이던 프로모션 지움. ]
            if ( cntVO.getDlrPromotionAmt() <= 0 ){
                promotionVO.setPromotionOwnCd("02");    // 딜러
                contractReDAO.deleteContractAllPromotions(promotionVO);
            }else{
                // 할인가가 있으면서, 프로모션 수정사항이 발생한다면 - 기 저장중이던 프로모션 지움.
                if( saveVO.getDlrPromotionVO().getUpdateDlrPromotionList().size() > 0 ){
                    contractReDAO.deleteContractAllPromotions(promotionVO);
                }
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
                contractReDAO.updateCarAssign(vmVO);
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
                    contractReDAO.updateCarAssign(vmVO);
                }

                // ㄴ 기존 배정 취소
                vmVO.setVinNo(cntVO.getBeforVinNo());
                vmVO.setOwnStatCd("O");       // 미배정
                contractReDAO.updateCarAssign(vmVO);
            }
        }

        // SA_0218T : 입출금
        for(ContractPayInfoVO payInfoVO : saveVO.getPayInfoVO().getInsertPayInfoList()){
            payInfoVO.setContractNo(contractNo);
            payInfoVO.setDlrCd(LoginUtil.getDlrCd());
            payInfoVO.setRegUsrId(LoginUtil.getUserId());
            payInfoVO.setUpdtUsrId(LoginUtil.getUserId());
            contractReDAO.insertPayInfo(payInfoVO);
        }
        for(ContractPayInfoVO payInfoVO : saveVO.getPayInfoVO().getUpdatePayInfoList()){
            payInfoVO.setRegUsrId(LoginUtil.getUserId());
            payInfoVO.setUpdtUsrId(LoginUtil.getUserId());
            contractReDAO.updatePayInfo(payInfoVO);
        }
        for(ContractPayInfoVO payInfoVO : saveVO.getPayInfoVO().getDeletePayInfoList()){
            contractReDAO.deletePayInfo(payInfoVO);
        }

        // SA_0219T : 부가서비스
        for(ContractReOptionVO optionVO : saveVO.getOptionVO().getInsertOptionList()){
            optionVO.setDlrCd(LoginUtil.getDlrCd());
            optionVO.setContractNo(contractNo);
            optionVO.setRegUsrId(LoginUtil.getUserId());
            optionVO.setUpdtUsrId(LoginUtil.getUserId());
            contractReDAO.insertOption(optionVO);
        }
        for(ContractReOptionVO optionVO : saveVO.getOptionVO().getUpdateOptionList()){
            optionVO.setRegUsrId(LoginUtil.getUserId());
            optionVO.setUpdtUsrId(LoginUtil.getUserId());
            contractReDAO.updateOption(optionVO);
        }
        for(ContractReOptionVO optionVO : saveVO.getOptionVO().getDeleteOptionList()){
            contractReDAO.deleteOption(optionVO);
        }

        // SA_0204T : 용품
        for(ContractReGoodsVO goodsVO : saveVO.getGoodsVO().getInsertGoodsList()){
            goodsVO.setDlrCd(LoginUtil.getDlrCd());
            goodsVO.setContractNo(contractNo);
            goodsVO.setRegUsrId(LoginUtil.getUserId());
            goodsVO.setUpdtUsrId(LoginUtil.getUserId());
            contractReDAO.insertGoods(goodsVO);
        }
        for(ContractReGoodsVO goodsVO : saveVO.getGoodsVO().getUpdateGoodsList()){
            goodsVO.setRegUsrId(LoginUtil.getUserId());
            goodsVO.setUpdtUsrId(LoginUtil.getUserId());
            contractReDAO.updateGoods(goodsVO);
        }
        for(ContractReGoodsVO goodsVO : saveVO.getGoodsVO().getDeleteGoodsList()){
            contractReDAO.deleteGoods(goodsVO);
        }

        // SA_0203T : 계약 법인 프로모션 저장/수정 Grid
        for(ContractPromotionVO promotionVO : saveVO.getCorpPromotionVO().getUpdateCorpPromotionList()){
            promotionVO.setRegUsrId(LoginUtil.getUserId());
            promotionVO.setUpdtUsrId(LoginUtil.getUserId());

            // 신규 계약시, 주문번호(계약번호)를 넣는다.
            promotionVO.setContractNo(contractNo);
            promotionVO.setPromotionOwnCd("01");    // 법인
            //contractReDAO.updateContractPromotions(promotionVO);

            if ("Y".equals( promotionVO.getChkYn() )){
                contractReDAO.insertContractPromotions(promotionVO);
            }else{
                contractReDAO.deleteContractPromotions(promotionVO);
            }
        }

        // SA_0203T : 계약 딜러 프로모션 저장/수정 Grid
        for(ContractPromotionVO promotionVO : saveVO.getDlrPromotionVO().getUpdateDlrPromotionList()){
            promotionVO.setRegUsrId(LoginUtil.getUserId());
            promotionVO.setUpdtUsrId(LoginUtil.getUserId());

            // 신규 계약시, 주문번호(계약번호)를 넣는다.
            promotionVO.setContractNo(contractNo);
            promotionVO.setPromotionOwnCd("02");    // 딜러
            //contractReDAO.updateContractPromotions(promotionVO);

            if ("Y".equals( promotionVO.getChkYn() )){
                contractReDAO.insertContractPromotions(promotionVO);
            }else{
                contractReDAO.deleteContractPromotions(promotionVO);
            }
        }

        //프로시저추가 - 계약저장 : DCS data보정
        contractReDAO.procDlrRetailContract(cntVO);

        return contractNo;
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

        contVO.setUpdtUsrId(LoginUtil.getUserId());
        contractReDAO.approval(contVO);

        if("20".equals(contVO.getContractStatCd())){

            ContractReSearchVO searchVO = new ContractReSearchVO();
            searchVO.setsDlrCd( contVO.getDlrCd() );
            searchVO.setsContractNo( contVO.getContractNo() );

            // 계약내역을 불러옴.
            ContractReVO cVO = contractReDAO.selectContractResByCondition(searchVO).get(0);

            if(cVO.getRealPayAmt() <= 0){
                // [실제지불금액]을(를) 확인하여 주세요.
                throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("sal.lbl.realPayAmt", null, LocaleContextHolder.getLocale())});
            }

            // 보험확정 정보 -> 보험관리 테이블 저장
            if( "A".equals(cVO.getIncAapTp()) ){

                 /**
                  *  보험 관리내역 삭제
                  *  SA_0216T-header , SA_0253T-detail
                  *  저장/수정시, 무조건 지우고 저장하기로 구상우과장께서 BHMC와 결정함.
                  */
                incJoinInfoService.deleteContractSaleIncInfo(contVO.getContractNo());


                IncJoinInfoSaveVO itemSaveVO = new IncJoinInfoSaveVO();

                // SA_0216T : 보험가입정보 - insert
                IncJoinInfoVO incVO = new IncJoinInfoVO();
                incVO.setDlrCd(cVO.getDlrCd());
                incVO.setCarlineCd( cVO.getCarlineCd()  );
                incVO.setModelCd( cVO.getModelCd()  );
                incVO.setIncExpcTotAmt( cVO.getIncExpcAmt() );      //예상총금액
                incVO.setRealIncTotAmt( cVO.getRealIncAmt() );      //실보험총금액
                incVO.setIncFeeTotAmt( cVO.getRealIncFeeAmt() );    //보험수수료
                incVO.setFrcIncAmt( cVO.getFrcIncAmt() );
                incVO.setBusIncAmt( cVO.getBusIncAmt() );
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
                incVO.setIncPconCustNm( cVO.getIncPconCustNm() );       //연계인
                incVO.setIncPconCustTelNo( cVO.getIncPconCustTelNo() ); //연계인전화번호
                incVO.setFinImplyYn(StringUtils.isEmpty(cVO.getFinImplyYn()) ? "N" : cVO.getFinImplyYn()); //재무수납포함여부
                incVO.setImplyYn(cVO.getImplyYn());
                incVO.setRemark( cVO.getIncRemark() );
                
                incVO.setIncStat("10");                                 //저장상태
                incVO.setIncCs("01");                                   //신보험
                
                // 보험 헤더
                itemSaveVO.setIncJoinInfoVO(incVO);

                // SA_0253T : 보험가입아이템 - insert
                BaseSaveVO<IncJoinInfoVO> incItemSaveDS = new BaseSaveVO<IncJoinInfoVO>();
               List<IncJoinInfoVO> insertIncItemList = incItemSaveDS.getInsertList();

                // SA_0222T : 계약-보험내역(Item)을 불러온다.
                List<ContractReIncVO> incItemList = contractReDAO.selectIncListsByCondition(searchVO);

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
            if(contractReDAO.selectGoodsListsByConditionCnt(searchVO) > 0){

                AccessoryMngSearchVO accSearchVO = new AccessoryMngSearchVO();
                accSearchVO.setsDlrCd( contVO.getDlrCd() );
                accSearchVO.setsSaleContractNo( contVO.getContractNo() );
                List<AccessoryMngVO> accList = accessoryMngService.selectAccessoryMngsByCondition( accSearchVO );
                if(accList != null && accList.size() > 0){

                    for(AccessoryMngVO accVO : accList){
                        if( "20".equals(accVO.getContractStatCd()) ){
                            // 출고된 용품으로 인해 변경이 불가능합니다.
                            throw processException("sal.error.contAccessoryImportMsg");
                        }
                    }

                    // 기존 경품 내역을 삭제 후 저장.
                    accessoryMngService.deleteContractSaleAccessoryMngs(contVO.getContractNo());
                }

                AccessoryMngSaveVO accessorySaveVO = new AccessoryMngSaveVO();
                AccessoryMngVO accessoryHeadVO = new AccessoryMngVO();

                accessoryHeadVO.setRegUsrId(LoginUtil.getUserId());     // 생성자
                accessoryHeadVO.setUpdtUsrId(LoginUtil.getUserId());    // 수정자
                accessoryHeadVO.setDlrCd(cVO.getDlrCd());
                accessoryHeadVO.setGoodsContractNo("");

                // SA_0261T : 경품판매 헤더 정보
                accessoryHeadVO.setGoodsTp("03");                       // 용품유형 : SAL158 - 03:용품
                accessoryHeadVO.setContractCustNo( cVO.getContractCustNo() );
                accessoryHeadVO.setContractCustTp( cVO.getCustTp() );
                accessoryHeadVO.setTelNo( cVO.getTelNo1() );
                accessoryHeadVO.setCarBrandCd("HD");                    // 브랜드 :  COM019 - HD:현대
                accessoryHeadVO.setCarlineCd( cVO.getCarlineCd() );
                accessoryHeadVO.setModelCd( cVO.getModelCd() );
                accessoryHeadVO.setOcnCd( cVO.getOcnCd() );
                accessoryHeadVO.setExtColorCd( cVO.getExtColorCd() );
                accessoryHeadVO.setIntColorCd( cVO.getIntColorCd() );
                accessoryHeadVO.setSaleContractNo( cVO.getContractNo() );
                accessoryHeadVO.setCustPayAmt( cVO.getGoodsAmt() );     // 고객지불금액
                accessoryHeadVO.setContractStatCd("10");                // 저장상태

                // SA_0204T : 계약용품정보 조회
                List<ContractReGoodsVO> goodsItemList  = contractReDAO.selectGoodsListsByCondition(searchVO);
                List<AccessoryMngItemVO> insertGoodsItemList =  accessorySaveVO.getInsertList();
                AccessoryMngItemVO accessoryItemVO = null;

                double vGoodsAmt = 0, vSaleAmt = 0, vDcAmt = 0;

                for(ContractReGoodsVO goodsItemVO : goodsItemList){
                    accessoryItemVO = new AccessoryMngItemVO();
                    accessoryItemVO.setRegUsrId(LoginUtil.getUserId());
                    accessoryItemVO.setUpdtUsrId(LoginUtil.getUserId());
                    accessoryItemVO.setDlrCd( goodsItemVO.getDlrCd() );
                    accessoryItemVO.setGoodsCd( goodsItemVO.getGoodsCd() );
                    accessoryItemVO.setGoodsNm( goodsItemVO.getGoodsNm() );
                    accessoryItemVO.setGoodsCnt( (int) goodsItemVO.getGoodsCnt() );
                    accessoryItemVO.setGoodsUnitCd( goodsItemVO.getGoodsUnitCd() );
                    accessoryItemVO.setRetlPrc( goodsItemVO.getGoodsPrc() );
                    accessoryItemVO.setDcRate( (int) goodsItemVO.getDcRate() );
                    accessoryItemVO.setSaleAmt( goodsItemVO.getGoodsAmt() );
                    accessoryItemVO.setTotAmt( goodsItemVO.getRealGoodsAmt() );
                    accessoryItemVO.setDcAmt( goodsItemVO.getDcAmt() );
                    accessoryItemVO.setPkgItemCd( goodsItemVO.getPkgItemCd() );
                    accessoryItemVO.setGrStrgeCd( goodsItemVO.getGrStrgeCd() );
                    accessoryItemVO.setGiStrgeCd( goodsItemVO.getGiStrgeCd() );

                    // 용품합계금액
                    vGoodsAmt += (goodsItemVO.getGoodsPrc() * goodsItemVO.getGoodsCnt() );
                    // 판매합계금액
                    vSaleAmt  += (goodsItemVO.getGoodsAmt() * goodsItemVO.getGoodsCnt() );
                    // 증정금액
                    vDcAmt    += (goodsItemVO.getDcAmt());

                    insertGoodsItemList.add(accessoryItemVO);
                }

                // 나머지 헤더정보 계산하여 저장
                accessoryHeadVO.setGoodsAmt( vGoodsAmt );
                accessoryHeadVO.setGoodsRealAmt(vSaleAmt);
                accessoryHeadVO.setPrenAmt( vDcAmt );
                accessoryHeadVO.setAddPrenAmt(0.0);                      // 추가증정금액
                accessoryHeadVO.setCustPayAmt( vGoodsAmt - vDcAmt );     // 고객납부금액

                accessorySaveVO.setGoodsMainVO(accessoryHeadVO);         // 경품 Header정보 저장
                accessorySaveVO.setContract(true);
                accessoryMngService.multiAccessoryMngs(accessorySaveVO);
            }else{
                accessoryMngService.deleteContractSaleAccessoryMngs(contVO.getContractNo());
            }

            //대행업무 SA_0264T
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

        }

        //프로시저추가 - 계약생성 : DCS data보정
        contractReDAO.procDlrRetailContract(contVO);

        return contVO.getContractNo();
    }

    /**
     * 계약을 삭제(승인전) 한다.
     */
    public String deleteContract (ContractReVO contVO) throws Exception{
        contVO.setUpdtUsrId(LoginUtil.getUserId());

        // 임시배정 차량 취소.
        ContractReSearchVO sVO = new ContractReSearchVO();
        sVO.setsDlrCd( contVO.getDlrCd() );
        sVO.setsContractNo( contVO.getContractNo() );
        List<ContractReVO> contList = contractReDAO.selectContractResByCondition(sVO);
        if(contList != null && contList.size() > 0){
            ContractReVO cVO = contList.get(0);
            if(cVO != null && !"".equals(cVO.getVinNo()) ){
                VehicleMasterVO vmVO = new VehicleMasterVO();
                vmVO.setOwnStatCd("O");
                vmVO.setUpdtUsrId(LoginUtil.getUserId());
                vmVO.setRegUsrId(LoginUtil.getUserId());
                vmVO.setDlrCd( cVO.getDlrCd() );
                vmVO.setVinNo( cVO.getVinNo() );
                contractReDAO.updateCarAssign(vmVO);
            }
        }

        // 계약 삭제
        contractReDAO.deleteContract(contVO);

        /**
         *  판매기회 계약건은 취소여부를 CRM 판매기회쪽으로 보내준다.
         */
        ContractReSearchVO searchVO = new ContractReSearchVO();
        searchVO.setsDlrCd(contVO.getDlrCd());
        searchVO.setsContractNo( contVO.getContractNo() );
        ContractReVO cnVO = contractReDAO.selectContractResByCondition( searchVO ).get(0);

        if( cnVO.getSaleOpptNo() != null && !"".equals(cnVO.getSaleOpptNo())){
            SalesOpptProcessMgmtVO opptVO = new SalesOpptProcessMgmtVO();
            opptVO.setDlrCd( cnVO.getDlrCd() );
            opptVO.setSeq( cnVO.getSaleOpptNo() );
            opptVO.setLeadStatCd("09");
            salesOpptProcessMgmtOutBoundService.updateSalesOpptProcessMgmt(opptVO);
        }

        //프로시저추가 - 계약삭제 : DCS data보정
        contractReDAO.procDlrRetailContract(contVO);
        return contVO.getContractNo();
    }

    /**
     * 계약을 삭제(승인후) 한다.
     */
    public String cancelContract (ContractReVO contVO) throws Exception{
        contVO.setUpdtUsrId(LoginUtil.getUserId());

        // 임시배정 차량 취소.
        ContractReSearchVO sVO = new ContractReSearchVO();
        sVO.setsDlrCd( contVO.getDlrCd() );
        sVO.setsContractNo( contVO.getContractNo() );
        List<ContractReVO> contList = contractReDAO.selectContractResByCondition(sVO);
        if(contList != null && contList.size() > 0){
            ContractReVO cVO = contList.get(0);
            if(cVO != null && !"".equals(cVO.getVinNo()) ){
                VehicleMasterVO vmVO = new VehicleMasterVO();
                vmVO.setOwnStatCd("O");
                vmVO.setUpdtUsrId(LoginUtil.getUserId());
                vmVO.setRegUsrId(LoginUtil.getUserId());
                vmVO.setDlrCd( cVO.getDlrCd() );
                vmVO.setVinNo( cVO.getVinNo() );
                contractReDAO.updateCarAssign(vmVO);
            }
        }

        contractReDAO.cancelContract(contVO);

        /**
         *  판매기회 계약건은 취소여부를 CRM 판매기회쪽으로 보내준다.
         */
        ContractReSearchVO searchVO = new ContractReSearchVO();
        searchVO.setsDlrCd(contVO.getDlrCd());
        searchVO.setsContractNo( contVO.getContractNo() );
        ContractReVO cnVO = contractReDAO.selectContractResByCondition( searchVO ).get(0);

        if( cnVO.getSaleOpptNo() != null && !"".equals(cnVO.getSaleOpptNo())){
            SalesOpptProcessMgmtVO opptVO = new SalesOpptProcessMgmtVO();
            opptVO.setDlrCd( cnVO.getDlrCd() );
            opptVO.setSeq( cnVO.getSaleOpptNo() );
            opptVO.setLeadStatCd("09");
            salesOpptProcessMgmtOutBoundService.updateSalesOpptProcessMgmt(opptVO);
        }

        //프로시저추가 - 계약해지 : DCS data보정
        contractReDAO.procDlrRetailContract(contVO);
        return contVO.getContractNo();
    }


    /**
     * 계약별 프로모션 조회
     */
    public int selectPromotionListsByConditionCnt(ContractReSearchVO searchVO) throws Exception{
        return contractReDAO.selectPromotionListsByConditionCnt(searchVO);
    }
    public List<ContractPromotionVO> selectPromotionListsByCondition(ContractReSearchVO searchVO) throws Exception{
        return contractReDAO.selectPromotionListsByCondition(searchVO);
    }

    /**
     * 계약별 입/출금내역 조회
     */
    public int selectPayInfoListsByConditionCnt(ContractReSearchVO searchVO) throws Exception{
        return contractReDAO.selectPayInfoListsByConditionCnt(searchVO);
    }
    public List<ContractPayInfoVO> selectPayInfoListsByCondition(ContractReSearchVO searchVO) throws Exception{
        return contractReDAO.selectPayInfoListsByCondition(searchVO);
    }

    /**
     * 계약별 입/출금내역 저장
     */
    public int savePayInfo (ContractRePayInfoSaveVO saveVO) throws Exception{
        for(ContractPayInfoVO payinfoVO : saveVO.getInsertPayInfoList()){
            payinfoVO.setDlrCd(LoginUtil.getDlrCd());
            payinfoVO.setRegUsrId(LoginUtil.getUserId());     // 사용자
            payinfoVO.setUpdtUsrId(LoginUtil.getUserId());    // 사용자
            contractReDAO.insertPayInfo(payinfoVO);
        }

        for(ContractPayInfoVO payinfoVO : saveVO.getUpdatePayInfoList()){
            payinfoVO.setRegUsrId(LoginUtil.getUserId());     // 사용자
            payinfoVO.setUpdtUsrId(LoginUtil.getUserId());    // 사용자
            contractReDAO.updatePayInfo(payinfoVO);
        }

        for(ContractPayInfoVO payinfoVO : saveVO.getDeletePayInfoList()){
            payinfoVO.setRegUsrId(LoginUtil.getUserId());     // 사용자
            payinfoVO.setUpdtUsrId(LoginUtil.getUserId());    // 사용자
            contractReDAO.deletePayInfo(payinfoVO);
        }

        return 1;

    }

    /**
     * 계약별 보험내역 조회
     */
    public int selectIncListsByConditionCnt(ContractReSearchVO searchVO) throws Exception{
        return contractReDAO.selectIncListsByConditionCnt(searchVO);
    }
    public List<ContractReIncVO> selectIncListsByCondition(ContractReSearchVO searchVO) throws Exception{
        return contractReDAO.selectIncListsByCondition(searchVO);
    }

    /**
     * 계약별 용품 조회
     */
    public int selectGoodsListsByConditionCnt(ContractReSearchVO searchVO) throws Exception{
        return contractReDAO.selectGoodsListsByConditionCnt(searchVO);
    }
    public List<ContractReGoodsVO> selectGoodsListsByCondition(ContractReSearchVO searchVO) throws Exception{
        return contractReDAO.selectGoodsListsByCondition(searchVO);
    }

    /**
     * 계약별 부가비용 조회
     */
    public int selectOptionListsByConditionCnt(ContractReSearchVO searchVO) throws Exception{
        return contractReDAO.selectOptionListsByConditionCnt(searchVO);
    }
    public List<ContractReOptionVO> selectOptionListsByCondition(ContractReSearchVO searchVO) throws Exception{
        return contractReDAO.selectOptionListsByCondition(searchVO);
    }

    /**
     * 딜러 프로모션에 대한 할인 레벨을 조회한다. [계약생성 시 체크 확인]
     */
    public int selectDlrDcLevelCnt(ContractReSearchVO searchVO) throws Exception{
        return contractReDAO.selectDlrDcLevelCnt(searchVO);
    }
    public List<ContractReVO> selectDlrDcLevel(ContractReSearchVO searchVO) throws Exception{
        return contractReDAO.selectDlrDcLevel(searchVO);
    }

    /**
     * 미배정 차량 조회
     */
    @Override
    public int selectContractReVinNosByConditionCnt(ContractReSearchVO searchVO) throws Exception{
        return contractReDAO.selectContractReVinNosByConditionCnt(searchVO);
    }
    @Override
    public List<VehicleMasterVO> selectContractReVinNosByCondition(ContractReSearchVO searchVO) throws Exception{
        return contractReDAO.selectContractReVinNosByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 품목팝업(판매단가용) 총 갯수를 조회한다.
     *   : 부품모듈의 ItemMasterService 와 동일. SQL 동일.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
    @Override
    public int selectItemSalePrcPopupByConditionCnt(ContractReSearchVO searchVO) throws Exception {
        return contractReDAO.selectItemSalePrcPopupByConditionCnt(searchVO);
    }
    @Override
    public List<ContractReGoodsVO> selectItemSalePrcPopupByCondition(ContractReSearchVO searchVO) throws Exception {
        return contractReDAO.selectItemSalePrcPopupByCondition(searchVO);
    }


    /**
     * 계약 상태 조회(출고 처리시 조회)
     */
    @Override
    public String selectContractStatCd(ContractSearchVO searchVO) throws Exception{
        return contractReDAO.selectContractStatCd(searchVO);
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
        List<ContractReVO>  contList = contractReDAO.selectContractResByCondition(searchVO);

        // 차량가격 재계산
        if(contList != null && contList.size() > 0){
            double retlAmt = contList.get(0).getRetlAmt() == null ? 0.0 : contList.get(0).getRetlAmt();
            double promotionAmt = contList.get(0).getPromotionAmt() == null ? 0.0 : contList.get(0).getPromotionAmt();
            double sbstAmt = contList.get(0).getSbstAmt() == null ? 0.0 : contList.get(0).getSbstAmt();
            double goodsAmt = contVO.getGoodsAmt();

            /***
             // 기존 계약화면 계산방식 : 계약관리
            double realCarAmt = retlAmt + promotionAmt + sbstAmt + goodsAmt;
            double etcSumAmt = contList.get(0).getEtcSumAmt() == null ? 0.0 : contList.get(0).getEtcSumAmt();
            double realPayAmt = realCarAmt + etcSumAmt;
             */

            // 신규 계약체결관리 계산방식 //
            double incAmt = contList.get(0).getIncAmt() == null ? 0.0 : contList.get(0).getIncAmt();
            double fincFeeAmt = contList.get(0).getFincFeeAmt() == null ? 0.0 : contList.get(0).getFincFeeAmt();
            double aapAmt = contList.get(0).getAapAmt() == null ? 0.0 : contList.get(0).getAapAmt();
            double realCarAmt = contList.get(0).getRealCarAmt() == null ? 0.0 : contList.get(0).getRealCarAmt();
            double etcSumAmt = contList.get(0).getEtcSumAmt() == null ? 0.0 : contList.get(0).getEtcSumAmt();
            double realPayAmt = retlAmt + goodsAmt + incAmt + + fincFeeAmt + sbstAmt + aapAmt - promotionAmt;
            ////////////////////////////////

            ContractReVO updateVO = new ContractReVO();
            updateVO.setRetlAmt(retlAmt);
            updateVO.setPromotionAmt(promotionAmt);
            updateVO.setSbstAmt(sbstAmt);
            updateVO.setGoodsAmt(goodsAmt);
            updateVO.setRealCarAmt(realCarAmt);
            updateVO.setEtcSumAmt(etcSumAmt);
            updateVO.setRealPayAmt(realPayAmt);
            updateVO.setDlrCd(contVO.getDlrCd());
            updateVO.setContractNo(contVO.getContractNo());
            contractReDAO.updateContractPrice(updateVO);

            // 용품 갱신
            contractReDAO.deleteContractGoods(searchVO);
            for(ContractReGoodsVO itemVO : goodsItemVO){
                contractReDAO.insertGoods(itemVO);
            }
        }
        return 1;
    }


    /**
     * 대행업무 내역을 계약에 반영하여 저장
     */
    @Override
    public int contractAapMngApply(AapMngVO aapMngVO) throws Exception{

        ContractReSearchVO searchVO = new ContractReSearchVO();
        searchVO.setsDlrCd( aapMngVO.getDlrCd() );
        searchVO.setsContractNo( aapMngVO.getContractNo() );

        List<ContractReVO>  contList = contractReDAO.selectContractResByCondition(searchVO);

        if(contList != null && contList.size() > 0){

            //신규 계약체결관리 계산방식 //
            double realCarAmt = contList.get(0).getRealCarAmt() != null ? contList.get(0).getRealCarAmt() : 0.0 ;
            double goodsAmt = contList.get(0).getGoodsAmt() != null ? contList.get(0).getGoodsAmt() : 0.0;
            double incAmt  = contList.get(0).getIncAmt() != null ? contList.get(0).getIncAmt() : 0.0;
            double fincFeeAmt = contList.get(0).getFincFeeAmt() != null ? contList.get(0).getFincFeeAmt() : 0.0;
            double sbstAmt = contList.get(0).getSbstAmt() != null ? contList.get(0).getSbstAmt() : 0.0;;
            double aapAmt  = aapMngVO.getRegPreAmt() != null ?  aapMngVO.getRegPreAmt() : 0.0;
            double realPayAmt = realCarAmt + goodsAmt + incAmt + fincFeeAmt + sbstAmt + aapAmt;
            ////////////////////////////////

            ContractReVO updatePriceVO = new ContractReVO();
            updatePriceVO.setRealCarAmt(realCarAmt);
            updatePriceVO.setGoodsAmt(goodsAmt);
            updatePriceVO.setIncAmt(incAmt);
            updatePriceVO.setFincFeeAmt(fincFeeAmt);
            updatePriceVO.setSbstAmt(sbstAmt);
            updatePriceVO.setAapAmt(aapAmt);
            updatePriceVO.setRealPayAmt(realPayAmt);
            updatePriceVO.setDlrCd(aapMngVO.getDlrCd());
            updatePriceVO.setContractNo(aapMngVO.getContractNo());
            contractReDAO.updateContractAapMngPrice(updatePriceVO);

            // SA_0220T : 계약 대행업무
            ContractReVO cntVO = new ContractReVO();
            cntVO.setUpdtUsrId(LoginUtil.getUserId());
            cntVO.setDlrCd(aapMngVO.getDlrCd());
            cntVO.setContractNo(aapMngVO.getContractNo());
            cntVO.setRegPreAmt(aapMngVO.getRegPreAmt() );
            cntVO.setRealRegAmt(aapMngVO.getRealRegAmt() );
            cntVO.setRegFeeAmt(aapMngVO.getRegFeeAmt() );
            cntVO.setRegExpcDt(aapMngVO.getRegExpcDt() );
            cntVO.setPurcTaxPreAmt(aapMngVO.getPurcTaxPreAmt() );
            cntVO.setRealPurcTaxAmt(aapMngVO.getRealPurcTaxAmt() );
            contractReDAO.updateReg(cntVO);
        }
        return 1;
    }

}
