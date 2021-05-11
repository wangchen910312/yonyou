package chn.bhmc.dms.par.cpm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.par.cpm.vo.AdvanceReceivedInfoDetailVO;
import chn.bhmc.dms.par.cpm.vo.AdvanceReceivedInfoSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AdvanceReceivedInfoDetailDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In Bo Shim
 * @since 2016. 5. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 23.     In Bo Shim     최초 생성
 * </pre>
 */
@Mapper("advanceReceivedInfoDetailDAO")
public interface AdvanceReceivedInfoDetailDAO {

    /**
     * 선수금 상세 정보를 등록한다.
     * @param leavItemVO 등록할 정보가 담긴 LeaveItemVO
     * @return 등록된 목록수
     */
    public int insertAdvanceReceivedInfoDetail(AdvanceReceivedInfoDetailVO advanceReceivedInfoDetailVO) throws Exception;

    /**
     * 선수금  상세 정보를 수정한다.
     * @param leavItemVO - 수정할 정보가 담긴 LeaveItemVO
     * @return 수정된 목록수
     */
    public int updateAdvanceReceivedInfoDetail(AdvanceReceivedInfoDetailVO advanceReceivedInfoDetailVO) throws Exception;

    /**
     * 선수금  상세 정보를 삭제한다.
     * @param leavItemVO - 삭제할 정보가 담긴 LeaveItemVO
     * @return 삭제된 목록수
     */
    public int deleteAdvanceReceivedInfoDetail(AdvanceReceivedInfoDetailVO advanceReceivedInfoDetailVO) throws Exception;

    /**
     * Key에 해당하는 선수금 상세 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @return 조회한 선수금 상세 정보
     */
    public AdvanceReceivedInfoDetailVO selectAdvanceReceivedInfoDetailByKey(@Param("dlrCd") String dlrCd) throws Exception;

    /**
     * 조회 조건에 해당하는 선수금 상세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AdvanceReceivedInfoSearchVO
     * @return 조회 목록
     */
    public List<AdvanceReceivedInfoDetailVO> selectAdvanceReceivedInfoDetailsByCondition(AdvanceReceivedInfoSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 선수금 상세 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AdvanceReceivedInfoSearchVO
     * @return 조회 목록 수
     */
    public int selectAdvanceReceivedInfoDetailsByConditionCnt(AdvanceReceivedInfoSearchVO searchVO) throws Exception;
}
