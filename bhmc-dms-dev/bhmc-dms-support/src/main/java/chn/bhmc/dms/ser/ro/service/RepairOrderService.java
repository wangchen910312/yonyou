package chn.bhmc.dms.ser.ro.service;

import java.util.List;

import chn.bhmc.dms.ser.ro.vo.RepairOrderSaveVO;
import chn.bhmc.dms.ser.ro.vo.RepairOrderSearchVO;
import chn.bhmc.dms.ser.ro.vo.RepairOrderVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RepairOrderService.java
 * @Description : Ro Service
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

public interface RepairOrderService {

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
     * RO접수를 등록/수정한다.
     * @param repairOrderSaveVO - RO/부품/공임을 포함하는 RepairOrderSaveVO
     * @return
     */
    public String multiRepairOrder(RepairOrderSaveVO repairOrderSaveVO) throws Exception;

    /**
     * 조회 조건에 해당하는 RO , 사전점검 KEY 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return 조회 목록
     */
    public RepairOrderVO selectRepairOrderByKey(RepairOrderSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 RO , 사전점검 KEY 정보를 조회한다.
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
     * RO접수를 수정한다.
     * @param repairOrderVO -
     * @return
     */
    public String updateRepairOrder(RepairOrderVO repairOrderVO) throws Exception;

    /**
     * RO접수 여부를 조회한다.
     * @param repairOrderVO -
     * @return
     */
    public String selectRepairOrderCheckByKey(RepairOrderSearchVO repairOrderVO) throws Exception;

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
     * 정비 이력 조회
     *
     * @param searchVO
     * @return
     */
    public List<RepairOrderVO> selectRepairOrdersHistory(RepairOrderSearchVO searchVO)throws Exception;

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
     * 인도 체크 정보 업데이트
     * Statements
     *
     * @param repairOrderVO
     * @return
     * @throws Exception
     */
    public String updateDelivery(RepairOrderVO repairOrderVO)throws Exception;

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
     * RO변경알람,SMS
     * @param repairOrderVO - 수정할 정보가 담긴 RepairOrderVO
     * @return
     */
    public void roChangeAlramCall(RepairOrderVO repairOrderVO) throws Exception;

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
     * 2020.09.25
     * 查看DMS登陆用户是否有维修委托权限,没有则不能从维修委托查询页面跳转
     * TJX
     * @return 
     */
	public int selectUsrServicePower(String userId) throws Exception;
}