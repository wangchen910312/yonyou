package chn.bhmc.dms.mob.api.crm.service;

import java.util.List;

import chn.bhmc.dms.mob.api.crm.vo.CustomerRelInfoSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.CustomerRelInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CustomerInfoService.java
 * @Description : 고객 정보관리 Service
 * @author Kyo Jin Lee
 * @since 2016. 1. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 27.     Kyo Jin Lee     최초 생성
 * </pre>
 */

public interface CrmCustomerRelInfoService {

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int selectCustomerRelInfoByConditionCnt(CustomerRelInfoSearchVO searchVO) throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<CustomerRelInfoVO> selectCustomerRelInfoByCondition(CustomerRelInfoSearchVO searchVO) throws Exception;

}
