package chn.bhmc.dms.par.stm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.*;

import org.jxls.common.*;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.excel.*;
import chn.bhmc.dms.core.util.*;
import chn.bhmc.dms.par.stm.service.StockInOutService;
import chn.bhmc.dms.par.stm.service.dao.StockInOutDAO;
import chn.bhmc.dms.par.stm.vo.StockInOutSearchVO;
import chn.bhmc.dms.par.stm.vo.StockInOutVO;

/**
 * 재고 구현 클래스
 *
 * @author JU WON LEE
 * @since 2018. 2. 08.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2018. 2. 08.     JU WON LEE      최초 생성
 * </pre>
 */
@Service("stockInOutService")
public class StockInOutServiceImpl extends HService implements StockInOutService, JxlsSupport {

    @Resource(name="stockInOutDAO")
    private StockInOutDAO stockInOutDAO;

    /*
     * @see chn.bhmc.dms.par.stm.service.StockInOutService#selectStockAnalysisByCondition(chn.bhmc.dms.par.stm.vo.StockInOutSearchVO)
     */
    @Override
    public List<StockInOutVO> selectStockAnalysisByCondition(StockInOutSearchVO searchVO) throws Exception {
        // TODO Auto-generated method stub
        return stockInOutDAO.selectStockAnalysisByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.StockInOutService#selectStockAnalysisByConditionCnt(chn.bhmc.dms.par.stm.vo.StockInOutSearchVO)
     */
    @Override
    public int selectStockAnalysisByConditionCnt(StockInOutSearchVO searchVO) throws Exception {
        // TODO Auto-generated method stub
        return stockInOutDAO.selectStockAnalysisByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initJxlsContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {
        StockInOutSearchVO searchVO = new StockInOutSearchVO();
        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        List<StockInOutVO> list = selectStockAnalysisByCondition(searchVO);
        context.putVar("items", list);
    }

}
