package chn.bhmc.dms.crm.dmm.service;

import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfBaseVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfCalcAcceptVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfConsAndCopnRapVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfConsumeListRapVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfConsumeRapVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfCouponRapVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfInfoRapVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfParamVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfPaymentRapVO;

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

public interface BlueMembershipInterfaceService {


    /**
     * 블루멤버십 가입2. (인터페이스)
     * 딜러 One Click회원 가입 (딜러에서 차량을 구매하고 가입하는 경우, 보통 버튼 Click한번으로 가입이 되므려 OneClick회원가입이라 한다.)
     * @param paramVO - 등록할 정보가 담긴 BlueMembershipIfParamVO
     * @return BlueMembershipIfInfoRapVO
     */
    public BlueMembershipIfInfoRapVO insertCreateMembership(BlueMembershipIfParamVO paramVO) throws Exception;

    /**
     * 블루멤버십 회원 포인트 조회 (인터페이스)
     * @param BlueMembershipIfParamVO - 등록할 정보가 담긴 BlueMembershipIfParamVO
     * @return MemberUserintegralInfoVO
     */
    public BlueMembershipIfInfoRapVO selectMemberUserIntegralInfo(BlueMembershipIfParamVO paramVO) throws Exception;

    /**
     * 블루멤버십 가입신청 정보를 조회한다. (인터페이스)
     * @param paramVO - 검색할 정보가 담긴 BlueMembershipIfParamVO
     * @return BlueMembershipIfInfoRapVO
     */
    public BlueMembershipIfInfoRapVO selectBlueMembershipByIdentityNumber(BlueMembershipIfParamVO paramVO) throws Exception;

    /**
     * 블루멤버십 인증대기목록
     * @param paramVO - 등록할 정보가 담긴 BlueMembershipIfParamVO
     * @return BlueMembershipIfCouponRapVO
     */
    public BlueMembershipIfPaymentRapVO selectPaymentAccessPoints(BlueMembershipIfParamVO paramVO) throws Exception;

    /**
     * 블루멤버십 가입3. (인터페이스)
     * 딜러인증심사(고객이 APP, 홈페이지에서 가입을 하고 온 경우)
     * @param paramVO - 등록할 정보가 담긴 BlueMembershipIfParamVO
     * @return BlueMembershipIfInfoRapVO
     */
    public BlueMembershipIfInfoRapVO insertMembershipApproval(BlueMembershipIfParamVO paramVO) throws Exception;

    /**
     * 블루멤버십 포인트소비 신규 (인터페이스)
     * @param paramVO - 조회할 정보가 담긴 BlueMembershipIfParamVO
     * @return BlueMembershipIfConsumeRapVO
     */
    public BlueMembershipIfConsumeRapVO insertAddMembersConsume(BlueMembershipIfParamVO paramVO) throws Exception;

    /**
     * 블루멤버십 BM 회원 포인트 명세 (인터페이스)
     * @param paramVO - 조회할 정보가 담긴 BlueMembershipIfParamVO
     * @return AddORConsumeintegralVO
     */
    public BlueMembershipIfConsumeListRapVO selectAddORConsumeintegral(BlueMembershipIfParamVO paramVO) throws Exception;

    /**
     * 블루멤버십 쿠폰 사용 여부 조회 (인터페이스)
     * @param paramVO - 등록할 정보가 담긴 BlueMembershipIfParamVO
     * @return BlueMembershipIfCouponRapVO
     */
    public BlueMembershipIfCouponRapVO selectCustomCardCodeInfoByDMSInfo(BlueMembershipIfParamVO paramVO) throws Exception;

    /**
     * 블루멤버십 쿠폰 사용 (인터페이스)
     * @param paramVO - 등록할 정보가 담긴 BlueMembershipIfParamVO
     * @return BlueMembershipIfCouponRapVO
     */
    public BlueMembershipIfCouponRapVO updateUserAwardCustomCardInfo(BlueMembershipIfParamVO paramVO) throws Exception;

    /**
     * 블루멤버십 정산수용여부  (인터페이스)
     * @param paramVO - 딜러 정산 목록 및 정산수용여부
     * @return BlueMembershipIfCouponRapVO
     */
    public BlueMembershipIfBaseVO updateCalcAcceptInfo(BlueMembershipIfCalcAcceptVO paramVO) throws Exception;

    /**
     * 블루멤버십 IF LOG 쌓는다
     * @param paramVO - dlrCd, bmIfParam, bmIfReturn
     */
    public void insertBlueMembershipInterfaceLog(String aa, String bb, String cc) throws Exception;

    /**
     * 블루 멤버십 쿠폰+포인트 사용 - CRM512
     * @param paramVO - 등록할 정보가 담긴 BlueMembershipIfParamVO
     * @return BlueMembershipIfCouponRapVO
     */
    public BlueMembershipIfConsAndCopnRapVO updateUseCardAndAddConsume(BlueMembershipIfParamVO paramVO) throws Exception;

}
