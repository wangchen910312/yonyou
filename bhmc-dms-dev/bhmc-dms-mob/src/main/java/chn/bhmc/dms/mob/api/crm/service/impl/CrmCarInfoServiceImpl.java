package chn.bhmc.dms.mob.api.crm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.mob.api.crm.dao.CrmCarInfoDAO;
import chn.bhmc.dms.mob.api.crm.service.CrmCarInfoService;
import chn.bhmc.dms.mob.api.crm.vo.CarInfoSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.CarInfoVO;

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

@Service("CrmcarInfoService")
public class CrmCarInfoServiceImpl extends HService implements CrmCarInfoService {

    /**
     * 차종, 모델, 옵션 리스트 DAO 선언
     */
    @Resource(name="CrmcarInfoDAO")
    CrmCarInfoDAO CrmcarInfoDAO;


    /**
     * 차종 정보를 조회한다. (코드형 리스트)
     */
    @Override
    public List<CarInfoVO> selectCarListsByCondition(CarInfoSearchVO searchVO) throws Exception{
        return CrmcarInfoDAO.selectCarListsByCondition(searchVO);
    }

    /**
     * 외장색 정보를 조회한다. (코드형 리스트)
     */
    @Override
    public List<CarInfoVO> selectExtColorListsByCondition(CarInfoSearchVO searchVO) throws Exception{
        return CrmcarInfoDAO.selectExtColorListsByCondition(searchVO);
    }

}
