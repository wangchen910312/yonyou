package chn.bhmc.dms.ser.ro.service;

import java.util.List;

import chn.bhmc.dms.ser.ro.vo.PreRepairOrderSaveVO;
import chn.bhmc.dms.ser.ro.vo.PreRepairOrderSearchVO;
import chn.bhmc.dms.ser.ro.vo.PreRepairOrderVO;


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

public interface PreRepairOrderService {

    /**
     * 조회 조건에 해당하는 RO접수 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PreRepairOrderSearchVO
     * @return 조회 목록
     */
    public int selectPreRepairOrderByConditionCnt(PreRepairOrderSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 RO접수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PreRepairOrderSearchVO
     * @return 조회 목록
     */
    public List<PreRepairOrderVO> selectPreRepairOrderByCondition(PreRepairOrderSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 RO접수 현황 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PreRepairOrderSearchVO
     * @return 조회 목록
     */
    public int selectPreRepairOrderListByConditionCnt(PreRepairOrderSearchVO searchVO)throws Exception;

    /**
     * 조회 조건에 해당하는 RO접수 현황 를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PreRepairOrderSearchVO
     * @return 조회 목록
     */
    public List<PreRepairOrderVO> selectPreRepairOrderListByCondition(PreRepairOrderSearchVO searchVO)throws Exception;

    /**
     * RO접수를 등록/수정한다.
     * @param repairOrderSaveVO - RO/부품/공임을 포함하는 PreRepairOrderSaveVO
     * @return
     */
    public String multiPreRepairOrder(PreRepairOrderSaveVO repairOrderSaveVO) throws Exception;

    /**
     * 조회 조건에 해당하는 RO , 사전점검 KEY 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PreRepairOrderSearchVO
     * @return 조회 목록
     */
    public PreRepairOrderVO selectPreRepairOrderByKey(PreRepairOrderSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 RO KEY 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PreRepairOrderSearchVO
     * @return 조회 목록
     */
    public PreRepairOrderVO selectPreRepairOrderInfoByKey(PreRepairOrderSearchVO searchVO) throws Exception;

     /**
     * RO접수를 수정한다.
     * @param repairOrderVO -
     * @return
     */
    public String updatePreRepairOrder(PreRepairOrderVO repairOrderVO) throws Exception;

    /**
     * RO접수 여부를 조회한다.
     * @param repairOrderVO -
     * @return
     */
    public String selectPreRepairOrderCheckByKey(PreRepairOrderSearchVO repairOrderVO) throws Exception;


}