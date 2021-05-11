package chn.bhmc.dms.ser.ro.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.ser.ro.vo.RepairCheckSearchVO;
import chn.bhmc.dms.ser.ro.vo.RepairOrderSearchVO;
import chn.bhmc.dms.ser.ro.vo.RepairOrderVO;
import chn.bhmc.dms.ser.ro.vo.SpecialVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RepairOrderDAO.java
 * @Description : RO DAO
 * @author KyungMok Kim
 * @since 2016. 3. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 14.   KyungMok Kim     최초 생성
 * </pre>
 */

@Mapper("repairOrderDAO")
public interface RepairOrderDAO {

    /**
     * 조회 조건에 해당하는 RO접수 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return 조회 목록
     */
    public int selectRepairOrderByConditionCnt(RepairOrderSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 RO접수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return 조회 목록
     */
    public List<RepairOrderVO> selectRepairOrderByCondition(RepairOrderSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 RO접수 현황 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return 조회 목록
     */
    public int selectRepairOrderListByConditionCnt(RepairOrderSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 RO접수 현황 를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return 조회 목록
     */
    public List<RepairOrderVO> selectRepairOrderListByCondition(RepairOrderSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 RO 정보 현황 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return 조회 목록
     */
    public int selectRepairOrderInfoListByConditionCnt(RepairOrderSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 RO정보 현황 를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return 조회 목록
     */
    public List<RepairOrderVO> selectRepairOrderInfoListByCondition(RepairOrderSearchVO searchVO) throws Exception;


    /**
     * RO접수 정보를 등록한다.
     * @param obj - 등록할 정보가 담긴 RepairOrderVO
     * @return 등록된 목록수
     */
    public void insertRepairOrder(RepairOrderVO obj);

    /**
     * RO접수 정보를 수정한다.
     * @param obj - 수정할 정보가 담긴 RepairOrderVO
     * @return 수정된 목록수
     */
    public void updateRepairOrder(RepairOrderVO obj);

    /**
     * RO접수 정보를 삭제한다.
     * @param obj - 삭제할 정보가 담긴 RepairOrderVO
     * @return 삭제된 목록수
     */
    public void deleteRepairOrder(RepairOrderVO obj);

    /**
     * 조회 조건에 해당하는 RO,사전점검 KEY 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return 조회 목록
     */
    public RepairOrderVO selectRepairOrderByKey(RepairOrderSearchVO searchVO) throws Exception;

    /**
    /**
     * 조회 조건에 해당하는 RO,사전점검 KEY 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return 조회 목록
     */
    public RepairOrderVO selectRepairOrderWorkByKey(RepairOrderSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 RO KEY 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return 조회 목록
     */
    public RepairOrderVO selectRepairOrderInfoByKey(RepairOrderSearchVO searchVO) throws Exception;

    /**
     * RO접수 여부를 조회한다.
     * @param repairOrderVO -
     * @return RO 접수 여부
     */
    public String selectRepairOrderCheckByKey(RepairOrderSearchVO repairOrderVO)throws Exception;

    /**
     * 원인부품에 대해 이전 RO 정보를  조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return 조회 목록
     */
    public List<RepairOrderVO> selectPreRepairOrderByCondition(RepairOrderSearchVO searchVO)throws Exception;

    /**
     * 작업진도 칸반 RO 정보를  조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return 조회 목록
     */
    public List<RepairOrderVO> selectWorkProcessKanban(RepairOrderSearchVO searchVO)throws Exception;

    /**
     * 작업진도 페인트 칸반 RO 정보를  조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return 조회 목록
     */
    public List<RepairOrderVO> selectPaintKanban(RepairOrderSearchVO searchVO)throws Exception;

    /**
     * 작업진도 페인트 칸반 RO 정보를  조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return 조회 목록
     */
    public List<RepairOrderVO> selectCarWashKanban(RepairOrderSearchVO searchVO)throws Exception;

    /**
     * 인도현황 보드  칸반 RO 정보를  조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return 조회 목록
     */
    public List<RepairOrderVO> selectDeliveryKanban(RepairOrderSearchVO searchVO)throws Exception;

    /**
     * 인도현황 보드  칸반 RO 컬럼 정보를  조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return 조회 목록
     */
    public List<RepairOrderVO> selectDeliveryKanbanRowsByCondition(RepairOrderSearchVO searchVO)throws Exception;

    /**
     * 사전점검 상태 업데이트
     * @param searchVO - 수정할 정보가 담긴 RepairOrderVO
     * @return
     */
    public int updatePreCheckStat(RepairOrderVO repairOrderVO)throws Exception;

    /**
     *
     * 인도 체크 화면에서 RO 취소시 작업배분 데이터 삭제
     *
     * @param repairOrderVO
     * @return
     * @throws Exception
     */
    public int deleteDelivery(RepairOrderVO repairOrderVO)throws Exception;

    /**
     * 조회 조건에 해당하는 RO진도 현황 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return 조회 목록
     */
    public int selectRepairOrderProcessByConditionCnt(RepairOrderSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 RO진도 현황 를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return 조회 목록
     */
    public List<RepairOrderVO> selectRepairOrderProcessByCondition(RepairOrderSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 RO히스토리를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return 조회 목록
     */
    public List<RepairOrderVO> selectRepairOrderHistoryByCondition(RepairOrderSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 세차 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return 조회 목록
     */
    public int selectCarWashListByConditionCnt(RepairOrderSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 세차를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return 조회 목록
     */
    public List<RepairOrderVO> selectCarWashListByCondition(RepairOrderSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 공임이력 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return 조회 목록
     */
    public int selectLbrHistListByConditionCnt(RepairOrderSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 공임이력을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return 조회 목록
     */
    public List<RepairOrderVO> selectLbrHistListByCondition(RepairOrderSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 고객의견 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return 조회 목록
     */
    public int selectCustDmndHistListByConditionCnt(RepairOrderSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 고객의견을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return 조회 목록
     */
    public List<RepairOrderVO> selectCustDmndHistListByCondition(RepairOrderSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 기타사항 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return 조회 목록
     */
    public int selectEtcHistListByConditionCnt(RepairOrderSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 기타사항을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return 조회 목록
     */
    public List<RepairOrderVO> selectEtcHistListByCondition(RepairOrderSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 RO 갯수를 조회한다. (처음수리여부 판단)
     * @param RepairOrderVO
     * @return 조회 목록
     */
    public int selectFirstRoYnCnt(RepairOrderVO repairOrderVO) throws Exception;
    
    /**
     * 交车检查维修派工/维修进度校验
     * @param repairOrderSearchVO
     * @return
     */
	public List<RepairCheckSearchVO> selectRepairCheckByCondition(RepairOrderSearchVO repairOrderSearchVO);

	/**
	 * 查询是否有维修委托权限
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	public int selectUsrServicePowerByCondition(String userId) throws Exception;

	/**
	 * 维修委托确认对维修预约单状态确认
	 * @param roVO
	 * @return
	 * @throws Exception
	 */
	public String selectResvDocNoInfoByKey(RepairOrderVO roVO) throws Exception;

	/**
	 * 2020.11.11将修改前关联的预约单号状态调整为"预约确认"
	 * @param repairOrderVO
	 */
	public void updateResvDocNoInfoByKey(RepairOrderVO repairOrderVO) throws Exception;

	/**
	 * 查询是否一个接车单开了多张委托单
	 * @param roVO
	 * @return
	 * @throws Exception
	 */
	public int selectRodocInfoCnt(RepairOrderVO roVO) throws Exception;
	
	/**
	 * 需求 327 交车确认时提醒客户要在APP端进行确认，服务结算时校验是否已收到APP的确认   取消交车时，清空se_0300t 表 cust_confirm_cd 01APP确认 02系统确认 空未确认 字段值 JiaMing 2021-3-31   
	 * @param repairOrderVO
	 * @return
	 * @throws Exception
	 */
	public int updateCustConfirmCd(RepairOrderVO repairOrderVO)throws Exception;
    
	/**
     * 需求 327 交车确认时提醒客户要在APP端进行确认，服务结算时校验是否已收到APP的确认   取消交车时，更改SE_1162T 表 CANCEL_YN 字段为 Y JiaMing 2021-4-7
     * 查询特殊车辆宴请工单表信息 
     * @param repairOrderVO
     * @return
     */
	public SpecialVO selectSpecialInfo(RepairOrderVO repairOrderVO) throws Exception;

	/**
	 * 需求 327 交车确认时提醒客户要在APP端进行确认，服务结算时校验是否已收到APP的确认   取消交车时，更改SE_1162T 表 CANCEL_YN 字段为 Y JiaMing 2021-4-7
	 * @param specialVO
	 * @throws Exception
	 */
	public void updateCancelYn(SpecialVO specialVO) throws Exception;
	
}