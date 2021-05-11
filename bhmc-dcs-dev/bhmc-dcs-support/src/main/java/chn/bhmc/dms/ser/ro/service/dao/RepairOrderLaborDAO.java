package chn.bhmc.dms.ser.ro.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.ser.ro.vo.RepairOrderLaborVO;
import chn.bhmc.dms.ser.ro.vo.RepairOrderSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RepairOrderLaborDAO.java
 * @Description : RO접수 공임 DAO
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

@Mapper("repairOrderLaborDAO")
public interface RepairOrderLaborDAO {

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
     * RO접수 공임 정보를 등록한다.
     * @param obj - 등록할 정보가 담긴 RepairOrderLaborVO
     * @return 등록된 목록수
     */
    public void insertRepairOrderLabor(RepairOrderLaborVO obj);

    /**
     * RO접수 공임 정보를 수정한다.
     * @param obj - 수정할 정보가 담긴 RepairOrderLaborVO
     * @return 수정된 목록수
     */
    public void updateRepairOrderLabor(RepairOrderLaborVO obj);

    /**
     * RO접수 공임 정보를 삭제한다.
     * @param obj - 삭제할 정보가 담긴 RepairOrderLaborVO
     * @return 삭제된 목록수
     */
    public void deleteRepairOrderLabor(RepairOrderLaborVO obj);

}