package chn.bhmc.dms.par.pmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.par.pmm.service.PartsVenderSalPriceTargetHistoryService;
import chn.bhmc.dms.par.pmm.service.dao.PartsVenderSalPriceTargetHistoryDAO;
import chn.bhmc.dms.par.pmm.vo.PartsVenderSalPriceTargetHistorySearchVO;
import chn.bhmc.dms.par.pmm.vo.PartsVenderSalPriceTargetHistoryVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PartsVenderSalPriceTargetHistoryServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In Bo Shim
 * @since 2016. 4. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 19.     In Bo Shim     최초 생성
 * </pre>
 */

@Service("partsVenderSalPriceTargetHistoryService")
public class PartsVenderSalPriceTargetHistoryServiceImpl extends HService implements PartsVenderSalPriceTargetHistoryService {

    @Resource(name="partsVenderSalPriceTargetHistoryDAO")
    private PartsVenderSalPriceTargetHistoryDAO partsVenderSalPriceTargetHistoryDAO;

    /*
     * @see chn.bhmc.dms.par.pmm.service.PartsVenderSalPriceTargetHistoryService#insertPartsVenderSalPriceHistory(chn.bhmc.dms.par.pmm.vo.PartsVenderSalPriceTargetHistoryVO)
     */
    @Override
    public int insertPartsVenderSalPriceTargetHistory(PartsVenderSalPriceTargetHistoryVO partsVenderSalPriceTargetHistoryVO) {
        return partsVenderSalPriceTargetHistoryDAO.insertPartsVenderSalPriceTargetHistory(partsVenderSalPriceTargetHistoryVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.PartsVenderSalPriceTargetHistoryService#selectPartsVenderSalPriceTargetHistorysByCondition(chn.bhmc.dms.par.pmm.vo.PartsVenderSalPriceTargetHistorySearchVO)
     */
    @Override
    public List<PartsVenderSalPriceTargetHistoryVO> selectPartsVenderSalPriceTargetHistorysByCondition(
            PartsVenderSalPriceTargetHistorySearchVO searchVO) throws Exception {
        return partsVenderSalPriceTargetHistoryDAO.selectPartsVenderSalPriceTargetHistorysByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.PartsVenderSalPriceTargetHistoryService#selectPartsVenderSalPriceTargetHistorysByConditionCnt(chn.bhmc.dms.par.pmm.vo.PartsVenderSalPriceTargetHistorySearchVO)
     */
    @Override
    public int selectPartsVenderSalPriceTargetHistorysByConditionCnt(PartsVenderSalPriceTargetHistorySearchVO searchVO)
            throws Exception {
        return partsVenderSalPriceTargetHistoryDAO.selectPartsVenderSalPriceTargetHistorysByConditionCnt(searchVO);
    }
}
