package chn.bhmc.dms.sal.dlv.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.sal.dlv.vo.ChargingPileVO;
import chn.bhmc.dms.sal.dlv.vo.ContDeliverySearchVO;
import chn.bhmc.dms.sal.dlv.vo.ContDeliveryVO;
import chn.bhmc.dms.sal.dlv.vo.NewEnergyVSApplicationVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ContDeliveryMngDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim yewon
 * @since 2016. 10. 23
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 10. 23     yewon.kim              최초 생성
 * </pre>
 */

@Mapper("contDeliveryMngDAO")
public interface ContDeliveryMngDAO {

    /**
      * 조회 조건에 해당하는 고객인도 정보를 조회한다.
      */
    public List<ContDeliveryVO> selectContDeliveryByCondition(ContDeliverySearchVO searchVO) throws Exception;

    /**
     *  조회 조건에 해당하는 고객인도목록 총 갯수를 조회한다.
     */
    public int selectContDeliveryByConditionCnt(ContDeliverySearchVO searchVO) throws Exception;

    //차량정보 목록을 조회
    public List<ContDeliveryVO> selectDeliveryVehicleByCondition(ContDeliverySearchVO searchVO) throws Exception;
    public int selectDeliveryVehicleByConditionCnt(ContDeliverySearchVO searchVO) throws Exception;

    /**
     *  고객인도관리 - 차량테이블 (OWN_STAT_CD - 'D',CAR_STAT_CD = 'Q190') 변경.
     */
    public boolean updateVehicleContDelivery(ContDeliveryVO contDeliveryVO) throws Exception;

    /**
     *  고객인도관리 - 계약테이블 (CONTRACT_STAT_CD = '50') 변경.
     */
    public boolean updateContractDelivery(ContDeliveryVO contDeliveryVO) throws Exception;

    //인터페이스seq채번
    public int selectSeqCondition(ContDeliveryVO contDeliveryVO) throws Exception;

    //판매사원id조회
    public String selectSalesEmpNoCondition(ContDeliveryVO contDeliveryVO) throws Exception;


    //승상구분조회
    public String selectCarDstinCdCondition(ContDeliveryVO contDeliveryVO) throws Exception;

    // VIN NO의 차량정보 조회
    public String selectVinTempSearch(ContDeliveryVO contDeliveryVO) throws Exception;
    
    //딜러소매실적수신_데이터생성
    public int procDdlRetail(ContDeliveryVO contDeliveryVO) throws Exception;

    //public String selectCarId(@Param("vinNo") String vinNo);
    public String selectCarId(ContDeliveryVO contDeliveryVO) throws Exception;

    //차량 정보 조회
    public List<ContDeliveryVO> selectContCarInfoSearch(@Param("carId") String carId);

    // 계약 차량정보 저장
    public int updateContractCarInfo(ContDeliveryVO contDeliveryVO) throws Exception;

    /**
     *  출고관리 - 이상출고처리
     */
    public boolean insertExceptionDelivery(ContDeliveryVO contDeliveryVO) throws Exception;

    //  출고관리 - 이상출고   처리강제판매처리신청수신
    public int procRfidExcepReq(ContDeliveryVO contDeliveryVO) throws Exception;

    public int insertVehicleHist0301(ContDeliveryVO contDeliveryVO) throws Exception;
    
    // 이상출고처리 신청중 상태 조회
    public int selectContractExceptionStatByConditionCnt(ContDeliverySearchVO searchVO) throws Exception;
    
    // 계약건의 이상출고처리 신청상태 조회
    public String selectContractExceptionStatYnSearchByCondition(ContDeliverySearchVO searchVO) throws Exception;
    
    // 해당계약번호 or VIn NO 의 이상출고 최종이력을 초기화 한다
    public int updateVhicleExceptionInit(ContDeliveryVO updateVO) throws Exception;

    // 출고스캔요청
    public int updateVhicleDeliveryAsk(ContDeliveryVO updateVO) throws Exception;
    // 출고스캔요청I/F
    public int procDeliveryAsk(ContDeliveryVO updateVO) throws Exception;

	public void insertChargingPile(ChargingPileVO chargingPileVO);

	public NewEnergyVSApplicationVO getNewEnergySubsidy(ContDeliveryVO contDeliveryVO);

	public ChargingPileVO selectUserVO(ContDeliveryVO contDeliveryVO);

	public ContDeliveryVO selectIsCharging(ContDeliveryVO contDeliveryVO);

	public ContDeliveryVO selectModelCdByVin(ContDeliveryVO contDeliveryVO);
	
	//Q21011300013 2020年12月13号，D1096店正常零售的一台车，dms合同信息和sap收到的零售信息，销售顾问不一致。  jiaMing 2021-1-27
	public ContDeliveryVO checkContractNoInfoSaleEmpNo(ContDeliveryVO contDeliveryVO) throws Exception;
}
