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
 * @ClassName   : MembershipPointHisDAO.java
 * @Description : 멤버십 포인트 이력 DAO
 * @author Kim Hyun Ho
 * @since 2016. 4. 5.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 5.     Kim Hyun Ho     최초 생성
 * </pre>
 */

@Mapper("membershipPointHisDAO")
public interface MembershipPointHisDAO {

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
     * 조회 조건에 멤버십 포인트(가용포인트, 차감포인트, 적립포인트 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipPointHisSearchVO
     * @return 조회 목록
     */
    public List<MembershipPointHisVO> selectPointInfosCondition(MembershipPointHisSearchVO searchVO) throws Exception;

    /**
     * 멤버십 특별포인트이력을 등록한다.
     * @param membershipPointHisVO - 등록하는 특별 포인트 MembershipPointHisVO
     * @return
     */
    public int insertSpecialPoint(MembershipPointHisVO membershipPointHisVO) throws Exception;

    /**
     * 멤버십 충전이력을 등록한다.
     * @param membershipPointHisVO - 등록하는 특별 이력 MembershipPointHisVO
     * @return
     */
    public int insertRechargeAmt(MembershipPointHisVO membershipPointHisVO) throws Exception;

    /**
     * 멤버십 총 포인트점수를 조회한다
     * @param membershipPointHisVO - 조회하는 포인트 MembershipPointHisVO
     * @return
     */
    public int selectTotPointByKey(MembershipPointHisSearchVO searchVO) throws Exception;

    /**
     * 멤버십 일반 포인트이력을 등록한다.
     * @param membershipPointHisVO - 등록하는 일반 포인트 MembershipPointHisVO
     * @return
     */
    public void selectCallPoint(MembershipPointHisVO membershipPointHisVO) throws Exception;

    /**
     * 멤버십 포인트이력을 등록한다.(일반-증감,차감 포함)
     * @param membershipPointHisVO - 등록하는 포인트 MembershipPointHisVO
     * @return
     */
    public int updatePointProcedure(MembershipPointHisVO membershipPointHisVO) throws Exception;
}
