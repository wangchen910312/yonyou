package chn.bhmc.dms.crm.dmm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.crm.dmm.vo.MembershipCardSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipCardVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipCardDAO.java
 * @Description : 멤버십 카드관리 DAO
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

@Mapper("membershipCardDAO")
public interface MembershipCardDAO {

    /**
     * 멤버쉽 카드 정보를 등록한다.
     * @param membershipCardVO - 등록할 정보가 담긴 MembershipCardVO
     * @return 등록된 목록수
     */
    public int insertMembershipCard(MembershipCardVO memberahipCardVO) throws Exception;

    /**
     * 조회 조건에 해당하는 멤버십 카드정보 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipCardSearchVO
     * @return
     */
    public int selectMembershipCardsByConditionCnt(MembershipCardSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 멤버십 카드정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipCardSearchVO
     * @return 조회 목록
     */
    public List<MembershipCardVO> selectMembershipCardsByCondition(MembershipCardSearchVO searchVO) throws Exception;

    /**
     * 멤버십 카드 정보를 수정한다.
     * @param memberahipCardVO - 수정할 정보가 담긴 MembershipCardVO
     * @return 수정된 목록수
     */
    public int updateMembershipCard(MembershipCardVO memberahipCardVO) throws Exception;

    /**
     * 멤버십 카드 정보를 삭제한다.
     * @param memberahipCardVO - 삭제할 정보가 담긴 MembershipCardVO
     * @return 삭제된 목록수
     */
    public int deleteMembershipCard(MembershipCardVO memberahipCardVO) throws Exception;

    /**
     * Key에 해당하는 멤버십카드 정보를 조회한다.
     * @param mesgKey - 메세지키
     * @return 조회한 멤버십카드 정보
     */
    public MembershipCardVO selectMembershipCardByKey(@Param("dlrCd") String dlrCd, @Param("cardTpCd") String cardTpCd, @Param("cardNo") String cardNo);

    /**
     * 미사용 포인트 카드 목록 총 갯수를 조회한다.
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


}
