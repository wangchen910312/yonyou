package chn.bhmc.dms.sal.veh.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.veh.vo.VehicleCustomerInfoVO;
import chn.bhmc.dms.sal.veh.vo.VehicleDeliveryVO;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VehicleMasterDAO.java
 * @Description : 차량마스터 관리
 * @author Kim yewon
 * @since 2016. 1. 29
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 29      Kim yewon              최초 생성
 * </pre>
 */

@Mapper("vehicleMasterDAO")
public interface VehicleMasterDAO {

    /**
      * 조회 조건에 해당하는 차량마스터 정보를 조회한다.
      */
    public List<VehicleMasterVO> selectVehicleMasterByCondition(VehicleMasterSearchVO searchVO);
    public int selectVehicleMasterByConditionCnt(VehicleMasterSearchVO searchVO);

    /**
     * CRM : 차량 계약자 정보 조회
     */
    public int selectVehicleCustomerInfoByConditionCnt(VehicleMasterSearchVO searchVO) throws Exception;
    public List<VehicleCustomerInfoVO> selectVehicleCustomerInfoByCondition(VehicleMasterSearchVO searchVO) throws Exception;

    /**
     * 차량마스터 메인 저장한다.
     */
    public void updateVehicleMasterMain(VehicleMasterVO saveVO) throws Exception;


    /**
     * 조회 조건에 해당하는 차량소유자 정보를 조회한다.
     */
    public int selectVehicleMasterOwnerByConditionCnt(VehicleMasterSearchVO searchVO) throws Exception;
    public List<VehicleMasterVO> selectVehicleMasterOwnerByCondition(VehicleMasterSearchVO searchVO) throws Exception;

    /**
     * 차량소유자 사용여부를 N으로 변경
     */
    public int updateOwnerNonUsed(VehicleMasterVO saveVO) throws Exception;

    /**
     * 차량 소유자 등록
     */
    public int insertVehicleOwner(VehicleMasterVO vo) throws Exception;
    /**
     * 차량 소유자 수정
     */
    public int updateVehicleOwner(VehicleMasterVO vo) throws Exception;

    /**
     * 조회 조건에 해당하는 차량운전자 정보를 조회한다.
     */
    public int selectVehicleMasterDriverByConditionCnt(VehicleMasterSearchVO searchVO) throws Exception;
    public List<VehicleMasterVO> selectVehicleMasterDriverByCondition(VehicleMasterSearchVO searchVO);

    /**
     * 차량 운전자 등록
     */
    public int insertVehicleDriver(VehicleMasterVO vo) throws Exception;
    /**
     * 차량 운전자 수정
     */
    public int updateVehicleDriver(VehicleMasterVO vo) throws Exception;

    /**
     * [서비스모듈] 차량운전자의 주운전자여부를 N으로 일괄 변경한다.
     */
    public int updateNonMdriver(VehicleMasterVO vo) throws Exception;

    /**
     * 조회 조건에 해당하는 옵션 정보를 조회한다.
     */
    public int selectVehicleMasterOptionsByConditionCnt(VehicleMasterSearchVO searchVO) throws Exception;
    public List<VehicleMasterVO> selectVehicleMasterOptionsByCondition(VehicleMasterSearchVO searchVO);

    /**
     * 옵션 등록
     */
    public int insertVehicleOption(VehicleMasterVO vo) throws Exception;
    /**
     * 옵션 수정
     */
    public int updateVehicleOption(VehicleMasterVO vo) throws Exception;

    /**
     * 조회 조건에 해당하는 계약 정보를 조회한다.
     */
    public int selectVehicleMasterContractsByConditionCnt(VehicleMasterSearchVO searchVO) throws Exception;
    public List<VehicleMasterVO> selectVehicleMasterContractsByCondition(VehicleMasterSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 주문 정보를 조회한다.
     */
    public int selectVehicleMasterOrdersByConditionCnt(VehicleMasterSearchVO searchVO) throws Exception;
    public List<VehicleMasterVO> selectVehicleMasterOrdersByCondition(VehicleMasterSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 재고 정보를 조회한다.
     */
    public int selectVehicleMasterStocksByConditionCnt(VehicleMasterSearchVO searchVO) throws Exception;
    public List<VehicleMasterVO> selectVehicleMasterStocksByCondition(VehicleMasterSearchVO searchVO) throws Exception;


    /**
     * 조회 조건에 해당하는 차량마스터관리 - PopUp 목록을 조회한다.
     */
    public int selectVehicleMasterStsByConditionCnt(VehicleMasterSearchVO searchVO) throws Exception;
    public List<VehicleMasterVO> selectVehicleMasterStsByCondition(VehicleMasterSearchVO searchVO) throws Exception;


    public int selectVehicleVinNo(VehicleMasterSearchVO searchVO) throws Exception;


    //정비에서 필요되는 신차정보 저장 로직.
    public int insertNewCar(VehicleMasterVO vo) throws Exception;
    public int updateNewCar(VehicleMasterVO vo) throws Exception;

    public int selectVinNoCnt(VehicleMasterVO searchVO) throws Exception;
    public int selectNewVinNoCnt(VehicleMasterVO searchVO) throws Exception;
    public int selectNewVinNoChkCnt(VehicleMasterVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 출입고내역을 조회한다.
     */
    public int selectVehicleMasterDeliveryHistCnt(VehicleMasterSearchVO searchVO) throws Exception;
    public List<VehicleMasterVO> selectVehicleMasterDeliveryHist(VehicleMasterSearchVO searchVO) throws Exception;

    /**
     * 차량 출고내역 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<VehicleDeliveryVO> selectVehicleDeliverySearch(VehicleMasterSearchVO searchVO) throws Exception;

    /**
     * [CRM 전용]:고객번호로 자사보유차량 대수/타사보유차량 대수 산출
     **/
    public List<VehicleMasterVO> selectVehicleCustCntSearch(VehicleMasterSearchVO searchVO) throws Exception;

    public List<VehicleMasterVO> selectWrrntEndDt(VehicleMasterSearchVO searchVO);
}
