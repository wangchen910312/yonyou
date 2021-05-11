package chn.bhmc.dms.mis.tmp.service;

import java.util.List;

import chn.bhmc.dms.mis.tmp.vo.TargetSearchMgmtVO;
/**
 * <pre>
 * [제조사] 년월간 목표 조회
 * </pre>
 *
 * @ClassName   : TargetSearchMgmtService.java
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

public interface TargetSearchMgmtService {

    /**
     * 조회 조건에 해당하는 년월간 목표 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetSearchMgmtVO
     * @return 조회 목록
     */
    public List<TargetSearchMgmtVO> selectTargetSearchMgmtByCondition(TargetSearchMgmtVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 년월간 목표 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetSearchMgmtVO
     * @return
     */
    public int selectTargetSearchMgmtByConditionCnt(TargetSearchMgmtVO searchVO) throws Exception;

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
     * [제조사] 월간 목표 등록 사업부에 따른 사무소 조회
     * @param searchVO - 조회 조건을 포함하는 TargetMonthAllRegVO
     * @return
     */
    public List<TargetSearchMgmtVO> selectMonthOfficeList(TargetSearchMgmtVO searchVO);

    /**
     * [제조사] 월간 목표 등록 사업부에 따른 사무소 조회
     * @param searchVO - 조회 조건을 포함하는 TargetMonthAllRegVO
     * @return
     */
    public int selectOfficeListCnt(TargetSearchMgmtVO searchVO) throws Exception;

    /**
     * [제조사] 월간 목표 등록 사무소에 따른 딜러사 조회
     * @param searchVO - 조회 조건을 포함하는 TargetMonthAllRegVO
     * @return
     */
    public List<TargetSearchMgmtVO> selectMonthDealerList(TargetSearchMgmtVO searchVO);

    /**
     * [제조사] 월간 목표 등록 사무소에 따른 딜러사 조회
     * @param searchVO - 조회 조건을 포함하는 TargetMonthAllRegVO
     * @return
     */
    public int selectDealerListCnt(TargetSearchMgmtVO searchVO) throws Exception;

}
