package chn.bhmc.dms.sal.orm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.orm.service.BtoSearchOrderService;
import chn.bhmc.dms.sal.orm.service.dao.BtoSearchOrderDAO;
import chn.bhmc.dms.sal.orm.vo.BtoCreateOrderEtcVO;
import chn.bhmc.dms.sal.orm.vo.BtoCreateOrderSearchVO;
import chn.bhmc.dms.sal.orm.vo.BtoSearchOrderSearchVO;
import chn.bhmc.dms.sal.orm.vo.BtoSearchOrderVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BtoCreateOrderServiceImpl
 * @Description : BTO 주문생성
 * @author Bong
 * @since 2016. 2. 16.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.02.16         Bong            최초 생성
 * </pre>
 */

@Service("btoSearchOrderService")
public class BtoSearchOrderServiceImpl extends HService implements BtoSearchOrderService {

    /**
     * BTO 주문조회 DAO 선언
     */
    @Resource(name="btoSearchOrderDAO")
    BtoSearchOrderDAO btoSearchOrderDAO;


    /**
     * 주차 및 메모  정보를 조회한다.
     */
    @Override
    public List<BtoCreateOrderEtcVO> selectWeekRemark(BtoCreateOrderSearchVO searchVO) throws Exception {
        return btoSearchOrderDAO.selectWeekRemark(searchVO);
    };

    /**
     * 조회 조건에 해당하는 정보 갯수를 조회한다.
     */
    @Override
    public int selectBtoSearchOrderByConditionCnt(BtoSearchOrderSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return btoSearchOrderDAO.selectBtoSearchOrderByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는  정보를 조회한다.
     */
    @Override
    public List<BtoSearchOrderVO> selectBtoSearchOrderByCondition(BtoSearchOrderSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return btoSearchOrderDAO.selectBtoSearchOrderByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는  정보를 조회한다.
     */
    @Override
    public List<BtoSearchOrderVO> selectBtoSearchOrderDetailByCondition(BtoSearchOrderSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return btoSearchOrderDAO.selectBtoSearchOrderDetailByCondition(searchVO);
    }


}
