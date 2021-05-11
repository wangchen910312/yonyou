package chn.bhmc.dms.crm.cif.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.crm.cif.vo.CustomerRelInfoVO;

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

public interface CustomerRelInfoService {

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int selectCustomerRelInfoByConditionCnt(CustomerRelInfoVO searchVO) throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<CustomerRelInfoVO> selectCustomerRelInfoByCondition(CustomerRelInfoVO searchVO) throws Exception;


    /**
     * Statements
     *
     * @param saveVO
     */
    public void multiCustomerRelChg(BaseSaveVO<CustomerRelInfoVO> saveVO) throws Exception;

}
