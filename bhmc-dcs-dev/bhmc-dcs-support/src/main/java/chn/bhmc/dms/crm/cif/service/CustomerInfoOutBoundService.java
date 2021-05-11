package chn.bhmc.dms.crm.cif.service;

import java.util.List;

import chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoVO;
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

public interface CustomerInfoOutBoundService {


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
     * 고객정보를 입력 한다.
     *
     * @param CustomerInfoVO - 등록 정보가 담긴 CustomerInfoVO
     * @return CustomerInfoVO
     */
    public CustomerInfoVO insertCustomer(CustomerInfoVO customerInfoVO) throws Exception;

    /**
     * 고객정보를 수정한다.
     *
     * @param customerInfoVO - 등록 정보가 담긴 CustomerInfoVO
     * @return 등록된 목록수
     */
    public CustomerInfoVO updateCustomer(CustomerInfoVO customerInfoVO) throws Exception;

    /**
     * Key에 해당하는 고객 정보를 조회한다.
     * @param CustomerInfoVO customerInfoVO (고객명 + 핸드폰)
     * @return 조회한 고객 정보
     */
    public CustomerInfoVO selectCustDupByKey(CustomerInfoSearchVO searchVO) throws Exception;

    /**
     * Key에 해당하는 고객 정보를 조회한다.
     * @param CustomerInfoVO customerInfoVO (증거유형 + 증거번호)
     * @return 조회한 고객 정보
     */
    public CustomerInfoVO selectCustMathDocDupByKey(CustomerInfoSearchVO searchVO) throws Exception;

    /**
     * 고객번호를 채번한다.
     *
     * @param null
     * @return 고객번호
     */
    public String selectNextCustNo() throws Exception;

}
