package chn.bhmc.dms.mob.api.sales.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.mob.api.sales.dao.SalesBtoSearchOrderDAO;
import chn.bhmc.dms.mob.api.sales.service.SalesBtoSearchOrderService;
import chn.bhmc.dms.mob.api.sales.vo.BtoCreateOrderEtcVO;
import chn.bhmc.dms.mob.api.sales.vo.BtoCreateOrderSearchVO;


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

@Service("SalesBtoSearchOrderService")
public class SalesBtoSearchOrderServiceImpl extends HService implements SalesBtoSearchOrderService {

    /**
     * BTO 주문조회 DAO 선언
     */
    @Resource(name="SalesBtoSearchOrderDAO")
    SalesBtoSearchOrderDAO SalesBtoSearchOrderDAO;


    /**
     * 주차 및 메모  정보를 조회한다.
     */
    @Override
    public List<BtoCreateOrderEtcVO> selectWeekRemark(BtoCreateOrderSearchVO searchVO) throws Exception {
        return SalesBtoSearchOrderDAO.selectWeekRemark(searchVO);
    };

   
}
