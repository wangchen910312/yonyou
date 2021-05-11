package chn.bhmc.dms.crm.dmm.service;

import chn.bhmc.dms.crm.dmm.vo.BlueMembershipJoinVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BlueMembershipJoinHistoryService.java
 * @Description : 블루멤버십 인증 히스토리 interface
 * @author Lee In Moon
 * @since 2016.09.28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.09.28.     Lee In Moon     최초 생성
 * </pre>
 */

public interface BlueMembershipJoinHistoryService {

    /**
     * 블루멤버십 인증 히스토리 입력
     *
     * @param joinVO
     */
    public int insertBlueMembershipJoinHistory(BlueMembershipJoinVO joinVO) throws Exception;

}
