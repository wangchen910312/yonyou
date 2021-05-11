package chn.bhmc.dms.crm.cso.service;

import java.util.List;

import chn.bhmc.dms.crm.cso.vo.SalesOnDutyMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOnDutyMgmtVO;

/**
 * 당직관리 서비스
 *
 * @author kyo jin lee
 * @since 2016.03.07.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.07         kyo jin lee            최초 생성
 * </pre>
 */

public interface SalesOnDutyMgmtService {

    /**
     * 조회 조건에 해당하는 당직관리 관리 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptProcessMgmtSearchVO
     * @return int
     */
    public int selectSalesOnDutyMgmtByConditionCnt(SalesOnDutyMgmtSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 당직관리 관리 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOnDutyMgmtSearchVO
     * @return int 조회 목록
     */
    public List<SalesOnDutyMgmtVO> selectSalesOnDutyMgmtByCondition(SalesOnDutyMgmtSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 당직관리 관리 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOnDutyMgmtSearchVO
     * @return int 조회 목록
     */
    public List<SalesOnDutyMgmtVO> selectSalesOnDutySchedulerMgmtByCondition(SalesOnDutyMgmtSearchVO searchVO) throws Exception;

    /**
     * 당직관리 카운트 업데이트
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int updateSalesOnDutyCountMgmt(SalesOnDutyMgmtVO salesOnDutyMgmtVO) throws Exception;

    /**
     * 조회 조건에 해당하는 직원배정 관리 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptProcessMgmtSearchVO
     * @return int
     */
    public int selectSalesOpptScAssignMgmtByConditionCnt(SalesOnDutyMgmtSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 직원배정 관리 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOnDutyMgmtSearchVO
     * @return int 조회 목록
     */
    public List<SalesOnDutyMgmtVO> selectSalesOpptScAssignMgmtByCondition(SalesOnDutyMgmtSearchVO searchVO) throws Exception;

    /**
     * 직원배정 신규
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int insertSalesOpptScAssignMgmt(SalesOnDutyMgmtVO salesOnDutyMgmtVO) throws Exception;

    /**
     * 당직 구성원 다음달로 복사
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int insertCopyOnDutyMbrNextMonth(SalesOnDutyMgmtVO salesOnDutyMgmtVO) throws Exception;

    /**
     * 직원배정 삭제
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int deleteOnDutySetMember(SalesOnDutyMgmtVO salesOnDutyMgmtVO) throws Exception;





}
