package chn.bhmc.dms.bat.crm.dmm.service.dao;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.bat.crm.dmm.vo.BatMembershipGradeChgVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatMembershipGradeChgDAO.java
 * @Description : 클래스 설명을 기술합니다.
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
@Mapper("batMembershipGradeChgDAO")
public interface BatMembershipGradeChgDAO {

    /**
     * 맴버십 등급변경 예정 목록 추출을 하기 위한 프로시저 호출
     * @param saveVO - 조회 조건을 포함하는 BatMembershipGradeChgVO
     * @return
     *
     */
    public void selectCallMembershipGradeChg(BatMembershipGradeChgVO saveVO) throws Exception;

}
