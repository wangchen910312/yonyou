package chn.bhmc.dms.crm.dmm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.dmm.vo.BlueMembershipSearchVO;

import chn.bhmc.dms.crm.dmm.vo.BlueMembershipJoinSearchVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipJoinVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BlueMembershipJoinDAO.java
 * @Description : 블루멤버십 가입신청 DAO
 * @author Kim Hyun Ho
 * @since 2016. 5. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 20.     Kim Hyun Ho     최초 생성
 * </pre>
 */

@Mapper("blueMembershipJoinDAO")
public interface BlueMembershipJoinDAO {

    /**
     * 조회 조건에 해당하는 블루멤버십 가입 총 인원수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BlueMembershipJoinSearchVO
     * @return
     */
    public int selectBlueMembershipJoinsByConditionCnt(BlueMembershipJoinSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 블루멤버십 가입정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BlueMembershipSearchVO
     * @return 조회 목록
     */
    public List<BlueMembershipJoinVO> selectBlueMembershipJoinsByCondition(BlueMembershipJoinSearchVO searchVO) throws Exception;

    /**
     * 블루멤버십 가입신청 정보를 등록한다.
     * @param blueMembershipJoinVO - 등록할 정보가 담긴 BlueMembershipJoinVO
     * @return 등록된 목록수
     */
    public int insertBlueMembershipJoin(BlueMembershipJoinVO blueMembershipJoinVO) throws Exception;

    /**
     * 블루멤버십 가입신청 정보를 등록한다.
     * @param blueMembershipJoinVO - 등록할 정보가 담긴 BlueMembershipJoinVO
     * @return 등록된 목록수
     */
    public int insertCreateMembership(BlueMembershipJoinVO blueMembershipJoinVO) throws Exception;

    /**
     * 블루멤버십 주소 정보를 수정한다.
     * @param blueMembershipJoinVO - 수정할 정보가 담긴 BlueMembershipJoinVO
     * @return 수정된 목록수
     */
    public int updateBlueMembershipJoinAddr(BlueMembershipJoinVO blueMembershipJoinVO) throws Exception;

    /**
     * 조회 조건에 해당하는 블루멤버십 가입정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BlueMembershipJoinSearchVO
     * @return BlueMembershipJoinVO
     */
    public BlueMembershipJoinVO selectBlueMembershipJoinByKey(BlueMembershipJoinSearchVO searchVO) throws Exception;


    /**
     * 블루멤버십 가입신청 정보를 수정한다.
     * @param blueMembershipJoinVO - 수정할 정보가 담긴 BlueMembershipJoinVO
     * @return 수정된 목록수
     */
    public int updateBlueMembershipApprove(BlueMembershipJoinVO blueMembershipJoinVO) throws Exception;



    /**
     * 블루멤버십 가입현황 Count
     * @param BlueMembershipSearchVO - 조회 조건을 포함하는 BlueMembershipSearchVO
     * @return int
     */
    public int selectBlueMembershipByConditionCnt(BlueMembershipSearchVO search) throws Exception;

    /**
     * 블루멤버십 가입현황
     * @param BlueMembershipSearchVO - 조회 조건을 포함하는 BlueMembershipSearchVO
     * @return List BlueMembershipJoinVO
     */
    public List<BlueMembershipJoinVO> selectBlueMembershipByCondition(BlueMembershipSearchVO search) throws Exception;
}
