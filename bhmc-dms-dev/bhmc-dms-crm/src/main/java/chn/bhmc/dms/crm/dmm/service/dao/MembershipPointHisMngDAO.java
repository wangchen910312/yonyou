package chn.bhmc.dms.crm.dmm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.dmm.vo.MembershipPointHisMngSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipPointHisMngVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipPointHisMngDAO.java
 * @Description : 포인트 소멸이력 DAO
 * @author Kim Hyun Ho
 * @since 2016. 5. 28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 28.     Kim Hyun Ho     최초 생성
 * </pre>
 */

@Mapper("membershipPointHisMngDAO")
public interface MembershipPointHisMngDAO {

    /**
     * 포인트 소멸이력 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipPointHisMngSearchVO
     * @return
     */
    public int selectMembershipPointHisMngsByConditionCnt(MembershipPointHisMngSearchVO searchVO) throws Exception;

    /**
     * 포인트 소멸이력 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipPointHisMngSearchVO
     * @return 조회 목록
     */
    public List<MembershipPointHisMngVO> selectMembershipPointHisMngsByCondition(MembershipPointHisMngSearchVO searchVO) throws Exception;

    /**
     * 포인트 소멸이력 대상자 총 인원수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipPointHisMngSearchVO
     * @return
     */
    public int selectMembershipPointHisMngUsrsByConditionCnt(MembershipPointHisMngSearchVO searchVO) throws Exception;

    /**
     * 포인트 소멸이력 대상자 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipPointHisMngSearchVO
     * @return 조회 목록
     */
    public List<MembershipPointHisMngVO> selectMembershipPointHisMngUsrsByCondition(MembershipPointHisMngSearchVO searchVO) throws Exception;

}
