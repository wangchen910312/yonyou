package chn.bhmc.dms.crm.dmm.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipGradeChgVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipService.java
 * @Description : 멤버십 서비스
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

public interface MembershipService {


    /**
     * 멤버십 고객 정보를 등록한다.
     * @param MembershipVO - 등록할 정보가 담긴 MembershipVO
     * @return 등록된 목록수
     */
    public int insertMembership(MembershipVO membershipVO) throws Exception;

    /**
     * 멤버십 고객 정보를 수정한다.
     * @param MembershipVO - 수정할 정보가 담긴 MembershipVO
     * @return 수정된 목록수
     */
    public int updateMembership(MembershipVO membershipVO) throws Exception;

    /**
     * 멤버십 고객정보 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipSearchVO
     * @return
     */
    public int selectMembershipsByConditionCnt(MembershipSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 멤버십 고객정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipSearchVO
     * @return 조회 목록
     */
    public List<MembershipVO> selectMembershipsByCondition(MembershipSearchVO searchVO) throws Exception;


    /**
     * 멤버십 정보 팝업 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipSearchVO
     * @return
     */
    public int selectMembershipsPopupByConditionCnt(MembershipSearchVO searchVO) throws Exception;

    /**
     * 멤버십 정보 팝업를 조회 한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipSearchVO
     * @return 조회 목록
     */
    public List<MembershipVO> selectMembershipsPopupByCondition(MembershipSearchVO searchVO) throws Exception;

    public String selectNextMembershipNo() throws Exception;

    /**
     * 멤버십 고객(custNo)/자동차(vinNo) 정보등록 여부를 조회한다.
     * @param MembershipSearchVO - 조회할 정보가 담긴 MembershipSearchVO
     * @return 조회된 카운터수
     */
    public int selectMembershipJoinUserCnt(MembershipSearchVO searchVO) throws Exception;


    /**
     * 멤버십 등급을 멀티수정 처리한다.
     * @param MembershipGardeChgVO
     */
    public void multiMembershipGrades(BaseSaveVO<MembershipGradeChgVO> membershipGardeChgVO) throws Exception;


    /**
     * 멤버십 등급을 수정 처리한다.
     * @param MembershipGardeChgVO
     */
    public int updateMembershipGradeChg(MembershipGradeChgVO membershipGradeChgVO) throws Exception;

    /**
     * 멤버십 기본정보를 조회한다.
     * @param MembershipSearchVO
     */
    public MembershipVO selectMembershipInfoByKey(MembershipSearchVO searchVO) throws Exception;

    /**
     * 멤버십 특별포인트 정보를 등록한다.
     * @param MembershipVO - 등록할 정보가 담긴 MembershipVO
     * @return 등록된 목록수
     */
    public int insertSpecialPoint(MembershipVO membershipVO) throws Exception;

}
