package chn.bhmc.dms.mob.api.crm.service;

import chn.bhmc.dms.mob.api.crm.vo.BlueMembershipIfConsumeListRapVO;
import chn.bhmc.dms.mob.api.crm.vo.BlueMembershipIfParamVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BlueMembershipInterfaceService.java
 * @Description : 블루멤버십 인터페이스
 * @author Kim Hyun Ho
 * @since 2016. 7. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 25.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public interface CrmBlueMembershipInterfaceService {


    /**
     * 블루멤버십 BM 회원 포인트 명세 (인터페이스)
     * @param paramVO - 조회할 정보가 담긴 BlueMembershipIfParamVO
     * @return AddORConsumeintegralVO
     */
    public BlueMembershipIfConsumeListRapVO selectAddORConsumeintegral(BlueMembershipIfParamVO paramVO) throws Exception;

}
