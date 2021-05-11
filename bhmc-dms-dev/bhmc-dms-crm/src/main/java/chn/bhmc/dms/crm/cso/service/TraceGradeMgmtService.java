package chn.bhmc.dms.crm.cso.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.crm.cso.vo.TraceGradeMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.TraceGradeMgmtVO;

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

public interface TraceGradeMgmtService {

    /**
     * 추적일이 등록 된 목록수를 조회한다. (저장 시 insert/update 판단을 위함)
     *
     * @param TraceGradeMgmtSearchVO
     * @return int
     */
    public int selectTraceGradeAssigedMgmtsByCnt(TraceGradeMgmtSearchVO searchVO) throws Exception;

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

    /**
     * 추적 등급별 다음 추적일 정보를 등록한다.
     * @param TraceGradeMgmtVO
     * @return 등록된 목록수
     */
    public void multiTraceGrade(BaseSaveVO<TraceGradeMgmtVO> saveVO) throws Exception;

    /**
     * 다음 추적일을 삽입한다.
     * @param TraceGradeMgmtVO
     * @return 삽입 후 등록된 목록수
     */
    public int insertTraceGrade(TraceGradeMgmtVO traceGradeMgmtVO) throws Exception;

    /**
     * 다음 추적일을 수정한다.
     * @param TraceGradeMgmtVO
     * @return 수정된 목록수
     */
    public int updateTraceGrade(TraceGradeMgmtVO traceGradeMgmtVO) throws Exception;

}
