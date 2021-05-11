package chn.bhmc.dms.sal.ass.service;

import java.util.List;

import chn.bhmc.dms.sal.ass.vo.AssignSearchVO;
import chn.bhmc.dms.sal.ass.vo.AssignVO;

/**
 * 배정관리 서비스
 *
 * @author Kim yewon
 * @since 2016. 3. 3.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                       수정자                              수정내용
 *  ----------------   ------------    ---------------------------
 *   2016.03.3         Kim yewon            최초 생성
 * </pre>
 */

public interface AssignMngService {


	/**
     * 조회 조건에 해당하는 배정 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AssignSearchVO
     * @return 조회 목록
     */
	public List<AssignVO> selectAssignByCondition(AssignSearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 배정목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AssignSearchVO
     * @return
     */
	public int selectAssignByConditionCnt(AssignSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 배정팝업 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AssignSearchVO
     * @return 조회 목록
     */
    public List<AssignVO> selectAssignPopupListByCondition(AssignSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 배정팝업 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AssignSearchVO
     * @return
     */
    public int selectAssignPopupListByConditionCnt(AssignSearchVO searchVO) throws Exception;


    /**
     * 배정관리 - 배정이벤트
     * @param VO - assignVO
     * @return 성공 true
     * @throws Exception
     */
    public boolean insertVehicleAssign(AssignVO assginVO) throws Exception;



    /**
     * 배정관리 - 배정취소 이벤트
     * @param VO - assignVO
     * @return 성공 true
     * @throws Exception
     */
    public boolean cancelVehicleAssign(AssignVO assginVO) throws Exception;



    /**
     * 배정관리 - 차량교환
     * @param VO - assignVO
     * @return 성공 true
     * @throws Exception
     */
    public boolean vehicleExchange(AssignVO assginVO) throws Exception;



    /**
     * 조회 조건에 해당하는 배정계약현황을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AssignSearchVO
     * @return 조회 목록
     */
    public List<AssignVO> selectAssignStsByCondition(AssignSearchVO searchVO) throws Exception;


    /**
     * 조회 조건에 해당하는 배정계약현황목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AssignSearchVO
     * @return
     */
    public int selectAssignStsByConditionCnt(AssignSearchVO searchVO) throws Exception;


    /**
     * 조회 조건에 해당하는 배정취소이력현황 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AssignSearchVO
     * @return 조회 목록
     */
    public List<AssignVO> selectAssignCancelStsByCondition(AssignSearchVO searchVO) throws Exception;


    /**
     * 조회 조건에 해당하는 배정취소이력목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AssignSearchVO
     * @return
     */
    public int selectAssignCancelStsByConditionCnt(AssignSearchVO searchVO) throws Exception;




}
