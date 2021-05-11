package chn.bhmc.dms.mis.tmp.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.mis.tmp.vo.TargetSearchMgmtVO;
/**
 * <pre>
 * [제조사] 년월간 목표 조회
 * </pre>
 *
 * @ClassName   : TargetSearchMgmtDAO.java
 * @Description : [제조사] 년월간 목표 조회
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

@Mapper("targetSearchMgmtDAO")
public interface TargetSearchMgmtDAO {

    /**
     * 조회 조건에 해당하는 년간목표 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetSearchMgmtVO
     * @return 조회 목록
     */
    public List<TargetSearchMgmtVO> selectTargetSearchMgmtByCondition(TargetSearchMgmtVO searchVO);

    /**
     * 조회 조건에 해당하는 년간목표 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetSearchMgmtVO
     * @return
     */
    public int selectTargetSearchMgmtByConditionCnt(TargetSearchMgmtVO searchVO);

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<TargetSearchMgmtVO> selectSdptList(TargetSearchMgmtVO searchVO);

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<TargetSearchMgmtVO> selectOfficeList(TargetSearchMgmtVO searchVO);

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<TargetSearchMgmtVO> selectDealerList(TargetSearchMgmtVO searchVO);

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<TargetSearchMgmtVO> selectMonthOfficeList(TargetSearchMgmtVO searchVO);

    /**
     * 조회 조건에 해당하는 월간목표 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetMonthRegSearchVO
     * @return
     */
    public int selectOfficeListCnt(TargetSearchMgmtVO searchVO);

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<TargetSearchMgmtVO> selectMonthDealerList(TargetSearchMgmtVO searchVO);

    /**
     * 조회 조건에 해당하는 월간목표 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetMonthRegSearchVO
     * @return
     */
    public int selectDealerListCnt(TargetSearchMgmtVO searchVO);

}
