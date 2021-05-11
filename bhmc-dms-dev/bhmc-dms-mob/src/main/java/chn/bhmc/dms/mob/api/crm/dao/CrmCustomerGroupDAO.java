package chn.bhmc.dms.mob.api.crm.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.crm.vo.CustomerGroupSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.CustomerGroupVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CustomerGroupDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kyo Jin Lee
 * @since 2016. 1. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 20.     Kyo Jin Lee     최초 생성
 * </pre>
 */

@Mapper("CrmcustomerGroupDAO")
public interface CrmCustomerGroupDAO {

    /**
     * 조회 조건에 해당하는 고객그룹 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CustomerGrouopSearchVO
     * @return
     */
    public List<CustomerGroupVO> selectCustomerGroupByCondition(CustomerGroupSearchVO searchVO);
    

    /**
     * 고객의 그룹 목록을 조회한다.
     * @param customerGroupVO - 등록할 정보가 담긴 customerGroupVO
     * @return 목록
     */
    public List<CustomerGroupVO> selectCustomerGroupByKey(CustomerGroupVO customerGroupVO);
}
