package chn.bhmc.dms.par.cpm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.par.cpm.service.AdvanceReceivedInfoDetailService;
import chn.bhmc.dms.par.cpm.service.dao.AdvanceReceivedInfoDetailDAO;
import chn.bhmc.dms.par.cpm.vo.AdvanceReceivedInfoDetailVO;
import chn.bhmc.dms.par.cpm.vo.AdvanceReceivedInfoSearchVO;

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
@Service("advanceReceivedInfoDetailService")
public class AdvanceReceivedInfoDetailServiceImpl extends HService implements AdvanceReceivedInfoDetailService {

    @Resource(name="advanceReceivedInfoDetailDAO")
    private AdvanceReceivedInfoDetailDAO advanceReceivedInfoDetailDAO;

    /*
     * @see chn.bhmc.dms.par.cpm.service.AdvanceReceivedInfoDetailService#selectAdvanceReceivedInfoDetailByKey(java.lang.String)
     */
    @Override
    public AdvanceReceivedInfoDetailVO selectAdvanceReceivedInfoDetailByKey(String dlrCd) throws Exception {
        return advanceReceivedInfoDetailDAO.selectAdvanceReceivedInfoDetailByKey(dlrCd);
    }

    /*
     * @see chn.bhmc.dms.par.cpm.service.AdvanceReceivedInfoDetailService#selectAdvanceReceivedInfoDetailsByCondition(chn.bhmc.dms.par.cpm.vo.AdvanceReceivedInfoSearchVO)
     */
    @Override
    public List<AdvanceReceivedInfoDetailVO> selectAdvanceReceivedInfoDetailsByCondition(
            AdvanceReceivedInfoSearchVO searchVO) throws Exception {
        return advanceReceivedInfoDetailDAO.selectAdvanceReceivedInfoDetailsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.cpm.service.AdvanceReceivedInfoDetailService#selectAdvanceReceivedInfoDetailsByConditionCnt(chn.bhmc.dms.par.cpm.vo.AdvanceReceivedInfoSearchVO)
     */
    @Override
    public int selectAdvanceReceivedInfoDetailsByConditionCnt(AdvanceReceivedInfoSearchVO searchVO) throws Exception {
        return advanceReceivedInfoDetailDAO.selectAdvanceReceivedInfoDetailsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.cpm.service.AdvanceReceivedInfoDetailService#insertAdvanceReceivedInfoDetail(chn.bhmc.dms.par.cpm.vo.AdvanceReceivedInfoDetailVO)
     */
    @Override
    public int insertAdvanceReceivedInfoDetail(AdvanceReceivedInfoDetailVO advanceReceivedInfoDetailVO)
            throws Exception {
        return advanceReceivedInfoDetailDAO.insertAdvanceReceivedInfoDetail(advanceReceivedInfoDetailVO);
    }

    /*
     * @see chn.bhmc.dms.par.cpm.service.AdvanceReceivedInfoDetailService#updateAdvanceReceivedInfoDetail(chn.bhmc.dms.par.cpm.vo.AdvanceReceivedInfoDetailVO)
     */
    @Override
    public int updateAdvanceReceivedInfoDetail(AdvanceReceivedInfoDetailVO advanceReceivedInfoDetailVO)
            throws Exception {
        return advanceReceivedInfoDetailDAO.updateAdvanceReceivedInfoDetail(advanceReceivedInfoDetailVO);
    }

    /*
     * @see chn.bhmc.dms.par.cpm.service.AdvanceReceivedInfoDetailService#deleteAdvanceReceivedInfoDetail(chn.bhmc.dms.par.cpm.vo.AdvanceReceivedInfoDetailVO)
     */
    @Override
    public int deleteAdvanceReceivedInfoDetail(AdvanceReceivedInfoDetailVO advanceReceivedInfoDetailVO)
            throws Exception {
        return advanceReceivedInfoDetailDAO.deleteAdvanceReceivedInfoDetail(advanceReceivedInfoDetailVO);
    }

}
