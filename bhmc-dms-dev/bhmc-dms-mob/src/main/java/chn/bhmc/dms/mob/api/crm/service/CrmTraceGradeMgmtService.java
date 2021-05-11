package chn.bhmc.dms.mob.api.crm.service;

import java.util.List;

import chn.bhmc.dms.mob.api.crm.vo.TraceGradeMgmtSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.TraceGradeMgmtVO;

/**
 * <pre>
 * 추적 등급별 다음 추적일 설정 서비스
 * </pre>
 *
 * @ClassName   : TraceGradeMgmtService.java
 * @Description : TraceGradeMgmtService
 * @author Jin Choi
 * @since 2017. 2. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 6.     Jin Choi     최초 생성
 * </pre>
 */

public interface CrmTraceGradeMgmtService {
    /**
     * 추적 등급별 다음 추적일 설정 관리 총 갯수를 조회한다.
     *
     * @param TraceGradeMgmtSearchVO
     * @return int
     */
    public int selectTraceGradeMgmtsByCnt(TraceGradeMgmtSearchVO searchVO)throws Exception;

    /**
     * 추적 등급별 다음 추적일 설정 관리 정보를 조회한다.
     *
     * @param TraceGradeMgmtSearchVO
     * @return List<TraceGradeMgmtVO> 조회 목록
     */
    public List<TraceGradeMgmtVO> selectTraceGradeMgmts(TraceGradeMgmtSearchVO searchVO) throws Exception;


}
