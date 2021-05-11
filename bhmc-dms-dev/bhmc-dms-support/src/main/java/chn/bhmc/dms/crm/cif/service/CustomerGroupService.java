package chn.bhmc.dms.crm.cif.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.crm.cif.vo.CustomerGroupSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerGroupVO;



//import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CustomerGroupService.java
 * @Description : 고객그룹관리 Service
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

public interface CustomerGroupService {

    /**
     * 조회 조건에 해당하는 고객그룹 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CustomerGroupSearchVO
     * @return
     */
    public int selectCustomerGroupByConditionCnt(CustomerGroupSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 메세지소스 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DBMessageSourceSearchVO
     * @return 조회 목록
     */
    public List<CustomerGroupVO> selectCustomerGroupByCondition(CustomerGroupSearchVO searchVO) throws Exception;

    /**
     * Statements
     *
     * @param saveVO
     */
    public void multiCustomerGroup(BaseSaveVO<CustomerGroupVO> saveVO) throws Exception;

    /**
     * Statements
     *
     * @param saveVO
     */
    public void multiCustomerGroupInfo(BaseSaveVO<CustomerGroupVO> saveVO) throws Exception;

    /**
     * Statements
     *
     * @param saveVO
     */
    public void multiCustomerGroupChg(BaseSaveVO<CustomerGroupVO> saveVO) throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int selectCustomerInGroupByConditionCnt(CustomerGroupSearchVO searchVO) throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<CustomerGroupVO> selectCustomerInGroupByCondition(CustomerGroupSearchVO searchVO) throws Exception;

    /**
     * Statements
     *
     * @param custNo, grpTp
     * @return
     * @throws Exception
     */
    public List<CustomerGroupVO> selectCustomerGroupByKey(String custNo, String grpTp, String dlrCd, String pltCd) throws Exception;

}
