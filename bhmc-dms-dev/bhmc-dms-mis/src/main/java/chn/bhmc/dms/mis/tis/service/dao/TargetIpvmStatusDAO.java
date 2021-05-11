package chn.bhmc.dms.mis.tis.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.mis.tis.vo.TargetIpvmStatusSearchVO;
import chn.bhmc.dms.mis.tis.vo.TargetIpvmStatusVO;

/**
 * <pre>
 * [딜러사] 목표 개선 현황
 * </pre>
 *
 * @ClassName   : TargetIpvmStatusDAO.java
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
@Mapper("targetIpvmStatusDAO")
public interface TargetIpvmStatusDAO {

    /**
     * 조회 조건에 해당하는 이슈정보 정보를 조회한다.
     * @param searchVO 조회 조건을 포함하는 IssueBoardSearchVO
     * @return 조회 목록
     */
    public List<TargetIpvmStatusVO> selectTargetIpvmStatusByCondition(TargetIpvmStatusSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 이슈정보 총 갯수를 조회한다.
     * @param searchVO 조회 조건을 포함하는 IssueBoardSearchVO
     * @return
     */
    public int selectTargetIpvmStatusByConditionCnt(TargetIpvmStatusSearchVO searchVO);

    public int insertTargetIpvmStatus(TargetIpvmStatusVO targetIpvmStatusVO);

    public TargetIpvmStatusVO selectTargetIpvmStatusByKey(TargetIpvmStatusSearchVO searchVO);

}
