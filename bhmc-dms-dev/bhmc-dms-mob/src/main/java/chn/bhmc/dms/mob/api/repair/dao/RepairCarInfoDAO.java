package chn.bhmc.dms.mob.api.repair.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.repair.vo.CarInfoSearchVO;
import chn.bhmc.dms.mob.api.repair.vo.CarInfoVO;



/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CarInfoDAO.java
 * @Description : 차종, 모델, 옵션 정보를 리스트로 받아온다.
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 11.     Kang Seok Han     최초 생성
 * </pre>
 */

@Mapper("RepairCarInfoDAO")
public interface RepairCarInfoDAO {
	
    public List<CarInfoVO> selectCarListsByCondition(CarInfoSearchVO searchVO) throws Exception;

}
