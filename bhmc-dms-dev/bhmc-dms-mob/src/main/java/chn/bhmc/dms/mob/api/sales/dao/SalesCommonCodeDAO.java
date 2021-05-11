package chn.bhmc.dms.mob.api.sales.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.sales.vo.CommonCodeSearchVO;
import chn.bhmc.dms.mob.api.sales.vo.CommonCodeVO;


/**
 * 공통코드에 관한 데이터처리 매퍼 클래스
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

@Mapper("SalesCommonCodeDAO")
public interface SalesCommonCodeDAO {

    
    /**
     * Statements
     *
     * @param searchVO
     * @param lang
     * @return
     */
    public List<CommonCodeVO> selectCommonCodesByCmmGrpCd(CommonCodeSearchVO searchVO);

    

}
