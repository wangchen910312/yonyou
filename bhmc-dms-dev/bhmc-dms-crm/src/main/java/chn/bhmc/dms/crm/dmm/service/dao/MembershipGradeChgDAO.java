package chn.bhmc.dms.crm.dmm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.dmm.vo.MembershipGradeChgSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipGradeChgVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipGradeChgDAO.java
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

@Mapper("membershipGradeChgDAO")
public interface MembershipGradeChgDAO {

    /**
     * 조회 조건에 해당하는 멤버십 등급변경정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipGradeChgSearchVO
     * @return 조회 목록
     */
    public List<MembershipGradeChgVO> selectMasterGradeSeqByCondition(MembershipGradeChgSearchVO searchVO) throws Exception;

}
