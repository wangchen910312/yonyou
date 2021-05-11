package chn.bhmc.dms.mob.api.crm.service;

import java.util.List;

import chn.bhmc.dms.mob.api.crm.vo.CustomerInfoSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.CustomerInfoVO;

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

public interface CrmCustomerInfoService {

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int selectCustomerInfoHistoryByConditionCnt(CustomerInfoSearchVO searchVO) throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<CustomerInfoVO> selectCustomerInfoHistoryByCondition(CustomerInfoSearchVO searchVO) throws Exception;

}
