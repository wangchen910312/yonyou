package chn.bhmc.dms.crm.dmm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.dmm.vo.MembershipGradeChgSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipGradeChgVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipGradeChgDAO.java
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

@Mapper("membershipGradeChgDAO")
public interface MembershipGradeChgDAO {

    /**
     * 멤버십 등급변경정보 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipGradeChgSearchVO
     * @return
     */
    public int selectMembershipGradeChgsByConditionCnt(MembershipGradeChgSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 멤버십 등급변경정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipGradeChgSearchVO
     * @return 조회 목록
     */
    public List<MembershipGradeChgVO> selectMembershipGradeChgsByCondition(MembershipGradeChgSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 멤버십 등급변경정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipGradeChgSearchVO
     * @return 조회 목록
     */
    public List<MembershipGradeChgVO> selectMasterGradeSeqByCondition(MembershipGradeChgSearchVO searchVO) throws Exception;

    /**
     * 멤버십 등급변경시 적용여부를 "Y"로 수정한다.
     * @param membershipGradeChgVO - MembershipGradeChgSearchVO
     * @return
     */
    public int updateApplyYn(MembershipGradeChgVO membershipGradeChgVO) throws Exception;

    /**
     * 멤버십 등급을 변경하는 프로시저를 호출한다.
     * @param membershipGradeChgVO - MembershipGradeChgVO
     * @return
     */
    public void selectMembershipGradeChgProcedure(MembershipGradeChgVO membershipGradeChgVO) throws Exception;

}
