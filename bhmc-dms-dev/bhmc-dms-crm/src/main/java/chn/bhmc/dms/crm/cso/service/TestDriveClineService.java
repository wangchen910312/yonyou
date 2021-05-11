package chn.bhmc.dms.crm.cso.service;

import java.util.List;

import chn.bhmc.dms.crm.cso.vo.TestDriveClineSaveVO;
import chn.bhmc.dms.crm.cso.vo.TestDriveClineSearchVO;
import chn.bhmc.dms.crm.cso.vo.TestDriveClineVO;

/**
 * 시승노선관리 서비스
 *
 * @author in moon lee
 * @since 2016.05.12
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.05.12         in moon lee            최초 생성
 * </pre>
 */

public interface TestDriveClineService {

    /**
     * 조회 조건에 해당하는 시승노선 총 갯수를 조회한다.
     * @param TestDriveClineSearchVO testDriveClineSearchVO
     * @return
     */
    public int selectTestDriveClinesByConditionCnt(TestDriveClineSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 시승노선 정보를 조회한다.
     * @param TestDriveClineSearchVO testDriveClineSearchVO
     * @return 조회 목록
     */
    public List<TestDriveClineVO> selectTestDriveClinesByCondition(TestDriveClineSearchVO searchVO) throws Exception;

    /**
     * 시승노선을 저장한다.
     * @param saveVO
     * @return
     */
    public int multiTestDriveClineMgmt(TestDriveClineSaveVO saveVO) throws Exception;


}
