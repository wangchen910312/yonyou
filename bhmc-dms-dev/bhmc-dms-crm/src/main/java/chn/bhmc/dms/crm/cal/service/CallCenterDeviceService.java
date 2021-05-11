package chn.bhmc.dms.crm.cal.service;

import chn.bhmc.dms.crm.cal.vo.CallCenterDeviceSearchVO;
import chn.bhmc.dms.crm.cal.vo.CallCenterDeviceVO;


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

public interface CallCenterDeviceService {

    /**
     * 조회 조건에 해당하는 콜센터실행 총 갯수를 조회한다.
     * @param searchVO
     * @return
     */
    int insertCallCenterHistory(CallCenterDeviceVO callCenterDeviceVO) throws Exception;

    /**
     * 콜센터실행 히스토리 정보를 조회한다.
     * @param CallCenterDeviceSearchVO - DLR_CD, CALL_HIS_SEQ
     * @return
     */
    public CallCenterDeviceVO selectCallCenterDeviceByKey(CallCenterDeviceSearchVO searchVO) throws Exception;


}
