package chn.bhmc.dms.sal.obt.service;

import java.util.List;

import chn.bhmc.dms.sal.obt.vo.VehicleObtainReqSearchVO;
import chn.bhmc.dms.sal.obt.vo.VehicleObtainReqVO;

/**
 * 차량조달신청관리 서비스
 *
 * @author Kim yewon
 * @since 2016. 4. 22.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                       수정자                              수정내용
 *  ----------------   ------------    ---------------------------
 *   2016.04.22         Kim yewon            최초 생성
 * </pre>
 */

public interface VehicleObtainReqService {


	/**
     * 조회 조건에 해당하는 차량조달신청관리 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleObtainReqSearchVO
     * @return 조회 목록
     */
	public List<VehicleObtainReqVO> selectVehicleObtainReqByCondition(VehicleObtainReqSearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 차량조달신청관리 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CmpCarRunMngSearchVO
     * @return
     */
	public int selectVehicleObtainReqByConditionCnt(VehicleObtainReqSearchVO searchVO) throws Exception;


	/**
     * 차량조달신청관리 저장한다.
     * @param saveVO
     */
    public int saveVehicleObtainReq(VehicleObtainReqVO saveVO) throws Exception;


    /**
     * 차량조달신청관리 삭제한다.
     * @param saveVO
     */
    public int deleteVehicleObtainReq(VehicleObtainReqVO saveVO) throws Exception;

}
