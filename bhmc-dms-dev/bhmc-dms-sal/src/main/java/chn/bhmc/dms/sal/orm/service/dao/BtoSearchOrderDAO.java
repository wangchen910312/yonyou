package chn.bhmc.dms.sal.orm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.orm.vo.BtoCreateOrderEtcVO;
import chn.bhmc.dms.sal.orm.vo.BtoCreateOrderSearchVO;
import chn.bhmc.dms.sal.orm.vo.BtoSearchOrderSearchVO;
import chn.bhmc.dms.sal.orm.vo.BtoSearchOrderVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BtoSearchOrderDAO
 * @Description : BTO 주문조회 DAO
 * @author Bong
 * @since 2016. 2. 29.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.02.29         Bong            최초 생성
 * </pre>
 */

@Mapper("btoSearchOrderDAO")
public interface BtoSearchOrderDAO {

    /**
     * 주차 및 메모  정보를 조회한다.
     */
    public List<BtoCreateOrderEtcVO> selectWeekRemark(BtoCreateOrderSearchVO searchVO);

    /**
      * 조회 조건에 해당하는  정보를 조회한다.
      */
    public int selectBtoSearchOrderByConditionCnt(BtoSearchOrderSearchVO searchVO);
    public List<BtoSearchOrderVO> selectBtoSearchOrderByCondition(BtoSearchOrderSearchVO searchVO);

    /**
     * 조회 조건에 해당하는  정보를 조회한다.
     */
    public List<BtoSearchOrderVO> selectBtoSearchOrderDetailByCondition(BtoSearchOrderSearchVO searchVO);

}
