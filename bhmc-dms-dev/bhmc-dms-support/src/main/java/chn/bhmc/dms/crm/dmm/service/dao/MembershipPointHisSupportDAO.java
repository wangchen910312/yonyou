package chn.bhmc.dms.crm.dmm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.dmm.vo.MembershipPointHisSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipPointHisVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : membershipPointHisSupportDAO.java
 * @Description : 멤버십 포인트 이력 DAO
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

@Mapper("membershipPointHisSupportDAO")
public interface MembershipPointHisSupportDAO {

    /** support
     * 멤버십 일반 포인트이력을 등록한다.
     * @param membershipPointHisVO - 등록하는 일반 포인트 MembershipPointHisVO
     * @return
     */
    public String selectCallPoint(MembershipPointHisVO membershipPointHisVO) throws Exception;

    /** support
     * 멤버십 충전/사용 프로시저를 태운다.
     * @param membershipPointHisVO - 등록하는 충전 MembershipPointHisVO
     * @return
     */
    public String insertRechargeAmtProc(MembershipPointHisVO membershipPointHisVO) throws Exception;

    /**
     * 멤버십 충전금액에 대한 잔액을 조회한다. (멤버십 양도/양수 에서 사용)
     * @param membershipPointHisVO - 등록하는 포인트 MembershipPointHisVO
     * @return
     */
    public MembershipPointHisVO selectRealTotAmtInfoByKey(MembershipPointHisSearchVO membershipPointHisSearchVO) throws Exception;

    /** support
     * 타시스템에서 사용 : 멤버십 적립카드에 대한 카드별 가용금액을 조회한다.
     * @param membershipPointHisVO - 등록하는 포인트 MembershipPointHisVO
     * @return
     */
    public List<MembershipPointHisVO> selectRealTotAmtInfoCondition(MembershipPointHisSearchVO membershipPointHisSearchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 멤버십 포인트 이력 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipSearchVO
     * @return
     */
    public int selectPointHistorysByConditionCnt(MembershipPointHisSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 멤버십 포인트 이력 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipPointHisSearchVO
     * @return 조회 목록
     */
    public List<MembershipPointHisVO> selectPointHistorysByCondition(MembershipPointHisSearchVO searchVO) throws Exception;

    /**
     * 멤버십 포인트 이력 정보를 조회한다. ( 취소할대상 )
     * @param searchVO - 조회 조건을 포함하는 MembershipPointHisSearchVO
     * @return MembershipPointHisVO
     */
    public List<MembershipPointHisVO> selectPointCancelHistorysByKey(MembershipPointHisSearchVO searchVO) throws Exception;

}
