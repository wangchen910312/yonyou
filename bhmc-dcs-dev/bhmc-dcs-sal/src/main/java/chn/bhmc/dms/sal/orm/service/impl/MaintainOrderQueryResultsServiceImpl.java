package chn.bhmc.dms.sal.orm.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.orm.service.MaintainOrderQueryResultsService;
import chn.bhmc.dms.sal.orm.service.dao.MaintainOrderQueryResultsDAO;
import chn.bhmc.dms.sal.orm.vo.MaintainOrderQueryResultsSearchVO;
import chn.bhmc.dms.sal.orm.vo.MaintainOrderQueryResultsVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MaintainOrderQueryResultsServiceImpl
 * @Description : 오더유지 결과조회
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

@Service("maintainOrderQueryResultsService")
public class MaintainOrderQueryResultsServiceImpl extends HService implements MaintainOrderQueryResultsService {

    /**
     * 오더유지 결과조회 DAO 선언
     */
    @Resource(name="maintainOrderQueryResultsDAO")
    MaintainOrderQueryResultsDAO maintainOrderQueryResultsDAO;


    /**
     * 년월의 초기값을 조회한다.
     */
    public Date selectSysDt() throws Exception {
        MaintainOrderQueryResultsSearchVO searchVO = new MaintainOrderQueryResultsSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return maintainOrderQueryResultsDAO.selectSysDt(searchVO);
    }


    /**
     * 조회 조건에 해당하는  정보를 조회한다.
     */
    @Override
    public List<MaintainOrderQueryResultsVO> selectMaintainOrderQueryResultsByCondition(MaintainOrderQueryResultsSearchVO searchVO) throws Exception {

        return maintainOrderQueryResultsDAO.selectMaintainOrderQueryResultsByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 총 갯수를 조회한다.
     */
    @Override
    public int selectMaintainOrderQueryResultsByConditionCnt(MaintainOrderQueryResultsSearchVO searchVO)  throws Exception {

        return maintainOrderQueryResultsDAO.selectMaintainOrderQueryResultsByConditionCnt(searchVO);
    }

    /**
     * 상세정보를 조회한다.
     */
    @Override
    public List<MaintainOrderQueryResultsVO> selectMaintainOrderQueryResultsDetByCondition(MaintainOrderQueryResultsVO searchVO) throws Exception {

        return maintainOrderQueryResultsDAO.selectMaintainOrderQueryResultsDetByCondition(searchVO);
    }


}
