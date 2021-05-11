package chn.bhmc.dms.mob.api.repair.dao;
import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.repair.vo.CalculateSearchVO;
import chn.bhmc.dms.mob.api.repair.vo.CalculateVO;



/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CalculateDAO.java
 * @Description : 정산 DAO
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

@Mapper("RepairCalculateDAO")
public interface RepairCalculateDAO {

	public CalculateVO selectCalculateByKey(CalculateSearchVO searchVO) throws Exception;

    public int selectCalculateListByConditionCnt(CalculateSearchVO searchVO)throws Exception;

    public List<CalculateVO> selectCalculateListByCondition(CalculateSearchVO searchVO)throws Exception;
    
    public String  selectCalculatesAmouts(CalculateSearchVO searchVO)throws Exception;

   
}