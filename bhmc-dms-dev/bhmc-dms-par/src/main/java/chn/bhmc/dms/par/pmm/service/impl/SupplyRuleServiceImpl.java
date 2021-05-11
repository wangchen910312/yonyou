package chn.bhmc.dms.par.pmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pmm.service.SupplyRuleService;
import chn.bhmc.dms.par.pmm.service.dao.SupplyRuleDAO;
import chn.bhmc.dms.par.pmm.vo.SupplyRuleSearchVO;
import chn.bhmc.dms.par.pmm.vo.SupplyRuleVO;

/**
 * SafetyStockSettingServiceImpl
 *
 * @author In Bo Shim
 * @since 2016. 5. 03.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 5. 03.     In Bo Shim      최초 생성
 * </pre>
 */
@Service("supplyRuleService")
public class SupplyRuleServiceImpl extends HService implements SupplyRuleService {

    @Resource(name="supplyRuleDAO")
    private SupplyRuleDAO supplyRuleDAO;

    /*
     * @see chn.bhmc.dms.par.pmm.service.SupplyRuleService#insertSupplyRule(chn.bhmc.dms.par.pmm.vo.SupplyRuleVO)
     */
    @Override
    public int insertSupplyRule(SupplyRuleVO saftyStockWeightVO) throws Exception {
        saftyStockWeightVO.setDlrCd(LoginUtil.getDlrCd());
        saftyStockWeightVO.setRegUsrId(LoginUtil.getUserId());
        return supplyRuleDAO.insertSupplyRule(saftyStockWeightVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.SupplyRuleService#updateSupplyRule(chn.bhmc.dms.par.pmm.vo.SupplyRuleVO)
     */
    @Override
    public int updateSupplyRule(SupplyRuleVO saftyStockWeightVO) throws Exception {
        saftyStockWeightVO.setDlrCd(LoginUtil.getDlrCd());
        saftyStockWeightVO.setUpdtUsrId(LoginUtil.getUserId());
        return supplyRuleDAO.updateSupplyRule(saftyStockWeightVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.SupplyRuleService#deleteSupplyRule(chn.bhmc.dms.par.pmm.vo.SupplyRuleVO)
     */
    @Override
    public int deleteSupplyRule(SupplyRuleVO saftyStockWeightVO) throws Exception {
        saftyStockWeightVO.setDlrCd(LoginUtil.getDlrCd());
        saftyStockWeightVO.setUpdtUsrId(LoginUtil.getUserId());
        return supplyRuleDAO.deleteSupplyRule(saftyStockWeightVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.SupplyRuleService#selectSupplyRuleByKey(java.lang.String, java.lang.String)
     */
    @Override
    public SupplyRuleVO selectSupplyRuleByKey(String dlrCd, String pltCd) throws Exception {
        return supplyRuleDAO.selectSupplyRuleByKey(dlrCd, pltCd);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.SupplyRuleService#selectSupplyRulesPivotByCondition(chn.bhmc.dms.par.pmm.vo.SupplyRuleSearchVO)
     */
    @Override
    public List<SupplyRuleVO> selectSupplyRulesPivotByCondition(SupplyRuleSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsPltCd(LoginUtil.getPltCd());

        return supplyRuleDAO.selectSupplyRulesPivotByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.SupplyRuleService#selectSupplyRulesByCondition(chn.bhmc.dms.par.pmm.vo.SupplyRuleSearchVO)
     */
    @Override
    public List<SupplyRuleVO> selectSupplyRulesByCondition(SupplyRuleSearchVO searchVO) throws Exception {
        return supplyRuleDAO.selectSupplyRulesByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.SupplyRuleService#selectSupplyRulesByConditionCnt(chn.bhmc.dms.par.pmm.vo.SupplyRuleSearchVO)
     */
    @Override
    public int selectSupplyRulesByConditionCnt(SupplyRuleSearchVO searchVO) throws Exception {
        return supplyRuleDAO.selectSupplyRulesByConditionCnt(searchVO);
    }
}
