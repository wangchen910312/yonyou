package chn.bhmc.dms.mob.api.repair.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.repair.vo.ServicePartVO;
import chn.bhmc.dms.mob.api.repair.vo.TabInfoSearchVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ServicePartDAO.java
 * @Description : 공통 부품 DAO
 * @author KyungMok Kim
 * @since 2016. 8. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 23.   KyungMok Kim     최초 생성
 * </pre>
 */

@Mapper("RepairServicePartDAO")
public interface RepairServicePartDAO {

    public int selectServicePartsByConditionCnt(TabInfoSearchVO searchVO) throws Exception;

    public List<ServicePartVO> selectServicePartsByCondition(TabInfoSearchVO searchVO) throws Exception;

}