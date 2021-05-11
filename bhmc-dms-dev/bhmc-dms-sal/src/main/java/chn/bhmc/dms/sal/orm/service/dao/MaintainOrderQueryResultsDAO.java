package chn.bhmc.dms.sal.orm.service.dao;

import java.util.Date;
import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.orm.vo.MaintainOrderQueryResultsSearchVO;
import chn.bhmc.dms.sal.orm.vo.MaintainOrderQueryResultsVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MaintainOrderQueryResultsDAO
 * @Description : 오더유지 결과조회 DAO
 * @author Bong
 * @since 2016. 4. 22.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.04.22         Bong            최초 생성
 * </pre>
 */

@Mapper("maintainOrderQueryResultsDAO")
public interface MaintainOrderQueryResultsDAO {

    /**
     * 년월의 초기값을 조회한다.
     */
    public Date selectSysDt(MaintainOrderQueryResultsSearchVO searchVO) throws Exception;

    /**
      * 조회 조건에 해당하는  정보를 조회한다.
      */
    public List<MaintainOrderQueryResultsVO> selectMaintainOrderQueryResultsByCondition(MaintainOrderQueryResultsSearchVO searchVO) throws Exception;

    /**
     *  조회 조건에 해당하는  총 갯수를 조회한다.
     */
    public int selectMaintainOrderQueryResultsByConditionCnt(MaintainOrderQueryResultsSearchVO searchVO) throws Exception;

    /**
     * 상세정보를 조회한다.
     */
   public List<MaintainOrderQueryResultsVO> selectMaintainOrderQueryResultsDetByCondition(MaintainOrderQueryResultsVO searchVO) throws Exception;

}
