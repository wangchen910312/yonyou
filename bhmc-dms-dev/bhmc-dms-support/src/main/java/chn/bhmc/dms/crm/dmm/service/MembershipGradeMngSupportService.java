package chn.bhmc.dms.crm.dmm.service;

import java.util.List;

import chn.bhmc.dms.crm.dmm.vo.MembershipGradeMngSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipGradeMngVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipGradeMngService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim Hyun Ho
 * @since 2016. 4. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 18.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public interface MembershipGradeMngSupportService {

    /**
     * 멤버십 등급정보 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipGradeMngSearchVO
     * @return
     */
    public int selectMembershipGradeMngsByConditionCnt(MembershipGradeMngSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 멤버십 등급정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipGradeMngSearchVO
     * @return 조회 목록
     */
    public List<MembershipGradeMngVO> selectMembershipGradeMngsByCondition(MembershipGradeMngSearchVO searchVO) throws Exception;

    /**
     * 멤버십 등급별 적립계수를 구한다.
     * @param MembershipSearchVO - dlrCd, membershipNo
     * @return MembershipGradeMngVO
     */
    public MembershipGradeMngVO selectMembershipGradeInfoByKey(MembershipSearchVO searchVO) throws Exception;

}