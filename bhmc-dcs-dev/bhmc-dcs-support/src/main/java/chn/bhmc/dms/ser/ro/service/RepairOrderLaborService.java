package chn.bhmc.dms.ser.ro.service;

import java.util.List;

import chn.bhmc.dms.ser.ro.vo.RepairOrderLaborVO;
import chn.bhmc.dms.ser.ro.vo.RepairOrderSearchVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RepairOrderLaborService.java
 * @Description : RO접수 공임 Service
 * @author KyungMok Kim
 * @since 2016. 1. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 19.   KyungMok Kim     최초 생성
 * </pre>
 */

public interface RepairOrderLaborService {

    /**
     * 조회 조건에 해당하는 공임 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return 조회 목록
     */
    public int selectRepairOrderLaborsByConditionCnt(RepairOrderSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 공임을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return 조회 목록
     */
    public List<RepairOrderLaborVO> selectRepairOrderLaborsByCondition(RepairOrderSearchVO searchVO) throws Exception;

    /**
     * RO접수 공임을 등록/수정/삭제한다.
     * @param repairOrderLaborSaveVO - 공임정보를 포함하는 RepairOrderPartVO
     * @return
     */
    public void multiRepairOrderLabor(List<RepairOrderLaborVO> repairOrderLaborSaveVO, String roDocNo) throws Exception;

    /**
     * RO접수 공임을 삭제한다.
     * @param repairOrderPartSaveVO - 공임정보를 포함하는 RepairOrderPartVO
     * @return
     */
    public void deleteRepairOrderLabor(RepairOrderLaborVO repairOrderLaborVO) throws Exception;

}