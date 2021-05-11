package chn.bhmc.dms.crm.cso.service;

import java.util.List;

import chn.bhmc.dms.crm.cso.vo.TestDriveCarSaveVO;
import chn.bhmc.dms.crm.cso.vo.TestDriveCarSearchVO;
import chn.bhmc.dms.crm.cso.vo.TestDriveCarVO;

/**
 * 시승 차량 관리 서비스
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

public interface TestDriveCarService {

    /**
     * 조회 조건에 해당하는 시승 차량 총 갯수를 조회한다.
     * @param TestDriveCarSearchVO testDriveCarSearchVO
     * @return
     */
    public int selectTestDriveCarsByConditionCnt(TestDriveCarSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 시승 차량 정보를 조회한다.
     * @param TestDriveCarSearchVO testDriveCarSearchVO
     * @return 조회 목록
     */
    public List<TestDriveCarVO> selectTestDriveCarsByCondition(TestDriveCarSearchVO searchVO) throws Exception;

    /**
     * 시승차량 관리 상태를 수정한다.
     * @param saveVO
     * @return
     */
    public int updateTestDriveCarMgmt(TestDriveCarSaveVO saveVO) throws Exception;

    /**
     * 시승차 - 예약이 있는지 확인 ( 세일즈에서 호출 )
     * @param TestDriveCarSearchVO : sDlrCd(딜러코드), sPltCd(센터코드), sTdrvVinNo(차대번호)
     * @return 예약이 없으면 true, 예약이 있으면 false
     * @throws Exception
     */
    public boolean selectTdrvCarByKeyCnt(TestDriveCarSearchVO saveVO) throws Exception;

    /**
     * 시승 차량 등록 ( 세일즈에서 호출 )
     * @param TestDriveCarVO : dlrCd(딜러코드), pltCd(센터코드), tdrvVinNo(차대번호), useYn(사용유무), regUsrId(등록자)
     * @return 등록완료 : true / 등록실패 : false
     * @throws Exception
     */
    public boolean insertTdrvCar(TestDriveCarVO saveVO) throws Exception;

    /**
     * 시승차량 주행거리를 변경한다. ( 시승 관리 저장시  이후 주행거리 -> 시승테이블 주행거리 수정 )
     * @param saveVO
     * @return
     */
    public int updateTestDriveCarRunDistVal (TestDriveCarVO saveVO) throws Exception;

    /**
     * 시승차량 삭제한다. ( 세일즈에서 호출 )
     * @param TestDriveCarSearchVO : sDlrCd(딜러코드), sPltCd(센터코드), sTdrvVinNo(차대번호)
     * @return 시승차량 삭제 수량
     */
    public int deleteTestDriveCar(TestDriveCarSearchVO searchVO) throws Exception;

}
