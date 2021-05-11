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

public interface CallCenterActionHistoryService {

    /**
     * 콜센터실행 히스토리를 등록한다..
     * @param CallCenterActionVO
     * @return 등록수량
     */
    int insertCallCenterActionHistory(CallCenterActionVO callCenterActionVO) throws Exception;

    /**
     * 조회 조건에 해당하는 콜센터실행 히스토리 총 갯수를 조회한다.
     * @param searchVO
     * @return
     */
    int  selectCallCenterActionHistorysByConditionCnt(CallCenterActionSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 콜센터실행 히스토리 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VisitCustomerSearchVO
     * @return
     */
    List<CallCenterActionVO> selectCallCenterActionHistorysByCondition(CallCenterActionSearchVO searchVO) throws Exception;


}
