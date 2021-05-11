package chn.bhmc.dms.mob.api.repair.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.mob.api.repair.dao.RepairCarInfoDAO;
import chn.bhmc.dms.mob.api.repair.service.RepairCarInfoService;
import chn.bhmc.dms.mob.api.repair.vo.CarInfoSearchVO;
import chn.bhmc.dms.mob.api.repair.vo.CarInfoVO;


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

@Service("RepairCarInfoService")
public class RepairCarInfoServiceImpl extends HService implements RepairCarInfoService {

    /**
     * 차종, 모델, 옵션 리스트 DAO 선언
     */
    @Resource(name="RepairCarInfoDAO")
    RepairCarInfoDAO RepairCarInfoDAO;

    @Override
    public List<CarInfoVO> selectCarListsByCondition(CarInfoSearchVO searchVO) throws Exception{
        return RepairCarInfoDAO.selectCarListsByCondition(searchVO);
    }
}
