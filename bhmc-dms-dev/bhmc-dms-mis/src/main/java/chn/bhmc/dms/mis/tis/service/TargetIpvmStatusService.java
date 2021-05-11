package chn.bhmc.dms.mis.tis.service;

import java.util.List;

import chn.bhmc.dms.mis.tis.vo.TargetIpvmStatusSearchVO;
import chn.bhmc.dms.mis.tis.vo.TargetIpvmStatusVO;
/**
 * <pre>
 * [딜러사] 목표 개선 현황
 * </pre>
 *
 * @ClassName   : TargetIpvmStatusService.java
 * @Description : [딜러사] 목표 개선 현황
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

public interface TargetIpvmStatusService {

    /**
     * 조회 조건에 해당하는 [딜러사] 목표 개선 현황 총 갯수를 조회한다.
     * @param searchVO 조회 조건을 포함하는 TargetIpvmStatusSearchVO
     * @return
     */
    public int selectTargetIpvmStatusByConditionCnt(TargetIpvmStatusSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 [딜러사] 목표 개선 현황 총 갯수를 조회한다.
     * @param searchVO 조회 조건을 포함하는 TargetIpvmStatusSearchVO
     * @return 조회 목록
     */
    public List<TargetIpvmStatusVO> selectTargetIpvmStatusByCondition(TargetIpvmStatusSearchVO searchVO) throws Exception;

    int insertTargetIpvmStatus(TargetIpvmStatusVO targetIpvmStatusVO) throws Exception;

    TargetIpvmStatusVO selectTargetIpvmStatusByKey(TargetIpvmStatusSearchVO searchVO) throws Exception;

}
