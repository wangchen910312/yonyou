package chn.bhmc.dms.mob.api.repair.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.repair.vo.LtsModelMappingVO;
import chn.bhmc.dms.mob.api.repair.vo.LtsModelSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LtsModelMappingDAO.java
 * @Description : LTS MODEL 매핑 DAO
 * @author Ki Hyun Kwon
 * @since 2016. 2. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 11.     Ki Hyun Kwon     최초 생성
 * </pre>
 */
@Mapper("RepairLtsModelMappingDAO")
public interface RepairLtsModelMappingDAO {
	
	 public List<LtsModelMappingVO> selectLtsModelsByCondition(LtsModelSearchVO searchVO) throws Exception;

    public LtsModelMappingVO selectMappingLtsModelCdByKey(LtsModelSearchVO searchVO) throws Exception;

}
