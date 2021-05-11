package chn.bhmc.dms.mob.api.crm.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.mob.api.crm.vo.CarInfoSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.CarInfoVO;

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

@Mapper("CrmcarInfoDAO")
public interface CrmCarInfoDAO {

    /**
     * 차종 정보를 조회한다. (코드형 리스트)
     */
    public List<CarInfoVO> selectCarListsByCondition(CarInfoSearchVO searchVO) throws Exception;


    /**
     * 외장색 정보를 조회한다. (코드형 리스트)
     */
    public List<CarInfoVO> selectExtColorListsByCondition(CarInfoSearchVO searchVO) throws Exception;
}
