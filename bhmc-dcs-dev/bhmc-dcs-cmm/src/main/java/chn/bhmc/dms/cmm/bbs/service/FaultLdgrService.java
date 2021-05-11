package chn.bhmc.dms.cmm.bbs.service;

import java.util.List;

import chn.bhmc.dms.cmm.bbs.vo.FaultLdgrSearchVO;
import chn.bhmc.dms.cmm.bbs.vo.FaultLdgrVO;

/**
 * 결함대장 관리 서비스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 29.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.29         Kang Seok Han            최초 생성
 * </pre>
 */

public interface FaultLdgrService {

    /**
     * 결함대장 정보를 등록한다.
     * @param faultLdgrVO - 등록할 정보가 담긴 FaultLdgrVO
     * @return 등록된 목록수
     */
    public int insertFaultLdgr(FaultLdgrVO faultLdgrVO) throws Exception;

    /**
     * 결함대장 정보를 수정한다.
     * @param faultLdgrVO - 수정할 정보가 담긴 FaultLdgrVO
     * @return 수정된 목록수
     */
    public int updateFaultLdgr(FaultLdgrVO faultLdgrVO) throws Exception;

    /**
     * 결함대장 정보를 삭제한다.
     * @param faultNo 결함번호
     * @return 삭제된 목록수
     */
    public int deleteFaultLdgr(int faultNo) throws Exception;

    /**
     * Key에 해당하는 결함대장 정보를 조회한다.
     * @param faultNo 결함번호
     * @return 조회한 결함대장
     */
    public FaultLdgrVO selectFaultLdgrByKey(int faultNo) throws Exception;

    /**
     * 조회 조건에 해당하는 결함대장 정보를 조회한다.
     * @param searchVO 조회 조건을 포함하는 FaultLdgrSearchVO
     * @return 조회 목록
     */
    public List<FaultLdgrVO> selectFaultLdgrsByCondition(FaultLdgrSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 결함대장 총 갯수를 조회한다.
     * @param searchVO 조회 조건을 포함하는 FaultLdgrSearchVO
     * @return
     */
    public int selectFaultLdgrsByConditionCnt(FaultLdgrSearchVO searchVO) throws Exception;
}
