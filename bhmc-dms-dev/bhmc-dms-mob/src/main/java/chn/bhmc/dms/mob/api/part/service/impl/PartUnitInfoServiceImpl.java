package chn.bhmc.dms.mob.api.part.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.mob.api.part.dao.PartUnitInfoDAO;
import chn.bhmc.dms.mob.api.part.service.PartUnitInfoService;
import chn.bhmc.dms.mob.api.part.vo.UnitInfoSearchVO;
import chn.bhmc.dms.mob.api.part.vo.UnitInfoVO;

/**
 * 단위 관리 서비스 구현 클래스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 4.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.05         Kang Seok Han            최초 생성
 * </pre>
 */

@Service("PartUnitInfoService")
public class PartUnitInfoServiceImpl extends HService implements PartUnitInfoService {

    /**
     * 단위 관리 DAO
     */
	@Resource(name="PartUnitInfoDAO")
	PartUnitInfoDAO PartUnitInfoDAO;

	
    /**
     * {@inheritDoc}
     */
    @Override
    public List<UnitInfoVO> selectUnitInfosByCondition(UnitInfoSearchVO searchVO)  throws Exception {
        return PartUnitInfoDAO.selectUnitInfosByCondition(searchVO);
    }

//    /**
//     * {@inheritDoc}
//     */
//    @Override
//    public int selectUnitInfosByConditionCnt(UnitInfoSearchVO searchVO)  throws Exception {
//        return unitInfoDAO.selectUnitInfosByConditionCnt(searchVO);
//    }




}
