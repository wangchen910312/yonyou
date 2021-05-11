package chn.bhmc.dms.crm.cal.service;

import java.util.List;

import chn.bhmc.dms.crm.cal.vo.CallCenterActionSearchVO;
import chn.bhmc.dms.crm.cal.vo.CallCenterActionVO;


/**
 * 콜센터실행 서비스
 *
 * @author in moon lee
 * @since 2016.05.17.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.05.17         in moon lee            최초 생성
 * </pre>
 */

public interface CallCenterActionService {

    /**
     * 조회 조건에 해당하는 콜센터실행 총 갯수를 조회한다.
     * @param searchVO
     * @return
     */
    int  selectCallCenterActionsByConditionCnt(CallCenterActionSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 콜센터실행 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VisitCustomerSearchVO
     * @return
     */
    List<CallCenterActionVO> selectCallCenterActionsByCondition(CallCenterActionSearchVO searchVO) throws Exception;

    /**
     * 콜센터실행 상세 정보를 조회한다.
     * @param CallCenterActionSearchVO - 콜번호
     * @return 콜센터실행 정보
     */
    CallCenterActionVO selectCallCenterActionByKey(CallCenterActionSearchVO searchVO) throws Exception;

    /**
     * 콜센터실행 정보를 수정한다.
     * @param CallCenterActionVO
     * @return 수정수량
     */
    int updateCallCenterAction(CallCenterActionVO callCenterActionVO) throws Exception;


    /**
     * 콜센터실행 에서 방문 예약 한다.
     * @param CallCenterActionVO
     * @return 예약 수량.
     */
    int updateCallCenterVsitResv(CallCenterActionVO callCenterActionVO) throws Exception;

}
