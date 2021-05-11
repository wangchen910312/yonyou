package chn.bhmc.dms.sal.svo.service;

import java.util.List;

import chn.bhmc.dms.sal.svo.vo.ReqTestDriveVehiclePopupCarVO;
import chn.bhmc.dms.sal.svo.vo.ReqTestDriveVehicleSearchVO;
import chn.bhmc.dms.sal.svo.vo.ReqTestDriveVehicleVO;
import chn.bhmc.dms.sal.svo.vo.TestDriveVehicleInspctSaveVO;




/**
 *  시승차량 심사 서비스
 *
 * @author Bong
 * @since 2016. 3. 08.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                      수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.08          Bong            최초 생성
 * </pre>
 */

public interface TestDriveVehicleInspctService {

    /**
     * 시승차량 심사 메인 조회
     */
    public int selectTestDriveVehicleInspctByConditionCnt(ReqTestDriveVehicleSearchVO searchVO) throws Exception;
    public List<ReqTestDriveVehicleVO> selectTestDriveVehicleInspctByCondition(ReqTestDriveVehicleSearchVO searchVO) throws Exception;
    public List<ReqTestDriveVehicleVO> selectTestDriveVehicleExportByCondition(ReqTestDriveVehicleSearchVO searchVO) throws Exception;
    
    
    /**
     * 시승차량 심사 팝업(1) 차량유형 - 정책입력
     */
    public int confirmPolicyInputPopup(ReqTestDriveVehiclePopupCarVO saveVO) throws Exception;


    /**
     * 시승차량 심사 팝업(2) 심사정보 조회
     */
    public int selectTestDriveVehicleInspctPopupContainCnt(ReqTestDriveVehicleSearchVO searchVO) throws Exception;
    public List<ReqTestDriveVehicleVO> selectTestDriveVehicleInspctPopupContain(ReqTestDriveVehicleSearchVO searchVO) throws Exception;

    /**
     * 시승차량 심사 확정 처리
     */
    public int confirmTestDriveVehicleInspct(TestDriveVehicleInspctSaveVO saveVO) throws Exception;

    /**
     * 시승차 합격여부 저장
     */
    public int secondConfirmTestDriveVehiclePopup(TestDriveVehicleInspctSaveVO saveVO) throws Exception;

}
