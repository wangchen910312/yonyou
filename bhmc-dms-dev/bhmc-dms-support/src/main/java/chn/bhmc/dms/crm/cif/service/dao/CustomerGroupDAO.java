package chn.bhmc.dms.crm.cif.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.crm.cif.vo.CustomerGroupSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerGroupVO;


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

@Mapper("customerGroupDAO")
public interface CustomerGroupDAO {

    /**
     * 조회 조건에 해당하는 고객그룹 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CustomerGrouopSearchVO
     * @return
     */
    public int selectCustomerGroupByConditionCnt(CustomerGroupSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 고객그룹 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CustomerGrouopSearchVO
     * @return
     */
    public List<CustomerGroupVO> selectCustomerGroupByCondition(CustomerGroupSearchVO searchVO);

    /**
     * 그룹 정보를 등록한다.
     * @param customerGroupVO - 등록할 정보가 담긴 customerGroupVO
     * @return 등록된 목록수
     */
    public int insertCustomerGroup(CustomerGroupVO customerGroupVO);

    /**
     * 그룹 정보를 수정한다.
     * @param customerGroupVO - 수정할 정보가 담긴 customerGroupVO
     * @return 수정된 목록수
     */
    public int updateCustomerGroup(CustomerGroupVO customerGroupVO);


    /**
     * 그룹 정보를 삭제한다.
     * @param customerGroupVO - 삭제할 정보가 담긴 customerGroupVO
     * @return 삭제된 목록수
     */
    public int deleteCustomerGroup(CustomerGroupVO customerGroupVO);

    /**
     * 고객의 그룹 정보를 수정한다.
     * @param customerGroupVO - 수정할 정보가 담긴 customerGroupVO
     * @return 수정된 목록수
     */
    public int updateCustomerGroupChg(CustomerGroupVO customerGroupVO);

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int selectCustomerInGroupByConditionCnt(CustomerGroupSearchVO searchVO);

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<CustomerGroupVO> selectCustomerInGroupByCondition(CustomerGroupSearchVO searchVO);

    /**
     * 고객의 그룹 정보를 등록한다.
     * @param customerGroupVO - 등록할 정보가 담긴 customerGroupVO
     * @return 등록된 목록수
     */
    public int insertCustomerGroupInfo(CustomerGroupVO customerGroupVO);

    /**
     * 고객의 그룹 정보를 삭제한다.
     * @param customerGroupVO - 등록할 정보가 담긴 customerGroupVO
     * @return 삭제 수
     */
    public int deleteCustomerGroupInfo(@Param("custNo") String custNo, @Param("grpTp") String grpTp, @Param("dlrCd") String dlrCd, @Param("pltCd") String pltCd);

    /**
     * 고객의 그룹 목록을 조회한다.
     * @param customerGroupVO - 등록할 정보가 담긴 customerGroupVO
     * @return 목록
     */
    public List<CustomerGroupVO> selectCustomerGroupByKey(CustomerGroupVO customerGroupVO);
}
