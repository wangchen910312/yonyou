package chn.bhmc.dms.par.cpm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.par.cpm.service.SaleActualSummaryService;
import chn.bhmc.dms.par.cpm.service.dao.SaleActualSummaryDAO;
import chn.bhmc.dms.par.cpm.vo.SaleActualSummaryVO;
import chn.bhmc.dms.par.cpm.vo.SalePlanSearchVO;

/**
 * 판매집계실적 구현 클래스
 *
 * @author In Bo Shim
 * @since 2016. 7. 15.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 7. 15.     In Bo Shim      최초 생성
 * </pre>
 */
@Service("saleActualSummaryService")
public class SaleActualSummaryServiceImpl extends HService implements SaleActualSummaryService {

    @Resource(name="saleActualSummaryDAO")
    private SaleActualSummaryDAO saleActualSummaryDAO;

    /*
     * @see chn.bhmc.dms.par.cpm.service.SaleActualSummaryService#insertSaleActualSummary(chn.bhmc.dms.par.cpm.vo.SaleActualSummaryVO)
     */
    @Override
    public int insertSaleActualSummary(SaleActualSummaryVO saleActualSummaryVO) throws Exception {
        return saleActualSummaryDAO.insertSaleActualSummary(saleActualSummaryVO);
    }

    /*
     * @see chn.bhmc.dms.par.cpm.service.SaleActualSummaryService#updateSaleActualSummary(chn.bhmc.dms.par.cpm.vo.SaleActualSummaryVO)
     */
    @Override
    public int updateSaleActualSummary(SaleActualSummaryVO saleActualSummaryVO) throws Exception {
        return saleActualSummaryDAO.updateSaleActualSummary(saleActualSummaryVO);
    }

    /*
     * @see chn.bhmc.dms.par.cpm.service.SaleActualSummaryService#deleteSaleActualSummary(chn.bhmc.dms.par.cpm.vo.SaleActualSummaryVO)
     */
    @Override
    public int deleteSaleActualSummary(SaleActualSummaryVO saleActualSummaryVO) throws Exception {
        return saleActualSummaryDAO.deleteSaleActualSummary(saleActualSummaryVO);
    }

    /*
     * @see chn.bhmc.dms.par.cpm.service.SaleActualSummaryService#selectSaleActualSummaryByKey(java.lang.String, java.lang.String)
     */
    @Override
    public SaleActualSummaryVO selectSaleActualSummaryByKey(String dlrCd, String itemCd) throws Exception {
        return saleActualSummaryDAO.selectSaleActualSummaryByKey(dlrCd);
    }

    /*
     * @see chn.bhmc.dms.par.cpm.service.SaleActualSummaryService#selectSaleActualSummarysByCondition(chn.bhmc.dms.par.cpm.vo.SaleActualSummarySearchVO)
     */
    @Override
    public List<SaleActualSummaryVO> selectSaleActualSummarysByCondition(SalePlanSearchVO searchVO) throws Exception {
        return saleActualSummaryDAO.selectSaleActualSummarysByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.cpm.service.SaleActualSummaryService#selectSaleActualSummarysByConditionCnt(chn.bhmc.dms.par.cpm.vo.SaleActualSummarySearchVO)
     */
    @Override
    public int selectSaleActualSummarysByConditionCnt(SalePlanSearchVO searchVO) throws Exception {
        return saleActualSummaryDAO.selectSaleActualSummarysByConditionCnt(searchVO);
    }

}
