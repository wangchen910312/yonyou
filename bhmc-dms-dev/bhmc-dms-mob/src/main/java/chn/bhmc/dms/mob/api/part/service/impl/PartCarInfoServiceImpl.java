package chn.bhmc.dms.mob.api.part.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.mob.api.part.dao.PartCarInfoDAO;
import chn.bhmc.dms.mob.api.part.service.PartCarInfoService;
import chn.bhmc.dms.mob.api.part.vo.CarInfoSearchVO;
import chn.bhmc.dms.mob.api.part.vo.CarInfoVO;


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

@Service("PartCarInfoService")
public class PartCarInfoServiceImpl extends HService implements PartCarInfoService {

    /**
     * 차종, 모델, 옵션 리스트 DAO 선언
     */
    @Resource(name="PartCarInfoDAO")
    PartCarInfoDAO PartCarInfoDAO;


    /**
     * 차종 정보를 조회한다. (코드형 리스트)
     */
//    @Override
//    public int selectCarListsByConditionCnt(CarInfoSearchVO searchVO) throws Exception{
//        return carInfoDAO.selectCarListsByConditionCnt(searchVO);
//    }
    @Override
    public List<CarInfoVO> selectCarListsByCondition(CarInfoSearchVO searchVO) throws Exception{
        return PartCarInfoDAO.selectCarListsByCondition(searchVO);
    }


    /**
     * 모델 정보를 조회한다. (코드형 리스트)
     */
//    @Override
//    public int selectModelListsByConditionCnt(CarInfoSearchVO searchVO) throws Exception{
//        return carInfoDAO.selectModelListsByConditionCnt(searchVO);
//    }
    @Override
    public List<CarInfoVO> selectModelListsByCondition(CarInfoSearchVO searchVO) throws Exception{
        return PartCarInfoDAO.selectModelListsByCondition(searchVO);
    }

//    @Override
//    public List<CarInfoVO> selectModelListsByCondition2(CarInfoSearchVO searchVO) throws Exception{
//        return carInfoDAO.selectModelListsByCondition2(searchVO);
//    }

    
    
}
