package chn.bhmc.dms.crm.dmm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.dmm.vo.MembershipGradeHisSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipGradeHisVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipGradeHisDAO.java
 * @Description : 멤버십 등급이력 DAO.
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
@Mapper("membershipGradeHisDAO")
public interface MembershipGradeHisDAO {

    /**
     * 멤버십 등급이력을 등록한다.
     * @param memberahipGradeHisVO - 등록할 정보가 담긴 MemberahipGradeHisVO
     * @return 등록된 목록수
     */
    public int insertMembershipGradeHis(MembershipGradeHisVO memberahipGradeHisVO) throws Exception;

    /**
     * 조회 조건에 해당하는 멤버십 등급 이력 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipGradeHisSearchVO
     * @return
     */
    public int selectMembershipGradeHissByConditionCnt(MembershipGradeHisSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 멤버십 등급 이력 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipGradeHisSearchVO
     * @return 조회 목록
     */
    public List<MembershipGradeHisVO> selectMembershipGradeHissByCondition(MembershipGradeHisSearchVO searchVO) throws Exception;


    /**
     * 조회 조건에 해당하는 멤버십 등급 변경 이력  정보 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipGradeHisSearchVO
     * @return
     */
    public int selectMembershipGradeChgHissByConditionCnt(MembershipGradeHisSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 멤버십 등급 변경 이력  정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipGradeHisSearchVO
     * @return 조회 목록
     */
    public List<MembershipGradeHisVO> selectMembershipGradeChgHissByCondition(MembershipGradeHisSearchVO searchVO) throws Exception;

}
