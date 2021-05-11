package chn.bhmc.dms.mob.api.crm.service;

import java.util.List;

import chn.bhmc.dms.mob.api.crm.vo.SignLineSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.SignLineVO;

/**
 * 결재양식 관리 서비스 / Secured Resource Management Service
 *
 * @author Kang Seok Han
 * @since 2016. 1. 18.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *  수정일                                  수정자                                 수정내용
 *  (Modification Date)   Developer            Contents
 *  ----------------    ------------    ---------------------------
 *   2016.01.18         Kang Seok Han            최초 생성
 * </pre>
 */

public interface CrmSignService {

    /**
     * 조회 조건에 해당하는 결재상신 결재선 목록을 조회한다.
     * @param searchVO
     * @return
     */
    public List<SignLineVO> selectSignLinesByCondition(SignLineSearchVO searchVO)  throws Exception;
}
