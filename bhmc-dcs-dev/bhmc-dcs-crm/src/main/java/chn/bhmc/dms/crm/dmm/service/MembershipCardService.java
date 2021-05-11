package chn.bhmc.dms.crm.dmm.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipCardSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipCardVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipCardService.java
 * @Description : 멤버십 카드관리 서비스
 * @author Kim Hyun Ho
 * @since 2016. 4. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 6.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public interface MembershipCardService {


    /**
     * 멤버십 카드정보 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipCardSearchVO
     * @return
     */
    public int selectMembershipsByConditionCnt(MembershipCardSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 멤버십 카드정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipCardSearchVO
     * @return 조회 목록
     */
    public List<MembershipCardVO> selectMembershipsByCondition(MembershipCardSearchVO searchVO) throws Exception;

    /**
     * 멤버십 카드 정보를 등록/수정/삭제 처리한다.
     * @param SurveySatisFactionVO
     */
    public void multiMembershipCards(BaseSaveVO<MembershipCardVO> membershipCardVO) throws Exception;

    /**
     * 멤버십 카드 정보를 등록한다.
     * @param membershipCardVO - 등록할 정보가 담긴 MembershipCardVO
     * @return 등록된 목록수
     */
    public int insertMembershipCard(MembershipCardVO membershipCardVO) throws Exception;

    /**
     * 멤버십 카드 정보를 수정한다.
     * @param membershipCardVO - 수정할 정보가 담긴 MembershipCardVO
     * @return 수정된 목록수
     */
    public int updateMembershipCard(MembershipCardVO membershipCardVO) throws Exception;

    /**
     * 멤버십 카드 정보를 삭제한다.
     * @param membershipCardVO - 삭제할 정보가 담긴 MembershipCardVO
     * @return 삭제된 목록수
     */
    public int deleteMembershipCard(MembershipCardVO membershipCardVO) throws Exception;

    /**
     * Key에 해당하는 멤버십카드 정보를 조회한다.
     * @param mesgKey - 메세지키
     * @return 조회한 멤버십카드 정보
     */
    public MembershipCardVO selectMembershipCardByKey(String dlrCd, String cardTpCd ,String cardNo) throws Exception;

    /**
     * 멤버십카드 일괄등록 처리를 수행한다.
     *
     * @param list
     * @throws Exception
     */
    public void insertMembershipCardSave(List<MembershipCardVO> list) throws Exception;

    /**
     *미사용 포인트 카드 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipCardSearchVO
     * @return
     */
    public int selectMembershipCardPopupsByConditionCnt(MembershipCardSearchVO searchVO) throws Exception;

    /**
     * 미사용 포인트 카드 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipCardSearchVO
     * @return 조회 목록
     */
    public List<MembershipCardVO> selectMembershipCardPopupsByCondition(MembershipCardSearchVO searchVO) throws Exception;

    /**
     * 미사용 포인트/충전 카드 목록에서 한건만을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipCardSearchVO
     * @return 조회 목록
     */
    public MembershipCardVO selectMembershipCardOnesByCondition(MembershipCardSearchVO searchVO) throws Exception;

}
