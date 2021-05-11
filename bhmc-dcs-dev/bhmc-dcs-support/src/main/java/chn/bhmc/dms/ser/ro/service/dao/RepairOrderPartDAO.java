package chn.bhmc.dms.ser.ro.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.ser.ro.vo.RepairOrderPartVO;
import chn.bhmc.dms.ser.ro.vo.RepairOrderSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RepairOrderPartDAO.java
 * @Description : RO접수 부품 DAO
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

@Mapper("repairOrderPartDAO")
public interface RepairOrderPartDAO {

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
     * RO접수 부품 정보를 등록한다.
     * @param obj - 등록할 정보가 담긴 RepairOrderPartVO
     * @return 등록된 목록수
     */
    public void insertRepairOrderPart(RepairOrderPartVO obj);

    /**
     * RO접수 부품 정보를 수정한다.
     * @param obj - 수정할 정보가 담긴 RepairOrderPartVO
     * @return 수정된 목록수
     */
    public void updateRepairOrderPart(RepairOrderPartVO obj);

    /**
     * RO접수 부품 정보를 삭제한다.
     * @param obj - 삭제할 정보가 담긴 RepairOrderPartVO
     * @return 삭제된 목록수
     */
    public void deleteRepairOrderPart(RepairOrderPartVO obj);

}