package chn.bhmc.dms.mob.api.crm.service;

import chn.bhmc.dms.mob.api.crm.vo.SystemConfigInfoVO;

/**
 * 시스템설정정보 관리 서비스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 4.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.05         Kang Seok Han            최초 생성
 * </pre>
 */

public interface CrmSystemConfigInfoService {

    /**
     * Key에 해당하는 시스템설정 정보를 조회한다.
     * @param prefKey - 시스템 설정 정보 키
     * @return 조회한 시스템설정 정보
     */
    public SystemConfigInfoVO selectSystemConfigInfoByKey(String prefKey) throws Exception;

    /**
     * Key에 해당하는 시스템설정 정보를 문자열로 반환한다.
     * @param prefKey - 시스템 설정 정보 키
     * @return 조회한 시스템설정 정보를 문자열로 반환한다.
     */
    public String selectStrValueByKey(String prefKey) throws Exception;
}
