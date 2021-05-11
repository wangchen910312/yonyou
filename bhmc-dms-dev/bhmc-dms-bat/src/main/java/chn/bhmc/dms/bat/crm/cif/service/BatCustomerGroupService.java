package chn.bhmc.dms.bat.crm.cif.service;

import java.util.List;

import chn.bhmc.dms.bat.crm.cif.vo.BatCustomerGroupSearchVO;
import chn.bhmc.dms.bat.crm.cif.vo.BatCustomerGroupVO;
import chn.bhmc.dms.core.datatype.BaseSaveVO;



//import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatCustomerGroupService
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

public interface BatCustomerGroupService {

    /**
     * 조회 조건에 해당하는 고객그룹 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BatCustomerGroupSearchVO
     * @return
     */
    public int selectCustomerGroupByConditionCnt(BatCustomerGroupSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 메세지소스 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DBMessageSourceSearchVO
     * @return 조회 목록
     */
    public List<BatCustomerGroupVO> selectCustomerGroupByCondition(BatCustomerGroupSearchVO searchVO) throws Exception;

    /**
     * Statements
     *
     * @param saveVO
     */
    public void multiCustomerGroup(BaseSaveVO<BatCustomerGroupVO> saveVO) throws Exception;

    /**
     * Statements
     *
     * @param saveVO
     */
    public void multiCustomerGroupInfo(BaseSaveVO<BatCustomerGroupVO> saveVO) throws Exception;

    /**
     * Statements
     *
     * @param saveVO
     */
    public void multiCustomerGroupChg(BaseSaveVO<BatCustomerGroupVO> saveVO) throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int selectCustomerInGroupByConditionCnt(BatCustomerGroupSearchVO searchVO) throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<BatCustomerGroupVO> selectCustomerInGroupByCondition(BatCustomerGroupSearchVO searchVO) throws Exception;

    /**
     * Statements
     *
     * @param custNo, grpTp
     * @return
     * @throws Exception
     */
    public List<BatCustomerGroupVO> selectCustomerGroupByKey(String custNo, String grpTp, String dlrCd, String pltCd) throws Exception;

}
