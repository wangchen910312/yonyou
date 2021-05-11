package chn.bhmc.dms.par.cpm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.cpm.service.AdvanceReceivedInfoHeaderService;
import chn.bhmc.dms.par.cpm.service.dao.AdvanceReceivedInfoHeaderDAO;
import chn.bhmc.dms.par.cpm.vo.AdvanceReceivedInfoHeaderVO;
import chn.bhmc.dms.par.cpm.vo.AdvanceReceivedInfoSearchVO;

/**
 * 선수금 헤더 구현 클래스
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
@Service("advanceReceivedInfoHeaderService")
public class AdvanceReceivedInfoHeaderServiceImpl extends HService implements AdvanceReceivedInfoHeaderService {

    @Resource(name="advanceReceivedInfoHeaderDAO")
    private AdvanceReceivedInfoHeaderDAO advanceReceivedInfoHeaderDAO;

    /*
     * @see chn.bhmc.dms.par.cpm.service.AdvanceReceivedInfoHeaderService#selectAdvanceReceivedInfoHeaderByKey(java.lang.String)
     */
    @Override
    public AdvanceReceivedInfoHeaderVO selectAdvanceReceivedInfoHeaderByKey(String dlrCd) throws Exception {
        return advanceReceivedInfoHeaderDAO.selectAdvanceReceivedInfoHeaderByKey(dlrCd);
    }

    /*
     * @see chn.bhmc.dms.par.cpm.service.AdvanceReceivedInfoHeaderService#selectAdvanceReceivedInfoHeadersByCondition(chn.bhmc.dms.par.cpm.vo.AdvanceReceivedInfoSearchVO)
     */
    @Override
    public List<AdvanceReceivedInfoHeaderVO> selectAdvanceReceivedInfoHeadersByCondition(
            AdvanceReceivedInfoSearchVO searchVO) throws Exception {
        return advanceReceivedInfoHeaderDAO.selectAdvanceReceivedInfoHeadersByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.cpm.service.AdvanceReceivedInfoHeaderService#selectAdvanceReceivedInfoHeadersByConditionCnt(chn.bhmc.dms.par.cpm.vo.AdvanceReceivedInfoSearchVO)
     */
    @Override
    public int selectAdvanceReceivedInfoHeadersByConditionCnt(AdvanceReceivedInfoSearchVO searchVO) throws Exception {
        return advanceReceivedInfoHeaderDAO.selectAdvanceReceivedInfoHeadersByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.cpm.service.AdvanceReceivedInfoHeaderService#insertAdvanceReceivedInfoHeader(chn.bhmc.dms.par.cpm.vo.AdvanceReceivedInfoHeaderVO)
     */
    @Override
    public int insertAdvanceReceivedInfoHeader(AdvanceReceivedInfoHeaderVO advanceReceivedInfoHeaderVO)
            throws Exception {
            advanceReceivedInfoHeaderVO.setRegUsrId(LoginUtil.getUserId());
        return advanceReceivedInfoHeaderDAO.insertAdvanceReceivedInfoHeader(advanceReceivedInfoHeaderVO);
    }

    /*
     * @see chn.bhmc.dms.par.cpm.service.AdvanceReceivedInfoHeaderService#updateAdvanceReceivedInfoHeader(chn.bhmc.dms.par.cpm.vo.AdvanceReceivedInfoHeaderVO)
     */
    @Override
    public int updateAdvanceReceivedInfoHeader(AdvanceReceivedInfoHeaderVO advanceReceivedInfoHeaderVO)
            throws Exception {
        advanceReceivedInfoHeaderVO.setUpdtUsrId(LoginUtil.getUserId());
        return advanceReceivedInfoHeaderDAO.updateAdvanceReceivedInfoHeader(advanceReceivedInfoHeaderVO);
    }

    /*
     * @see chn.bhmc.dms.par.cpm.service.AdvanceReceivedInfoHeaderService#deleteAdvanceReceivedInfoHeader(chn.bhmc.dms.par.cpm.vo.AdvanceReceivedInfoHeaderVO)
     */
    @Override
    public int deleteAdvanceReceivedInfoHeader(AdvanceReceivedInfoHeaderVO advanceReceivedInfoHeaderVO)
            throws Exception {
        return advanceReceivedInfoHeaderDAO.deleteAdvanceReceivedInfoHeader(advanceReceivedInfoHeaderVO);
    }




}
