package chn.bhmc.dms.mob.api.repair.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.repair.vo.ServiceReceiveDetailVO;
import chn.bhmc.dms.mob.api.repair.vo.ServiceReceiveSearchVO;



/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ServiceReceiveDetailDAO.java
 * @Description : 수납 디테일 DAO
 * @author KyungMok Kim
 * @since 2016. 4. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 18.   KyungMok Kim     최초 생성
 * </pre>
 */

@Mapper("RepairServiceReceiveDetailDAO")
public interface RepairServiceReceiveDetailDAO {

    public int selectServiceReceiveDetailsHistByConditionCnt(ServiceReceiveSearchVO searchVO) throws Exception;

    public List<ServiceReceiveDetailVO> selectServiceReceiveDetailsHistByCondition(ServiceReceiveSearchVO searchVO) throws Exception;

   
}