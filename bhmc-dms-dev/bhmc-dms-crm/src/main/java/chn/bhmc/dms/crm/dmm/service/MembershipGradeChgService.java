package chn.bhmc.dms.crm.dmm.service;

import java.util.List;

import chn.bhmc.dms.crm.dmm.vo.MembershipGradeChgSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipGradeChgVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipGradeChgService.java
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

public interface MembershipGradeChgService {

    /**
     * 조회 조건에 해당하는 등급적용기준 코드 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipGradeChgSearchVO
     * @return 조회 목록
     */
    public List<MembershipGradeChgVO> selectMasterGradeSeqByCondition(MembershipGradeChgSearchVO searchVO) throws Exception;

}
