package chn.bhmc.dms.mob.api.part.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.mob.api.part.dao.PartAdvanceReceivedInfoDetailDAO;
import chn.bhmc.dms.mob.api.part.service.PartAdvanceReceivedInfoDetailService;
import chn.bhmc.dms.mob.api.part.vo.AdvanceReceivedInfoDetailVO;
import chn.bhmc.dms.mob.api.part.vo.AdvanceReceivedInfoSearchVO;


/**
 * 선수금 상세 구현 클래스
 *
 * @author In Bo Shim
 * @since 2016. 5. 23.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 5. 23.     In Bo Shim      최초 생성
 * </pre>
 */
@Service("PartAdvanceReceivedInfoDetailService")
public class PartAdvanceReceivedInfoDetailServiceImpl extends HService implements PartAdvanceReceivedInfoDetailService {

    @Resource(name="PartAdvanceReceivedInfoDetailDAO")
    private PartAdvanceReceivedInfoDetailDAO PartAdvanceReceivedInfoDetailDAO;

    /*
     * @see chn.bhmc.dms.par.cpm.service.AdvanceReceivedInfoDetailService#selectAdvanceReceivedInfoDetailsByCondition(chn.bhmc.dms.par.cpm.vo.AdvanceReceivedInfoSearchVO)
     */
    @Override
    public List<AdvanceReceivedInfoDetailVO> selectAdvanceReceivedInfoDetailsByCondition(AdvanceReceivedInfoSearchVO searchVO) throws Exception {
        return PartAdvanceReceivedInfoDetailDAO.selectAdvanceReceivedInfoDetailsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.cpm.service.AdvanceReceivedInfoDetailService#selectAdvanceReceivedInfoDetailsByConditionCnt(chn.bhmc.dms.par.cpm.vo.AdvanceReceivedInfoSearchVO)
     */
    @Override
    public int selectAdvanceReceivedInfoDetailsByConditionCnt(AdvanceReceivedInfoSearchVO searchVO) throws Exception {
        return PartAdvanceReceivedInfoDetailDAO.selectAdvanceReceivedInfoDetailsByConditionCnt(searchVO);
    }


}
