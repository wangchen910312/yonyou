package chn.bhmc.dms.mob.api.sales.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.jxls.common.Context;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import able.com.vo.HMap;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.mob.api.sales.dao.SalesNotAssignedOrderDAO;
import chn.bhmc.dms.mob.api.sales.service.SalesNotAssignedOrderService;
import chn.bhmc.dms.mob.api.sales.vo.NotAssignedOrderSearchVO;
import chn.bhmc.dms.mob.api.sales.vo.NotAssignedOrderVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : NotAssignedOrderServiceImpl.java
 * @Description : 미배정 주문조회 Service
 * @author
 * @since 2016. 3. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 10.      Bong               최초 생성
 * </pre>
 */

@Service("SalesNotAssignedOrderService")
public class SalesNotAssignedOrderServiceImpl extends HService implements SalesNotAssignedOrderService, JxlsSupport {

    /**
     * 미배정 주문조회 DAO 선언
     */
    @Resource(name="SalesNotAssignedOrderDAO")
    SalesNotAssignedOrderDAO SalesNotAssignedOrderDAO;

    /**
     * 조회 건수
     */
    @Override
    public int selectNotAssignedOrderDetailCnt(NotAssignedOrderSearchVO searchVO)  throws Exception {
        return SalesNotAssignedOrderDAO.selectNotAssignedOrderDetailCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 정보를 조회한다.
     */
    @Override
    public List<NotAssignedOrderVO> selectNotAssignedOrderDetail(NotAssignedOrderSearchVO searchVO) throws Exception {
        return SalesNotAssignedOrderDAO.selectNotAssignedOrderDetail(searchVO);
    }
    
    /**
     * 조회 건수
     */
    @Override
    public int selectNotAssignedOrderCnt(NotAssignedOrderSearchVO searchVO)  throws Exception {
        return SalesNotAssignedOrderDAO.selectNotAssignedOrderCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 정보를 조회한다.
     */
    @Override
    public List<NotAssignedOrderVO> selectNotAssignedOrder(NotAssignedOrderSearchVO searchVO) throws Exception {
        return SalesNotAssignedOrderDAO.selectNotAssignedOrder(searchVO);
    }

    /**
     * 엑셀 다운로드
     * @param list
     * @throws Exception
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        NotAssignedOrderSearchVO searchVO = new NotAssignedOrderSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        List<NotAssignedOrderVO> list = SalesNotAssignedOrderDAO.selectNotAssignedOrder(searchVO);

        context.putVar("items", list);
    }

}
