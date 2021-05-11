package chn.bhmc.dms.par.cpm.service;

import java.util.List;

import chn.bhmc.dms.par.cpm.vo.LeaveItemInterfaceSearchVO;
import chn.bhmc.dms.par.cpm.vo.LeaveItemInterfaceVO;
import chn.bhmc.dms.par.cpm.vo.LeaveItemVO;

/**
 * 방치품관리관리 서비스
 *
 * @author In Bo Shim
 * @since 2016. 8. 27.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 8. 27.     In Bo Shim      최초 생성
 * </pre>
 */

public interface LeaveItemInterfaceService {

    /**
     * 조회 조건에 해당하는 방치품관리  정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 LeaveItemInterfaceSearchVO
     * @return 조회 목록
     */
    public List<LeaveItemInterfaceVO> selectLeaveItemInterfacesByCondition(LeaveItemInterfaceSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 방치품관리  총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 LeaveItemInterfaceSearchVO
     * @return 조회 목록 수
     */
    public int selectLeaveItemInterfacesByConditionCnt(LeaveItemInterfaceSearchVO searchVO) throws Exception;

    /**
     * 방치품  정보를 BMP 전송한다.
     * @param leavItemVO - 전송할 정보가 담긴 LeaveItemVO
     * @return 방치품 전송 목록수
     */
    public void multiLeaveItemSend(List<LeaveItemVO> leaveItemVOList) throws Exception;
}
