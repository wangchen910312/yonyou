package chn.bhmc.dms.crm.cso.service.dao;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.cso.vo.ShowRoomMgmtSearchVO;

/**
 * 전시장 관리에 관한 데이터처리 매퍼 클래스
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

@Mapper("showRoomStatsMgmtDAO")
public interface ShowRoomStatsMgmtDAO {

    public int selectSalesOpptShowRoomMgmtsByConditionCnt (ShowRoomMgmtSearchVO showRoomMgmtSearchVO) throws Exception;

}
