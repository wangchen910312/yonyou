package chn.bhmc.dms.par.cpm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.par.cpm.service.SaleSummaryService;
import chn.bhmc.dms.par.cpm.service.dao.SaleSummaryDAO;
import chn.bhmc.dms.par.cpm.vo.SalePlanSearchVO;
import chn.bhmc.dms.par.cpm.vo.SaleSummaryVO;

/**
 * 판매통계 구현 클래스
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
@Service("saleSummaryService")
public class SaleSummaryServiceImpl extends HService implements SaleSummaryService {

    @Resource(name="saleSummaryDAO")
    private SaleSummaryDAO saleSummaryDAO;

    /*
     * @see chn.bhmc.dms.par.cpm.service.SaleSummaryService#insertSaleSummary(chn.bhmc.dms.par.cpm.vo.SaleSummaryVO)
     */
    @Override
    public int insertSaleSummary(SaleSummaryVO saleSummaryVO) throws Exception {
        return saleSummaryDAO.insertSaleSummary(saleSummaryVO);
    }

    /*
     * @see chn.bhmc.dms.par.cpm.service.SaleSummaryService#updateSaleSummary(chn.bhmc.dms.par.cpm.vo.SaleSummaryVO)
     */
    @Override
    public int updateSaleSummary(SaleSummaryVO saleSummaryVO) throws Exception {
        return saleSummaryDAO.updateSaleSummary(saleSummaryVO);
    }

    /*
     * @see chn.bhmc.dms.par.cpm.service.SaleSummaryService#deleteSaleSummary(chn.bhmc.dms.par.cpm.vo.SaleSummaryVO)
     */
    @Override
    public int deleteSaleSummary(SaleSummaryVO saleSummaryVO) throws Exception {
        return saleSummaryDAO.deleteSaleSummary(saleSummaryVO);
    }

    /*
     * @see chn.bhmc.dms.par.cpm.service.SaleSummaryService#selectSaleSummaryByKey(java.lang.String, java.lang.String)
     */
    @Override
    public SaleSummaryVO selectSaleSummaryByKey(String dlrCd, String itemCd) throws Exception {
        return saleSummaryDAO.selectSaleSummaryByKey(dlrCd);
    }

    /*
     * @see chn.bhmc.dms.par.cpm.service.SaleSummaryService#selectSaleSummarysByCondition(chn.bhmc.dms.par.cpm.vo.SaleSummarySearchVO)
     */
    @Override
    public List<SaleSummaryVO> selectSaleSummarysByCondition(SalePlanSearchVO searchVO) throws Exception {
        return saleSummaryDAO.selectSaleSummarysByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.cpm.service.SaleSummaryService#selectSaleSummarysByConditionCnt(chn.bhmc.dms.par.cpm.vo.SaleSummarySearchVO)
     */
    @Override
    public int selectSaleSummarysByConditionCnt(SalePlanSearchVO searchVO) throws Exception {
        return saleSummaryDAO.selectSaleSummarysByConditionCnt(searchVO);
    }

}
