package chn.bhmc.dms.mob.api.sales.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.sales.vo.DBMessageSourceSearchVO;
import chn.bhmc.dms.mob.api.sales.vo.DBMessageSourceVO;



/**
 * 메세지소스에 관한 데이터처리 매퍼 클래스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 4.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.05         Kang Seok Han            최초 생성
 * </pre>
 */

@Mapper("SalesDBMessageSourceDAO")
public interface SalesDBMessageSourceDAO {

    /**
     * 조회 조건에 해당하는 메세지소스 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DBMessageSourceSearchVO
     * @return 조회 목록
     */
    public List<DBMessageSourceVO> selectDBMessageSourcesByCondition(DBMessageSourceSearchVO searchVO);
}
