package chn.bhmc.dms.par.cpm.service;

import chn.bhmc.dms.cmm.cmp.vo.DealerVO;
import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * 선수금 전송(인터페이스) 서비스
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

public interface AdvanceReceivedInfoSendService {

    /**
     * 선수금 전송 정보를 등록/수정/삭제
     * @param advanceReceivedInfoSendVO - 삭제할 정보가 담긴 AdvanceReceivedInfoSendVO
     * @return 등록/수정/삭제 목록 수
     */
    public void multiAdvanceReceivedInfoSend(BaseSaveVO<DealerVO> dealerVO) throws Exception;
}
