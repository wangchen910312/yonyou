package chn.bhmc.dms.sal.svo.service;

import java.util.List;

import chn.bhmc.dms.sal.svo.vo.ReqTestDriveVehiclePopupCarVO;
import chn.bhmc.dms.sal.svo.vo.ReqTestDriveVehiclePopupEvlVO;
import chn.bhmc.dms.sal.svo.vo.ReqTestDriveVehicleSaveVO;
import chn.bhmc.dms.sal.svo.vo.ReqTestDriveVehicleSearchVO;
import chn.bhmc.dms.sal.svo.vo.ReqTestDriveVehicleVO;




/**
 *  시승차량 신청 서비스
 *
 * @author Bong
 * @since 2016. 3. 02.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.02         Bong            최초 생성
 * </pre>
 */

public interface ReqTestDriveVehicleService {


    /**
     * 시승차량 신청 메인 조회
     */
    public int selectReqTestDriveVehicleByConditionCnt(ReqTestDriveVehicleSearchVO searchVO) throws Exception;
    public List<ReqTestDriveVehicleVO> selectReqTestDriveVehicleByCondition(ReqTestDriveVehicleSearchVO searchVO) throws Exception;

    /**
     * 시승차량 신청 팝업 상세내역 조회
     */
    public int selectReqTestDriveVehiclePopupContainCnt(ReqTestDriveVehicleSearchVO searchVO) throws Exception;
    public List<ReqTestDriveVehicleVO> selectReqTestDriveVehiclePopupContain(ReqTestDriveVehicleSearchVO searchVO) throws Exception;


    /**
     * 시승차량 신청 팝업 차량유형설명 정보 조회
     */
    public int selectReqTestDriveVehiclePopupContsByConditionCnt(ReqTestDriveVehicleSearchVO searchVO) throws Exception;
    public List<ReqTestDriveVehiclePopupCarVO> selectReqTestDriveVehiclePopupContsByCondition(ReqTestDriveVehicleSearchVO searchVO) throws Exception;


    /**
     * 시승차량 신청 팝업 차량정보 조회
     */
    public int selectReqTestDriveVehiclePopupCarsByConditionCnt(ReqTestDriveVehicleSearchVO searchVO) throws Exception;
    public List<ReqTestDriveVehiclePopupCarVO> selectReqTestDriveVehiclePopupCarsByCondition(ReqTestDriveVehicleSearchVO searchVO) throws Exception;

    /**
     * 시승차량 신청 팝업 심사정보 조회
     */
    public int selectReqTestDriveVehiclePopupEvlsByConditionCnt(ReqTestDriveVehicleSearchVO searchVO) throws Exception;
    public List<ReqTestDriveVehiclePopupEvlVO> selectReqTestDriveVehiclePopupEvlsByCondition(ReqTestDriveVehicleSearchVO searchVO) throws Exception;

    /**
     * 시승차 이전내역 조회
     */
    public List<ReqTestDriveVehicleVO> selectTestDriveBeforDtContain(ReqTestDriveVehicleSearchVO searchVO) throws Exception;

    /**
     * 시승차량신청 팝업 저장
     */
    public int multiReqTestDriveVehiclePopups(ReqTestDriveVehicleSaveVO saveVO) throws Exception;

    /**
     * 시승차량신청 2차심사요청 저장
     */
    public int secondSaveReqTestDriveVehiclePopup(ReqTestDriveVehicleVO saveVO) throws Exception;

    /**
     * 시승차량신청 삭제
     */
    public int deleteReqTestDriveVehicle(ReqTestDriveVehicleSearchVO deleteVO) throws Exception;

    /**
     * 시승차량신청 확정
     */
    public int confirmReqTestDriveVehicle(ReqTestDriveVehicleSearchVO deleteVO) throws Exception;


}
