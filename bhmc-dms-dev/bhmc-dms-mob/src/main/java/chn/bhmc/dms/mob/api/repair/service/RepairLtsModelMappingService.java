package chn.bhmc.dms.mob.api.repair.service;

import java.util.List;

import chn.bhmc.dms.mob.api.repair.vo.LtsModelMappingVO;
import chn.bhmc.dms.mob.api.repair.vo.LtsModelSearchVO;



/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LtsModelMappingService.java
 * @Description : 클래스 설명을 기술합니다.
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

public interface RepairLtsModelMappingService {
	
	public List<LtsModelMappingVO> selectLtsModelsByCondition(LtsModelSearchVO searchVO)throws Exception;

   public LtsModelMappingVO selectMappingLtsModelCdByKey(LtsModelSearchVO searchVO) throws Exception;

}
