package chn.bhmc.dms.par.cpm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.par.cpm.vo.LeaveItemInterfaceSearchVO;
import chn.bhmc.dms.par.cpm.vo.LeaveItemInterfaceVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LeaveItemInterfaceDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In Bo Shim
 * @since 2016. 8. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 27.     In Bo Shim     최초 생성
 * </pre>
 */
@Mapper("leaveItemInterfaceDAO")
public interface LeaveItemInterfaceDAO {

    /**
     * 조회 조건에 해당하는 방치품  정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 LeaveItemInterfaceSearchVO
     * @return 조회 목록
     */
    public List<LeaveItemInterfaceVO> selectLeaveItemInterfacesByCondition(LeaveItemInterfaceSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 방치품  총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 LeaveItemSearchVO
     * @return 조회 목록 수
     */
    public int selectLeaveItemInterfacesByConditionCnt(LeaveItemInterfaceSearchVO searchVO);
}
