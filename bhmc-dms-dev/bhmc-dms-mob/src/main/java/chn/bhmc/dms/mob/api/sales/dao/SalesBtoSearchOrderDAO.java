package chn.bhmc.dms.mob.api.sales.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.sales.vo.BtoCreateOrderEtcVO;
import chn.bhmc.dms.mob.api.sales.vo.BtoCreateOrderSearchVO;



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

@Mapper("SalesBtoSearchOrderDAO")
public interface SalesBtoSearchOrderDAO {

    /**
     * 주차 및 메모  정보를 조회한다.
     */
    public List<BtoCreateOrderEtcVO> selectWeekRemark(BtoCreateOrderSearchVO searchVO);

   
}
