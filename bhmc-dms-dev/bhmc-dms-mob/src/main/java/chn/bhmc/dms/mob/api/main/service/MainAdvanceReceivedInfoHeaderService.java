package chn.bhmc.dms.mob.api.main.service;

import chn.bhmc.dms.mob.api.main.vo.AdvanceReceivedInfoHeaderVO;

/**
 * 선수금 헤더 서비스
 *
 * @author In Bo Shim
 * @since 2016. 5. 23.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 5. 23.     In Bo Shim      최초 생성
 * </pre>
 */

public interface MainAdvanceReceivedInfoHeaderService {

    public AdvanceReceivedInfoHeaderVO selectAdvanceReceivedInfoHeaderByKey(String dlrCd) throws Exception;

}
