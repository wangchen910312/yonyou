package chn.bhmc.dms.sal.dlv.service.impl;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cif.service.CustomerInfoService;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoVO;
import chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtOutBoundService;
import chn.bhmc.dms.crm.cso.service.dao.SalesOpptProcessMgmtDAO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtVO;
import chn.bhmc.dms.crm.dmm.service.BlueMembershipJoinSupportService;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfConsumeRapVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfInfoRapVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipJoinVO;
import chn.bhmc.dms.sal.acc.service.AccessoryItemSalesService;
import chn.bhmc.dms.sal.acc.vo.AccessoryItemSalesVO;
import chn.bhmc.dms.sal.acu.service.ContBeforeMngService;
import chn.bhmc.dms.sal.acu.vo.ContBeforeMngSearchVO;
import chn.bhmc.dms.sal.acu.vo.ContBeforeMngVO;
import chn.bhmc.dms.sal.cmm.service.SalesCommonCamelService;
import chn.bhmc.dms.sal.cnt.service.ContractMntService;
import chn.bhmc.dms.sal.cnt.vo.ContractReSearchVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReVO;
import chn.bhmc.dms.sal.ctl.service.DeadlineCtrlMngService;
import chn.bhmc.dms.sal.ctl.vo.DeadlineCtrlMngSearchVO;
import chn.bhmc.dms.sal.dlv.service.ContDeliveryMngService;
import chn.bhmc.dms.sal.dlv.service.dao.ChargingPileDAO;
import chn.bhmc.dms.sal.dlv.service.dao.ContDeliveryMngDAO;
import chn.bhmc.dms.sal.dlv.vo.ChargingPileVO;
import chn.bhmc.dms.sal.dlv.vo.ContDeliverySearchVO;
import chn.bhmc.dms.sal.dlv.vo.ContDeliveryVO;
import chn.bhmc.dms.sal.dlv.vo.NewEnergyVSApplicationVO;
import chn.bhmc.dms.sal.fim.service.FincInfoMngService;
import chn.bhmc.dms.sal.fim.vo.FincInfoMngVO;
import chn.bhmc.dms.sal.inc.service.IncJoinInfoService;
import chn.bhmc.dms.sal.inc.vo.IncJoinInfoSaveVO;
import chn.bhmc.dms.sal.inc.vo.IncJoinInfoSearchVO;
import chn.bhmc.dms.sal.inc.vo.IncJoinInfoVO;
import chn.bhmc.dms.sal.inv.service.StockStrategyService;
import chn.bhmc.dms.sal.inv.vo.StockStrategySearchVO;
import chn.bhmc.dms.sal.inv.vo.StockStrategyVO;
import chn.bhmc.dms.sal.veh.service.VehicleMasterService;
import chn.bhmc.dms.sal.veh.vo.VehicleDeliveryVO;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterSaveVO;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterVO;
import chn.bhmc.dms.ser.cmm.service.ServiceCommonService;
import chn.bhmc.dms.ser.svi.service.BayManageService;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ContDeliveryMngServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author
 * @since 2016. 10. 23
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 10. 23      yewon.kim              최초 생성
 * </pre>
 */

@Service("contDeliveryMngService")
public class ContDeliveryMngServiceImpl extends HService implements ContDeliveryMngService {

	//2019/06/14 qiandelai 修复充电桩发送数据 start
	@Autowired
    SalesCommonCamelService salesCommonCamelService;
	
	@Resource(name="chargingPileDAO")
    ChargingPileDAO chargingPileDAO;
	//2019/06/14 qiandelai 修复充电桩发送数据 end
    /**
     * 배정관리 DAO 선언
     */
    @Resource(name="contDeliveryMngDAO")
    ContDeliveryMngDAO contDeliveryMngDAO;

    @Resource(name="contDeliveryMngService")
    ContDeliveryMngService contDeliveryMngService;
    
    @Resource(name="retailContractOrdNoIdgenService")
    TableIdGenService retailContractOrdNoIdgenService;
    /**
     * 마감시간 체크
     */
    @Resource(name="deadlineCtrlMngService")
    DeadlineCtrlMngService deadlineCtrlMngService;

    @Resource(name="chargingPileUid")
    EgovIdGnrService chargingPileUid;

    /**
     * 차량마스터 서비스
     */
    @Resource(name="vehicleMasterService")
    VehicleMasterService vehicleMasterService;


    /**
     * bay관리 - 서비스(정비)
     */
    @Resource(name="bayManageService")
    BayManageService bayManageService;


    /**
     * 고객정보 서비스
     */
    @Resource(name="customerInfoService")
    CustomerInfoService customerInfoService;

    /**
     * 보험가입정보관리 서비스
     */
    @Resource(name="incJoinInfoService")
    IncJoinInfoService incJoinInfoService;

    /**
     * 금융정보관리 서비스
     */
    @Resource(name="fincInfoMngService")
    FincInfoMngService fincInfoMngService;

    /**
     * 용품 서비스
     */
    @Resource(name="accessoryItemSalesService")
    AccessoryItemSalesService accessoryItemSalesService;

    /**
     * CRM 판매기회 관리 서비스
     */
    @Resource(name="salesOpptProcessMgmtOutBoundService")
    SalesOpptProcessMgmtOutBoundService salesOpptProcessMgmtOutBoundService;

    /**
     * 계약정보
     */
    @Resource(name="contractMntService")
    ContractMntService contractMntService;

    /**
     * 블루멤버십 서비스
     */
    @Resource(name="blueMembershipJoinSupportService")
    BlueMembershipJoinSupportService blueMembershipJoinSupportService;

    /**
     * camelClient
     */
    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;

    /**
     * 정비 공통 서비스
     */
    @Resource(name="serviceCommonService")
    ServiceCommonService serviceCommonService;

    /**
     * 전략출고 서비스
     */
    @Resource(name="stockStrategyService")
    StockStrategyService stockStrategyService;

    /**
     * 예약판매 서비스
     */
    @Resource(name="contBeforeMngService")
    ContBeforeMngService contBeforeMngService;
    /**
     *  贾明 2020-5-9 
     * CRS76 不能申请充电装的订单类型，除了试驾车N7以外，现在又增加了新的订单类型的需求，具体明细见excel
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;
    
    @Resource(name="salesOpptProcessMgmtDAO")
    SalesOpptProcessMgmtDAO salesOpptProcessMgmtDAO;
    /**
     * 조회 조건에 해당하는 고객인도정보를 조회한다.
     */
    @Override
    public List<ContDeliveryVO> selectContDeliveryByCondition(ContDeliverySearchVO searchVO) throws Exception {
        if(StringUtils.isBlank(searchVO.getsDlrCd())){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return contDeliveryMngDAO.selectContDeliveryByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 고객인도목록 총 갯수를 조회한다.
     */
    @Override
    public int selectContDeliveryByConditionCnt(ContDeliverySearchVO searchVO) throws Exception {
        if(StringUtils.isBlank(searchVO.getsDlrCd())){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return contDeliveryMngDAO.selectContDeliveryByConditionCnt(searchVO);
    }



    /**
     * 조회 조건에 해당하는 차량정보목록을 조회한다.
     */
    @Override
    public List<ContDeliveryVO> selectDeliveryVehicleByCondition(ContDeliverySearchVO searchVO) throws Exception {
        return contDeliveryMngDAO.selectDeliveryVehicleByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 차량정보목록 총 갯수를 조회한다.
     */
    @Override
    public int selectDeliveryVehicleByConditionCnt(ContDeliverySearchVO searchVO) throws Exception {
        return contDeliveryMngDAO.selectDeliveryVehicleByConditionCnt(searchVO);
    }

    /**
     * 고객인도관리
     */
    @Override
    public boolean updateVehicleContDelivery(ContDeliveryVO contDeliveryVO) throws Exception {

        // 고객인도시 마감확인
        DeadlineCtrlMngSearchVO deadLineVO = new DeadlineCtrlMngSearchVO();
        deadLineVO.setsCtrlGrpCd("Y");                      // 소매
        deadLineVO.setsCtrlDlrCd(LoginUtil.getDlrCd());     // 딜러코드
        deadLineVO.setsCtrlTargCd("Y01");                   // 소매처리
//        if(deadlineCtrlMngService.selectOneShotCheck(deadLineVO) > 0){
//            // [소매처리]는 마감되었습니다.
//            throw processException("sal.info.deliveryCheckMsg");
//        }

        VehicleMasterSearchVO vehicleMasterSearchVO = new VehicleMasterSearchVO();
        vehicleMasterSearchVO.setsVinNo(contDeliveryVO.getVinNo());
//        if(vehicleMasterService.selectVehicleVinNo(vehicleMasterSearchVO) == 0){
//            // 차량마스터에 해당 VIN이 존재하지 않습니다.
//            throw processException("sal.err.vehicleMasterNotVinNo");
//        }

        // 기타업무 상태확인
        selectContractEtcWorkCheck(contDeliveryVO);

        // 계약 Vin상태조정
        setContractVinNo(contDeliveryVO);

        ContDeliveryVO sVinInfoVO = new ContDeliveryVO();
        sVinInfoVO.setDlrCd(contDeliveryVO.getDlrCd());
        sVinInfoVO.setVinNo(contDeliveryVO.getVinNo());
        String temp4 = contDeliveryMngDAO.selectVinTempSearch(sVinInfoVO);
        if(StringUtils.isBlank(temp4)){
            contDeliveryVO.setTemp4("S");   // Temp4 입력
        }else{
            contDeliveryVO.setTemp4(temp4);
        }

        contDeliveryMngDAO.updateVehicleContDelivery(contDeliveryVO);
        contDeliveryMngDAO.updateContractDelivery(contDeliveryVO);

        // 소유자정보 변경(useYn = 'N')
        VehicleMasterSaveVO saveVO = new VehicleMasterSaveVO();
        List<VehicleMasterVO> insertOwnerList = new ArrayList<VehicleMasterVO>();
        VehicleMasterVO vo = new VehicleMasterVO();
        vo.setVinNo(contDeliveryVO.getVinNo());
        vo.setDlrCd(contDeliveryVO.getDlrCd());
        vo.setBpCd(contDeliveryVO.getContractCustNo());
        vo.setUseYn("Y");
        vo.setTxtObjectCd(contDeliveryVO.getSsnCrnNo());
        String carId = contDeliveryMngDAO.selectCarId(contDeliveryVO);
        vo.setCarId(carId);
        insertOwnerList.add(0, vo);
        saveVO.getOwnerGridVO().setInsertList(insertOwnerList);
        vehicleMasterService.saveVehicleMasterOwner(saveVO);

        saveVO = new VehicleMasterSaveVO();
        vo.setMdriverYn("Y");       // 주요운전자
        vo.setCarOwnerRelCd("01");  // 본인
        saveVO.setVehicleMasterVO(vo);
        saveVO.getDriverGridVO().setInsertList(insertOwnerList);

        // 운전자 등록( 소유자와 동일로 변경 )
        vehicleMasterService.saveVehicleMasterDriver(saveVO);

        // 계약 차량정보 저장
        updateCarInfo(contDeliveryVO.getContractNo(), carId);

        // 보험 차량정보 변경(VIN_NO UPDATE)
        IncJoinInfoSaveVO incJoinSaveVO = new IncJoinInfoSaveVO();
        IncJoinInfoVO incJoinVO = new IncJoinInfoVO();
        IncJoinInfoSearchVO incSearchVO = new IncJoinInfoSearchVO();
        incSearchVO.setsDlrCd(contDeliveryVO.getDlrCd());
        incSearchVO.setsContractNo(contDeliveryVO.getContractNo());
        incSearchVO.setsCustNo(contDeliveryVO.getContractCustNo());
        IncJoinInfoVO incVO = incJoinInfoService.selectIncNo(incSearchVO);
        if(incVO != null ){
            incJoinVO.setDlrCd(contDeliveryVO.getDlrCd());
            incJoinVO.setVinNo(contDeliveryVO.getVinNo());
            incJoinVO.setContractNo(contDeliveryVO.getContractNo());
            incJoinVO.setCustNo(contDeliveryVO.getContractCustNo());
            incJoinVO.setIncNo(incVO.getIncNo());
            incJoinVO.setPageGubun("G");                //"G":집단판매고객인도,보험테이블 VIN만 UPDATE

            incJoinSaveVO.setIncJoinInfoVO(incJoinVO);
            incJoinInfoService.updateVinNoIncJoinInfo(incJoinSaveVO);
        }

        // 차량정보 조회
        List<ContDeliveryVO> carList = contDeliveryMngDAO.selectContCarInfoSearch(carId);
        ContDeliveryVO carVO = null;
        if(carList != null && carList.size() > 0){
            carVO = carList.get(0);
        }

        // 금융 차량정보
        FincInfoMngVO fincVO = new FincInfoMngVO();
        fincVO.setDlrCd(contDeliveryVO.getDlrCd());
        fincVO.setContractNo(contDeliveryVO.getContractNo());
        List<FincInfoMngVO> fincList = fincInfoMngService.selectFincNoSearch(fincVO);
        if(carVO != null && fincList != null && fincList.size() > 0){
            fincVO = new FincInfoMngVO();
            fincVO.setDlrCd(contDeliveryVO.getDlrCd());
            fincVO.setFincNo(fincList.get(0).getFincNo());
            fincVO.setVinNo(contDeliveryVO.getVinNo());
            fincVO.setCarlineCd(carVO.getCarlineCd());
            fincVO.setModelCd(carVO.getModelCd());
            fincVO.setOcnCd(carVO.getOcnCd());
            fincVO.setExtColorCd(carVO.getExtColorCd());
            fincVO.setIntColorCd(carVO.getIntColorCd());
            fincVO.setCarRegNo(carVO.getCarRegNo());
            fincVO.setEnginNo(carVO.getEnginNo());
            fincVO.setCertNo(carVO.getCertNo());
            fincInfoMngService.updateVehicleFincMng(fincVO);
        }
        // 용품 차량정보
        AccessoryItemSalesVO accessoryVO = accessoryItemSalesService.selectAccessoryItemSalesByKey(contDeliveryVO.getDlrCd(), contDeliveryVO.getContractNo());
        if(accessoryVO != null){
            AccessoryItemSalesVO accessroySalesVO = new AccessoryItemSalesVO();
            accessroySalesVO.setDlrCd(contDeliveryVO.getDlrCd());
            accessroySalesVO.setGoodsContractNo(accessoryVO.getGoodsContractNo());
            accessroySalesVO.setCarlineCd(carVO.getCarlineCd());
            accessroySalesVO.setModelCd(carVO.getModelCd());
            accessroySalesVO.setOcnCd(carVO.getOcnCd());
            accessroySalesVO.setExtColorCd(carVO.getExtColorCd());
            accessroySalesVO.setIntColorCd(carVO.getIntColorCd());
            accessroySalesVO.setVinNo(carVO.getVinNo());
            accessroySalesVO.setCarRegNo(carVO.getCarRegNo());
            accessoryItemSalesService.updateAccessoryItemSalesVehicleInfoChange(accessroySalesVO);
        }

        /// 고객정보저장
        CustomerInfoVO customerInfoVO = new CustomerInfoVO();
        customerInfoVO.setCommandTp("CONTRACT");
        customerInfoVO.setDlrCd(contDeliveryVO.getDlrCd());             //DLR_CD 셋팅
        customerInfoVO.setCustCd("02");                                 // 02:보유고객
        customerInfoVO.setCustNo(contDeliveryVO.getContractCustNo());   //고객번호 셋팅

        customerInfoVO = customerInfoService.updateCustomer(customerInfoVO);

        //판매기회 계약건은 취소여부를 CRM 판매기회쪽으로 보내준다.
        if( contDeliveryVO.getSaleOpptNo() != null && !"".equals(contDeliveryVO.getSaleOpptNo())){
            SalesOpptProcessMgmtVO opptVO = new SalesOpptProcessMgmtVO();
            opptVO.setDlrCd( contDeliveryVO.getDlrCd() );
            opptVO.setSeq( contDeliveryVO.getSaleOpptNo() );
            opptVO.setcSeq( contDeliveryVO.getSaleOpptSeq() );
            opptVO.setLeadStatCd("06");
            opptVO.setMngScId(contDeliveryVO.getSaleEmpNo());
            salesOpptProcessMgmtOutBoundService.updateSalesOpptProcessMgmt(opptVO);
        }else{

            ContractReSearchVO cntSearchVO = new ContractReSearchVO();
            cntSearchVO.setsDlrCd(contDeliveryVO.getDlrCd());
            cntSearchVO.setsContractNo(contDeliveryVO.getContractNo());
            List<ContractReVO> contList = contractMntService.selectContractResByCondition(cntSearchVO);
            if(contList != null && contList.size() > 0
                    && !StringUtils.isEmpty(contList.get(0).getBeforeNo()) ){

                ContBeforeMngSearchVO beforMngSearchVO = new ContBeforeMngSearchVO();
                beforMngSearchVO.setsDlrCd(contDeliveryVO.getDlrCd());
                beforMngSearchVO.setsBeforeNo(contList.get(0).getBeforeNo());
                List<ContBeforeMngVO> beforeList = contBeforeMngService.selectContBeforeMngsByCondition(beforMngSearchVO);

                if(beforeList != null && beforeList.size() > 0
                        && !StringUtils.isEmpty(beforeList.get(0).getSaleOpptNo())
                ){
                    SalesOpptProcessMgmtVO opptVO = new SalesOpptProcessMgmtVO();
                    opptVO.setDlrCd( contDeliveryVO.getDlrCd() );
                    opptVO.setSeq( beforeList.get(0).getSaleOpptNo() );
                    opptVO.setcSeq( beforeList.get(0).getSaleOpptSeq() );
                    opptVO.setLeadStatCd("06");
                    opptVO.setMngScId(beforeList.get(0).getSaleEmpNo());
                    salesOpptProcessMgmtOutBoundService.updateSalesOpptProcessMgmt(opptVO);
                }
            }

        }

        StockStrategySearchVO strategySearchVO = new StockStrategySearchVO();
        strategySearchVO.setsLangCd("zh");
        strategySearchVO.setsDlrCd(contDeliveryVO.getDlrCd());
        strategySearchVO.setsCarId(carId);
        strategySearchVO.setsVinNo(contDeliveryVO.getVinNo());
        strategySearchVO.setIsDeliveryGubun("Y");
        List<StockStrategyVO> strategyList = stockStrategyService.selectStockStrategysByCondition(strategySearchVO);
        if(strategyList != null && strategyList.size() > 0){
            StockStrategyVO strategyVO = strategyList.get(0);


            if("A".equals(strategyVO.getStrStat())){
                // 전략출고 신청상태에서는 출고가 불가능합니다.
                //throw processException("sal.info.deliveryStrategyCheckMsg");

                // DCS의 전략출고 상태를 E로 변경
                strategyVO.setContractNo(contDeliveryVO.getContractNo());
                callStockStrategy(strategyVO);
            }

            strategyVO.setUpdtUsrId(LoginUtil.getUserId());
            strategyVO.setCaancReson("由于出库以取消");     // 전략출고 취소사유(출고로 인한 취소)
            strategyVO.setStrStat("E");                   // 출고상태 ( 승인 거절or통과 -> 출고)
            stockStrategyService.stockStrategyStr(strategyVO);
        }

        // 차량의 최종 상태를 점검한다.
        vehicleMasterSearchVO.setsDlrCd(contDeliveryVO.getDlrCd());
        vehicleMasterSearchVO.setsVinNo(contDeliveryVO.getVinNo());
        List<VehicleDeliveryVO> deliveryHisList = vehicleMasterService.selectVehicleDeliverySearch(vehicleMasterSearchVO);
        /**
         * J1실출고, J2출고취소, J3전략출고, J4전략출고취소, J5전략출고후실출고
         *-------------------------------
         * J2(출고취소) -> J1(실출고)
         * J3(전략출고) -> J5(실출고)
         * J4(전략출고취소) -> J1(실출고)
         *-------------------------------
         **/
        if(deliveryHisList != null && deliveryHisList.size() > 0){
            String opt = deliveryHisList.get(0).getKmopt();
            if("J3".equals(opt)){
                contDeliveryVO.setSpFlag("J5");
            }else{
                contDeliveryVO.setSpFlag("J1");
            }
        }else{
            //프로시저추가 - 딜러소매실적수신_데이터생성
            contDeliveryVO.setSpFlag("J1");
        }


        // BM포인트 차감
        updateBmPoint(contDeliveryVO.getContractNo());

        contDeliveryMngDAO.procDdlRetail(contDeliveryVO);
        
        //-----------liuxueying add cr_0218is_fms 线索出库接口记录start--------------
        if(StringUtils.isNotEmpty(contDeliveryVO.getSaleOpptNo()) && "50".equals(contDeliveryVO.getContractStatCd())){
	        SalesOpptProcessMgmtVO salesOpptProcessMgmtVO = new SalesOpptProcessMgmtVO();
	        salesOpptProcessMgmtVO.setDlrCd(contDeliveryVO.getDlrCd());
	        salesOpptProcessMgmtVO.setContractNo(contDeliveryVO.getContractNo());
	        salesOpptProcessMgmtDAO.insertContNoticeToFms(salesOpptProcessMgmtVO);
        }
        //-----------liuxueying add cr_0218is_fms 线索出库接口记录end--------------
        
        
        String team = "";
    	//查询车辆主表判断是否是新能源车
    	ContDeliveryVO newVo = contDeliveryMngService.selectIsCharging(contDeliveryVO);
    	//csr 64  试乘试驾车对于充电桩接口和监控平台接口以及新能源(北理工)接口，做不一样的处理，充电桩不发送、监控平台和新能源(北理工)接口要发送。contDeliveryVO.getOrdTp() N7 为试驾车  贾明 2020-3-11  
    	//if(newVo != null && "X".equals(newVo.getZfnewen()) && !"N7".equals(contDeliveryVO.getOrdTp())){
    	if(newVo != null && "X".equals(newVo.getZfnewen())){
          //if(null!=newVo &&"X".equals(newVo.getZfnewen())){
    		//CRS76 不能申请充电装的订单类型，除了试驾车N7以外，现在又增加了新的订单类型的需求，具体明细见excel 贾明 2020-5-9
    		boolean verBlo = veriChargingInfo(newVo.getOrdTp(),newVo.getCarlineEnNm());
    		if(verBlo){
    		//在出库后增加新数据到新能源充电桩表中需要查询用户表获取用户名手机号
    			ChargingPileVO chargingPileVO = new ChargingPileVO();
    			 synchronized (chargingPileUid) {
    				 team =  chargingPileUid.getNextStringId();
    	            }
    			chargingPileVO.setCustName(contDeliveryVO.getTemp6());
    			chargingPileVO.setCustPhone(contDeliveryVO.getTemp7());
    			chargingPileVO.setInstallationNo(team);
    			chargingPileVO.setIsNeed("02");
    			chargingPileVO.setState("01");
    			
    			//2019/06/14 qiandelai修改获取地址信息/充电桩数据发送   start
    			// 根据合同编号获取地址信息  
    			ContractReSearchVO searchVOs = new ContractReSearchVO();
    	        searchVOs.setsDlrCd(LoginUtil.getDlrCd());
    	        searchVOs.setsContractNo(contDeliveryVO.getContractNo());
    	        List<ContractReVO> list = contractMntService.selectContractResByCondition(searchVOs);
    	        if(list.size()>0){
    	        	ContractReVO contractReVO = list.get(0);
    	        	chargingPileVO.setInstallProvince(contractReVO.getSungNm());
    	        	chargingPileVO.setInstallCity(contractReVO.getCityNm());
    	        	chargingPileVO.setInstallArea(contractReVO.getDistNm());
    	        	chargingPileVO.setAddress(contractReVO.getAddrDetlCont());
    	        }
    			//查询车型，放入充电装对象
    			ContDeliveryVO vin = contDeliveryMngDAO.selectModelCdByVin(contDeliveryVO);
    			chargingPileVO.setCarModel(vin.getModelNm());//获取车型
    			chargingPileVO.setVinNo(contDeliveryVO.getVinNo());
    			chargingPileVO.setCustCd(contDeliveryVO.getContractCustNo());//客户编号
    			chargingPileVO.setDlrCd(contDeliveryVO.getDlrCd());
    			chargingPileVO.setCarState("01");
    			//NDMS销售的车辆信息中增加“订单类型”并且把该信息传输到充电桩平台  贾明 2019-7-18 start
    			chargingPileVO.setOrdTp(contDeliveryVO.getOrdTp());
    	 	   //NDMS销售的车辆信息中增加“订单类型”并且把该信息传输到充电桩平台  贾明 2019-7-18 end
    			contDeliveryMngService.insertChargingPile(chargingPileVO); //新增sa_0507t
    			chargingPileDAO.insertChargingIs(chargingPileVO);//新增SA_0507IS
    			
				CamelClient camelClient = camelClientFactory.createCamelClient();
	            camelClient.setIfId("SAL224");
	            camelClient.sendRequest();
	            Data receiveData = camelClient.sendRequest();

	            if (!receiveData.getFooter().getIfResult().equals("Z")) {
	                throw processException("global.err.dcsIfErrMsg", new String[] { receiveData.getFooter().getIfResult(), receiveData.getFooter().getIfFailMsg() });
	            }
    			//2019/06/10 qiandelai修改获取地址信息/充电桩数据发送    end
    		}
    	}
        

        Map<String, Object> message = new HashMap<String, Object>();

        message.put("KMTRDY", DateUtil.getDate("yyyy-MM-dd"));
        message.put("KMTRTM", DateUtil.getDate("HH:mm:ss"));

        //인터페이스seq채번
        int kmseq = contDeliveryMngDAO.selectSeqCondition(contDeliveryVO);
        message.put("KMSEQ", lpad(kmseq+"", "0", 6));

        message.put("KMOPT", contDeliveryVO.getSpFlag());
        message.put("KMSTDY", DateUtil.getDate("yyyy-MM-dd"));
        message.put("KMDCDY", DateUtil.getDate("HH:mm:ss"));
        //message.put("KMCNCD", contDeliveryVO.getCancReasonCd());
        message.put("KMVIN",  contDeliveryVO.getVinNo());
        message.put("KMDELR", LoginUtil.getDlrCd());
        message.put("KMCTCD", "");

        //판매사원id가져오기
        message.put("KMRGNO", contDeliveryVO.getSaleEmpNo());

        //승상구분가져오기
        String CarDstinCd = contDeliveryMngDAO.selectCarDstinCdCondition(contDeliveryVO);
        message.put("KMOTIT", CarDstinCd);

        message.put("KMCONT", contDeliveryVO.getContractNo());
        message.put("KMSTDY2","");

        message.put("KMPROP", contDeliveryVO.getRetlTpCd()); //판매유형
        message.put("KMUSER", LoginUtil.getUserId());

        CamelClient camelClient = camelClientFactory.createCamelClient();
        camelClient.setIfId("SAL025");
        camelClient.setSender(LoginUtil.getDlrCd());
        camelClient.addSendMessage(message);

        Data receiveData = camelClient.sendRequest();

        if (!receiveData.getFooter().getIfResult().equals("Z")) {
            throw processException("global.err.dcsIfErrMsg", new String[] { receiveData.getFooter().getIfResult(), receiveData.getFooter().getIfFailMsg() });
        }

        return true;
    }


    /**
     * LPAD 구현
     */
    private String lpad(String val, String pad, int length){
        if(val != null && val.length() > 0){
            while(val.length() < length){
                val = pad + val;
            }
        }
        return val;
    }
    /**
     * 校验是否给充电桩发信息 贾明 2020-5-9 
     * CRS76 不能申请充电装的订单类型，除了试驾车N7以外，现在又增加了新的订单类型的需求，具体明细见excel
     * @return
     */
    private boolean veriChargingInfo(String ordTp,String carlineEnNm){
    	 String langCd = LocaleContextHolder.getLocale().getLanguage();
    	 boolean judeVal = false;
    	 String carline = carlineEnNm.trim();
    	try {
    		List<CommonCodeVO> comCodeList = commonCodeService.selectCommonCodesByCmmGrpCd("SAL014", "Y", langCd);
    		List<String>  list = new ArrayList<String>();
    		list.clear();
    		for(CommonCodeVO comCode : comCodeList ){
    			list.add(comCode.getCmmCd());
    		}
    		//2020.09.09 update by tjx CSR156  系统可根据共同编码中定义的订单类型和任意REMARK值判断生成充电桩安装申请 strat
    		//sal014包含车辆订单类型则为true
    		judeVal	= list.contains(ordTp); 
    		//存在，并且对应的10个REMARK值都为空，则生成充电桩安装申请
    		if(judeVal) {
    			for(CommonCodeVO comVo : comCodeList ){
    				if(ordTp.equals(comVo.getCmmCd())) {
    					//对应的10个REMARK值都为空，则生成充电桩安装申请
    					if(comVo.getRemark1()==null && comVo.getRemark2()==null
    					&& comVo.getRemark3()==null && comVo.getRemark4()==null
    					&& comVo.getRemark5()==null && comVo.getRemark6()==null
    					&& comVo.getRemark7()==null && comVo.getRemark8()==null
    					&& comVo.getRemark9()==null && comVo.getRemark10()==null) {
    						judeVal = true;
    					}
    					//对应的10个REMARK值字段不全为空，则再判断出库车辆是否属于REMARK的值之内，属于则生成充电桩安装申请
    					else if(  carline.equals(comVo.getRemark1()==null ? "":comVo.getRemark1().trim()) || carline.equals(comVo.getRemark2()==null? "":comVo.getRemark2().trim())
    							||carline.equals(comVo.getRemark3()==null ? "":comVo.getRemark3().trim()) || carline.equals(comVo.getRemark4()==null? "":comVo.getRemark4().trim())
    							||carline.equals(comVo.getRemark5()==null ? "":comVo.getRemark5().trim()) || carline.equals(comVo.getRemark6()==null? "":comVo.getRemark6().trim())
    							||carline.equals(comVo.getRemark7()==null ? "":comVo.getRemark7().trim()) || carline.equals(comVo.getRemark8()==null? "":comVo.getRemark8().trim())
    							||carline.equals(comVo.getRemark9()==null ? "":comVo.getRemark9().trim()) || carline.equals(comVo.getRemark10()==null? "":comVo.getRemark10().trim())){
    						judeVal = true;
    					}
    					//不属于不生成
    					else {
    						judeVal = false;
    					}
    				}
    			}
    		}
    		list.clear();
    	//2020.09.09 update by tjx CSR156  系统可根据共同编码中定义的订单类型和任意REMARK值判断生成充电桩安装申请 end
		} catch (Exception e) {
			e.printStackTrace();
			judeVal = false;
		}
    	return judeVal;
    }

    /**
     * 계약의 기타업무 상태점검
     **/
    private void selectContractEtcWorkCheck(ContDeliveryVO contDeliveryVO) throws Exception{
        String dlrCd = contDeliveryVO.getDlrCd();
        String contractNo = contDeliveryVO.getContractNo();
        List<ContractReVO> list = contractMntService.selectContractEtcWorkCheck(dlrCd, contractNo);
        if(list != null && list.size() > 0){
            ContractReVO resultVO = list.get(0);

            if("N".equals(resultVO.getContractYn())){
                throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("sal.menu.payMgmt", null, LocaleContextHolder.getLocale())});
            }
            if("N".equals(resultVO.getIncYn())){
                //throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("sal.menu.insInfoReg", null, LocaleContextHolder.getLocale())});
            }
            if("N".equals(resultVO.getGoodsYn())){
                //throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("sal.title.goodsSalesMng", null, LocaleContextHolder.getLocale())});
            }
            if("N".equals(resultVO.getFincYn())){
                //throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("sal.menu.insInfoReg", null, LocaleContextHolder.getLocale())});
            }
            if("N".equals(resultVO.getUseYn())){
                throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("sal.title.usedCarBuy", null, LocaleContextHolder.getLocale())});
            }
            if("N".equals(resultVO.getPayYn())){
                throw processException("sal.info.payinfoChk");
            }
            contractMntService.selectContractUsedCarIsCheck(dlrCd, contractNo);
        }
    }

    /**
     * 계약 차량정보 저장(OCN, 내색, 외색)
     **/
    private void updateCarInfo(String contNo, String carId) throws Exception{
        if(StringUtils.isEmpty(contNo)){
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.contractNo", null, LocaleContextHolder.getLocale())});
        }
        if(StringUtils.isEmpty(carId)){
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.vinNum", null, LocaleContextHolder.getLocale())});
        }

        ContractReSearchVO searchVO = new ContractReSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsContractNo(contNo);
        List<ContractReVO> contList = contractMntService.selectContractResByCondition(searchVO);

        List<ContDeliveryVO> carList = null;
        ContDeliveryVO carVO = null;
        if(contList != null && contList.size() > 0){
            ContractReVO cVO = contList.get(0);

            // 고객 주소체크[2017.09.01]
            if(StringUtils.isBlank(cVO.getAddrTp())
                || StringUtils.isBlank(cVO.getZipCd())
                || StringUtils.isBlank(cVO.getSungCd())
                || StringUtils.isBlank(cVO.getCityCd())
                || StringUtils.isBlank(cVO.getDistCd())
                || StringUtils.isBlank(cVO.getAddrDetlCont())
            ){
                throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("sal.lbl.addr", null, LocaleContextHolder.getLocale())});
            }

            cVO.setRetlAmt(cVO.getRetlAmt()==null?0:cVO.getRetlAmt());
            if(StringUtils.isNotEmpty(cVO.getModelCd())
                    && StringUtils.isNotEmpty(cVO.getOcnCd())
                    && StringUtils.isNotEmpty(cVO.getExtColorCd())
                    && StringUtils.isNotEmpty(cVO.getIntColorCd())
                    && cVO.getRetlAmt() > 0 ){
                return;
            }

            carList = contDeliveryMngDAO.selectContCarInfoSearch(carId);
            if( StringUtils.isEmpty(cVO.getModelCd()) || StringUtils.isEmpty(cVO.getOcnCd()) || cVO.getRetlAmt() <= 0 ){
                if( carList != null && carList.size() > 0 ){
                    carVO = carList.get(0);
                    carVO.setContractNo(contNo);
                    carVO.setDlrCd(LoginUtil.getDlrCd());
                    carVO.setPromotionAmt(carVO.getMsPrc() - cVO.getRealCarAmt());
                    carVO.setGubun("A");
                    contDeliveryMngDAO.updateContractCarInfo(carVO);
                }
            }else if( StringUtils.isEmpty(cVO.getExtColorCd()) || StringUtils.isEmpty(cVO.getIntColorCd()) ){
                if( carList != null && carList.size() > 0 ){
                    carVO = carList.get(0);
                    carVO.setContractNo(contNo);
                    carVO.setDlrCd(LoginUtil.getDlrCd());
                    carVO.setGubun("B");
                    contDeliveryMngDAO.updateContractCarInfo(carVO);
                }
            }
        }else{
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.contractNo", null, LocaleContextHolder.getLocale())});
        }
    }

    /**
     * BM포인트 차감
     **/
    private void updateBmPoint(String contNo) throws Exception{
        ContractReSearchVO searchVO = new ContractReSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsContractNo(contNo);
        List<ContractReVO> contList = contractMntService.selectContractResByCondition(searchVO);

        if(contList != null && contList.size() > 0){
            ContractReVO cVO = contList.get(0);

            if(cVO.getPointAmt() == null
                    || cVO.getPointAmt() == 0 ){
                return;
            }

            BlueMembershipJoinVO bmJoinVO = new BlueMembershipJoinVO();
            bmJoinVO.setCustNo(cVO.getContractCustNo());
            bmJoinVO.setDlrCd(LoginUtil.getDlrCd());

            BlueMembershipIfInfoRapVO bmSearchRt = blueMembershipJoinSupportService.selectMemberUserIntegralInfo(bmJoinVO);
            if( bmSearchRt.getIsSuccess() && "Y".equals(bmSearchRt.getData().getBlueMembershipYN()) ){
                 String s = StringUtils.trimToNull(bmSearchRt.getData().getPoint());
                 double point = (s != null ? Double.parseDouble(s) : 0.0);
                 if(point - cVO.getBlueMembershipPointVal() < 0){
                     throw processException("sal.info.maxInfoChk", new String[]{messageSource.getMessage("sal.lbl.point", null, LocaleContextHolder.getLocale()), messageSource.getMessage("crm.lbl.usePoint", null, LocaleContextHolder.getLocale())});
                 }
            }

            bmJoinVO.setConsumeType("2");
            bmJoinVO.setVin("");        // vin번호
            bmJoinVO.setContractNo(cVO.getContractNo());
            bmJoinVO.setConsumePoints( String.valueOf((long)(double)cVO.getBlueMembershipPointVal()) );  // 소비포인트
            bmJoinVO.setTotalCost( new DecimalFormat("###.##").format(cVO.getRealPayAmt()) );            // 총비용 : 지불금액
            bmJoinVO.setConsumePointsCost( new DecimalFormat("###.##").format(Math.abs(cVO.getPointAmt())));  // 소비 포인트 환산비용
            BlueMembershipIfConsumeRapVO rapVO = blueMembershipJoinSupportService.insertAddMembersConsume(bmJoinVO);
            if( !rapVO.getIsSuccess() ){
                throw processException("sal.err.ifErrorMsg", new String[] { "E", rapVO.getMessage() });
            }

        }else{
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.contractNo", null, LocaleContextHolder.getLocale())});
        }
    }

    // DCS의 신청중 전략재고의 상태 변경.
    private boolean callStockStrategy(StockStrategyVO insertVO) throws Exception{

        String toDay = DateUtil.getDate("yyyy-MM-dd HH:mm:ss");

        Map<String, Object> message = new HashMap<String, Object>();

        message.put("DLR_CD", insertVO.getDlrCd());
        message.put("STR_NO", insertVO.getStrNo());
        message.put("CAR_ID", insertVO.getCarId());
        message.put("VIN_NO", insertVO.getVinNo());
        message.put("STR_STAT", "E");           // 출고상태로 변경
        message.put("STR_ASK_DT", DateUtil.convertToDateTimeString(insertVO.getStrAskDt()));
        message.put("STR_CONFIRM_DT", insertVO.getStrConfirmDt());
        message.put("CONFIRM_USR_ID", insertVO.getConfirmUsrId());
        message.put("CONFIRM_REMARK", insertVO.getConfirmRemark());
        message.put("CARLINE_CD", insertVO.getCarlineCd());
        message.put("MODEL_CD", insertVO.getModelCd());
        message.put("OCN_CD", insertVO.getOcnCd());
        message.put("EXT_COLOR_CD", insertVO.getExtColorCd());
        message.put("INT_COLOR_CD", insertVO.getIntColorCd());
        message.put("ORD_TP", insertVO.getOrdTp());
        message.put("CUST_CD", insertVO.getCustCd());
        message.put("CUST_NM", LoginUtil.getDlrCd()+LoginUtil.getDlrNm());
        message.put("REMARK", insertVO.getRemark());
        message.put("CONTRACT_NO", insertVO.getContractNo());
        message.put("CANC_DT", toDay);
        message.put("CAANC_RESON", "由于出库以取消");
        message.put("REG_USR_ID", insertVO.getRegUsrId());
        message.put("REG_DT", DateUtil.convertToDateTimeString(insertVO.getRegDt()));
        message.put("UPDT_USR_ID", LoginUtil.getUserId());
        message.put("UPDT_DT", toDay);
        CamelClient camelClient = camelClientFactory.createCamelClient();
        camelClient.setIfId("SAL141");           // service id
        camelClient.setSender(insertVO.getDlrCd());
        camelClient.addSendMessage(message);
        Data receiveData = camelClient.sendRequest();

        if (receiveData.getFooter().getIfResult().equals("E")) {
            throw processException("global.err.dcsIfErrMsg", new String[] { receiveData.getFooter().getIfResult(), receiveData.getFooter().getIfFailMsg() });
        }

        return true;
    }

    /**
     * 출고관리 - 이상출고처리   出库管理-异常出库处理
     */
    @Override
    public boolean insertExceptionDelivery(ContDeliveryVO contDeliveryVO) throws Exception {
        String vinNo = contDeliveryVO.getVinNo1()+contDeliveryVO.getVinNo2();
        contDeliveryVO.setVinNo(vinNo);
        if(StringUtils.isBlank(contDeliveryVO.getDlrCd())){
            contDeliveryVO.setDlrCd(LoginUtil.getDlrCd());
        }

        if(StringUtils.isBlank(contDeliveryVO.getContractNo())){
            throw processException("global.info.confirmMsgParam", new String[]{ messageSource.getMessage("global.lbl.contractNo", null, LocaleContextHolder.getLocale()) });
        }

        // 해당 계약번호 or VIN의 이상출고 최종이력을 초기화 한다.
        updateVhicleExceptionInit(contDeliveryVO.getDlrCd(), contDeliveryVO.getContractNo(), vinNo);
        setContractVinNo(contDeliveryVO);
    	contDeliveryVO.setRegUsrId(LoginUtil.getUserId());
    	contDeliveryVO.setReqStatCd("R");
    	contDeliveryMngDAO.insertExceptionDelivery(contDeliveryVO);

        //프로시저추가 - 강제판매처리신청수신 SAL073
    	contDeliveryMngDAO.procRfidExcepReq(contDeliveryVO);
        //Carmel InterFace Header Info
    	
        String team = "";
     	//查询车辆主表判断是否是新能源车
     	ContDeliveryVO newVo = contDeliveryMngService.selectIsCharging(contDeliveryVO);
     	//csr 64  试乘试驾车对于充电桩接口和监控平台接口以及新能源(北理工)接口，做不一样的处理，充电桩不发送、监控平台和新能源(北理工)接口要发送。contDeliveryVO.getOrdTp() N7 为试驾车  贾明 2020-3-11  
    	//if(newVo != null && "X".equals(newVo.getZfnewen()) && !"N7".equals(contDeliveryVO.getOrdTp())){
     	if(newVo != null && "X".equals(newVo.getZfnewen())){
     	//if(null!=newVo &&"X".equals(newVo.getZfnewen())){
     		//在出库后增加新数据到新能源充电桩表中需要查询用户表获取用户名手机号
     		//ChargingPileVO chargingPileVO = contDeliveryMngService.selectUserVO(contDeliveryVO);
     		//if(chargingPileVO!=null){
    		//CRS76 不能申请充电装的订单类型，除了试驾车N7以外，现在又增加了新的订单类型的需求，具体明细见excel 贾明 2020-5-9
    		boolean verBlo = veriChargingInfo(newVo.getOrdTp(),newVo.getCarlineEnNm());
    		if(verBlo){
     		ChargingPileVO chargingPileVO = new ChargingPileVO();
     			 synchronized (chargingPileUid) {
     				 team =  chargingPileUid.getNextStringId();
     	            }
     			chargingPileVO.setCustName(contDeliveryVO.getTemp6());
     			chargingPileVO.setCustPhone(contDeliveryVO.getTemp7());
     			chargingPileVO.setInstallationNo(team);
     			chargingPileVO.setIsNeed("02");
     			chargingPileVO.setState("01");
     			//2019/06/10 qiandelai修改获取地址信息/充电桩数据发送 start
     			// 根据合同编号获取地址信息  
     			ContractReSearchVO searchVOs = new ContractReSearchVO();
     	        searchVOs.setsDlrCd(LoginUtil.getDlrCd());
     	        searchVOs.setsContractNo(contDeliveryVO.getContractNo());
     	        List<ContractReVO> list = contractMntService.selectContractResByCondition(searchVOs);
     	        if(list.size()>0){
     	        	ContractReVO contractReVO = list.get(0);
     	        	chargingPileVO.setInstallProvince(contractReVO.getSungNm());
     	        	chargingPileVO.setInstallCity(contractReVO.getCityNm());
     	        	chargingPileVO.setInstallArea(contractReVO.getDistNm());
     	        }
     			chargingPileVO.setVinNo(contDeliveryVO.getVinNo());
     			chargingPileVO.setDlrCd(contDeliveryVO.getDlrCd());
     			ContDeliveryVO vin = contDeliveryMngDAO.selectModelCdByVin(contDeliveryVO);
    			chargingPileVO.setCarModel(vin.getModelNm());//获取车型
    			chargingPileVO.setCustCd(contDeliveryVO.getContractCustNo());//客户编号
    			chargingPileVO.setCarState("01");
    		 //NDMS销售的车辆信息中增加“订单类型”并且把该信息传输到充电桩平台  贾明 2019-7-18 start
    			chargingPileVO.setOrdTp(contDeliveryVO.getOrdTp());
    		 //NDMS销售的车辆信息中增加“订单类型”并且把该信息传输到充电桩平台  贾明 2019-7-18 end
    		    //异常出库时 不给充电桩平台发信息 贾明 2020-6-29 start
    			/**
     			contDeliveryMngService.insertChargingPile(chargingPileVO);
     			chargingPileDAO.insertChargingIs(chargingPileVO);
     			CamelClient camelClient = camelClientFactory.createCamelClient();
	            camelClient.setIfId("SAL224");
	            camelClient.sendRequest();
	            Data receiveData = camelClient.sendRequest();

	            if (!receiveData.getFooter().getIfResult().equals("Z")) {
	                throw processException("global.err.dcsIfErrMsg", new String[] { receiveData.getFooter().getIfResult(), receiveData.getFooter().getIfFailMsg() });
	            }
	            **/
    			//异常出库时 不给充电桩平台发信息 贾明 2020-6-29 start
     			//2019/06/10 qiandelai修改获取地址信息/充电桩数据发送    end
     		//}
    	   }    
     	}
    	
        Map<String, Object> message = new HashMap<String, Object>();
        serviceCommonService.executeCamelClent(message,"SAL073");

        return true;
    }

    /**
     * 임시배정된 vin 상태를 재조정해준다.
     */
    private int setContractVinNo(ContDeliveryVO contDeliveryVO) throws Exception{

        // sa_0201t에 vin조회
        ContractReSearchVO sVO = new ContractReSearchVO();
        sVO.setsDlrCd(LoginUtil.getDlrCd());
        sVO.setsVinNo(contDeliveryVO.getVinNo());
        for(ContractReVO vo : contractMntService.selectContractResByCondition(sVO) ){
            if( !contDeliveryVO.getContractNo().equals(vo.getContractNo()) ){
                // 계약블럭된 차량은 출고가 불가능합니다.
                throw processException("global.err.duplicate");
            }
        }

        // SA_0121T에 vinNo상태 맞춰줌.
        ContractReSearchVO searchVO = new ContractReSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsContractNo(contDeliveryVO.getContractNo());
        List<ContractReVO> contList = contractMntService.selectContractResByCondition(searchVO);
        if(contList != null && contList.size() > 0){
            ContractReVO cVO = contList.get(0);
            if(!contDeliveryVO.getVinNo().equals(cVO.getVinNo())){
                VehicleMasterVO vmVO = null;
                if(!StringUtils.isBlank(cVO.getVinNo())){
                    vmVO = new VehicleMasterVO();
                    vmVO.setOwnStatCd("O");             // 미배정
                    vmVO.setDlrCd( cVO.getDlrCd() );
                    vmVO.setVinNo( cVO.getVinNo() );
                    contractMntService.updateCarAssign(vmVO);
                }

                vmVO = new VehicleMasterVO();
                vmVO.setOwnStatCd("A");                // 배정
                vmVO.setDlrCd( cVO.getDlrCd() );
                vmVO.setVinNo( contDeliveryVO.getVinNo() );
                contractMntService.updateCarAssign(vmVO);

                ContractReVO cnt = new ContractReVO();
                cnt.setDlrCd(cVO.getDlrCd());
                cnt.setContractNo(contDeliveryVO.getContractNo());
                cnt.setVinNo(contDeliveryVO.getVinNo());
                contractMntService.updateContractEach(cnt);
            }
        }
        return 1;
    }


    //이상출고처리 신청중 상태 조회
    @Override
    public int selectContractExceptionStatByConditionCnt(ContDeliverySearchVO searchVO) throws Exception{
        if(StringUtils.isBlank(searchVO.getsDlrCd())){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return  contDeliveryMngDAO.selectContractExceptionStatByConditionCnt(searchVO);
    }

    // 해당계약번호의 이상출고 최종이력을 초기화 한다
    private boolean updateVhicleExceptionInit(String dlrCd, String contractNo, String vinNo) throws Exception{

        // 계약번호로 이상출고 최종이력을 초기화 한다.
        ContDeliveryVO cntVO = new ContDeliveryVO();
        cntVO.setDlrCd(dlrCd);
        cntVO.setContractNo(contractNo);
        contDeliveryMngDAO.updateVhicleExceptionInit(cntVO);

        // VIN NO로 이상출고 최종이력을 초기화 한다.
        ContDeliveryVO vinVO = new ContDeliveryVO();
        vinVO.setDlrCd(dlrCd);
        vinVO.setVinNo(vinNo);
        contDeliveryMngDAO.updateVhicleExceptionInit(vinVO);

        return true;
    }

    // 계약건의 이상출고처리 신청상태 조회
    @Override
    public String selectContractExceptionStatYnSearchByCondition(ContDeliverySearchVO searchVO) throws Exception{
        if(StringUtils.isBlank(searchVO.getsDlrCd())){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return contDeliveryMngDAO.selectContractExceptionStatYnSearchByCondition(searchVO);
    }

    // 출고스캔요청
    @Override
    public boolean deliveryAsk(ContDeliveryVO contDeliveryVO) throws Exception{
        if(StringUtils.isBlank(contDeliveryVO.getVinNo())){
            throw processException("sal.info.vinCheck");
        }
        if(StringUtils.isBlank(contDeliveryVO.getContractNo())){
            throw processException("global.info.required.select");
        }

        ContDeliverySearchVO searchVO = new ContDeliverySearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsCrcReqYn("N");
        searchVO.setsContractNo(contDeliveryVO.getContractNo());
        searchVO.setsVinNo(contDeliveryVO.getVinNo());
        List<ContDeliveryVO> searchList = selectDeliveryVehicleByCondition(searchVO);
        if(searchList != null && searchList.size() > 0){
            ContDeliveryVO item = searchList.get(0);
            if("C".equals(item.getStatCd())){
                // 출고요청 스캔이 되어있으므로, 출고처리 하시길 바랍니다.[已经扫描了出库申请，请做出库处理。]
                throw processException("sal.info.deliveryAskScanMsg");
            }
            if("C1".equals(item.getStatCd())){
                // 이상출고 스캔이 되어있으므로, 이상출고 요청처리 하시길 바랍니다.[已经进行了异常出库扫描，请做异常出库。]
                throw processException("sal.info.exceptionDeliveryScanMsg");
            }
            if("R".equals(item.getExpAprYn())){
                // 이상출고 신청이 진행중입니다.[正在执行异常出库。]
                throw processException("sal.info.exceptionDeliveryAskingMsg");
            }
            if("Y".equals(item.getExpAprYn())){
                // 이상출고처리 승인된 VIN이므로 바로 출고 가능합니다.[异常出库申请通过的VIN可直接出库。]
                throw processException("sal.info.excpDeliveryDirectOutstock");
            }
            if("C0".equals(item.getExpAprYn())){
                // 이미 등록되어 있습니다.
                throw processException("global.info.already");
            }
        }

        contDeliveryVO.setDlrCd(LoginUtil.getDlrCd());
        contDeliveryVO.setUpdtUsrId(LoginUtil.getUserId());
        contDeliveryVO.setTemp1("C0");      // 출고스캔요청

        // 출고스캔요청
        contDeliveryMngDAO.updateVhicleDeliveryAsk(contDeliveryVO);

        // 프로시져 실행
        contDeliveryMngDAO.procDeliveryAsk(contDeliveryVO);

        //Carmel InterFace Header Info
        Map<String, Object> message = new HashMap<String, Object>();
        serviceCommonService.executeCamelClent(message,"SAL188");   // SA_0121_11IS

        return true;
    }

    /*
	 * 查询充电桩申请审核状态
	 * */
	@Override
	public NewEnergyVSApplicationVO getNewEnergySubsidy(ContDeliveryVO contDeliveryVO) {
		return contDeliveryMngDAO.getNewEnergySubsidy(contDeliveryVO);
	}
	
	/*
	 * 添加充电桩表新数据
	 * */
	@Override
	public void insertChargingPile(ChargingPileVO chargingPileVO) {
		contDeliveryMngDAO.insertChargingPile(chargingPileVO);
		
	}

	@Override
	public ChargingPileVO selectUserVO(ContDeliveryVO contDeliveryVO) {
		return contDeliveryMngDAO.selectUserVO(contDeliveryVO);
	}

	@Override
	public ContDeliveryVO selectIsCharging(ContDeliveryVO contDeliveryVO) {
		return contDeliveryMngDAO.selectIsCharging(contDeliveryVO);
	}

	/**
	 *   	Q21011300013 整车销售出库时，增加校验逻辑，不单纯以页面传值为准，要以最新的合同信息为准。 
	 *      2020年12月13号，D1096店正常零售的一台车，dms合同信息和sap收到的零售信息，销售顾问不一致。
	 *      jiaMing 
	 *      2021-1-27 
	 */
	@Override
	public ContDeliveryVO checkContractNoInfoSaleEmpNo(ContDeliveryVO contDeliveryVO) throws Exception {
		if(StringUtils.isBlank(contDeliveryVO.getDlrCd())){
			contDeliveryVO.setDlrCd(LoginUtil.getDlrCd());
        }
		String   saleEmpNo =  contDeliveryVO.getSaleEmpNo();//销售顾问id
		ContDeliveryVO checkSaleNo = contDeliveryMngDAO.checkContractNoInfoSaleEmpNo(contDeliveryVO);
		boolean isFlag = StringUtils.equals(saleEmpNo, checkSaleNo.getSaleEmpNo());
    	if(!isFlag){
		    throw processException("sal.info.contractInofUpdateReSelect");
    	}
		return checkSaleNo;
	}

}