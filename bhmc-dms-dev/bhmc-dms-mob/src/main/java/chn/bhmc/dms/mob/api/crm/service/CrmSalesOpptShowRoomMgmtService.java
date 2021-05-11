package chn.bhmc.dms.mob.api.crm.service;

import java.util.List;

import chn.bhmc.dms.mob.api.crm.vo.SalesOpptShowRoomMgmtSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.SalesOpptShowRoomMgmtVO;



/**
 * 전시장 관리 서비스
 *
 * @author kyo jin lee
 * @since 2016.03.07.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.07         kyo jin lee            최초 생성
 * </pre>
 */

public interface CrmSalesOpptShowRoomMgmtService {

    public int selectSalesOpptShowRoomMgmtsByConditionCnt(SalesOpptShowRoomMgmtSearchVO searchVO) throws Exception;

    public List<SalesOpptShowRoomMgmtVO> selectSalesOpptShowRoomMgmtsByCondition(SalesOpptShowRoomMgmtSearchVO searchVO) throws Exception;
}
