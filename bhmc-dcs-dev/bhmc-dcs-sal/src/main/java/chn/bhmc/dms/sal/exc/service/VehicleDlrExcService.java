package chn.bhmc.dms.sal.exc.service;

import java.util.List;

import chn.bhmc.dms.sal.exc.vo.VehicleDlrExcSearchVO;
import chn.bhmc.dms.sal.exc.vo.VehicleDlrExcVO;

/**
 * 딜러간차량교환관리 서비스
 *
 * @author Kim yewon
 * @since 2016. 4. 27.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                       수정자                              수정내용
 *  ----------------   ------------    ---------------------------
 *   2016.04.27         Kim yewon            최초 생성
 * </pre>
 */

public interface VehicleDlrExcService {


	/**
     * 조회 조건에 해당하는 딜러간차량교환관리 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleDlrExcSearchVO
     * @return 조회 목록
     */
	public List<VehicleDlrExcVO> selectVehicleDlrExcByCondition(VehicleDlrExcSearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 딜러간차량교환관리 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleDlrExcSearchVO
     * @return
     */
	public int selectVehicleDlrExcByConditionCnt(VehicleDlrExcSearchVO searchVO) throws Exception;


	/**
     * 딜러간차량교환 정보 저장한다.
     * @param saveVO
     */
    public int saveVehicleDlrExc(VehicleDlrExcVO saveVO) throws Exception;


    /**
     * 딜러간차량교환정보 삭제한다.
     * @param saveVO
     */
    public int deleteVehicleDlrExc(VehicleDlrExcVO saveVO) throws Exception;

}
