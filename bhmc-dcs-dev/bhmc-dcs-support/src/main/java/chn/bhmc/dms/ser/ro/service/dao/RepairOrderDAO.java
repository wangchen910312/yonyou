package chn.bhmc.dms.ser.ro.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.ser.ro.vo.RepairOrderSearchVO;
import chn.bhmc.dms.ser.ro.vo.RepairOrderStatusVO;
import chn.bhmc.dms.ser.ro.vo.RepairOrderVO;

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
 *  2018.06.21.     Jin JUNG        add method - selectROCntByConditionCnt(), selectROCntByCondition()
 * </pre>
 */

@Mapper("repairOrderDAO")
public interface RepairOrderDAO {

    /**
     * 조회 조건에 해당하는 RO접수 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return 조회 목록
     */
    public int selectRepairOrderByConditionCnt(RepairOrderSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 RO접수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return 조회 목록
     */
    public List<RepairOrderVO> selectRepairOrderByCondition(RepairOrderSearchVO searchVO);


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
     * 조회 조건에 해당하는 RO KEY 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return 조회 목록
     */
    public RepairOrderVO selectRepairOrderByKey(RepairOrderSearchVO searchVO) throws Exception;

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
     * 조회 조건에 해당하는 딜러별 RO count 이력 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return 조회 목록
     */
    public int selectROCntByConditionCnt(RepairOrderSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 딜러별 RO count 이력을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return 조회 목록
     */
    public List<RepairOrderStatusVO> selectROCntByCondition(RepairOrderSearchVO searchVO) throws Exception;

}