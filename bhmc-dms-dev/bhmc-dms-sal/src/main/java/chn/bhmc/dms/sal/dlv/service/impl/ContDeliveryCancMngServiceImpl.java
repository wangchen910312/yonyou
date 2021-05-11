package chn.bhmc.dms.sal.dlv.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.quartz.JobExecutionException;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cif.service.CustomerInfoService;
import chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtOutBoundService;
import chn.bhmc.dms.crm.cso.service.dao.SalesOpptProcessMgmtDAO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtVO;
import chn.bhmc.dms.sal.acu.service.ContBeforeMngService;
import chn.bhmc.dms.sal.acu.vo.ContBeforeMngVO;
import chn.bhmc.dms.sal.cnt.service.ContractMntService;
import chn.bhmc.dms.sal.cnt.vo.ContractReVO;
import chn.bhmc.dms.sal.ctl.service.DeadlineCtrlMngService;
import chn.bhmc.dms.sal.ctl.vo.DeadlineCtrlMngSearchVO;
import chn.bhmc.dms.sal.dlv.service.ChargingPileService;
import chn.bhmc.dms.sal.dlv.service.ContDeliveryCancMngService;
import chn.bhmc.dms.sal.dlv.service.NewEnergyVSApplicationService;
import chn.bhmc.dms.sal.dlv.service.dao.ContDeliveryCancMngDAO;
import chn.bhmc.dms.sal.dlv.service.dao.ContDeliveryMngDAO;
import chn.bhmc.dms.sal.dlv.vo.ChargingPileVO;
import chn.bhmc.dms.sal.dlv.vo.ContDeliverySaveVO;
import chn.bhmc.dms.sal.dlv.vo.ContDeliverySearchVO;
import chn.bhmc.dms.sal.dlv.vo.ContDeliveryVO;
import chn.bhmc.dms.sal.inc.service.IncJoinInfoService;
import chn.bhmc.dms.sal.veh.service.VehicleMasterService;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterSaveVO;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterVO;
import chn.bhmc.dms.ser.svi.service.BayManageService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ContDeliveryMngServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author
 * @since 2016. 10. 24
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 10. 24      yewon.kim              최초 생성
 * </pre>
 */

@Service("contDeliveryCancMngService")
public class ContDeliveryCancMngServiceImpl extends HService implements ContDeliveryCancMngService {


	
	@Resource(name="NewEnergyVSApplicationService")
	NewEnergyVSApplicationService newEnergyVSApplicationService;
	
	@Resource(name="chargingPileService")
	ChargingPileService chargingPileService;
    /**
     * 배정관리 DAO 선언
     */
    @Resource(name="contDeliveryCancMngDAO")
    ContDeliveryCancMngDAO contDeliveryCancMngDAO;


    /**
     * 마감시간 체크
     */
    @Resource(name="deadlineCtrlMngService")
    DeadlineCtrlMngService deadlineCtrlMngService;


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
     * 계약 서비스
     */
    @Resource(name="contractMntService")
    ContractMntService contractMntService;

    /**
     * 예약판매 서비스
     */
    @Resource(name="contBeforeMngService")
    ContBeforeMngService contBeforeMngService;

    /**
     * 보험가입정보관리 서비스
     */
    @Resource(name="incJoinInfoService")
    IncJoinInfoService incJoinInfoService;


    /**
     * CRM 판매기회 관리 서비스
     */
    @Resource(name="salesOpptProcessMgmtOutBoundService")
    SalesOpptProcessMgmtOutBoundService salesOpptProcessMgmtOutBoundService;



    /**
     * camelClient
     */
    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;




    /**
     * 출고처리 서비스
     */
    @Resource(name="contDeliveryMngDAO")
    ContDeliveryMngDAO contDeliveryMngDAO;


    @Resource(name="salesOpptProcessMgmtDAO")
    SalesOpptProcessMgmtDAO salesOpptProcessMgmtDAO;
    /**
     * 조회 조건에 해당하는 고객인도정보를 조회한다.
     */
    @Override
    public List<ContDeliveryVO> selectContDeliveryCancByCondition(ContDeliverySearchVO searchVO) throws Exception {
        return contDeliveryCancMngDAO.selectContDeliveryCancByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 고객인도목록 총 갯수를 조회한다.
     */
    @Override
    public int selectContDeliveryCancByConditionCnt(ContDeliverySearchVO searchVO) throws Exception {
        return contDeliveryCancMngDAO.selectContDeliveryCancByConditionCnt(searchVO);
    }

    /**
     * 원샷개폐체크
     */
    @Override
    public int selectOneShotCheck(DeadlineCtrlMngSearchVO searchVO) throws Exception {
        return deadlineCtrlMngService.selectOneShotCheck(searchVO);
    }

    @Override
    public void contDeliveryCanc(ContDeliverySaveVO saveVO) throws Exception {

        // 고객인도시취소개폐확인
        DeadlineCtrlMngSearchVO deadLineVO = new DeadlineCtrlMngSearchVO();
        deadLineVO.setsCtrlGrpCd("Y");
        deadLineVO.setsCtrlDlrCd(LoginUtil.getDlrCd());
        deadLineVO.setsCtrlTargCd("Y01");
        if(deadlineCtrlMngService.selectOneShotCheck(deadLineVO) > 0){
            // [소매처리취소]는 마감되었습니다.
            throw processException("sal.info.deliveryCheckMsg");
        }

    	List<ContDeliveryVO> list = saveVO.getUpdateList();

        for(ContDeliveryVO contDeliveryVO : list){

        	String contractNo = contDeliveryVO.getContractNo();
        	contDeliveryVO.setUpdtUsrId(LoginUtil.getUserId());
        	contDeliveryVO.setRegUsrId(LoginUtil.getUserId());
        	contDeliveryVO.setDlrCd(LoginUtil.getDlrCd());
        	//contDeliveryVO.setContractStatCd("91");
        	contDeliveryVO.setContractStatCd("20");    // 취소 -> 계약생성 상태로 변경요청. [2016.12.06 구상우K]
        	contDeliveryVO.setGubun("C");

            //출고취소시 RO발행상태 확인해야 함. 2017.06.26
            if(contDeliveryCancMngDAO.selectActiveRoCnt(contDeliveryVO) > 0){
                // RO 중인 차량은 퇴고못합니다
                throw processException("sal.info.roCheckMsg");
            }

            //이월취소일시 이월취소테이블에 데이터저장.(승인요청로직을 탐)
            if(contDeliveryVO.getDeliveryGb().equals("Y")){//跨月出库取消
            	try{
            		if(contDeliveryVO.getReqStatCd() == null){
                		contDeliveryCancMngDAO.insertCancelDelivery(contDeliveryVO);
                	}else {
                		contDeliveryCancMngDAO.updateCancelDelivery(contDeliveryVO);
                	}

            		//딜러이월소매취소신청수신
                    contDeliveryCancMngDAO.procRetailCancelReq(contDeliveryVO);
            	}catch(Exception e){
            	    log.error(e.getMessage(), e);
                    throw new JobExecutionException(e.getMessage(), e);
            	}
            }else {//当月出库取消

                //고객인도 - 인도취소
                contDeliveryVO.setSpFlag("J2");
                contDeliveryMngDAO.procDdlRetail(contDeliveryVO);

                String temp4 = contDeliveryCancMngDAO.selectTemp4(contDeliveryVO);
                contDeliveryVO.setTemp4(temp4);

                //차량마스터 취소상태로 업데이트
                contDeliveryCancMngDAO.updateCnclVehicleContDelivery(contDeliveryVO);

                contDeliveryVO.setContractNo("");
                contDeliveryVO.setCarStatCd("60");
                contDeliveryVO.setTecId("");
                contDeliveryVO.setContractNo(contractNo);
                contDeliveryMngDAO.updateContractDelivery(contDeliveryVO);

                // 소유자정보 변경(useYn = 'N')
                VehicleMasterSaveVO saveOwnerVO = new VehicleMasterSaveVO();
                List<VehicleMasterVO> updateOwnerList = new ArrayList<VehicleMasterVO>();
                VehicleMasterVO vo = null;
                VehicleMasterSearchVO cSearchVO = new VehicleMasterSearchVO();
                cSearchVO.setsDlrCd(contDeliveryVO.getDlrCd());
                cSearchVO.setsCustNo(contDeliveryVO.getContractCustNo());
                cSearchVO.setsCarId(contDeliveryVO.getCarId());
                cSearchVO.setsNcarDstinCd("N");

                for(VehicleMasterVO mVO : vehicleMasterService.selectVehicleMasterOwnerByCondition(cSearchVO)){
                    vo = new VehicleMasterVO();
                    vo.setBpCd(mVO.getBpCd());
                    vo.setUseYn("N");
                    vo.setTxtObjectCd(contDeliveryVO.getSsnCrnNo());
                    vo.setUpdtUsrId(LoginUtil.getUserId());
                    vo.setCarId(contDeliveryVO.getCarId());
                    vo.setDlrCd(contDeliveryVO.getDlrCd());
                    vo.setSeq(mVO.getSeq());
                    updateOwnerList.add(vo);
                }

                saveOwnerVO.getOwnerGridVO().setUpdateList(updateOwnerList);
                vehicleMasterService.saveVehicleMasterOwner(saveOwnerVO);


                //판매사원id가져오기
                String salesEmpNo = contDeliveryMngDAO.selectSalesEmpNoCondition(contDeliveryVO);

                //판매기회 계약건은 취소여부를 CRM 판매기회쪽으로 보내준다.

                if((contDeliveryVO.getSaleOpptNo() != null && contDeliveryVO.getSaleOpptNo() != "")||(contDeliveryVO.getBefSaleOpptNo() != null && contDeliveryVO.getBefSaleOpptNo() != "")){
                    SalesOpptProcessMgmtVO opptVO = new SalesOpptProcessMgmtVO();
                    SalesOpptProcessMgmtVO returnOpptVO = null;

                    try{
                        opptVO.setDlrCd( contDeliveryVO.getDlrCd() );
                        opptVO.setLeadStatCd("05");
                        opptVO.setMngScId(salesEmpNo);
                        //opptVO.setFailCauCd("08"); crm요청으로 주석. 2017.04.01

                        if(contDeliveryVO.getBefSaleOpptNo() != null && contDeliveryVO.getBefSaleOpptNo() != "" ){
                            opptVO.setSeq( contDeliveryVO.getBefSaleOpptNo() );    //예판 판매기회번호
                            opptVO.setcSeq( contDeliveryVO.getBefSaleOpptSeq() );  //예판 판매기회 일련번호

                            returnOpptVO = salesOpptProcessMgmtOutBoundService.updateSalesOpptProcessMgmtCancelDelivery(opptVO);
                            if(returnOpptVO != null && returnOpptVO.getcSeq() != null){
                                ContractReVO contractVO = new ContractReVO();
                                contractVO.setDlrCd(contDeliveryVO.getDlrCd());
                                contractVO.setContractNo(contDeliveryVO.getContractNo());
                                contractVO.setSaleOpptSeq(returnOpptVO.getcSeq());
                                contractMntService.updateContractEach(contractVO);
                            }
                        }else{
                            opptVO.setSeq( contDeliveryVO.getSaleOpptNo() );       //계약 판매기회번호
                            opptVO.setcSeq( contDeliveryVO.getSaleOpptSeq() );     //계약 판매기회 일련번호

                            returnOpptVO = salesOpptProcessMgmtOutBoundService.updateSalesOpptProcessMgmtCancelDelivery(opptVO);
                            if(returnOpptVO != null && returnOpptVO.getcSeq() != null){
                                ContBeforeMngVO beforeVO = new ContBeforeMngVO();
                                beforeVO.setDlrCd(contDeliveryVO.getDlrCd());
                                beforeVO.setBeforeNo(contDeliveryVO.getBeforeNo());
                                beforeVO.setSaleOpptSeq(returnOpptVO.getcSeq());
                                contBeforeMngService.changeOpptSeq(beforeVO);
                            }
                        }
                    }catch (Exception e){
                        log.error(e.getMessage(), e);
    	                throw new JobExecutionException(e.getMessage(), e);
    	            }

                }

                //2017.03.28 요구사항으로 변경.
                //contDeliveryCancMngDAO.updateCleanContMaster(contDeliveryVO); //2017.04.25 령연씨요구조건으로 재수정함. 계약마스터에 빈 null로 업데이트 안함.
                contDeliveryCancMngDAO.updateCleanVinMaster(contDeliveryVO); //2017.04.25 령연씨요구조건으로 재수정함. OWN_STAT_CD 업데이트 안함.
                contDeliveryCancMngDAO.updateCleanRfidReq(contDeliveryVO);

                Map<String, Object> message = new HashMap<String, Object>();

                message.put("KMTRDY", DateUtil.getDate("yyyy-MM-dd"));
                message.put("KMTRTM", DateUtil.getDate("HH:mm:ss"));

                //인터페이스seq채번
                int kmseq = contDeliveryMngDAO.selectSeqCondition(contDeliveryVO);

                message.put("KMSEQ", lpad(kmseq+"", "0", 6));
                message.put("KMOPT", "J2");
                message.put("KMSTDY", DateUtil.getDate("yyyy-MM-dd"));
                message.put("KMDCDY", DateUtil.getDate("HH:mm:ss"));
                message.put("KMCNCD", contDeliveryVO.getCancReasonCd());
                message.put("KMVIN",  contDeliveryVO.getVinNo());
                message.put("KMDELR", LoginUtil.getDlrCd());
                message.put("KMCTCD", "");
                message.put("KMRGNO", salesEmpNo);
                //승상구분가져오기
                String CarDstinCd = contDeliveryMngDAO.selectCarDstinCdCondition(contDeliveryVO);
                message.put("KMOTIT", CarDstinCd);
                message.put("KMCONT", contDeliveryVO.getContractNo());
                message.put("KMSTDY2","");
                message.put("KMPROP", contDeliveryVO.getRetlTpCd());
                message.put("KMUSER", LoginUtil.getUserId());

                CamelClient camelClient = camelClientFactory.createCamelClient();
                camelClient.setIfId("SAL025");
                camelClient.setSender(LoginUtil.getDlrCd());
                camelClient.setReceiver("ERP");
                camelClient.addSendMessage(message);

                Data receiveData = camelClient.sendRequest();

                if (!receiveData.getFooter().getIfResult().equals("Z")) {
                    throw processException("global.err.dcsIfErrMsg", new String[] { receiveData.getFooter().getIfResult(), receiveData.getFooter().getIfFailMsg() });
                }

                //-----liuxueying add  当月取消出库时插入CR_0218IS_FMS接口表 start------------
                SalesOpptProcessMgmtVO salesOpptProcessMgmtVO = new SalesOpptProcessMgmtVO();
    	        salesOpptProcessMgmtVO.setDlrCd(contDeliveryVO.getDlrCd());
    	        salesOpptProcessMgmtVO.setContractNo(contDeliveryVO.getContractNo());
    	        salesOpptProcessMgmtDAO.insertContNoticeToFms(salesOpptProcessMgmtVO);
    	        //-----liuxueying add  当月取消出库时插入CR_0218IS_FMS接口表 end------------
    	        
    	        
                //취소시 소유자 정보 초기화 2017.06.26
                contDeliveryCancMngDAO.updateResetOwnerInfo(contDeliveryVO);

                //취소시 운전자 정보 초기화 2017.06.26
                contDeliveryCancMngDAO.updateResetDriverInfo(contDeliveryVO);
            }
            newEnergyVSApplicationService.updateNewEnVSApplicationTc(contDeliveryVO.getVinNo());
            //2019-4-23 qiandelai  取消出库修改充电桩作废状态开始
            /*ChargingPileVO chargingPileVO = new ChargingPileVO();
            chargingPileVO.setVinNo(contDeliveryVO.getVinNo());
            chargingPileVO.setState("03");
            chargingPileVO.setCarState("02");
            chargingPileService.updateStateByVin(chargingPileVO);*/
          //2019-4-23 qiandelai  取消出库修改充电桩作废状态结束
        }
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
}
