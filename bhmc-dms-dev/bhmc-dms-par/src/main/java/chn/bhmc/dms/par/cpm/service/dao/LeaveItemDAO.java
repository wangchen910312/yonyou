package chn.bhmc.dms.par.cpm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.par.cpm.vo.LeaveItemSearchVO;
import chn.bhmc.dms.par.cpm.vo.LeaveItemVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LeaveItemDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In Bo Shim
 * @since 2016. 5. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 24.     In Bo Shim     최초 생성
 * </pre>
 */
@Mapper("leaveItemDAO")
public interface LeaveItemDAO {

    /**
     * 방치품  정보를 수정한다.
     * @param leaveItem - 수정할 정보가 담긴 LeaveItemVO
     * @return 수정된 목록수
     */
    public int updateLeaveItem(LeaveItemVO leaveItemVO);

    /**
     * 방치품  정보를 전체 수정한다.
     * @param leaveItem - 수정할 정보가 담긴 LeaveItemVO
     * @return 수정된 목록수
     */
    public int updateLeaveItemAll(LeaveItemVO leaveItemVO);

    /**
     * 방치품  정보를 삭제한다.
     * @param leaveItem - 삭제할 정보가 담긴 LeaveItemVO
     * @return 삭제된 목록수
     */
    public int deleteLeaveItem(LeaveItemVO leaveItemVO);

    /**
     * Key에 해당하는 방치품  정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param giDocNo - 출고문서번호
     * @return 조회한 방치품  정보
     */
    public LeaveItemVO selectLeaveItemByKey(@Param("dlrCd") String dlrCd, @Param("itemCd") String itemCd);

    /**
     * 조회 조건에 해당하는 방치품  정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 LeaveItemSearchVO
     * @return 조회 목록
     */
    public List<LeaveItemVO> selectLeaveItemsByCondition(LeaveItemSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 방치품  총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 LeaveItemSearchVO
     * @return 조회 목록 수
     */
    public int selectLeaveItemsByConditionCnt(LeaveItemSearchVO searchVO);
}
