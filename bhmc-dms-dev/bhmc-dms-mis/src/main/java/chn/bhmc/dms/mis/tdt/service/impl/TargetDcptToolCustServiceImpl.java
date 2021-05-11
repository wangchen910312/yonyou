package chn.bhmc.dms.mis.tdt.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.mis.tdt.service.TargetDcptToolCustService;
import chn.bhmc.dms.mis.tdt.service.dao.TargetDcptToolSaleDAO;
import chn.bhmc.dms.mis.tdt.vo.TargetDcptToolCustVO;

/**
 * <pre>
 * [딜러사] 목표분해도구(집객)
 * </pre>
 *
 * @ClassName   : TargetDcptToolCustServiceImpl.java
 * @Description : [딜러사] 목표분해도구(집객)
 * @author chibeom.song
 * @since 2016. 7. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 22.   chibeom.song     최초 생성
 * </pre>
 */
@Service("targetDcptToolCustService")
public class TargetDcptToolCustServiceImpl extends HService implements TargetDcptToolCustService {

    /**
     * 단위 관리 DAO
     */
    @Resource(name="targetDcptToolSaleDAO")
    TargetDcptToolSaleDAO targetDcptToolSaleDAO;

    /**
     * {@inheritDoc}
     */
    @Override
    public List<TargetDcptToolCustVO> selectTargetDcptToolCustGoal(TargetDcptToolCustVO searchVO) throws Exception {
        return targetDcptToolSaleDAO.selectTargetDcptToolCustGoal(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectTargetDcptToolCustGoalCnt(TargetDcptToolCustVO searchVO) throws Exception {
        return targetDcptToolSaleDAO.selectTargetDcptToolCustGoalCnt(searchVO);
    }

}
