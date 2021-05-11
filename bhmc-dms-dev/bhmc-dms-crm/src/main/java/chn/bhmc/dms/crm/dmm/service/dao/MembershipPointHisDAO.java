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
     * 멤버십 특별포인트이력을 등록한다.
     * @param membershipPointHisVO - 등록하는 특별 포인트 MembershipPointHisVO
     * @return
     */
    public int insertSpecialPoint(MembershipPointHisVO membershipPointHisVO) throws Exception;

    /**
     * 멤버십 총 포인트점수를 조회한다
     * @param membershipPointHisVO - 조회하는 포인트 MembershipPointHisVO
     * @return
     */
    public int selectTotPointByKey(MembershipPointHisSearchVO searchVO) throws Exception;

    /**
     * 멤버십 포인트이력을 등록한다.(일반-증감,차감 포함)
     * @param membershipPointHisVO - 등록하는 포인트 MembershipPointHisVO
     * @return
     */
    public int updatePointProcedure(MembershipPointHisVO membershipPointHisVO) throws Exception;

    /**
     * 멤버십 포인트 소멸 대상 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipPointHisSearchVO
     * @return
     */
    public int selectMembershipPointExtsByConditionCnt(MembershipPointHisSearchVO searchVO) throws Exception;

    /**
     * 멤버십 포인트 소멸 대상 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipPointHisSearchVO
     * @return 조회 목록
     */
    public List<MembershipPointHisVO> selectMembershipPointExtsByCondition(MembershipPointHisSearchVO searchVO) throws Exception;

    /**
     * 멤버십 포인트 소멸 대상 목록 요약정보를 구한다
     * @param searchVO - 조회 조건을 포함하는 MembershipPointHisSearchVO
     * @return 포인트 소멸 대상 정보
     */
    public MembershipPointHisVO selectMembershipPointExtTotalCnt(MembershipPointHisSearchVO searchVO) throws Exception;

}
