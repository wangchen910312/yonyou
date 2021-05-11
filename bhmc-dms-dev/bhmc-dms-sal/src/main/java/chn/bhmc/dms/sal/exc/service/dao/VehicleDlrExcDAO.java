package chn.bhmc.dms.sal.exc.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.exc.vo.VehicleDlrExcSearchVO;
import chn.bhmc.dms.sal.exc.vo.VehicleDlrExcVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VehicleDlrExcDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim yewon
 * @since 2016. 4. 27
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 27      Kim yewon              최초 생성
 * </pre>
 */

@Mapper("vehicleDlrExcDAO")
public interface VehicleDlrExcDAO {

    /**
      * 조회 조건에 해당하는 딜러간차량교환 정보를 조회한다.
      */
    public List<VehicleDlrExcVO> selectVehicleDlrExcByCondition(VehicleDlrExcSearchVO searchVO);

    /**
     *  조회 조건에 해당하는 딜러간차량교환관리 총 갯수를 조회한다.
     */
    public int selectVehicleDlrExcByConditionCnt(VehicleDlrExcSearchVO searchVO);


    /**
     * 대행업무 수정한다.
     */
    public int updateVehicleDlrExc(VehicleDlrExcVO saveVO) throws Exception;


    /**
     * 대행업무를 신규 등록
     */
    public int insertVehicleDlrExc(VehicleDlrExcVO vo) throws Exception;


    /**
     * 대행업무를 삭제
     */
    public int deleteVehicleDlrExc(VehicleDlrExcVO vo) throws Exception;


    //딜러간차량교환심사요청정보수신
    public int procExchangeReq(VehicleDlrExcVO vo) throws Exception;

    /**
     * 딜러간차량교환승인
     */
    public int updateVehicleDlrExcConf(VehicleDlrExcVO vo) throws Exception;

}
