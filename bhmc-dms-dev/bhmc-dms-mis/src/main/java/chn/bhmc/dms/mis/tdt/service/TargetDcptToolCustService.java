package chn.bhmc.dms.mis.tdt.service;

import java.util.List;

import chn.bhmc.dms.mis.tdt.vo.TargetDcptToolCustVO;

/**
 * <pre>
 * [딜러사] 목표분해도구(집객)
 * </pre>
 *
 * @ClassName   : TargetDcptToolCustService.java
 * @Description : [딜러사] 목표분해도구(집객)
 * @author chibeom.song
 * @since 2016. 7. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 22.   chibeom.song     최초 생성
 * </pre>
 */

public interface TargetDcptToolCustService {

    /**
     * 조회 조건에 해당하는 년간 목표 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetYearRegSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptToolCustVO> selectTargetDcptToolCustGoal(TargetDcptToolCustVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 년간 목표 정보 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetYearRegSearchVO
     * @return
     */
    public int selectTargetDcptToolCustGoalCnt(TargetDcptToolCustVO searchVO) throws Exception;

}
