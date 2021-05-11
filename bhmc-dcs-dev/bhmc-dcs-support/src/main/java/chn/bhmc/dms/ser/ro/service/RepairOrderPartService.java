package chn.bhmc.dms.ser.ro.service;

import java.util.List;

import chn.bhmc.dms.ser.ro.vo.RepairOrderPartVO;
import chn.bhmc.dms.ser.ro.vo.RepairOrderSearchVO;
import chn.bhmc.dms.ser.ro.vo.RepairOrderVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RepairOrderPartService.java
 * @Description : RO접수 부품 Service
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

public interface RepairOrderPartService {

    /**
     * 조회 조건에 해당하는 부품 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return 조회 목록
     */
    public int selectRepairOrderPartsByConditionCnt(RepairOrderSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 부품을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return 조회 목록
     */
    public List<RepairOrderPartVO> selectRepairOrderPartsByCondition(RepairOrderSearchVO searchVO) throws Exception;

    /**
     * RO접수 부품을 등록/수정한다.
     * @param repairOrderPartSaveVO - 부품정보를 포함하는 RepairOrderPartVO
     * @return
     */
    public void multiRepairOrderPart(List<RepairOrderPartVO> repairOrderPartSaveVO, RepairOrderVO repairOrderVO) throws Exception;

    /**
     * RO접수 부품을 삭제한다.
     * @param resvDocNo
     * @return
     */
    public void deleteRepairOrderPart(RepairOrderPartVO repairOrderPartVO) throws Exception;

    /**
     * RO접수 부품을 추가한다.
     * @param resvDocNo
     * @return
     */
    public void insertRepairOrderPart(RepairOrderPartVO repairOrderPartVO) throws Exception;

    /**
     * RO접수 부품을 수정한다.
     * @param resvDocNo
     * @return
     */
    public void updateRepairOrderPart(RepairOrderPartVO repairOrderPartVO) throws Exception;

}