package chn.bhmc.dms.sal.veh.service.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService;
import chn.bhmc.dms.crm.cif.service.CustomerRelInfoService;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoVO;
import chn.bhmc.dms.crm.cif.vo.CustomerRelInfoVO;
import chn.bhmc.dms.sal.veh.service.VehicleMasterService;
import chn.bhmc.dms.sal.veh.service.dao.VehicleMasterDAO;
import chn.bhmc.dms.sal.veh.vo.VehicleCustomerInfoVO;
import chn.bhmc.dms.sal.veh.vo.VehicleDeliveryVO;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterIfVO;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterSaveVO;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterVO;
import chn.bhmc.dms.ser.cmm.service.dao.VehOfCustInfoDAO;
import chn.bhmc.dms.ser.cmm.vo.SpeVehiWarrDeadVO;
import chn.bhmc.dms.ser.cmm.vo.VehOfCustInfoSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VehicleMasterServieceImpl.java
 * @Description : 차량마스터 관리
 * @author
 * @since 2016. 1. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 29.     Kim yewon              최초 생성
 * </pre>
 */

@Service("vehicleMasterService")
public class VehicleMasterServiceImpl extends HService implements VehicleMasterService {

    /**
     * 차종 DAO 선언
     */
    @Resource(name="vehicleMasterDAO")
    VehicleMasterDAO vehicleMasterDAO;

    /**
     * Camel Client Factory
     */
    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;

    /**
     * 고객 정보관리
     */
    @Resource(name="customerRelInfoService")
    CustomerRelInfoService customerRelInfoService;

    /**
     * 고객 필수정보
     */
    @Resource(name="customerInfoOutBoundService")
    CustomerInfoOutBoundService customerInfoOutBoundService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;
    
    /**
     * 增加特殊车辆维修工单信息 保修截止日期计算方式 贾明 2019-3-11
     */
    @Resource(name="vehOfCustInfoDAO")
    VehOfCustInfoDAO vehOfCustInfoDAO;
    
    /**
     * 조회 조건에 해당하는 차종 정보를 조회한다.
     */
    @Override
    public List<VehicleMasterVO> selectVehicleMasterByCondition(VehicleMasterSearchVO searchVO) throws Exception {
        List<VehicleMasterVO> list = vehicleMasterDAO.selectVehicleMasterByCondition(searchVO);

        return list;
    }

    /**
     * 조회 조건에 해당하는 차종 총 갯수를 조회한다.
     */
    @Override
    public int selectVehicleMasterByConditionCnt(VehicleMasterSearchVO searchVO) throws Exception {

        if(searchVO.getsStartDt() != null && searchVO.getsEndDt() != null){ //검색시작일과 검색종료일자가 존재하면
            if(searchVO.getsSrchDtType().equals("01")){                     //검색일종류 : 판매일
                searchVO.setsCustSaleDtFrDt(searchVO.getsStartDt());
                searchVO.setsCustSaleDtToDt(searchVO.getsEndDt());
            }else if(searchVO.getsSrchDtType().equals("02")){               //검색일종류 : 공장출고일
                searchVO.setsPltGiDtFrDt(searchVO.getsStartDt());
                searchVO.setsPltGiDtToDt(searchVO.getsEndDt());
            }else if(searchVO.getsSrchDtType().equals("04")){               //검색일종류 : 빈배정일
                searchVO.setsCarVinAllocFrDt(searchVO.getsStartDt());
                searchVO.setsCarVinAllocToDt(searchVO.getsEndDt());
            }else if(searchVO.getsSrchDtType().equals("06")){               //검색일종류 : 입고일
                searchVO.setsDlrGrDtFrDt(searchVO.getsStartDt());
                searchVO.setsDlrGrDtToDt(searchVO.getsEndDt());
            }
        }

        return vehicleMasterDAO.selectVehicleMasterByConditionCnt(searchVO);
    }

    /**
     * CRM : 차량 계약자 정보 조회
     */
    @Override
    public int selectVehicleCustomerInfoByConditionCnt(VehicleMasterSearchVO searchVO) throws Exception {
        return vehicleMasterDAO.selectVehicleCustomerInfoByConditionCnt(searchVO);
    }
    @Override
    public List<VehicleCustomerInfoVO> selectVehicleCustomerInfoByCondition(VehicleMasterSearchVO searchVO) throws Exception {
        return vehicleMasterDAO.selectVehicleCustomerInfoByCondition(searchVO);
    }

    /**
     * 차량마스터 메인 저장한다.
     */
    @Override
    public void saveVehicleMasterMain(VehicleMasterSaveVO saveVO) throws Exception{

        saveVO.getVehicleMasterVO().setRegUsrId(LoginUtil.getUserId());
        saveVO.getVehicleMasterVO().setUpdtUsrId(LoginUtil.getUserId());

        /*현재 엔진번호를 가져와서 비교후 엔진번호가 변경되는 경우엔 엔진번호 변경로직을 태운다. 2017. 07.18*/

        String nowEngineNo = "";
        String changedEngineNo = "";
        String dlrCd = LoginUtil.getDlrCd();
        String ncarDstinCd = "";
        int engineLength = 0;

        nowEngineNo = vehicleMasterDAO.selectNowEngineNo(saveVO.getVehicleMasterVO());
        changedEngineNo = saveVO.getVehicleMasterVO().getEnginSerialNo();
        engineLength = StringUtil.nullConvert(saveVO.getVehicleMasterVO().getEnginSerialNo()).length();
        ncarDstinCd = vehicleMasterDAO.selectNcarDstinCd(saveVO.getVehicleMasterVO());

        saveVO.getVehicleMasterVO().setOldEngineNo(nowEngineNo);

        if(!StringUtil.nullConvert(changedEngineNo).equals(nowEngineNo)){ //엔진번호 변경이 포함

            //자사차량(N)은 무조건 앞6자리=모델, 나머지 뒷자리=시리얼 - 타사차량(L)은 무조건 시리얼에 통으로 넣음 2018.08.02. 최대리랑 이야기 함. LEE.K
            //자사차량만 인터페이스 대상임.
            if(StringUtil.nullConvert(ncarDstinCd).equals("N")){
                Map<String, Object> message = new HashMap<String, Object>();

                message.put("VIN_NO", saveVO.getVehicleMasterVO().getVinNo());
                message.put("OLD_ENGIN_NO", nowEngineNo);
                message.put("NEW_ENGIN_NO", saveVO.getVehicleMasterVO().getEnginSerialNo());
                message.put("DLR_CD", dlrCd);
                message.put("REG_USR_ID", LoginUtil.getUserId());
                message.put("REG_DT", DateUtil.getDate("yyyy-MM-dd HH:mm:ss"));

                CamelClient camelClient = camelClientFactory.createCamelClient();
                camelClient.setIfId("SAL185");
                camelClient.setSender(dlrCd);
                camelClient.setReceiver("SAL");
                camelClient.addSendMessage(message);

                Data receiveData = camelClient.sendRequest();

                if (!receiveData.getFooter().getIfResult().equals("Z")) {
                    throw processException("global.err.dcsIfErrMsg", new String[] { receiveData.getFooter().getIfResult(), receiveData.getFooter().getIfFailMsg() });
                }
                
                /** 发动机号码 在交车检查时，确认交车不进行置空 贾明 2019-2-15*/
                if(engineLength > 6){
                    saveVO.getVehicleMasterVO().setEnginModelCd((saveVO.getVehicleMasterVO().getEnginSerialNo()).substring(0,6));   //엔진모델
                    saveVO.getVehicleMasterVO().setEnginSerialNo((saveVO.getVehicleMasterVO().getEnginSerialNo()).substring(6));    //엔진시리얼
                }
                
                if(!StringUtils.equals(saveVO.getOpFlag(), "JC") && engineLength == 0){
                    saveVO.getVehicleMasterVO().setEnginModelCd(" ");   //엔진모델
                    saveVO.getVehicleMasterVO().setEnginSerialNo(" ");  //엔진시리얼
                }
                
            }
            
            /** 发动机号码 在交车检查时，确认交车不进行置空 贾明 2019-2-15*/
            else if(!StringUtils.equals(saveVO.getOpFlag(), "JC")){
                if(engineLength == 0){
                    saveVO.getVehicleMasterVO().setEnginModelCd(" ");   //엔진모델
                    saveVO.getVehicleMasterVO().setEnginSerialNo(" ");  //엔진시리얼
                }else{
                    saveVO.getVehicleMasterVO().setEnginModelCd(" ");   //엔진모델
                }
            }
            

            vehicleMasterDAO.updateVehicleMasterMain(saveVO.getVehicleMasterVO());

        }else{
        	
        	/** 发动机号码 在交车检查时，确认交车不进行置空 贾明 2019-2-15*/
            if(StringUtil.nullConvert(ncarDstinCd).equals("N")){
              
                if(engineLength > 6){
                    saveVO.getVehicleMasterVO().setEnginModelCd((saveVO.getVehicleMasterVO().getEnginSerialNo()).substring(0,6));   //엔진모델
                    saveVO.getVehicleMasterVO().setEnginSerialNo((saveVO.getVehicleMasterVO().getEnginSerialNo()).substring(6));    //엔진시리얼
                }
                
               
                if(!StringUtils.equals(saveVO.getOpFlag(), "JC") && engineLength == 0){
                    saveVO.getVehicleMasterVO().setEnginModelCd(" ");   //엔진모델
                    saveVO.getVehicleMasterVO().setEnginSerialNo(" ");  //엔진시리얼
                }
                
            } else if(!StringUtils.equals(saveVO.getOpFlag(), "JC")) {

                if(engineLength == 0){
                    saveVO.getVehicleMasterVO().setEnginModelCd(" ");   //엔진모델
                    saveVO.getVehicleMasterVO().setEnginSerialNo(" ");  //엔진시리얼
                }else{
                    saveVO.getVehicleMasterVO().setEnginModelCd(" ");   //엔진모델
                }
            }
            
            

            vehicleMasterDAO.updateVehicleMasterMain(saveVO.getVehicleMasterVO());
        }

        //차량소유자 정보
        if(saveVO.getOwnerGridVO() != null){
            saveVehicleMasterOwner(saveVO);
        }

        //차량운전자 정보
        if(saveVO.getDriverGridVO() != null){
            saveVehicleMasterDriver(saveVO);
        }

        vehicleMasterDAO.vinMasterSyncProc(saveVO.getVehicleMasterVO());

    }


    /**
     * 조회 조건에 해당하는 차량소유자 정보를 조회한다.
     */
    @Override
    public int selectVehicleMasterOwnerByConditionCnt(VehicleMasterSearchVO searchVO) throws Exception {
        return vehicleMasterDAO.selectVehicleMasterOwnerByConditionCnt(searchVO);
    }
    @Override
    public List<VehicleMasterVO> selectVehicleMasterOwnerByCondition(VehicleMasterSearchVO searchVO) throws Exception {
        return vehicleMasterDAO.selectVehicleMasterOwnerByCondition(searchVO);
    }

    /**
     * 차량소유자 저장한다.
     */
    @Override
    public void saveVehicleMasterOwner(VehicleMasterSaveVO saveVO) throws Exception{

    	String carId = "";
    	if(saveVO.getVehicleMasterVO() == null){
    		if(saveVO.getOwnerGridVO().getUpdateList() == null || saveVO.getOwnerGridVO().getUpdateList().isEmpty()){
    			carId = saveVO.getOwnerGridVO().getInsertList().get(0).getCarId();
    		}else {
    			carId = saveVO.getOwnerGridVO().getUpdateList().get(0).getCarId();
    		}

    	}else {
    		carId = saveVO.getVehicleMasterVO().getCarId();
    	}

        // 저장
        for(VehicleMasterVO vo : saveVO.getOwnerGridVO().getInsertList()){
            vo.setUpdtUsrId(LoginUtil.getUserId());     // 사용자
            vo.setRegUsrId(LoginUtil.getUserId());
            vo.setCarId(carId);

            vehicleMasterDAO.insertVehicleOwner(vo);
            if(vo.getUseYn().equals("Y")){
                vehicleMasterDAO.updateOwnerNonUsed(vo);

                CustomerInfoVO infoVO = new CustomerInfoVO();
                infoVO.setCommandTp("CARMASTER");
                infoVO.setCustNo(vo.getBpCd());
                customerInfoOutBoundService.updateCustomer(infoVO);
            }
        }

        // 수정
        for(VehicleMasterVO vo : saveVO.getOwnerGridVO().getUpdateList()){
            vo.setUpdtUsrId(LoginUtil.getUserId());     // 사용자
            vo.setRegUsrId(LoginUtil.getUserId());
            vo.setCarId(carId);
            vehicleMasterDAO.updateVehicleOwner(vo);

            CustomerInfoVO infoVO = new CustomerInfoVO();
            infoVO.setCommandTp("CARMASTER");
            infoVO.setCustNo(vo.getBpCd());
            customerInfoOutBoundService.updateCustomer(infoVO);
        }
    }

    /**
     * 조회 조건에 해당하는 차량소유자 정보를 조회한다.
     */
    @Override
    public int selectVehicleMasterDriverByConditionCnt(VehicleMasterSearchVO searchVO) throws Exception {
        return vehicleMasterDAO.selectVehicleMasterDriverByConditionCnt(searchVO);
    }
    @Override
    public List<VehicleMasterVO> selectVehicleMasterDriverByCondition(VehicleMasterSearchVO searchVO) throws Exception {
        return vehicleMasterDAO.selectVehicleMasterDriverByCondition(searchVO);
    }

    /**
     * 차량운전자 저장한다.
     */
    @Override
    public void saveVehicleMasterDriver(VehicleMasterSaveVO saveVO) throws Exception{
    	String carId = saveVO.getVehicleMasterVO().getCarId();

        // 저장
        for(VehicleMasterVO vo : saveVO.getDriverGridVO().getInsertList()){
            vo.setUpdtUsrId(LoginUtil.getUserId());     // 사용자
            vo.setRegUsrId(LoginUtil.getUserId());
            vo.setCarId(carId);

            if(vo.getUseYn().equals("N")){
                vo.setMdriverYn("N");
            }
            vehicleMasterDAO.insertVehicleDriver(vo);
            if(vo.getUseYn().equals("Y") ){
                vehicleMasterDAO.updateNonMdriver(vo);
            }

            VehicleMasterSearchVO searchVO = new VehicleMasterSearchVO();
            searchVO.setsDlrCd(vo.getDlrCd());
            searchVO.setsCarId(vo.getCarId());
            searchVO.setsUseYn("Y");
            List<VehicleMasterVO> ownList = selectVehicleMasterOwnerByCondition(searchVO);
            String ownCd = "";
            if(ownList != null && ownList.size() > 0){
                ownCd = ownList.get(0).getBpCd();
            }
            CustomerRelInfoVO custInfo = null;
            if(StringUtils.isNotEmpty(ownCd) && StringUtils.isNotEmpty(vo.getBpCd()) && !ownCd.equals(vo.getBpCd()) ){
                custInfo = new CustomerRelInfoVO();
                custInfo.setUpperCustNo(ownCd);
                custInfo.setPconCustNo(vo.getBpCd());
                custInfo.setPconTp("07");       // 수리요청인 CRM030: '07'
                customerRelInfoService.insertCustomerRelInfo(custInfo);
            }
        }

        // 수정
        for(VehicleMasterVO vo : saveVO.getDriverGridVO().getUpdateList()){
            vo.setUpdtUsrId(LoginUtil.getUserId());     // 사용자
            vo.setRegUsrId(LoginUtil.getUserId());
            vo.setCarId(carId);

            if(vo.getUseYn().equals("N")){
                vo.setMdriverYn("N");
            }
            vehicleMasterDAO.updateVehicleDriver(vo);
            if(vo.getUseYn().equals("Y") && vo.getMdriverYn().equals("Y")){
                vehicleMasterDAO.updateNonMdriver(vo);
            }
        }

    }

    /**
     * [서비스모듈] 차량운전자 저장한다.
     */
    @Override
    public int insertVehicleMasterDriverService(VehicleMasterVO vo) throws Exception{
        vo.setUpdtUsrId(LoginUtil.getUserId());     // 사용자
        vo.setRegUsrId(LoginUtil.getUserId());

        vehicleMasterDAO.insertVehicleDriver(vo);
        vehicleMasterDAO.updateNonMdriver(vo);      // 차량운전자의 주운전자여부를 N으로 변경

        return 1;
    }

    /**
     * 조회 조건에 해당하는 옵션 정보를 조회한다.
     */
    @Override
    public int selectVehicleMasterOptionsByConditionCnt(VehicleMasterSearchVO searchVO) throws Exception {
        return vehicleMasterDAO.selectVehicleMasterOptionsByConditionCnt(searchVO);
    }
    @Override
    public List<VehicleMasterVO> selectVehicleMasterOptionsByCondition(VehicleMasterSearchVO searchVO) throws Exception {
        return vehicleMasterDAO.selectVehicleMasterOptionsByCondition(searchVO);
    }

    /**
     * 옵션 저장한다.
     */
    @Override
    public int saveVehicleMasterOption(VehicleMasterSaveVO saveVO) throws Exception{

        // 저장
        for(VehicleMasterVO vo : saveVO.getInsertOptionList()){
            vo.setUpdtUsrId(LoginUtil.getUserId());     // 사용자
            vo.setRegUsrId(LoginUtil.getUserId());

            vehicleMasterDAO.insertVehicleOption(vo);
        }

        // 수정
        for(VehicleMasterVO vo : saveVO.getUpdateOptionList()){
            vo.setUpdtUsrId(LoginUtil.getUserId());     // 사용자
            vo.setRegUsrId(LoginUtil.getUserId());

            vehicleMasterDAO.updateVehicleOption(vo);
        }

        return 1;
    }

    /**
     * 조회 조건에 해당하는 계약 정보를 조회한다.
     */
    @Override
    public int selectVehicleMasterContractsByConditionCnt(VehicleMasterSearchVO searchVO) throws Exception {
        return vehicleMasterDAO.selectVehicleMasterContractsByConditionCnt(searchVO);
    }
    @Override
    public List<VehicleMasterVO> selectVehicleMasterContractsByCondition(VehicleMasterSearchVO searchVO) throws Exception {
        List<VehicleMasterVO> list = vehicleMasterDAO.selectVehicleMasterContractsByCondition(searchVO);
        HashMap<String, String> incCmpMap = new HashMap<String, String>();
        String langCd = LocaleContextHolder.getLocale().getLanguage();
        for(CommonCodeVO vo : commonCodeService.selectCommonCodesByCmmGrpCd("SAL127", null, langCd)){
            incCmpMap.put(vo.getCmmCd(), vo.getCmmCdNm());
        }
        for(VehicleMasterVO vo : list){
            vo.setIncCmpCd(incCmpMap.get(vo.getIncCmpCd()));
        }
        return list;
    }

    /**
     * 조회 조건에 해당하는 주문 정보를 조회한다.
     */
    @Override
    public int selectVehicleMasterOrdersByConditionCnt(VehicleMasterSearchVO searchVO) throws Exception {
        return vehicleMasterDAO.selectVehicleMasterOrdersByConditionCnt(searchVO);
    }
    @Override
    public List<VehicleMasterVO> selectVehicleMasterOrdersByCondition(VehicleMasterSearchVO searchVO) throws Exception {
        return vehicleMasterDAO.selectVehicleMasterOrdersByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 재고 정보를 조회한다.
     */
    @Override
    public int selectVehicleMasterStocksByConditionCnt(VehicleMasterSearchVO searchVO) throws Exception {
        return vehicleMasterDAO.selectVehicleMasterStocksByConditionCnt(searchVO);
    }
    @Override
    public List<VehicleMasterVO> selectVehicleMasterStocksByCondition(VehicleMasterSearchVO searchVO) throws Exception {
        return vehicleMasterDAO.selectVehicleMasterStocksByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 엔진변경이력을 조회한다.
     */
    @Override
    public List<VehicleMasterVO> selectVehicleMasterEngineHistory(VehicleMasterSearchVO searchVO) throws Exception {

        String dlrCd = LoginUtil.getDlrCd();

        Map<String, Object> messageSrch = new HashMap<String, Object>();
        messageSrch.put("VIN_NO", searchVO.getsVinNo());          //VIN Number

        CamelClient camelClientSrch = camelClientFactory.createCamelClient();

        camelClientSrch.setIfId("SAL186");           // service id
        camelClientSrch.setSender(dlrCd);
        camelClientSrch.setReceiver("SAL");
        camelClientSrch.addSendMessage(messageSrch);

        Data receiveDataSrch = camelClientSrch.sendRequest();

        List<VehicleMasterIfVO> engineIfList = new ArrayList<VehicleMasterIfVO>();
        List<VehicleMasterVO> engineList = new ArrayList<VehicleMasterVO>();

        if (receiveDataSrch.getFooter().getIfResult().equals("Z")) {

            engineIfList = receiveDataSrch.readMessages(VehicleMasterIfVO.class);

            VehicleMasterVO vehicleMasterVO = new VehicleMasterVO();

            for(int i = 0 ; i <  engineIfList.size() ; i++){
                vehicleMasterVO = new VehicleMasterVO();

                vehicleMasterVO.setSeq(engineIfList.get(i).getSeq());
                vehicleMasterVO.setVinNo(StringUtil.isNullToString(engineIfList.get(i).getVinNo()));
                vehicleMasterVO.setOldEngineNo(StringUtil.isNullToString(engineIfList.get(i).getOldEnginNo()));
                vehicleMasterVO.setNewEngineNo(StringUtil.isNullToString(engineIfList.get(i).getNewEnginNo()));
                vehicleMasterVO.setDlrCd(StringUtil.isNullToString(engineIfList.get(i).getDlrCd()));
                vehicleMasterVO.setRegUsrId(StringUtil.isNullToString(engineIfList.get(i).getRegUsrId()));
                vehicleMasterVO.setRegDtChar(StringUtil.isNullToString(engineIfList.get(i).getRegDtChar()));
                vehicleMasterVO.setRegDt(engineIfList.get(i).getRegDt());

                engineList.add(vehicleMasterVO);
            }

        } else {
            throw processException("global.err.dcsIfErrMsg", new String[] { receiveDataSrch.getFooter().getIfResult(), receiveDataSrch.getFooter().getIfFailMsg() });
        }

        return engineList;
    }

    /**
     * 조회 조건에 해당하는 차량마스터관리 - PopUp목록을 조회한다.
     */
    @Override
    public int selectVehicleMasterStsByConditionCnt(VehicleMasterSearchVO searchVO) throws Exception {
        return vehicleMasterDAO.selectVehicleMasterStsByConditionCnt(searchVO);
    }
    @Override
    public List<VehicleMasterVO> selectVehicleMasterStsByCondition(VehicleMasterSearchVO searchVO) throws Exception {
        return vehicleMasterDAO.selectVehicleMasterStsByCondition(searchVO);
    }

    @Override
    public int selectVehicleVinNo(VehicleMasterSearchVO searchVO) throws Exception {
        return vehicleMasterDAO.selectVehicleVinNo(searchVO);
    }


    //정비에서 필요되는 신차정보 저장 로직.
    @Override
    public String saveNewCar(VehicleMasterVO saveVO) throws Exception{

        int newCarCnt = 0;

        if(!StringUtil.nullConvert(saveVO.getVinNo()).equals("")){
            newCarCnt = vehicleMasterDAO.selectNewVinNoChkCnt(saveVO);
        }else{
            newCarCnt = vehicleMasterDAO.selectNewVinNoCnt(saveVO);

        }

        if(newCarCnt == 0){
/*
            if(vehicleMasterDAO.selectVinNoCnt(saveVO) > 0){
                // 이미 등록되여있는 VIN NO입니다.[판매차량마스터 참조]
                throw processException("sal.info.registedVehicleMasterVinNo");
            }
*/
            saveVO.setRegUsrId(LoginUtil.getUserId());              // 등록자
            saveVO.setDlrCd(LoginUtil.getDlrCd());                  // 딜러
            saveVO.setOrdDlrCd(LoginUtil.getDlrCd());
            vehicleMasterDAO.insertNewCar(saveVO);
        }else {
            saveVO.setUpdtUsrId(LoginUtil.getUserId());             // 등록자
            saveVO.setDlrCd(LoginUtil.getDlrCd());                  // 딜러
            saveVO.setOrdDlrCd(LoginUtil.getDlrCd());
            vehicleMasterDAO.updateNewCar(saveVO);
        }

        return saveVO.getCarId();
    }

    /**
     * 조회 조건에 해당하는 차량마스터관리 - 차량입출고내역을 조회한다.
     */
    @Override
    public int selectVehicleMasterDeliveryHistCnt(VehicleMasterSearchVO searchVO) throws Exception {
        return vehicleMasterDAO.selectVehicleMasterDeliveryHistCnt(searchVO);
    }
    @Override
    public List<VehicleMasterVO> selectVehicleMasterDeliveryHist(VehicleMasterSearchVO searchVO) throws Exception {
        return vehicleMasterDAO.selectVehicleMasterDeliveryHist(searchVO);
    }

    /**
     * 차량 출고내역 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    @Override
    public List<VehicleDeliveryVO> selectVehicleDeliverySearch(VehicleMasterSearchVO searchVO) throws Exception{
        return vehicleMasterDAO.selectVehicleDeliverySearch(searchVO);
    }


    /**
    *
    * CamelClent
    *
    * @param pwaVO
    * @return
    * @throws Exception
    */
   public boolean executeCamelClent(Map<String, Object> message , String ifId)throws Exception{


       boolean result  =  false;
        CamelClient camelClient = camelClientFactory.createCamelClient();
        camelClient.addSendMessage(message);
        camelClient.setSender(LoginUtil.getDlrCd());

        camelClient.setIfId(ifId);
        Data receiveData = null;
        try{
            receiveData =  camelClient.sendRequest();

            result  =  (receiveData.getFooter().getIfResult().equals("Z")) ? true : false;
            log.info("executeCamelClent result " + result + " / IfResult"+receiveData.getFooter().getIfResult());
            if(!receiveData.getFooter().getIfResult().equals("Z")){
                throw processException("global.err.dcsIfErrMsg", new String[] { receiveData.getFooter().getIfResult(), receiveData.getFooter().getIfFailMsg() });
            }
        }catch(Exception e){
            //throw new Exception(e.getMessage());
            throw processException("global.err.dcsIfErrMsg", new String[]{e.getMessage()});
        }
       return result;
   }

   /**
    *
    * CamelClent
    *
    * @param pwaVO
    * @return
    * @throws Exception
    */
   public Data executeCamelClentSearchResult(Map<String, Object> message , String ifId)throws Exception{

       CamelClient camelClient = camelClientFactory.createCamelClient();
       camelClient.addSendMessage(message);
       camelClient.setSender(LoginUtil.getDlrCd());

       camelClient.setIfId(ifId);

       Data receiveData =  null;

       try{
            receiveData =  camelClient.sendRequest();
           if(!receiveData.getFooter().getIfResult().equals("Z")){
               throw processException("global.err.dcsIfErrMsg", new String[] { receiveData.getFooter().getIfResult(), receiveData.getFooter().getIfFailMsg() });
           }
       }catch(Exception e){
           //throw new Exception(e.getMessage()); messageSource.getMessage("ser.lbl.quest", null, LocaleContextHolder.getLocale())}
           throw processException("global.err.dcsIfErrMsg", new String[]{e.getMessage()});
       }
       return receiveData;
   }

    /**
     * DCS Vehicle data Searching
     */
    public List<VehicleMasterVO> selectDcsVehicleInfo(VehicleMasterSearchVO searchVO) throws Exception {

        Map<String, Object> message = new HashMap<String, Object>();

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }

        message.put("DLR_CD", searchVO.getsDlrCd());          //Dealer Code
        message.put("VIN_NO", searchVO.getsVinNo());          //VIN Number
        message.put("CARLINE_CD", searchVO.getsCarlineCd());  //Car Line Code
        message.put("CAR_REG_NO", searchVO.getsCarRegNo());   //Car Regist Number

        CamelClient camelClient = camelClientFactory.createCamelClient();
        camelClient.setIfId("SAL126");           // service id
        camelClient.setSender(searchVO.getsDlrCd());
        camelClient.addSendMessage(message);

        Data receiveData = camelClient.sendRequest();

        List<VehicleMasterVO> vehicleList = new ArrayList<VehicleMasterVO>();
        List<VehicleMasterIfVO> vehicleIfList = new ArrayList<VehicleMasterIfVO>();

        // TODO [김경목] 추후변경(IF)
        if (receiveData.getFooter().getIfResult().equals("Z")) {
            vehicleIfList = receiveData.readMessages(VehicleMasterIfVO.class);
            VehicleMasterVO vehicleMasterVO = new VehicleMasterVO();

            for(int i = 0 ; i <  vehicleIfList.size() ; i++){
                vehicleMasterVO = new VehicleMasterVO();
                vehicleMasterVO.setVinNo(StringUtil.isNullToString(vehicleIfList.get(i).getVinNo()));                   //VIN Number
                vehicleMasterVO.setCarRunDistVal(StringUtil.isNullToString(vehicleIfList.get(i).getCarRunDstVal()));    //CarRunDistVal
                vehicleMasterVO.setCarRegNo(StringUtil.isNullToString(vehicleIfList.get(i).getTemp1()));             //CAR_REG_NO
                vehicleMasterVO.setDlrCd(StringUtil.isNullToString(vehicleIfList.get(i).getDlrCd()));                   //Dealer Code
                vehicleMasterVO.setCarId(StringUtil.isNullToString(vehicleIfList.get(i).getCarId()));                   //Vehicle ID
                vehicleMasterVO.setNcarDstinCd(StringUtil.isNullToString(vehicleIfList.get(i).getNcarDstinCd()));       //BHMC Yes or No
                vehicleMasterVO.setModelNm(StringUtil.isNullToString(vehicleIfList.get(i).getModelCd()));

                vehicleList.add(vehicleMasterVO);
            }

        } else {
            throw processException("global.err.dcsIfErrMsg", new String[] { receiveData.getFooter().getIfResult(), receiveData.getFooter().getIfFailMsg() });
        }
        return vehicleList;
    }

    /**
     * DCS Vehicle data Gathering
     */
    public List<VehicleMasterVO> selectDcsVehicleInfoGathering(VehicleMasterSearchVO searchVO) throws Exception {

        Map<String, Object> message = new HashMap<String, Object>();

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }

        message.put("DLR_CD", searchVO.getsDlrCd());          //Dealer Code
        message.put("VIN_NO", searchVO.getsVinNo());          //VIN Number

        CamelClient camelClient = camelClientFactory.createCamelClient();
        camelClient.setIfId("SAL127");           // service id
        camelClient.setSender(searchVO.getsDlrCd());
        camelClient.addSendMessage(message);

        Data receiveData = camelClient.sendRequest();

        List<VehicleMasterVO> vehicleList = new ArrayList<VehicleMasterVO>();
        List<VehicleMasterIfVO> vehicleIfList = new ArrayList<VehicleMasterIfVO>();

        if (receiveData.getFooter().getIfResult().equals("Z")) {
            vehicleIfList = receiveData.readMessages(VehicleMasterIfVO.class);
            VehicleMasterVO vehicleMasterVO = new VehicleMasterVO();

            for(int i = 0 ; i <  vehicleIfList.size() ; i++){
                vehicleMasterVO = new VehicleMasterVO();

                vehicleMasterVO.setVinNo(StringUtil.isNullToString(vehicleIfList.get(i).getVinNo()));   //VIN Number
                vehicleMasterVO.setCustNo(StringUtil.isNullToString(vehicleIfList.get(i).getCustNo())); //Customer Number
                vehicleMasterVO.setCustNm(StringUtil.isNullToString(vehicleIfList.get(i).getCustNm())); //Customer Name
                vehicleMasterVO.setDlrCd(StringUtil.isNullToString(vehicleIfList.get(i).getDlrCd()));   //Dealer Code
                vehicleMasterVO.setBhmcYn(StringUtil.isNullToString(vehicleIfList.get(i).getBhmcYn())); //BHMC Yes or No
                vehicleMasterVO.setTelNo(StringUtil.isNullToString(vehicleIfList.get(i).getTelNo()));   //Telephone Number
                vehicleMasterVO.setHpNo(StringUtil.isNullToString(vehicleIfList.get(i).getHpNo()));     //Mobile Number
                vehicleMasterVO.setCarId(StringUtil.isNullToString(vehicleIfList.get(i).getCarId()));   //Vehicle ID

                vehicleList.add(vehicleMasterVO);
            }

        } else {
            throw processException("global.err.dcsIfErrMsg", new String[] { receiveData.getFooter().getIfResult(), receiveData.getFooter().getIfFailMsg() });
        }
        return vehicleList;
    }

    /**
     * [CRM 전용]:고객번호로 자사보유차량 대수/타사보유차량 대수 산출
     **/
    @Override
    public List<VehicleMasterVO> selectVehicleCustCntSearch(VehicleMasterSearchVO searchVO) throws Exception{
        return vehicleMasterDAO.selectVehicleCustCntSearch(searchVO);
    }

    @Override
    public List<VehicleMasterVO> selectWrrntEndDt(VehicleMasterSearchVO searchVO) throws Exception {
    	//增加特殊车辆维修工单信息 保修截止日期计算方式 贾明 2019-3-14 start
    	List<VehicleMasterVO> list = new ArrayList<VehicleMasterVO>();
    	VehOfCustInfoSearchVO vehSerchVO = new VehOfCustInfoSearchVO();
    	vehSerchVO.setsVinNo(searchVO.getsVinNo());
    	List<SpeVehiWarrDeadVO> speVehiWaDeVO = vehOfCustInfoDAO.selectSpecialVehicleWarrDeadInfo(vehSerchVO);
    	if(speVehiWaDeVO.size() > 0){
    		int normWarrper = speVehiWaDeVO.get(0).getNormWarrPer();//正常保修保修期 月份
    		Date  grteStartDt = searchVO.getsCustSaleDt();//保修开始日期
    		Date  grteEndDate = DateUtil.add(grteStartDt, Calendar.MONTH, normWarrper);
    		Date  grteEndDt = DateUtil.add(grteEndDate, Calendar.DATE, -1);
    		VehicleMasterVO vehicleMasterVO = new VehicleMasterVO();
    		vehicleMasterVO.setWrrntEndDt(grteEndDt);
    		list.add(vehicleMasterVO);
    		//增加特殊车辆维修工单信息 保修截止日期计算方式 贾明 2019-3-14  end
    	} else {
    		//List<VehicleMasterVO> list = vehicleMasterDAO.selectWrrntEndDt(searchVO);
    		list = vehicleMasterDAO.selectWrrntEndDt(searchVO);
    	} 
        

        return list;
    }

    @Override
    public void updateCarAfterVerify(VehicleMasterVO vehicleMasterVO) throws Exception {
        vehicleMasterDAO.updateCarAfterVerify(vehicleMasterVO);
    }

    @Override
    public VehicleMasterVO selectCarInfoByCarId(String carId) {
        return vehicleMasterDAO.selectCarInfoByCarId(carId);
    }
    
    /**
     * <p>Title:绑定车架号-查询车辆信息数量 </p >
     * @author TangWei 2021年4月15日 下午4:43:27
     * @param VehicleMasterSearchVO searchVO
     * @return
     */
    @Override
    public int selectBindingVinNoCarInfoCnt(VehicleMasterSearchVO searchVO) throws Exception {
        return vehicleMasterDAO.selectBindingVinNoCarInfoCnt(searchVO);  
    }  
    
    /**
     * <p>Title:绑定车架号-查询车辆信息数据 </p >
     * @author TangWei 2021年4月15日 下午4:43:38
     * @param VehicleMasterSearchVO searchVO
     * @return
     */
    @Override
    public List<VehicleMasterVO> selectBindingVinNoCarInfoData(VehicleMasterSearchVO searchVO) throws Exception {
        return vehicleMasterDAO.selectBindingVinNoCarInfoData(searchVO);
    }

}