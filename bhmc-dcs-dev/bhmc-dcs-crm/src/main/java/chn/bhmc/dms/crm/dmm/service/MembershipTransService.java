package chn.bhmc.dms.crm.dmm.service;

import java.util.List;

import chn.bhmc.dms.crm.dmm.vo.MembershipTransSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipTransVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipTransService.java
 * @Description : 멤버십 양도/양수 서비스
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

public interface MembershipTransService {
    /**
     * 멤버십 양도/양수 정보를 등록한다.
     * @param MembershipTransVO - 등록할 정보가 담긴 MembershipTransVO
     * @return 등록된 목록수
     */
    public int insertMembershipTrans(MembershipTransVO membershipTransVO) throws Exception;

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
     * @param membershipTransVO - 조회 조건을 포함하는 MembershipTransVO
     * @return
     */
    public int updateMembershipTransPointVal(MembershipTransVO transVO) throws Exception;

    /**
     * 멤버십 양도대기중 승인이 완료가 되면 양도신청 포인트를 조회후 포인트 등록한다음 총합산 금액 정보를 수정한다.
     * @param membershipTransVO - 조회 조건을 포함하는 MembershipTransVO
     * @return
     */
    public int insertTransPointProcedure(MembershipTransVO transVO) throws Exception;

    /**
     * 조회 조건에 해당하는 멤버십 양도관리 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipTransSearchVO
     * @return 조회 목록
     */
    public MembershipTransVO selectMembershipTransMngByKey(MembershipTransSearchVO searchVO) throws Exception;
}
