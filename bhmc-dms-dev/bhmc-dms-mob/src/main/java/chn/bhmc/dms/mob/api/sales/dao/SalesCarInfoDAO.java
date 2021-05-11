package chn.bhmc.dms.mob.api.sales.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.sales.vo.CarInfoSearchVO;
import chn.bhmc.dms.mob.api.sales.vo.CarInfoVO;



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

@Mapper("SalesCarInfoDAO")
public interface SalesCarInfoDAO {

    /**
     * 차종 정보를 조회한다. (코드형 리스트)
     */
  
    public List<CarInfoVO> selectCarListsByCondition(CarInfoSearchVO searchVO) throws Exception;

    public List<CarInfoVO> selectBarcodeCarVinsByCondition(CarInfoSearchVO searchVO) throws Exception;
    
    
    /**
     * 바코드로 차량코드와 차량명 조회
     */
    public List<CarInfoVO> selectBarcodeCarNmByCondition(CarInfoSearchVO searchVO) throws Exception;
}
