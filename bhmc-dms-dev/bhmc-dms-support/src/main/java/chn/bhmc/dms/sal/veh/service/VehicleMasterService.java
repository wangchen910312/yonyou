package chn.bhmc.dms.sal.veh.service;

import java.util.List;
import java.util.Map;

import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.sal.veh.vo.VehicleCustomerInfoVO;
import chn.bhmc.dms.sal.veh.vo.VehicleDeliveryVO;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterSaveVO;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterVO;

/**
 * 차량마스터 관리
 *
 * @author Kim yewon
 * @since 2016. 1. 29.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                       수정자                              수정내용
 *  ----------------   ------------    ---------------------------
 *   2016.01.29         Kim yewon            최초 생성
 * </pre>
 */

public interface VehicleMasterService {


	/**
     * 조회 조건에 해당하는 차량마스터 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleMasterSearchVO
     * @return 조회 목록
     */
	public List<VehicleMasterVO> selectVehicleMasterByCondition(VehicleMasterSearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 차량마스터 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleMasterSearchVO
     * @return
     */
	public int selectVehicleMasterByConditionCnt(VehicleMasterSearchVO searchVO) throws Exception;

	/**
	 * CRM : 차량 계약자 정보 조회
	 */
	public int selectVehicleCustomerInfoByConditionCnt(VehicleMasterSearchVO searchVO) throws Exception;
	public List<VehicleCustomerInfoVO> selectVehicleCustomerInfoByCondition(VehicleMasterSearchVO searchVO) throws Exception;

	/**
	 * 차량마스터 메인 저장한다.
	 * @param saveVO
	 */
	public void saveVehicleMasterMain(VehicleMasterSaveVO saveVO) throws Exception;



	/**
	 * 조회 조건에 해당하는 차량소유자 정보를 조회한다.
	 * @param searchVO - 조회 조건을 포함하는 VehicleMasterSearchVO
	 * @return 조회 목록
	 */
	public int selectVehicleMasterOwnerByConditionCnt(VehicleMasterSearchVO searchVO) throws Exception;
	public List<VehicleMasterVO> selectVehicleMasterOwnerByCondition(VehicleMasterSearchVO searchVO) throws Exception;

	/**
	 * 차량마스터 - 차량소유자 저장
	 * @param saveVO
	 * @return
	 * @throws Exception
	 */
	public void saveVehicleMasterOwner(VehicleMasterSaveVO saveVO) throws Exception;


    /**
     * 조회 조건에 해당하는 차량운전자 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleMasterSearchVO
     * @return 조회 목록
     */
    public int selectVehicleMasterDriverByConditionCnt(VehicleMasterSearchVO searchVO) throws Exception;
    public List<VehicleMasterVO> selectVehicleMasterDriverByCondition(VehicleMasterSearchVO searchVO) throws Exception;

    /**
     * 차량마스터 - 차량운전자 저장
     * @param saveVO
     * @return
     * @throws Exception
     */
    public void saveVehicleMasterDriver(VehicleMasterSaveVO saveVO) throws Exception;

    /**
     * [서비스모듈] 차량운전자 저장한다.
     * @param insertVO
     * @return
     * @throws Exception
     */
    public int insertVehicleMasterDriverService(VehicleMasterVO insertVO) throws Exception;

    /**
     * 조회 조건에 해당하는 옵션 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleMasterSearchVO
     * @return 조회 목록
     */
    public int selectVehicleMasterOptionsByConditionCnt(VehicleMasterSearchVO searchVO) throws Exception;
    public List<VehicleMasterVO> selectVehicleMasterOptionsByCondition(VehicleMasterSearchVO searchVO) throws Exception;

    /**
     * 차량마스터 - 옵션 저장
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int saveVehicleMasterOption(VehicleMasterSaveVO saveVO) throws Exception;

    /**
     * 조회 조건에 해당하는 계약 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleMasterSearchVO
     * @return 조회 목록
     */
    public int selectVehicleMasterContractsByConditionCnt(VehicleMasterSearchVO searchVO) throws Exception;
    public List<VehicleMasterVO> selectVehicleMasterContractsByCondition(VehicleMasterSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 주문 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleMasterSearchVO
     * @return 조회 목록
     */
    public int selectVehicleMasterOrdersByConditionCnt(VehicleMasterSearchVO searchVO) throws Exception;
    public List<VehicleMasterVO> selectVehicleMasterOrdersByCondition(VehicleMasterSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 재고 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleMasterSearchVO
     * @return 조회 목록
     */
    public int selectVehicleMasterStocksByConditionCnt(VehicleMasterSearchVO searchVO) throws Exception;
    public List<VehicleMasterVO> selectVehicleMasterStocksByCondition(VehicleMasterSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 엔진히스토리 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleMasterSearchVO
     * @return 조회 목록
     */
    public List<VehicleMasterVO> selectVehicleMasterEngineHistory(VehicleMasterSearchVO searchVO) throws Exception;

    /**
     * 차량마스터관리 - PopUp 조회 조건에 해당하는 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleMasterSearchVO
     * @return 조회 목록
     */
    public int selectVehicleMasterStsByConditionCnt(VehicleMasterSearchVO searchVO) throws Exception;
    public List<VehicleMasterVO> selectVehicleMasterStsByCondition(VehicleMasterSearchVO searchVO) throws Exception;


    public int selectVehicleVinNo(VehicleMasterSearchVO searchVO) throws Exception;


    //정비에서 필요되는 신차정보 저장 로직.
    public String saveNewCar(VehicleMasterVO saveVO) throws Exception;

    /**
     * 조회 조건에 해당하는 차량입출고내역을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleMasterSearchVO
     * @return 조회 목록
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
    *
    * CamelClent
    *
    * @param message
    * @param ifId
    * @return
    * @throws Exception
    */
   public boolean executeCamelClent(Map<String, Object> message , String ifId)throws Exception;

   /**
    *
    * CamelClent
    *
    * @param message
    * @param ifId
    * @return
    * @throws Exception
    */
   public Data executeCamelClentSearchResult(Map<String, Object> message , String ifId)throws Exception;

   public List<VehicleMasterVO> selectDcsVehicleInfo(VehicleMasterSearchVO searchVO) throws Exception ;

   public List<VehicleMasterVO> selectDcsVehicleInfoGathering(VehicleMasterSearchVO searchVO) throws Exception ;


   /**
    * [CRM 전용]:고객번호로 자사보유차량 대수/타사보유차량 대수 산출
    **/
   public List<VehicleMasterVO> selectVehicleCustCntSearch(VehicleMasterSearchVO searchVO) throws Exception;

   public List<VehicleMasterVO> selectWrrntEndDt(VehicleMasterSearchVO searchVO) throws Exception;
   
   /**
    * <p>Title: 更新车辆绑定发票标识</p>
    * @author Gongrs 2021年4月12日 下午5:39:54
    * @param vinNo：车辆VIN码；bindingReceiptFlag：绑定发票标识(01.未绑定、02.机动车发票、03.增值税发票)
    */
   public void updateCarAfterVerify(VehicleMasterVO vehicleMasterVO) throws Exception;
   
   /**
    * <p>Title: 根据carId查询车辆信息</p>
    * @author Gongrs 2021年4月15日 下午6:26:04
    * @param carId:车辆主键
    * @return VehicleMasterVO
    */
   public VehicleMasterVO selectCarInfoByCarId(String carId);
   
   /**
    * <p>Title:绑定车架号-查询车辆信息数量 </p >
    * @author TangWei 2021年4月15日 下午4:39:34
    * @param VehicleMasterSearchVO searchVO
    * @return VehicleMasterVO
    */
   public int selectBindingVinNoCarInfoCnt(VehicleMasterSearchVO searchVO) throws Exception;
   
   /**
    * <p>Title:绑定车架号-查询车辆信息数据 </p >
    * @author TangWei 2021年4月15日 下午4:39:34
    * @param VehicleMasterSearchVO searchVO
    * @return VehicleMasterVO
    */
   public List<VehicleMasterVO> selectBindingVinNoCarInfoData(VehicleMasterSearchVO searchVO) throws Exception;
}