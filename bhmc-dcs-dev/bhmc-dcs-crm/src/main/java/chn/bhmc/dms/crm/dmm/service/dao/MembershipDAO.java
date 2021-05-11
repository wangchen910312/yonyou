package chn.bhmc.dms.crm.dmm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.dmm.vo.MembershipGradeChgVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim Hyun Ho
 * @since 2016. 3. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 22.     Kim Hyun Ho     최초 생성
 * </pre>
 */

@Mapper("membershipDAO")
public interface MembershipDAO {

    /**
     * 멤버쉽  정보를 등록한다.
     * @param membershipVO - 등록할 정보가 담긴 MembershipVO
     * @return 등록된 목록수
     */
    public int insertMembership(MembershipVO memberahipVO) throws Exception;

    /**
     * 멤버쉽  정보를 수정한다.
     * @param membershipVO - 수정할 정보가 담긴 MembershipVO
     * @return 수정된 목록수
     */
    public int updateMembership(MembershipVO memberahipVO) throws Exception;

    /**
     * 조회 조건에 해당하는 멤버십 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipSearchVO
     * @return
     */
    public int selectMembershipsByConditionCnt(MembershipSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 멤버십 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipSearchVO
     * @return 조회 목록
     */
    public List<MembershipVO> selectMembershipsByCondition(MembershipSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 멤버십 팝업 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipSearchVO
     * @return
     */
    public int selectMembershipsPopupByConditionCnt(MembershipSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 멤버십 팝업 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipSearchVO
     * @return 조회 목록
     */
    public List<MembershipVO> selectMembershipsPopupByCondition(MembershipSearchVO searchVO) throws Exception;


    /**
     * 멤버십 고객(custNo)/자동차(vinNo) 정보등록 여부를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipSearchVO
     * @return
     */
    public int selectMembershipJoinUserCnt(MembershipSearchVO searchVO) throws Exception;

    /**
     * 멤버십 등급 정보를 수정한다.
     * @param membershipGradeChgVO - 수정할 정보가 담긴 MembershipGradeChgVO
     * @return 수정된 목록수
     */
    public int updateMembershipGradeChg(MembershipGradeChgVO membershipGradeChgVO) throws Exception;

    /**
     * 조회 조건에 해당하는 멤버십 기본정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipSearchVO
     * @return
     */
    public MembershipVO selectMembershipInfoByKey(MembershipSearchVO searchVO) throws Exception;

}
