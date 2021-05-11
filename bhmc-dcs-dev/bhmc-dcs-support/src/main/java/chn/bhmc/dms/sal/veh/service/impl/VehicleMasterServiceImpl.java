package chn.bhmc.dms.sal.veh.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoVO;
import chn.bhmc.dms.sal.veh.service.VehicleMasterService;
import chn.bhmc.dms.sal.veh.service.dao.VehicleMasterDAO;
import chn.bhmc.dms.sal.veh.vo.VehicleCustomerInfoVO;
import chn.bhmc.dms.sal.veh.vo.VehicleDeliveryVO;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterSaveVO;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterVO;

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
     * 고객 필수정보
     */
    @Resource(name="customerInfoOutBoundService")
    CustomerInfoOutBoundService customerInfoOutBoundService;


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

        if(StringUtil.nullConvert(saveVO.getVehicleMasterVO().getEnginSerialNo()).length() == 12){
            saveVO.getVehicleMasterVO().setEnginModelCd((saveVO.getVehicleMasterVO().getEnginSerialNo()).substring(0,6));   //엔진모델
            saveVO.getVehicleMasterVO().setEnginSerialNo((saveVO.getVehicleMasterVO().getEnginSerialNo()).substring(6));    //엔진시리얼
        }

        vehicleMasterDAO.updateVehicleMasterMain(saveVO.getVehicleMasterVO());

        //차량소유자 정보
        if(saveVO.getOwnerGridVO() != null){
            saveVehicleMasterOwner(saveVO);
        }

        //차량운전자 정보
        if(saveVO.getDriverGridVO() != null){
            saveVehicleMasterDriver(saveVO);
        }

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
            @SuppressWarnings("unused")
            String ownCd = "";
            if(ownList != null && ownList.size() > 0){
                ownCd = ownList.get(0).getBpCd();
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

        vehicleMasterDAO.updateNonMdriver(vo);      // 차량운전자의 주운전자여부를 N으로 변경
        vehicleMasterDAO.insertVehicleDriver(vo);
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
        return vehicleMasterDAO.selectVehicleMasterContractsByCondition(searchVO);
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
     * [CRM 전용]:고객번호로 자사보유차량 대수/타사보유차량 대수 산출
     **/
    @Override
    public List<VehicleMasterVO> selectVehicleCustCntSearch(VehicleMasterSearchVO searchVO) throws Exception{
        return vehicleMasterDAO.selectVehicleCustCntSearch(searchVO);
    }

    @Override
    public List<VehicleMasterVO> selectWrrntEndDt(VehicleMasterSearchVO searchVO) throws Exception {
        List<VehicleMasterVO> list = vehicleMasterDAO.selectWrrntEndDt(searchVO);

        return list;
    }

}