package chn.bhmc.dms.crm.cif.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.cif.vo.CustomerMemoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerMemoVO;


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

@Mapper("customerMemoDAO")
public interface CustomerMemoDAO {

    /**
     * 메모 목록 수를 조회한다.
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int selectCustomerMemoByConditionCnt(CustomerMemoSearchVO searchVO);

    /**
     * 메모 목록을 조회한다.
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<CustomerMemoVO> selectCustomerMemoByCondition(CustomerMemoSearchVO searchVO);

    /**
     * 메모 정보를 등록한다.
     * @param CustomerMemoVO - 등록할 정보가 담긴 CustomerMemoVO
     * @return 등록된 목록수
     */
    public int insertCustomerMemo(CustomerMemoVO customerMemoDAO);

    /**
     * 메모 정보를 수정한다.
     * @param CustomerMemoVO - 수정할 정보가 담긴 CustomerMemoVO
     * @return 수정된 목록수
     */
    public int updateCustomerMemo(CustomerMemoVO customerMemoDAO);

    /**
     * 메모 정보를 삭제한다.
     * @param CustomerMemoVO - 삭제할 정보가 담긴 CustomerMemoVO
     * @return 삭제된 목록수
     */
    public int deleteCustomerMemo(CustomerMemoVO customerMemoDAO);


}
