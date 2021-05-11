package chn.bhmc.dms.crm.cso.service;

import java.util.List;

import chn.bhmc.dms.crm.cso.vo.TestDriveCalendarVO;
import chn.bhmc.dms.crm.cso.vo.TestDriveResvSearchVO;
import chn.bhmc.dms.crm.cso.vo.TestDriveResvVO;

/**
 * 시승 예약 관리 서비스
 *
 * @author in moon lee
 * @since 2016.02.11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.02.11         in moon lee            최초 생성
 * </pre>
 */

public interface TestDriveMgmtService {


    /**
     * 조회 조건에 해당하는 시승 예약 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TestDriveResvSearchVO
     * @return
     */
    public int selectTestDriveResvsByConditionCnt(TestDriveResvSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 시승 예약 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TestDriveResvSearchVO
     * @return 조회 목록
     */
    public List<TestDriveResvVO> selectTestDriveResvsByCondition(TestDriveResvSearchVO searchVO) throws Exception;

    /**
     * 시승 예약 중복을 확인한다.
     * @param testDriveResvVO
     *
     */
    public int selectTdrvResvByKeyCnt(TestDriveResvVO testDriveResvVO) throws Exception;

    /**
     * 시승 예약 상세 조회
     * @param testDriveResvVO
     *
     */
    public TestDriveResvVO selectTestDriveMgmtByKey(TestDriveResvSearchVO searchVO) throws Exception;

    /**
     * 시승 예약 정보를 저장 한다.
     * @param TestDriveResvVO - 등록할 정보가 담긴 TestDriveResvVO
     * @return 저장된 목록수
     */
    public int multiTestDriveResvs(TestDriveResvVO testDriveResvVO) throws Exception;

    /**
     * 시승 예약 정보를 삭제한다.
     * @param visitCustomerVO - 삭제할 정보가 담긴 TestDriveResvVO
     * @return 삭제된 목록수
     */
    public int cancelTestDriveResv(TestDriveResvVO visitCustomerVO) throws Exception;

    /**
     * 시승 일지를 저장 한다.
     * @param testDriveResvVO - 시승 일지 정보가 담긴 TestDriveResvVO
     * @return 저장된 목록수
     */
    public int updateTestDriveMgmt(TestDriveResvVO testDriveResvVO) throws Exception;



    /**
     * 조회 조건에 해당하는 시승 예약 캘린더 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TestDriveResvSearchVO
     * @return
     */
    public int selectTestDriveCalendarsByConditionCnt(TestDriveResvSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 시승 예약 캘린더 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TestDriveResvSearchVO
     * @return 조회 목록
     */
    public List<TestDriveCalendarVO> selectTestDriveCalendarsByCondition(TestDriveResvSearchVO searchVO) throws Exception;


}
