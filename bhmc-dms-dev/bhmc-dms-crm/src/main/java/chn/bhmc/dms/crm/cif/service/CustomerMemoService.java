package chn.bhmc.dms.crm.cif.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.crm.cif.vo.CustomerMemoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerMemoVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CustomerMemoService.java
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

public interface CustomerMemoService {

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int selectCustomerMemoByConditionCnt(CustomerMemoSearchVO searchVO) throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<CustomerMemoVO> selectCustomerMemoByCondition(CustomerMemoSearchVO searchVO) throws Exception;


    /**
     * Statements
     *
     * @param saveVO
     */
    public void multiCustomerMemoChg(BaseSaveVO<CustomerMemoVO> saveVO) throws Exception;

}
