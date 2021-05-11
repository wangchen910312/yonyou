package chn.bhmc.dms.mob.api.crm.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.mob.api.crm.vo.MembershipPointHisSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.MembershipPointHisVO;

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

@Mapper("CrmmembershipPointHisSupportDAO")
public interface CrmMembershipPointHisSupportDAO {

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

}
