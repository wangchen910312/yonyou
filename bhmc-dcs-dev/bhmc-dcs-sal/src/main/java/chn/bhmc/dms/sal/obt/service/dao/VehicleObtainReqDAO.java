package chn.bhmc.dms.sal.obt.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.obt.vo.VehicleObtainReqSearchVO;
import chn.bhmc.dms.sal.obt.vo.VehicleObtainReqVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VehicleObtainReqDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim yewon
 * @since 2016. 4. 22
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 22      Kim yewon              최초 생성
 * </pre>
 */

@Mapper("vehicleObtainReqDAO")
public interface VehicleObtainReqDAO {

    /**
      * 조회 조건에 해당하는 차량조달신청관리 정보를 조회한다.
      */
    public List<VehicleObtainReqVO> selectVehicleObtainReqByCondition(VehicleObtainReqSearchVO searchVO);

    /**
     *  조회 조건에 해당하는 차량조달신청관리목록 총 갯수를 조회한다.
     */
    public int selectVehicleObtainReqByConditionCnt(VehicleObtainReqSearchVO searchVO);


    /**
     * 대행업무 수정한다.
     */
    public int updateVehicleObtainReq(VehicleObtainReqVO saveVO) throws Exception;


    /**
     * 대행업무를 신규 등록
     */
    public int insertVehicleObtainReq(VehicleObtainReqVO vo) throws Exception;


    /**
     * 대행업무를 삭제
     */
    public int deleteVehicleObtainReq(VehicleObtainReqVO vo) throws Exception;


    //차량조달심사요청정보수신
    public int procObtainReq(VehicleObtainReqVO vo) throws Exception;

    /**
     * 대행업무를 신규 등록
     */
    public int updateVehicleObtainReqConf(VehicleObtainReqVO vo) throws Exception;
}
