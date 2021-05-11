package chn.bhmc.dms.crm.cso.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.cso.vo.TestDriveCarSearchVO;
import chn.bhmc.dms.crm.cso.vo.TestDriveCarVO;

/**
 * 시승 예약에 관한 데이터처리 매퍼 클래스
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

@Mapper("testDriveCarDAO")
public interface TestDriveCarDAO {

    /**
     * 조회 조건에 해당하는 시승 예약 총 갯수를 조회한다.
     * @param carId
     * @return
     */
    public int selectTestDriveCarsByConditionCnt(TestDriveCarSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 시승 예약 정보를 조회한다.
     * @param carId
     * @return 조회 목록
     */
    public List<TestDriveCarVO> selectTestDriveCarsByCondition(TestDriveCarSearchVO searchVO) throws Exception;

    /**
     * 시승차량 관리 상태를 수정한다.
     * @param saveVO
     * @return
     */
    public int updateTestDriveCarMgmt(TestDriveCarVO saveVO) throws Exception;

    /**
     * 시승차 - 예약이 있는지 확인
     * @param TestDriveCarSearchVO
     * @return
     */
    public int selectTdrvCarByKeyCnt(TestDriveCarSearchVO searchVO) throws Exception;

    /**
     * 시승 차량 등록
     * @param TestDriveCarSearchVO
     * @return
     */
    public int insertTdrvCar(TestDriveCarVO saveVO) throws Exception;

    /**
     * 시승 차량 등록 확인
     * @param saveVO
     * @return 등록된 시승 차량 수량
     */
    public int selectTdrvCarByKey(TestDriveCarVO saveVO) throws Exception;

    /**
     * 시승차량 주행거리를 변경한다. ( 시승 관리 저장시  이후 주행거리 -> 시승테이블 주행거리 수정 )
     * @param saveVO
     * @return
     */
    public int updateTestDriveCarRunDistVal(TestDriveCarVO saveVO) throws Exception;

}
