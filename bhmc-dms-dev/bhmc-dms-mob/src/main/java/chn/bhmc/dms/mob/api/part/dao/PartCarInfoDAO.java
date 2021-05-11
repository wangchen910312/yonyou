package chn.bhmc.dms.mob.api.part.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.part.vo.CarInfoSearchVO;
import chn.bhmc.dms.mob.api.part.vo.CarInfoVO;

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

@Mapper("PartCarInfoDAO")
public interface PartCarInfoDAO {

    /**
     * 차종 정보를 조회한다. (코드형 리스트)
     */
    //public int selectCarListsByConditionCnt(CarInfoSearchVO searchVO) throws Exception;
    public List<CarInfoVO> selectCarListsByCondition(CarInfoSearchVO searchVO) throws Exception;

    /**
     * 모델 정보를 조회한다. (코드형 리스트)
     */
   // public int selectModelListsByConditionCnt(CarInfoSearchVO searchVO) throws Exception;
    public List<CarInfoVO> selectModelListsByCondition(CarInfoSearchVO searchVO) throws Exception;
   // public List<CarInfoVO> selectModelListsByCondition2(CarInfoSearchVO searchVO) throws Exception;

}
