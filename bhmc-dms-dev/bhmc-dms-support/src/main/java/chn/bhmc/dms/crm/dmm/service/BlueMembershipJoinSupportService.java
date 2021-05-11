package chn.bhmc.dms.crm.dmm.service;

import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfConsAndCopnRapVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfConsumeRapVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfCouponRapVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfInfoRapVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipJoinVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BlueMembershipJoinSupportService.java
 * @Description : 블루멤버십 가입 interface
 * @author Lee In Moon
 * @since 2016.09.03.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.09.03.     Lee In Moon     최초 생성
 * </pre>
 */

public interface BlueMembershipJoinSupportService {

    /**
     * 타시스템에서 사용 : 블루멤버십 회원포인트 정보를 조회한다.
     * @param BlueMembershipJoinVO - 수정할 정보가 담긴 BlueMembershipJoinVO
     * @return 조회된 정보
     */
    public BlueMembershipIfInfoRapVO selectMemberUserIntegralInfo(BlueMembershipJoinVO blueMembershipJoinVO) throws Exception;

    /**
     * 타시스템에서 사용 : 블루멤버십 포인트 적립&사용한다.(블루멤버십 포인트 소비 신규)
     * @param blueMembershipJoinVO - 등록할 정보가 담긴 BlueMembershipJoinVO
     * @return 등록된 목록수
     */
    public BlueMembershipIfConsumeRapVO insertAddMembersConsume(BlueMembershipJoinVO joinVO) throws Exception;


    /**
     * 타시스템에서 사용 : 블루멤버십 쿠폰 사용 여부 조회.
     * @param blueMembershipJoinVO - 등록할 정보가 담긴 BlueMembershipJoinVO
     * @return 등록된 목록수
     */
    public BlueMembershipIfCouponRapVO selectCustomCardCodeInfoByDMSInfo(BlueMembershipJoinVO joinVO) throws Exception;


    /**
     * 타시스템에서 사용 : 블루멤버십 쿠폰 사용
     * @param blueMembershipJoinVO - 등록할 정보가 담긴 BlueMembershipJoinVO
     * @return 등록된 목록수
     */
    public BlueMembershipIfCouponRapVO updateUserAwardCustomCardInfo(BlueMembershipJoinVO joinVO) throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     */
    public boolean updateBlueMembershipInfoSync() throws Exception;

    /**
     * 블루 멤버십 쿠폰+포인트 사용 - CRM512
     * @param paramVO - 등록할 정보가 담긴 BlueMembershipJoinVO
     * @return BlueMembershipIfConsAndCopnRapVO
     */
    public BlueMembershipIfConsAndCopnRapVO updateUseCardAndAddConsume(BlueMembershipJoinVO joinVO) throws Exception;


}
