package chn.bhmc.dms.sal.svo.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.svo.vo.ReqTestDriveVehiclePopupCarVO;
import chn.bhmc.dms.sal.svo.vo.ReqTestDriveVehiclePopupEvlVO;
import chn.bhmc.dms.sal.svo.vo.ReqTestDriveVehicleSearchVO;
import chn.bhmc.dms.sal.svo.vo.ReqTestDriveVehicleVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ReqTestDriveVehicleDAO
 * @Description : 시승차량 신청 DAO
 * @author Bong
 * @since 2016. 3. 02.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.03.02     Bong                  최초 생성
 * </pre>
 */

@Mapper("reqTestDriveVehicleDAO")
public interface ReqTestDriveVehicleDAO {

    /**
     * 조회 조건에 해당하는 시승차량 신청 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReqTestDriveVehicleSearchVO
     * @return 조회 목록
     */

    public List<ReqTestDriveVehicleVO> selectReqTestDriveVehicleByCondition(ReqTestDriveVehicleSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 시승차량 신청 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReqTestDriveVehicleSearchVO
     * @return
     */
    public int selectReqTestDriveVehicleByConditionCnt(ReqTestDriveVehicleSearchVO searchVO) throws Exception;

    /**
     * 시승차량 신청 팝업 세부정보 조회
     */
    public int selectReqTestDriveVehiclePopupContainCnt(ReqTestDriveVehicleSearchVO searchVO) throws Exception;
    public List<ReqTestDriveVehicleVO> selectReqTestDriveVehiclePopupContain(ReqTestDriveVehicleSearchVO searchVO) throws Exception;

    /**
     * 시승차량 신청 팝업 차량유형설명 정보 조회
     */
    public int selectReqTestDriveVehiclePopupContsByConditionCnt(ReqTestDriveVehicleSearchVO searchVO) throws Exception;
    public List<ReqTestDriveVehiclePopupCarVO> selectReqTestDriveVehiclePopupContsByCondition(ReqTestDriveVehicleSearchVO searchVO) throws Exception;

    /**
     * 시승차량 신청 팝업 차량내역 조회
     */
    public int selectReqTestDriveVehiclePopupCarsByConditionCnt(ReqTestDriveVehicleSearchVO searchVO) throws Exception;
    public List<ReqTestDriveVehiclePopupCarVO> selectReqTestDriveVehiclePopupCarsByCondition(ReqTestDriveVehicleSearchVO searchVO) throws Exception;

    /**
     * 시승차량신청 팝업 심사내역 조회
     */
    public int selectReqTestDriveVehiclePopupEvlsByConditionCnt(ReqTestDriveVehicleSearchVO searchVO) throws Exception;
    public List<ReqTestDriveVehiclePopupEvlVO> selectReqTestDriveVehiclePopupEvlsByCondition(ReqTestDriveVehicleSearchVO searchVO) throws Exception;

    /**
     * 시승차 이전내역 조회
     */
    public List<ReqTestDriveVehicleVO> selectTestDriveBeforDtContain(ReqTestDriveVehicleSearchVO searchVO) throws Exception;

    /**
     * 시승차량신청 팝업 차량 저장/수정/삭제 SA_0422T 차량 detail
     */
    public int insertReqTestDriveVehiclePopupCars(ReqTestDriveVehiclePopupCarVO saveVO) throws Exception;
    public int updateReqTestDriveVehiclePopupCars(ReqTestDriveVehiclePopupCarVO saveVO) throws Exception;
    public int deleteReqTestDriveVehiclePopupCars(ReqTestDriveVehiclePopupCarVO saveVO) throws Exception;

    /**
     * 시승차량 신청 저장/수정 SA_0424T
     */
    public int insertReqTestDriveVehicle (ReqTestDriveVehicleVO saveVO) throws Exception;
    public int updateReqTestDriveVehicle (ReqTestDriveVehicleVO saveVO) throws Exception;

    /**
     * 시승차량신청 2차심사요청 저장
     */
    public int secondSaveReqTestDriveVehiclePopup(ReqTestDriveVehicleVO saveVO) throws Exception;

    /**
     * 시승차량신청 삭제
     */
    public int deleteReqTestDriveVehicle (ReqTestDriveVehicleSearchVO saveVO) throws Exception;

    /**
     * 시승차량신청 확정
     */
    public int confirmReqTestDriveVehicle (ReqTestDriveVehicleSearchVO saveVO) throws Exception;

    //시승차주문정보수신1
    public int procDemoCarReq1(ReqTestDriveVehiclePopupCarVO saveVO) throws Exception;

    //시승차주문정보수신2
    public int procDemoCarReq2(ReqTestDriveVehiclePopupCarVO saveVO) throws Exception;

    /**
     * Statements
     *
     * @param contVO
     */
    public void procDemoCarReq2(ReqTestDriveVehicleVO contVO);
}