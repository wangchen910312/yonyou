package chn.bhmc.dms.crm.dmm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.dmm.vo.MembershipPointExtSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipPointExtVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipPointExtDAO.java
 * @Description : 포인트 소멸 DAO.
 * @author Kim Hyun Ho
 * @since 2016. 5. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 10.     Kim Hyun Ho     최초 생성
 * </pre>
 */
@Mapper("membershipPointExtDAO")
public interface MembershipPointExtDAO {
    /**
     * 조회 조건에 해당하는 포인트 소멸예정정보 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipPointExtSearchVO
     * @return
     */
    public int selectMembershipPointExtsByConditionCnt(MembershipPointExtSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 포인트 소멸예정정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipPointExtSearchVO
     * @return 조회 목록
     */
    public List<MembershipPointExtVO> selectMembershipPointExtsByCondition(MembershipPointExtSearchVO searchVO) throws Exception;

    /**
     * SMS발신을 하고나서 발신여부에 Y로 update한다.
     * @param membershipPointExtVO - 조회 조건을 포함하는 MembershipPointExtVO
     * @return 조회 목록
     */
    public int updateMembershipPointExtSmsYn(MembershipPointExtVO membershipPointExtVO);

    /**
     * Group으로 묶어서 SMS발신을 하고나서 발신여부에 Y로 update한다.
     * @param membershipPointExtVO - 조회 조건을 포함하는 MembershipPointExtVO
     * @return 조회 목록
     */
    public int updateMembershipPointExtSmsYnGroup(MembershipPointExtVO membershipPointExtVO);
}
