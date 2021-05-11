package chn.bhmc.dms.bat.crm.dmm.service;

import chn.bhmc.dms.bat.crm.dmm.vo.BatMembershipGradeChgVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatMembershipGradeChgService.java
 * @Description : 맴버십 등급변경 예정 추출 서비스
 * @author Kim Hyun Ho
 * @since 2016. 8. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 12.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public interface BatMembershipGradeChgService {
    /**
     * 맴버십 등급변경 예정 목록 추출을 하기 위한 프로시저 호출
     * @param searchVO - 조회 조건을 포함하는 BatMembershipGradeChgSearchVO
     * @return
     *
     */
    public void selectCallMembershipGradeChg(BatMembershipGradeChgVO saveVO) throws Exception;
}
