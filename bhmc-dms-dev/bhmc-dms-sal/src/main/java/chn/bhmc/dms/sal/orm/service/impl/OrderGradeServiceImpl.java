package chn.bhmc.dms.sal.orm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.sal.orm.service.OrderGradeService;
import chn.bhmc.dms.sal.orm.service.dao.OrderGradeDAO;
import chn.bhmc.dms.sal.orm.vo.OrderGradeSearchVO;
import chn.bhmc.dms.sal.orm.vo.OrderGradeVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : OrderGradeServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Lee Seungmin
 * @since 2016. 3. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 23.     Lee Seungmin     최초 생성
 * </pre>
 */

@Service("orderGradeService")
public class OrderGradeServiceImpl extends HService implements OrderGradeService{

    @Resource(name="orderGradeDAO")
    OrderGradeDAO orderGradeDAO;

    @Override
    public List<OrderGradeVO> selectOrderGradeCondition(OrderGradeSearchVO searchVO) throws Exception {
        return orderGradeDAO.selectOrderGradeCondition(searchVO);
    }

    @Override
    public int selectOrderGradeConditionCnt(OrderGradeSearchVO searchVO)  throws Exception {
        return orderGradeDAO.selectOrderGradeConditionCnt(searchVO);
    }
}
