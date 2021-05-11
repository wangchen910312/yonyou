package chn.bhmc.dms.mob.api.crm.service;

import chn.bhmc.dms.mob.api.crm.vo.DealerVO;

/**
 * 딜러 관리 서비스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 29.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.29         Kang Seok Han            최초 생성
 * </pre>
 */

public interface CrmDealerService {

    /**
     * Key에 해당하는 딜러 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @return 조회한 딜러 정보
     */
    public DealerVO selectDealerByKey(String dlrCd) throws Exception;
}
