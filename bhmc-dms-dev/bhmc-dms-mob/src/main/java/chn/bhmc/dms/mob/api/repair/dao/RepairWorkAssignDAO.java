package chn.bhmc.dms.mob.api.repair.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.repair.vo.WorkAssignSearchVO;
import chn.bhmc.dms.mob.api.repair.vo.WorkAssignVO;



/**
 * <pre>
 * 작업배정 처리에 대한 mapper class
 * </pre>
 *
 * @ClassName   : WorkAssignDAO.java
 * @Description : 작업배정 DAO
 * @author Yin Xueyuan
 * @since 2016. 4. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 1.   Yin Xueyuan      최초 생성
 * </pre>
 */

@Mapper("RepairWorkAssignDAO")
public interface RepairWorkAssignDAO {

    public List<WorkAssignVO> selectWorkAssignByCondition(WorkAssignSearchVO searchVO);

    public int selectWorkAssignByConditionCnt(WorkAssignSearchVO searchVO);

}
