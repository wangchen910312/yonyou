package chn.bhmc.dms.crm.cso.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.cso.vo.TestDriveClineSearchVO;
import chn.bhmc.dms.crm.cso.vo.TestDriveClineVO;

/**
 * 시승노선관리에 관한 데이터처리 매퍼 클래스
 *
 * @author in moon lee
 * @since 2016.05.12.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.05.12         in moon lee            최초 생성
 * </pre>
 */

@Mapper("testDriveClineDAO")
public interface TestDriveClineDAO {

    /**
     * 조회 조건에 해당하는 시승노선관리 총 갯수를 조회한다.
     * @return
     */
    public int selectTestDriveClinesByConditionCnt(TestDriveClineSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 시승노선관리 정보를 조회한다.
     * @return 조회 목록
     */
    public List<TestDriveClineVO> selectTestDriveClinesByCondition(TestDriveClineSearchVO searchVO) throws Exception;

    /**
     * 시승노선을 등록한다.
     * @param saveVO
     * @return
     */
    public int insertTestDriveClineMgmt(TestDriveClineVO saveVO) throws Exception;

    /**
     * 시승노선을 수정한다.
     * @param saveVO
     * @return
     */
    public int updateTestDriveClineMgmt(TestDriveClineVO saveVO) throws Exception;

    /**
     * 시승노선을 삭제한다.
     * @param saveVO
     * @return
     */
    public int deleteTestDriveClineMgmt(TestDriveClineVO saveVO) throws Exception;

}
