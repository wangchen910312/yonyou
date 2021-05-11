package chn.bhmc.dms.mob.api.part.service;

import chn.bhmc.dms.mob.api.part.vo.AdvanceReceivedInfoHeaderVO;



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

public interface PartAdvanceReceivedInfoHeaderService {

    /**
     * Key에 해당하는 선수금 헤더 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @return 조회한 선수금 헤더 정보
     */
    public AdvanceReceivedInfoHeaderVO selectAdvanceReceivedInfoHeaderByKey(String dlrCd) throws Exception;

    }
