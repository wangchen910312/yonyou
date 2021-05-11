package chn.bhmc.dms.mob.api.sales.service;

import java.util.List;

import chn.bhmc.dms.mob.api.sales.vo.DBMessageSourceSearchVO;
import chn.bhmc.dms.mob.api.sales.vo.DBMessageSourceVO;



/**
 * 메세지소스 관리 서비스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 18.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.18         Kang Seok Han            최초 생성
 * </pre>
 */

public interface SalesDBMessageSourceService {

    /**
     * 조회 조건에 해당하는 메세지소스 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DBMessageSourceSearchVO
     * @return 조회 목록
     */
	public List<DBMessageSourceVO> selectDBMessageSourcesByCondition(DBMessageSourceSearchVO searchVO) throws Exception;
}
