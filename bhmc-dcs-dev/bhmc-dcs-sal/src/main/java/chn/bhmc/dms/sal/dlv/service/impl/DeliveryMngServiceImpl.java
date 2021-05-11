package chn.bhmc.dms.sal.dlv.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.xml.bind.JAXBElement;

import able.com.service.HService;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.eai.EaiClient;
import chn.bhmc.dms.core.support.eai.EaiSimpleMessage;
import chn.bhmc.dms.core.support.eai.schema.CommDMSDoc;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cif.service.CustomerInfoService;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoVO;
import chn.bhmc.dms.sal.ctl.service.DeadlineCtrlMngService;
import chn.bhmc.dms.sal.ctl.vo.DeadlineCtrlMngSearchVO;
import chn.bhmc.dms.sal.dlv.service.DeliveryMngService;
import chn.bhmc.dms.sal.dlv.service.dao.DeliveryMngDAO;
import chn.bhmc.dms.sal.dlv.vo.DeliverySaveVO;
import chn.bhmc.dms.sal.dlv.vo.DeliverySearchVO;
import chn.bhmc.dms.sal.dlv.vo.DeliveryVO;
import chn.bhmc.dms.sal.dlv.vo.GroupSalesDeliveryVO;
import chn.bhmc.dms.sal.inc.service.IncJoinInfoService;
import chn.bhmc.dms.sal.veh.service.VehicleMasterService;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterSearchVO;
import chn.bhmc.dms.ser.svi.service.BayManageService;
import chn.bhmc.dms.ser.svi.vo.BayDetailVO;
import chn.bhmc.dms.ser.svi.vo.BayManageSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DeliveryMngServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author
 * @since 2016. 3. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 10.      Kim yewon              최초 생성
 * </pre>
 */

@Service("deliveryMngService")
public class DeliveryMngServiceImpl extends HService implements DeliveryMngService {

    @Resource(name="eaiClient")
    EaiClient eaiClient;

    /**
     * 배정관리 DAO 선언
     */
    @Resource(name="deliveryMngDAO")
    DeliveryMngDAO deliveryMngDAO;

    /**
     * 고객정보 서비스
     */
    @Resource(name="customerInfoService")
    CustomerInfoService customerInfoService;

    /**
     * 차량마스터 서비스
     */
    @Resource(name="vehicleMasterService")
    VehicleMasterService vehicleMasterService;

    /**
     * 마감시간 체크
     */
    @Resource(name="deadlineCtrlMngService")
    DeadlineCtrlMngService deadlineCtrlMngService;

    /**
     * 보험가입정보관리 서비스
     */
    @Resource(name="incJoinInfoService")
    IncJoinInfoService incJoinInfoService;

    /**
     * bay관리 - 서비스(정비)
     */
    @Resource(name="bayManageService")
    BayManageService bayManageService;

    /**
     * 조회 조건에 해당하는 고객인도정보를 조회한다.
     */
    @Override
    public List<DeliveryVO> selectDeliveryByCondition(DeliverySearchVO searchVO) throws Exception {
        return deliveryMngDAO.selectDeliveryByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 고객인도목록 총 갯수를 조회한다.
     */
    @Override
    public int selectDeliveryByConditionCnt(DeliverySearchVO searchVO) throws Exception {
        return deliveryMngDAO.selectDeliveryByConditionCnt(searchVO);
    }


    /**
     * 고객인도관리 - 고객인도 이벤트
     */
    @Override
    public boolean updateVehicleDelivery(DeliveryVO deliveryVO) throws Exception {

        // 고객인도시 마감확인
        DeadlineCtrlMngSearchVO deadLineVO = new DeadlineCtrlMngSearchVO();
        deadLineVO.setsCtrlGrpCd("B");                      // 소매
        deadLineVO.setsCtrlDlrCd(LoginUtil.getDlrCd());     // 딜러코드
        deadLineVO.setsCtrlTargCd("C01");                   // 소매처리
        if(deadlineCtrlMngService.selectDeadLineCheck(deadLineVO) > 0){
            // [소매처리]는 마감되었습니다.
            throw processException("sal.info.deadLineCheckMsg", new String[]{messageSource.getMessage("sal.lbl.contSalePross", null, LocaleContextHolder.getLocale())});
        }

        VehicleMasterSearchVO vehicleMasterSearchVO = new VehicleMasterSearchVO();
        vehicleMasterSearchVO.setsVinNo(deliveryVO.getVinNo());
        if(vehicleMasterService.selectVehicleVinNo(vehicleMasterSearchVO) == 0){
            // 차량마스터에 해당 VIN이 존재하지 않습니다.
            throw processException("sal.err.vehicleMasterNotVinNo");
        }

        BayManageSearchVO searchVO = new BayManageSearchVO();
        searchVO.setsBayNo("C01");
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        List<BayDetailVO> tecIdList = bayManageService.selectBayDetailsByCondition(searchVO);
        String tecId = tecIdList.get(0).getTecId();
        deliveryVO.setTecId(tecId);
        deliveryVO.setUpdtUsrId(LoginUtil.getUserId());
        deliveryVO.setCarStatCd("70");
        deliveryVO.setContractStatCd("50");
        deliveryVO.setGubun("D");
        if(deliveryVO.getGrpContractNo() == "" || deliveryVO.getGrpContractNo() == null){
            deliveryVO.setSaleTp("N");
        }else {
            DeliveryVO vo = deliveryMngDAO.selectRetlTpCd(deliveryVO);
            deliveryVO.setRetlTpCd(vo.getRetlTpCd());
            deliveryVO.setDstbChnCd("A");
            deliveryVO.setSaleTp("G");
        }
        deliveryMngDAO.updateVehicleDelivery(deliveryVO);
        deliveryMngDAO.updateContractDelivery(deliveryVO);

        // 고객정보저장
        CustomerInfoVO customerInfoVO = new CustomerInfoVO();
        customerInfoVO.setCommandTp("CONTRACT");
        customerInfoVO.setDlrCd(deliveryVO.getDlrCd());   //DLR_CD 셋팅
        customerInfoVO.setCustCd("02");   // 02:보유고객
        customerInfoVO.setCustNo(deliveryVO.getContractCustNo());    //고객번호 셋팅

        customerInfoVO = customerInfoService.updateCustomer(customerInfoVO);

        Map<String, Object> message = new HashMap<String, Object>();
        message.put("KMTRDY", DateUtil.getDate("yyyy-MM-dd"));
        message.put("KMTRTM", DateUtil.getDate("HH:mm:ss"));

        /*인터페이스seq채번*/
        int kmseq = deliveryMngDAO.selectSeqCondition(deliveryVO);
        message.put("KMSEQ", lpad(kmseq+"", "0", 6));

        message.put("KMOPT", "J1");
        message.put("KMSTDY", DateUtil.getDate("yyyy-MM-dd"));
        message.put("KMDCDY", DateUtil.getDate("HH:mm:ss"));
        message.put("KMCNCD", deliveryVO.getCancReasonCd());
        message.put("KMVIN",  deliveryVO.getVinNo());
        message.put("KMDELR", LoginUtil.getDlrCd());
        message.put("KMCTCD", "");

        /*판매사원id가져오기*/
        String salesEmpNo = deliveryMngDAO.selectSalesEmpNoCondition(deliveryVO);
        message.put("KMRGNO", salesEmpNo);

        /*승상구분가져오기*/
        String CarDstinCd = deliveryMngDAO.selectCarDstinCdCondition(deliveryVO);
        message.put("KMOTIT", CarDstinCd);
        message.put("KMCONT", deliveryVO.getContractNo());
        message.put("KMSTDY2","");
        message.put("KMPROP", deliveryVO.getRetlTpCd());
        message.put("KMUSER", LoginUtil.getUserId());

        CommDMSDoc reqCommDMSDoc = new EaiSimpleMessage.Builder()
        .ifId("SAL025")
        .company("H")
        .sender("SAL")
        .receiver(LoginUtil.getDlrCd())
        .flag("Y")
        .addMessage(message)
        .build()
        .buildCommDMSDoc();

        CommDMSDoc commDMSDoc = eaiClient.sendRequest(reqCommDMSDoc);

        String ifresultCd = commDMSDoc.getFooter().getValue().getIFRESULT().getValue();

        if(!ifresultCd.equals("Z")){
            JAXBElement<String>  ifResult = commDMSDoc.getFooter().getValue().getIFRESULT();
            JAXBElement<String>  ifResultMsg =  commDMSDoc.getFooter().getValue().getIFFAILMSG();

            log.error("commDMSDoc ifResult Value ="+ commDMSDoc.getFooter().getValue().getIFRESULT().getValue());
            log.error("commDMSDoc ifResultMsg Value="+ commDMSDoc.getFooter().getValue().getIFFAILMSG());
            log.error("commDMSDoc IFRESULT ="+ commDMSDoc.getFooter().getValue().getIFRESULT());

            throw processException("global.err.dcsIfErrMsg", new String[] { ifResult.getValue(), ifResultMsg.getValue() });
        }

        //프로시저추가 - 딜러소매실적수신_데이터생성
        deliveryVO.setSpFlag("J1");

        deliveryMngDAO.procDdlRetail(deliveryVO);

        return true;
    }

    /**
     * 고객인도관리 - 고객인도 이벤트
     */
    @Override
    public boolean insertExceptionDelivery(DeliveryVO deliveryVO) throws Exception {

        deliveryVO.setRegUsrId(LoginUtil.getUserId());
        deliveryVO.setReqStatCd("R");
        deliveryMngDAO.insertExceptionDelivery(deliveryVO);

        //프로시저추가 - 강제판매처리신청수신
        deliveryMngDAO.procRfidExcepReq(deliveryVO);

        return true;
    }

    //고객인도 테이블 존재여부 및 승인여부
    @Override
    public List<DeliveryVO> selectExcptApproveYn(DeliveryVO deliveryVO) throws Exception {

        return deliveryMngDAO.selectExcptApproveYn(deliveryVO);
    }

    //이상출고 정보 조회
    @Override
    public List<DeliveryVO> selectExcpDeliveryByCondition(DeliverySearchVO searchVO) throws Exception {
        return deliveryMngDAO.selectExcpDeliveryByCondition(searchVO);
    }

    //이상출고정보 조회
    @Override
    public int selectExcpDeliveryByConditionCnt(DeliverySearchVO searchVO) throws Exception {
        return deliveryMngDAO.selectExcpDeliveryByConditionCnt(searchVO);
    }

    //인도취소
    @Override
    public boolean cancelDelivery(DeliveryVO deliveryVO) throws Exception {

        String contractNo = deliveryVO.getContractNo();
        deliveryVO.setUpdtUsrId(LoginUtil.getUserId());
        deliveryVO.setDlrCd(LoginUtil.getDlrCd());
        deliveryVO.setContractStatCd("91");
        deliveryVO.setGubun("C");

        //이월취소일시 이월취소테이블에 데이터저장.(승인요청로직을 탐)
        if(deliveryVO.getDeliveryGb().equals("Y")){
            deliveryMngDAO.cancelDelivery(deliveryVO);

            //딜러이월소매취소신청수신
            deliveryMngDAO.procRetailCancelReq(deliveryVO);
        }else {
            Map<String, Object> message = new HashMap<String, Object>();

            message.put("KMTRDY", DateUtil.getDate("yyyy-MM-dd"));
            message.put("KMTRTM", DateUtil.getDate("HH:mm:ss"));

            /*인터페이스seq채번*/
            int kmseq = deliveryMngDAO.selectSeqCondition(deliveryVO);
            message.put("KMSEQ", lpad(kmseq+"", "0", 6));

            message.put("KMOPT", "J2");
            message.put("KMSTDY", DateUtil.getDate("yyyy-MM-dd"));
            message.put("KMDCDY", DateUtil.getDate("HH:mm:ss"));
            message.put("KMCNCD", deliveryVO.getCancReasonCd());
            message.put("KMVIN",  deliveryVO.getVinNo());
            message.put("KMDELR", LoginUtil.getDlrCd());
            message.put("KMCTCD", "");

            /*판매사원id가져오기*/
            String salesEmpNo = deliveryMngDAO.selectSalesEmpNoCondition(deliveryVO);
            message.put("KMRGNO", salesEmpNo);

            /*승상구분가져오기*/
            String CarDstinCd = deliveryMngDAO.selectCarDstinCdCondition(deliveryVO);
            message.put("KMOTIT", CarDstinCd);
            message.put("KMCONT", deliveryVO.getContractNo());
            message.put("KMSTDY2","");
            message.put("KMPROP", deliveryVO.getRetlTpCd());
            message.put("KMUSER", LoginUtil.getUserId());

            CommDMSDoc reqCommDMSDoc = new EaiSimpleMessage.Builder()
            .ifId("SAL025")
            .company("H")
            .sender("SAL")
            .receiver(LoginUtil.getDlrCd())
            .flag("Y")
            .addMessage(message)
            .build()
            .buildCommDMSDoc();

            CommDMSDoc commDMSDoc = eaiClient.sendRequest(reqCommDMSDoc);

            String ifresultCd = commDMSDoc.getFooter().getValue().getIFRESULT().getValue();

            if(!ifresultCd.equals("Z")){
                JAXBElement<String>  ifResult = commDMSDoc.getFooter().getValue().getIFRESULT();
                JAXBElement<String>  ifResultMsg =  commDMSDoc.getFooter().getValue().getIFFAILMSG();

                log.error("commDMSDoc ifResult Value ="+ commDMSDoc.getFooter().getValue().getIFRESULT().getValue());
                log.error("commDMSDoc ifResultMsg Value="+ commDMSDoc.getFooter().getValue().getIFFAILMSG());
                log.error("commDMSDoc IFRESULT ="+ commDMSDoc.getFooter().getValue().getIFRESULT());

                throw processException("global.err.dcsIfErrMsg", new String[] { ifResult.getValue(), ifResultMsg.getValue() });
            }

            //고객인도 - 인도취소
            deliveryVO.setSpFlag("J2");
            deliveryMngDAO.procDdlRetail(deliveryVO);

            deliveryVO.setContractNo("");
            deliveryVO.setCarStatCd("60");
            deliveryVO.setTecId("");
            deliveryMngDAO.updateVehicleDelivery(deliveryVO);

            deliveryVO.setContractNo(contractNo);
            deliveryMngDAO.updateContractDelivery(deliveryVO);

            // 고객정보저장
            CustomerInfoVO customerInfoVO = new CustomerInfoVO();
            customerInfoVO.setCommandTp("CONTRACT");
            customerInfoVO.setDlrCd(deliveryVO.getDlrCd());   //DLR_CD 셋팅
            customerInfoVO.setCustCd("01");   // 02:보유고객
            customerInfoVO.setCustNo(deliveryVO.getContractCustNo());    //고객번호 셋팅

            customerInfoVO = customerInfoService.updateCustomer(customerInfoVO);
        }
        return true;
    }


    /**
     * 집단판매 - 고객인도할 차량List를 조회한다.
     */
    @Override
    public List<GroupSalesDeliveryVO> selectGroupSalesDelivery(DeliverySearchVO searchVO) throws Exception {
        return deliveryMngDAO.selectGroupSalesDelivery(searchVO);
    }

    /**
     * 집단판매 - 고객인도할 차량List의 총갯수를 조회한다.
     */
    @Override
    public int selectGroupSalesDeliveryCnt(DeliverySearchVO searchVO) throws Exception {
        return deliveryMngDAO.selectGroupSalesDeliveryCnt(searchVO);
    }

    //이상출고시 첨부파일 추가
    @Override
    public boolean updateAddFile(DeliveryVO deliveryVO) throws Exception {

        deliveryMngDAO.updateAddFile(deliveryVO);
        return true;
    }

    @Override
    public void GroupVehicleDelivery(DeliverySaveVO obj) throws Exception {

        for(GroupSalesDeliveryVO grpVO : obj.getUpdateList()){

            DeliveryVO vo = new DeliveryVO();
            vo.setDlrCd(grpVO.getDlrCd());
            vo.setContractNo(grpVO.getContractNo());
            vo.setGrpContractNo(grpVO.getGrpContractNo());
            vo.setOrdTp(grpVO.getOrdTp());
            vo.setVinNo(grpVO.getVinNo());
            vo.setContractCustNo(grpVO.getCustNo());
            vo.setSsnCrnNo(grpVO.getSsnCrnNo());
            vo.setSaleOpptNo(grpVO.getSaleOpptSeq());
            vo.setRealDlDt(grpVO.getRealDlDt());
            vo.setSaleEmpNo(grpVO.getSaleEmpNo());
            updateVehicleDelivery(vo);
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

    /**
     * 조회 조건에 해당하는 전략출고심사정보를 조회한다.
     */
    @Override
    public List<DeliveryVO> selectTacticsDeliveryReq(DeliverySearchVO searchVO) throws Exception {
        return deliveryMngDAO.selectTacticsDeliveryReq(searchVO);
    }

    /**
     * 조회 조건에 해당하는 전략출고심사정보 총 갯수를 조회한다.
     */
    @Override
    public int selectTacticsDeliveryReqCnt(DeliverySearchVO searchVO) throws Exception {
        return deliveryMngDAO.selectTacticsDeliveryReqCnt(searchVO);
    }

    /**
     * 전략출고 승인 처리 미사용 2017.01.24
     */

    @Override
    public boolean confirmDelivery(DeliveryVO vo)throws Exception{

        vo.setUpdtUsrId(LoginUtil.getUserId());
        vo.setStrStat("B");

        DeliveryVO deliveryVO = new DeliveryVO();

        deliveryVO.setDlrCd(vo.getDlrCd());
        deliveryVO.setVinNo(vo.getVinNo());
        deliveryVO.setContractNo(vo.getContractNo());

        vo.setUpdtUsrId(LoginUtil.getUserId());

        Map<String, Object> message = new HashMap<String, Object>();

        message.put("KMTRDY", DateUtil.getDate("yyyy-MM-dd"));
        message.put("KMTRTM", DateUtil.getDate("HH:mm:ss"));

        /*인터페이스seq채번*/
        int kmseq = deliveryMngDAO.selectSeqCondition(deliveryVO);
        message.put("KMSEQ", lpad(kmseq+"", "0", 6));

        message.put("KMOPT", "J3");
        message.put("KMSTDY", DateUtil.getDate("yyyy-MM-dd"));  //요청년월일(필수)
        message.put("KMDCDY", DateUtil.getDate("HH:mm:ss"));    //요청시간(필수)
        message.put("KMVIN",  vo.getVinNo());                   //VIN_NO(필수)
        message.put("KMDELR", vo.getDlrCd());                   //세션 딜러코드(필수)
        message.put("KMCTCD", "");                              //2급딜러코드

        /*판매사원id가져오기*/
        String salesEmpNo = deliveryMngDAO.selectSalesEmpNoCondition(deliveryVO);
        message.put("KMRGNO", salesEmpNo);                      //판매사원ID(필수)

        /*승상구분가져오기*/
        String CarDstinCd = deliveryMngDAO.selectCarDstinCdCondition(deliveryVO);
        message.put("KMOTIT", CarDstinCd);                      //승상구분(필수)
        message.put("KMCONT", "");                              //계약번호(필수)
        message.put("KMSTDY2","");                              //보증수리시작일

        /*주문타입가져오기*/
        String dlvSltVal = deliveryMngDAO.selectCarDlvSltValCondition(deliveryVO);
        String deliveryRetlTp = "";

        /*가져온 주문타입으로 판매유형 셋팅*/
        if(dlvSltVal.equals("AD")||dlvSltVal.equals("AS")||dlvSltVal.equals("N1")||dlvSltVal.equals("N8")||dlvSltVal.equals("N9")){
            deliveryRetlTp = "P1";
        }else if(dlvSltVal.equals("C1")){
            deliveryRetlTp = "D1";
        }else if(dlvSltVal.equals("N5")||dlvSltVal.equals("NS")){
            deliveryRetlTp = "D2";
        }else if(dlvSltVal.equals("N7")){
            deliveryRetlTp = "D3";
        }else if(dlvSltVal.equals("C3")||dlvSltVal.equals("N6")){
            deliveryRetlTp = "D4";
        }else if(dlvSltVal.equals("C4")){
            deliveryRetlTp = "F1";
        }else if(dlvSltVal.equals("C6")||dlvSltVal.equals("C9")||dlvSltVal.equals("N3")||dlvSltVal.equals("NB")){
            deliveryRetlTp = "F2";
        }else if(dlvSltVal.equals("N4")){
            deliveryRetlTp = "F4";
        }else if(dlvSltVal.equals("C2")||dlvSltVal.equals("C7")||dlvSltVal.equals("C8")||dlvSltVal.equals("N2")){
            deliveryRetlTp = "F5";
        }else {
            deliveryRetlTp = "F1";
        }

        message.put("KMPROP", deliveryRetlTp);          //소매유형코드(필수)
        message.put("KMUSER", LoginUtil.getUserId());   //사용자ID(필수)

        CommDMSDoc reqCommDMSDoc = new EaiSimpleMessage.Builder()
        .ifId("SAL025")
        .company("H")
        .sender("SAL")
        .receiver(LoginUtil.getDlrCd())
        .flag("Y")
        .addMessage(message)
        .build()
        .buildCommDMSDoc();

        CommDMSDoc commDMSDoc = eaiClient.sendRequest(reqCommDMSDoc);

        String ifresultCd = commDMSDoc.getFooter().getValue().getIFRESULT().getValue();

        if(!ifresultCd.equals("Z")){
            JAXBElement<String>  ifResult = commDMSDoc.getFooter().getValue().getIFRESULT();
            JAXBElement<String>  ifResultMsg =  commDMSDoc.getFooter().getValue().getIFFAILMSG();

            log.error("commDMSDoc ifResult Value ="+ commDMSDoc.getFooter().getValue().getIFRESULT().getValue());
            log.error("commDMSDoc ifResultMsg Value="+ commDMSDoc.getFooter().getValue().getIFFAILMSG());
            log.error("commDMSDoc IFRESULT ="+ commDMSDoc.getFooter().getValue().getIFRESULT());

            throw processException("global.err.dcsIfErrMsg", new String[] { ifResult.getValue(), ifResultMsg.getValue() });
        }

        deliveryMngDAO.updateDelivery(vo);

        //전략출고승인인터페이스
        deliveryMngDAO.procTacticsDeliveryApprove(vo);

        return true;
    }

    /**
     * 전략출고 불승인 처리
     */

    @Override
    public boolean rejectDelivery(DeliveryVO vo)throws Exception{
        vo.setUpdtUsrId(LoginUtil.getUserId());
        vo.setStrStat("C");

        deliveryMngDAO.updateDelivery(vo);

        //전략출고승인인터페이스
        deliveryMngDAO.procTacticsDeliveryApprove(vo);
        return true;
    }
}
