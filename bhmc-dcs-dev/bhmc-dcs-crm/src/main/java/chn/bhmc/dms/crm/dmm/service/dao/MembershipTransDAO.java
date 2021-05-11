package chn.bhmc.dms.crm.dmm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.dmm.vo.MembershipTransSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipTransVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipTransDAO.java
 * @Description : 멤버십 양도/양수 DAO
 * @author Kim Hyun Ho
 * @since 2016. 5. 2.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 2.     Kim Hyun Ho     최초 생성
 * </pre>
 */

@Mapper("membershipTransDAO")
public interface MembershipTransDAO {
    /**
     * 멤버쉽 양도/양수 정보를 등록한다.
     * @param membershipTransVO - 등록할 정보가 담긴 MembershipTransVO
     * @return 등록된 목록수
     */
    public int insertMembershipTrans(MembershipTransVO memberahipTransVO) throws Exception;

    /**
     * 조회 조건에 해당하는 멤버십 양도관리 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipTransSearchVO
     * @return
     */
    public int selectMembershipTransMngsByConditionCnt(MembershipTransSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 멤버십 양도관리 목록데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipTransSearchVO
     * @return 조회 목록
     */
    public List<MembershipTransVO> selectMembershipTransMngsByCondition(MembershipTransSearchVO searchVO) throws Exception;

    /**
     * 멤버십 양도에서 양도신청 포인트 정보를 수정한다.
     * @param membershipTransVO - 등록할 정보가 담긴 MembershipTransVO
     * @return 수정된 수
     */
    public int updateMembershipTransPointVal(MembershipTransVO transVO) throws Exception;

    /**
     * 조회 조건에 해당하는 멤버십 양도관리 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipTransSearchVO
     * @return 조회 목록
     */
    public MembershipTransVO selectMembershipTransMngByKey(MembershipTransSearchVO searchVO) throws Exception;
}
