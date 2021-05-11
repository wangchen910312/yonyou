package chn.bhmc.dms.sal.dlv.service;

import java.util.List;

import chn.bhmc.dms.sal.dlv.vo.ChargingPileVO;
import chn.bhmc.dms.sal.dlv.vo.ContDeliverySearchVO;
import chn.bhmc.dms.sal.dlv.vo.ContDeliveryVO;
import chn.bhmc.dms.sal.dlv.vo.NewEnergyVSApplicationVO;

/**
 * 계약출고관리 서비스
 *
 * @author yewon.kim
 * @since 2016. 10. 23.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일              수정자                수정내용
 *  ----------------   ------------    ---------------------------
 *   2016. 10. 23.       yewon.kim            최초 생성
 * </pre>
 */

public interface ContDeliveryMngService {


	/**
     * 조회 조건에 해당하는 계약출고관리 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DeliverySearchVO
     * @return 조회 목록
     */
	public List<ContDeliveryVO> selectContDeliveryByCondition(ContDeliverySearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 계약출고관리 목록의  총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AssignSearchVO
     * @return
     */
	public int selectContDeliveryByConditionCnt(ContDeliverySearchVO searchVO) throws Exception;



	//차량목록 조회
	public List<ContDeliveryVO> selectDeliveryVehicleByCondition(ContDeliverySearchVO searchVO) throws Exception;
	public int selectDeliveryVehicleByConditionCnt(ContDeliverySearchVO searchVO) throws Exception;


	//출고관리 - 인도처리
	public boolean updateVehicleContDelivery(ContDeliveryVO contDeliveryVO) throws Exception;

	//출고관리 - 이상출고처리
	public boolean insertExceptionDelivery(ContDeliveryVO contDeliveryVO) throws Exception;
	
	//출고관리 - 이상출고 스캔요청
	public boolean deliveryAsk(ContDeliveryVO contDeliveryVO) throws Exception;
	
	
	//이상출고처리 신청중 상태 조회
	public int selectContractExceptionStatByConditionCnt(ContDeliverySearchVO searchVO) throws Exception;
	
    // 계약건의 이상출고처리 신청상태 조회
    public String selectContractExceptionStatYnSearchByCondition(ContDeliverySearchVO searchVO) throws Exception;

	public NewEnergyVSApplicationVO getNewEnergySubsidy(ContDeliveryVO contDeliveryVO);

	public void insertChargingPile(ChargingPileVO chargingPileVO);

	public ChargingPileVO selectUserVO(ContDeliveryVO contDeliveryVO);

	public ContDeliveryVO selectIsCharging(ContDeliveryVO contDeliveryVO);
	
	//Q21011300013 2020年12月13号，D1096店正常零售的一台车，dms合同信息和sap收到的零售信息，销售顾问不一致。  jiaMing 2021-1-27
   public ContDeliveryVO checkContractNoInfoSaleEmpNo(ContDeliveryVO contDeliveryVO) throws Exception;
	
}
