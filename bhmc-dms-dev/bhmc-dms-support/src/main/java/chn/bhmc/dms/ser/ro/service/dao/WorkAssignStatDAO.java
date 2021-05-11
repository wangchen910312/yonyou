package chn.bhmc.dms.ser.ro.service.dao;

import chn.bhmc.dms.ser.ro.vo.*;
import able.com.mybatis.Mapper;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : WorkAssignStatDAO.java
 * @Description : RO DAO
 * @author Haegun Jung
 * @since 2018. 6. 8.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2018. 6. 8.   Haegun Jung       배정리스트의 품질검사 상태갱신
 * </pre>
 */

@Mapper("workAssignStatDAO")
public interface WorkAssignStatDAO {

    /**
     * 조회 조건에 해당하는 배정리스트의 품질검사상태값을 변경한다.
     * @param RepairOrderVO - 조회 조건을 포함하는 RepairOrderVO
     * @return 조회 목록
     */
    public int updateWorkAssign(RepairOrderVO repairOrderVO) throws Exception;

}