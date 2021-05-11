package chn.bhmc.dms.mob.api.sales.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.mob.api.sales.dao.SalesCarInfoDAO;
import chn.bhmc.dms.mob.api.sales.service.SalesCarInfoService;
import chn.bhmc.dms.mob.api.sales.vo.CarInfoSearchVO;
import chn.bhmc.dms.mob.api.sales.vo.CarInfoVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CarInfoServiceImpl
 * @Description : 차종, 모델, 옵션 정보를 리스트로 받아온다.
 * @author
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 11.          최초 생성
 * </pre>
 */

@Service("SalesCarInfoService")
public class SalesCarInfoServiceImpl extends HService implements SalesCarInfoService {

    /**
     * 차종, 모델, 옵션 리스트 DAO 선언
     */
    @Resource(name="SalesCarInfoDAO")
    SalesCarInfoDAO SalesCarInfoDAO;


    /**
     * 차종 정보를 조회한다. (코드형 리스트)
     */
    
    @Override
    public List<CarInfoVO> selectCarListsByCondition(CarInfoSearchVO searchVO) throws Exception{
        return SalesCarInfoDAO.selectCarListsByCondition(searchVO);
    }
    @Override
    public List<CarInfoVO> selectBarcodeCarVinsByCondition(CarInfoSearchVO searchVO) throws Exception{
        return SalesCarInfoDAO.selectBarcodeCarVinsByCondition(searchVO);
    }
    
    /**
     * 바코드로 차량코드와 차량명 조회
     */
    @Override
    public List<CarInfoVO> selectBarcodeCarNmByCondition(CarInfoSearchVO searchVO) throws Exception{
        return SalesCarInfoDAO.selectBarcodeCarNmByCondition(searchVO);
    }

    
}
