package chn.bhmc.dms.crm.dmm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.dmm.vo.MembershipGradeMngSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipGradeMngVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipGradeMngDAO.java
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

@Mapper("membershipGradeMngDAO")
public interface MembershipGradeMngDAO {

    /**
     * 멤버십 등급정보를 등록한다.
     * @param membershipGradeMngVO - 등록할 정보가 담긴 MembershipGradeMngVO
     * @return 등록된 목록수
     */
    public int insertMembershipGradeMng(MembershipGradeMngVO membershipGradeMngVO) throws Exception;

    /**
     * 멤버십 등급정보를 수정한다.
     * @param membershipGradeMngVO - 수정할 정보가 담긴 MembershipGradeMngVO
     * @return 수정된 목록수
     */
    public int updateMembershipGradeMng(MembershipGradeMngVO membershipGradeMngVO) throws Exception;

    /**
     * 멤버십 기준최근을 수정한다.
     * @param membershipGradeMngVO - 수정할 정보가 담긴 MembershipGradeMngVO
     * @return 수정된 목록수
     */
    public int updateStdPridMonth(MembershipGradeMngVO membershipGradeMngVO) throws Exception;

    /**
     * 멤버십 등급정보를 삭제한다.
     * @param membershipGradeMngVO - 삭제할 정보가 담긴 MembershipGradeMngVO
     * @return 삭제된 목록수
     */
    public int deleteMembershipGradeMng(MembershipGradeMngVO membershipGradeMngVO) throws Exception;

    /**
     * 멤버십 등급정보의 기준최근을 조회한다.
     * @param membershipGradeMngVO - 조회할 정보가 담긴 MembershipGradeMngSearchVO
     * @return 조회된 정보
     */
    public String selectStdPridMonthByKey(MembershipGradeMngSearchVO membershipGradeMngSearchVO) throws Exception;


    /**
     * 멤버십 등급정보 DropDownList 를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipGradeMngSearchVO
     * @return 조회 목록
     */
    public List<MembershipGradeMngVO> selectGradeCodesByCondition(MembershipGradeMngSearchVO searchVO) throws Exception;

    /**
     * 멤버십 등급변경 인원을 추출한다.
     */
    public MembershipGradeMngVO callProcedures(MembershipGradeMngSearchVO searchVO);

    /**
     * 멤버십 등급 설정 상세정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipGradeMngSearchVO
     * @return
     */
    public MembershipGradeMngVO selectMembershipGradeMngByKey(MembershipGradeMngSearchVO searchVO) throws Exception;

    /**
     * 멤버십 등급 사용(가입) 여부
     *
     * @param searchVO
     * @return
     */
    public int selectMembershipGradeJoinCnt(MembershipGradeMngSearchVO searchVO) throws Exception;
}
