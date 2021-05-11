package chn.bhmc.dms.crm.dmm.service;

import java.util.HashMap;
import java.util.List;

import chn.bhmc.dms.crm.dmm.vo.BlueMembershipSearchVO;

import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfConsumeListRapVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfInfoRapVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipJoinSearchVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipJoinVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BlueMembershipService.java
 * @Description : 블루멤버십 가입 interface
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

public interface BlueMembershipJoinService {

    /**
     * 조회 조건에 해당하는 블루멤버십 가입 총 인원수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BlueMembershipJoinSearchVO
     * @return
     */
    public int selectBlueMembershipJoinsByConditionCnt(BlueMembershipJoinSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 블루멤버십 가입정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BlueMembershipJoinSearchVO
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
     * 블루멤버십 주소 정보를 수정한다.
     * @param blueMembershipJoinVO - 수정할 정보가 담긴 BlueMembershipJoinVO
     * @return 수정된 목록수
     */
    public int updateBlueMembershipJoinAddr(BlueMembershipJoinVO blueMembershipJoinVO) throws Exception;

    /**
     * 블루멤버십 가입신청 정보를 조회한다.
     * @param searchVO - 검색할 정보가 담긴 BlueMembershipJoinSearchVO
     * @return BlueMembershipJoinVO
     */
    public BlueMembershipJoinVO selectBlueMembershipJoinByKey(BlueMembershipJoinSearchVO searchVO) throws Exception;


    /**
     * 블루멤버십 가입신청 정보를 수정한다.
     * @param BlueMembershipJoinVO - 수정할 정보가 담긴 BlueMembershipJoinVO
     * @return 수정된 목록수
     */
    public int updateBlueMembershipApprove(BlueMembershipJoinVO blueMembershipJoinVO) throws Exception;

    /**
     * 딜러 One Click회원 가입 (딜러에서 차량을 구매하고 가입하는 경우, 보통 버튼 Click한번으로 가입이 됨으로 OneClick회원가입이라 한다.)
     * @param blueMembershipJoinVO - 등록할 정보가 담긴 BlueMembershipJoinVO
     * @return 등록된 목록수
     */
    public HashMap<String, String> insertCreateMembership(BlueMembershipJoinVO joinVO) throws Exception;

    /**
     * 블루멤버십 가입 정보를 확인 및 출력한다.
     * @param BlueMembershipJoinVO - 수정할 정보가 담긴 BlueMembershipJoinVO
     * @return 조회된 정보
     */
    public BlueMembershipIfInfoRapVO selectBlueMembershipByIdentityNumber(BlueMembershipJoinVO blueMembershipJoinVO) throws Exception;


    /**
     * 블루멤버십 딜러 인증 심사( 고객이 APP, 홈페이지에서 가입을 하고 온 경우 ) 인터페이스
     * @param blueMembershipJoinVO - 등록할 정보가 담긴 BlueMembershipJoinVO
     * @return 등록된 목록수
     */
    public BlueMembershipIfInfoRapVO insertMembershipApproval(BlueMembershipJoinVO joinVO) throws Exception;

    /**
     * 블루멤버십 BM 회원 포인트 명세
     * @param blueMembershipJoinVO - 등록할 정보가 담긴 BlueMembershipJoinVO
     * @return 등록된 목록수
     */
    public BlueMembershipIfConsumeListRapVO blueMembershipIfConsumeList(BlueMembershipJoinVO joinVO) throws Exception;

    /**
     * 블루멤버십 가입 현황 수
     * @param blueMembershipJoinVO - 등록할 정보가 담긴 BlueMembershipJoinVO
     * @return 수량
     */
    public int selectBlueMembershipByConditionCnt(BlueMembershipSearchVO search) throws Exception;

    /**
     * 블루멤버십 가입 현황
     * @param blueMembershipJoinVO - 등록할 정보가 담긴 BlueMembershipJoinVO
     * @return 등록된 목록수
     */
    public List<BlueMembershipJoinVO> selectBlueMembershipByCondition(BlueMembershipSearchVO search) throws Exception;


}