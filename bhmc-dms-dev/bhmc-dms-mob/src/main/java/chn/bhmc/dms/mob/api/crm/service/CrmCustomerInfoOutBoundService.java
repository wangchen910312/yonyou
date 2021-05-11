package chn.bhmc.dms.mob.api.crm.service;

import java.util.List;

import chn.bhmc.dms.mob.api.crm.vo.CustomerInfoVO;
import chn.bhmc.dms.mob.api.crm.vo.CustomerInfoSearchVO;
//import chn.bhmc.dms.crm.cif.vo.CustomerRelInfoVO;
/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CustomerInfoOutBoundService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kyo Jin Lee
 * @since 2016. 5. 30.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 30.     Kyo Jin Lee     최초 생성
 * </pre>
 */

public interface CrmCustomerInfoOutBoundService {

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int selectCustomerListByConditionCnt(CustomerInfoSearchVO searchVO) throws Exception;
    
    public int selectCustomerAndCarInfoByConditionCnt(CustomerInfoSearchVO searchVO) throws Exception;
    
    public List<CustomerInfoVO> selectCustomerAndCarInfoByCondition(CustomerInfoSearchVO searchVO) throws Exception;
    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<CustomerInfoVO> selectCustomerListByCondition(CustomerInfoSearchVO searchVO) throws Exception;
    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int selectCustomerInfoByConditionCnt(CustomerInfoSearchVO searchVO) throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<CustomerInfoVO> selectCustomerInfoByCondition(CustomerInfoSearchVO searchVO) throws Exception;
    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int selectCustomerByConditionCnt(CustomerInfoSearchVO searchVO) throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<CustomerInfoVO> selectCustomerByCondition(CustomerInfoSearchVO searchVO) throws Exception;


}
