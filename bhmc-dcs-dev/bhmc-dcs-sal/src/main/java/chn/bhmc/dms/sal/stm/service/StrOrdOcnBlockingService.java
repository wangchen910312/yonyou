package chn.bhmc.dms.sal.stm.service;

import java.util.List;
import java.util.Map;

import chn.bhmc.dms.sal.stm.vo.StrOrdOcnBlockingSearchVO;
import chn.bhmc.dms.sal.stm.vo.StrOrdOcnBlockingVO;

/**
 *   전략오더OCN블러킹
 * @author Kim Jin Suk
 * @since 2016. 7. 25.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.07.25         Kim Jin Suk            최초 생성
 * </pre>
 */

public interface StrOrdOcnBlockingService {

    /**
     * 전략오더OCN블러킹 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("rawtypes")
    public Map<String, List> selectStrOrdOcnBlockingsByCondition(StrOrdOcnBlockingSearchVO searchVO) throws Exception;
    public int selectStrOrdOcnBlockingsByConditionCnt(StrOrdOcnBlockingSearchVO searchVO) throws Exception;

    /**
     * 전략오더OCN블러킹 저장
     * @param saveVO
     * @throws Exception
     */
    public int multiStrOrdOcnBlockings(Map<?,?> saveVO) throws Exception;

    /**
     * 딜러 - 딜러 복사
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int strOrdOcnBlockingDlrCopys(StrOrdOcnBlockingVO saveVO) throws Exception;

    /**
     * 전체딜러 복사
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int strOrdOcnBlockingAllDlrCopys(Map<String, String> saveVO) throws Exception;
}