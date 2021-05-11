package chn.bhmc.dms.crm.dmm.service;

import java.util.List;

import chn.bhmc.dms.crm.dmm.vo.MembershipGradeHisSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipGradeHisVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipGradeHisService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim Hyun Ho
 * @since 2016. 4. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 29.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public interface MembershipGradeHisService {

    /**
     * 멤버십 등급변경시 변경 이력을 등록한다.
     * @param membershipGradeHisVO - MembershipGradeHisVO
     * @return
     */
    public int insertMembershipGradeHis(MembershipGradeHisVO membershipGradeHisVO) throws Exception;

    /**
     * 멤버십 등급이력 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipPointHisSearchVO
     * @return
     */
    public int selectMembershipGradeHissByConditionCnt(MembershipGradeHisSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 멤버십 등급이력 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipGradeHisSearchVO
     * @return 조회 목록
     */
    public List<MembershipGradeHisVO> selectMembershipGradeHissByCondition(MembershipGradeHisSearchVO searchVO) throws Exception;

}
