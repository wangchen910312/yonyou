package chn.bhmc.dms.crm.dmm.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipGradeMngSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipGradeMngVO;

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

public interface MembershipGradeMngService {

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
     * 멤버십 등급정보를 등록/수정/삭제 처리한다.
     * @param SurveySatisFactionVO
     */
    public void multiMembershipGradeMngs(BaseSaveVO<MembershipGradeMngVO> saveVO) throws Exception;

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

    public String selectNextMembershipGradeSeq() throws Exception;

    /**
     * 멤버십 등급정보의 기준최근을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipGradeMngSearchVO
     * @return
     */
    public String selectStdPridMonthByKey(MembershipGradeMngSearchVO searchVO) throws Exception;


    /**
     * 멤버십 등급정보 DropDownList 를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipGradeMngSearchVO
     * @return 조회 목록
     */
    public List<MembershipGradeMngVO> selectGradeCodesByCondition(MembershipGradeMngSearchVO searchVO) throws Exception;

    /**
     * 멤버십 등급변경 인원을 추출한다.
     * @param membershipGradeMngSearchVO - MembershipGradeMngSearchVO
     * @return
     */
    public MembershipGradeMngVO callProcedures(MembershipGradeMngSearchVO searchVO) throws Exception;
}
