package chn.bhmc.dms.sal.svo.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.svo.vo.ReqTestDriveVehiclePopupCarVO;
import chn.bhmc.dms.sal.svo.vo.ReqTestDriveVehicleSearchVO;
import chn.bhmc.dms.sal.svo.vo.ReqTestDriveVehicleVO;
import chn.bhmc.dms.sal.svo.vo.TestDriveVehicleInspctSaveVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : TestDriveVehicleInspctDAO
 * @Description : 시승차 심사 DAO
 * @author Bong
 * @since 2016. 3. 08.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.03.08       Bong                 최초 생성
 * </pre>
 */

@Mapper("testDriveVehicleInspctDAO")
public interface TestDriveVehicleInspctDAO {

    /**
     * 시승차량 신청 팝업 차량유형설명 정보 조회
     */
    public int selectReqTestDriveVehiclePopupContsByConditionCnt(ReqTestDriveVehicleSearchVO searchVO) throws Exception;

    /**
     * 시승차량 심사 메인 조회
     */
    public int selectTestDriveVehicleInspctByConditionCnt(ReqTestDriveVehicleSearchVO searchVO) throws Exception;
    public List<ReqTestDriveVehicleVO> selectTestDriveVehicleInspctByCondition(ReqTestDriveVehicleSearchVO searchVO) throws Exception;
    /**
     * 엑셀 출력 조회 
     */
    public List<ReqTestDriveVehicleVO> selectTestDriveVehicleExportByCondition(ReqTestDriveVehicleSearchVO searchVO) throws Exception;
    
    
    /**
     * 시승차량 심사 팝업(1) 차량유형 - 정책입력
     */
    public int confirmPolicyInputPopupUpdate(ReqTestDriveVehiclePopupCarVO saveVO) throws Exception;
    public int confirmPolicyInputPopupInsert(ReqTestDriveVehiclePopupCarVO saveVO) throws Exception;
    public int insertCarPopupContHists(ReqTestDriveVehiclePopupCarVO saveVO) throws Exception;
    public int procCarPopupContHists(ReqTestDriveVehiclePopupCarVO saveVO) throws Exception;

    /**
     * 시승차량 심사 팝업(2) 심사정보 조회
     */
    public int selectTestDriveVehicleInspctPopupContainCnt(ReqTestDriveVehicleSearchVO searchVO) throws Exception;
    public List<ReqTestDriveVehicleVO> selectTestDriveVehicleInspctPopupContain(ReqTestDriveVehicleSearchVO searchVO) throws Exception;

    /**
     * 시승차량 심사 팝업(2) 심사 확정
     */
    public int insertTestDriveVehicleInspctDetail(TestDriveVehicleInspctSaveVO saveVO) throws Exception;
    public int updateTestDriveVehicleInspctHeader(TestDriveVehicleInspctSaveVO saveVO) throws Exception;

    //프로시저 추가
    public int procTestDriveInspct(TestDriveVehicleInspctSaveVO saveVO) throws Exception;

    /**
     * 시승차 합격여부 저장
     */
    public int secondConfirmTestDriveVehiclePopup(TestDriveVehicleInspctSaveVO saveVO) throws Exception;
}