package chn.bhmc.dms.sal.acc.service;

import java.util.List;

import chn.bhmc.dms.sal.acc.vo.AccessoryConditionSearchVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryConditionVO;


/**
 *  경품판매현황 서비스
 *
 * @author Kim Jin Suk
 * @since 2016. 6. 30.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.06.30         Kim Jin Suk            최초 생성
 * </pre>
 */

public interface AccessoryConditionService {

    /**
     * 경품판매현황 내역을 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectAccessoryConditionsByConditionCnt(AccessoryConditionSearchVO searchVO) throws Exception;
    public List<AccessoryConditionVO> selectAccessoryConditionsByCondition(AccessoryConditionSearchVO searchVO) throws Exception;

}
