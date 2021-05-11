package chn.bhmc.dms.crm.dmm.service;

import java.util.List;

import chn.bhmc.dms.crm.dmm.vo.MembershipPointHisSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipPointHisVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipPointHisSupportService.java
 * @Description : 멤버십 포인트 이력.
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

public interface MembershipPointHisSupportService {

    /**
     * 멤버십 포인트이력을 등록한다.(일반-증감,차감 포함)
     * @param membershipPointHisVO - 등록하는 포인트 MembershipPointHisVO
     * @return
     */
    public String selectCallPoint(MembershipPointHisVO membershipPointHisVO) throws Exception;

    /**
     * 멤버십 충전/사용 프로시저를 태운다.
     * @param membershipPointHisVO - 등록하는 충전 MembershipPointHisVO
     * @return
     */
    public String insertRechargeAmtProc(MembershipPointHisVO membershipPointHisVO) throws Exception;

    /**
     * 타시스템에서 사용 : 멤버십 충전금액에 대한 잔액을 조회한다.
     * @param membershipPointHisVO - 등록하는 포인트 MembershipPointHisVO
     * @return
     */
    public MembershipPointHisVO selectRealTotAmtInfoByKey(MembershipPointHisSearchVO membershipPointHisSearchVO) throws Exception;

    /**
     * 타시스템에서 사용 : 멤버십 적립카드에 대한 카드별 가용금액을 조회한다.
     * @param membershipPointHisVO - 등록하는 포인트 MembershipPointHisVO
     * @return
     */
    public List<MembershipPointHisVO> selectRealTotAmtInfoCondition(MembershipPointHisSearchVO membershipPointHisSearchVO) throws Exception;

    /**
     * 타시스템에서 사용 : 멤버십 포인트이력을 등록한다.(일반-증감,차감 포함)
     * @param membershipPointHisVO - 등록하는 포인트 MembershipPointHisVO
     * @return
     */
    public MembershipPointHisVO selectCallPointInterface(MembershipPointHisVO membershipPointHisVO) throws Exception;

    /**
     * 멤버십 포인트이력 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipPointHisSearchVO
     * @return
     */
    public int selectPointHistorysByConditionCnt(MembershipPointHisSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 멤버십 포인트 이력 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipSearchVO
     * @return 조회 목록
     */
    public List<MembershipPointHisVO> selectPointHistorysByCondition(MembershipPointHisSearchVO searchVO) throws Exception;

    /**
     * 포인트/선불카드 취소 ( 서비스에서 사용 )
     * @param MembershipPointHisSearchVO - sDlrCd / sRoDocNo
     * @return String [정상:00 / 나머지는 실패]
     */
    public MembershipPointHisVO cancelMembershipChargeInterface(MembershipPointHisSearchVO searchVO) throws Exception;

    /**
     * 멤버십 포인트 적립
     * @param searchVO - 조회 조건을 포함하는 MembershipSearchVO
     * @return 조회 목록
     */
    public MembershipPointHisVO selectCallPointSaveInterface(MembershipPointHisVO membershipPointHisVO) throws Exception;

}