package chn.bhmc.dms.par.cpm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.cpm.service.LeaveItemService;
import chn.bhmc.dms.par.cpm.service.dao.LeaveItemDAO;
import chn.bhmc.dms.par.cpm.vo.LeaveItemSearchVO;
import chn.bhmc.dms.par.cpm.vo.LeaveItemVO;

/**
 * 방치품 선정 구현 클래스
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
@Service("leaveItemService")
public class LeaveItemServiceImpl extends HService implements LeaveItemService {

    @Resource(name="leaveItemDAO")
    private LeaveItemDAO leaveItemDAO;

    /*
     * @see chn.bhmc.dms.par.cpm.service.LeaveItemService#updateLeaveItem(chn.bhmc.dms.par.cpm.vo.LeaveItemVO)
     */
    @Override
    public int updateLeaveItem(LeaveItemVO leaveItemVO) throws Exception {
        leaveItemVO.setDlrCd(LoginUtil.getDlrCd());
        leaveItemVO.setUpdtUsrId(LoginUtil.getUserId());
        return leaveItemDAO.updateLeaveItem(leaveItemVO);
    }

    /*
     * @see chn.bhmc.dms.par.cpm.service.LeaveItemService#updateLeaveItemAll(chn.bhmc.dms.par.cpm.vo.LeaveItemVO)
     */
    @Override
    public int updateLeaveItemAll(LeaveItemVO leaveItemVO) throws Exception {
        leaveItemVO.setDlrCd(LoginUtil.getDlrCd());
        leaveItemVO.setUpdtUsrId(LoginUtil.getUserId());
        return leaveItemDAO.updateLeaveItemAll(leaveItemVO);
    }

    /*
     * @see chn.bhmc.dms.par.cpm.service.LeaveItemService#deleteLeaveItem(chn.bhmc.dms.par.cpm.vo.LeaveItemVO)
     */
    @Override
    public int deleteLeaveItem(LeaveItemVO leaveItemVO) throws Exception {
        leaveItemVO.setDlrCd(LoginUtil.getDlrCd());
        leaveItemVO.setUpdtUsrId(LoginUtil.getUserId());
        return leaveItemDAO.deleteLeaveItem(leaveItemVO);
    }

    /*
     * @see chn.bhmc.dms.par.cpm.service.LeaveItemService#multiLeaveItem(chn.bhmc.dms.par.cpm.vo.LeaveItemSaveVO)
     */
    @Override
    public void multiLeaveItem(BaseSaveVO<LeaveItemVO> obj) throws Exception {

        for(LeaveItemVO leaveItemVO : obj.getDeleteList()){

            leaveItemVO.setDlrCd(LoginUtil.getDlrCd());
            leaveItemVO.setUpdtUsrId(LoginUtil.getUserId());
            leaveItemDAO.deleteLeaveItem(leaveItemVO);
        }

        for(LeaveItemVO leaveItemVO : obj.getUpdateList()){

            leaveItemVO.setDlrCd(LoginUtil.getDlrCd());
            leaveItemVO.setUpdtUsrId(LoginUtil.getUserId());
            leaveItemDAO.updateLeaveItem(leaveItemVO);
        }
    }

    /*
     * @see chn.bhmc.dms.par.cpm.service.LeaveItemService#selectLeaveItemByKey(java.lang.String, java.lang.String)
     */
    @Override
    public LeaveItemVO selectLeaveItemByKey(String dlrCd, String itemCd) throws Exception {
        return leaveItemDAO.selectLeaveItemByKey(dlrCd, itemCd);
    }

    /*
     * @see chn.bhmc.dms.par.cpm.service.LeaveItemService#selectLeaveItemsByCondition(chn.bhmc.dms.par.cpm.vo.LeaveItemSearchVO)
     */
    @Override
    public List<LeaveItemVO> selectLeaveItemsByCondition(LeaveItemSearchVO searchVO) throws Exception {
        return leaveItemDAO.selectLeaveItemsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.cpm.service.LeaveItemService#selectLeaveItemsByConditionCnt(chn.bhmc.dms.par.cpm.vo.LeaveItemSearchVO)
     */
    @Override
    public int selectLeaveItemsByConditionCnt(LeaveItemSearchVO searchVO) throws Exception {
        return leaveItemDAO.selectLeaveItemsByConditionCnt(searchVO);
    }
}
