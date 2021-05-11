package chn.bhmc.dms.par.pmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pmm.service.SafetyStockWeightService;
import chn.bhmc.dms.par.pmm.service.dao.SafetyStockWeightDAO;
import chn.bhmc.dms.par.pmm.vo.SaftyStockSearchVO;
import chn.bhmc.dms.par.pmm.vo.SaftyStockWeightVO;

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
@Service("safetyStockWeightService")
public class SafetyStockWeightServiceImpl extends HService implements SafetyStockWeightService {

    @Resource(name="safetyStockWeightDAO")
    private SafetyStockWeightDAO safetyStockWeightDAO;

    /*
     * @see chn.bhmc.dms.par.pmm.service.SafetyStockWeightService#insertSafetyStockWeight(chn.bhmc.dms.par.pmm.vo.SaftyStockWeightVO)
     */
    @Override
    public int insertSafetyStockWeight(SaftyStockWeightVO saftyStockWeightVO) throws Exception {
        saftyStockWeightVO.setDlrCd(LoginUtil.getDlrCd());
        saftyStockWeightVO.setRegUsrId(LoginUtil.getUserId());
        return safetyStockWeightDAO.insertSafetyStockWeight(saftyStockWeightVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.SafetyStockWeightService#updateSafetyStockWeight(chn.bhmc.dms.par.pmm.vo.SaftyStockWeightVO)
     */
    @Override
    public int updateSafetyStockWeight(SaftyStockWeightVO saftyStockWeightVO) throws Exception {
        saftyStockWeightVO.setDlrCd(LoginUtil.getDlrCd());
        saftyStockWeightVO.setUpdtUsrId(LoginUtil.getUserId());
        return safetyStockWeightDAO.updateSafetyStockWeight(saftyStockWeightVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.SafetyStockWeightService#deleteSafetyStockWeight(chn.bhmc.dms.par.pmm.vo.SaftyStockWeightVO)
     */
    @Override
    public int deleteSafetyStockWeight(SaftyStockWeightVO saftyStockWeightVO) throws Exception {
        saftyStockWeightVO.setDlrCd(LoginUtil.getDlrCd());
        saftyStockWeightVO.setUpdtUsrId(LoginUtil.getUserId());
        return safetyStockWeightDAO.deleteSafetyStockWeight(saftyStockWeightVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.SafetyStockWeightService#selectSafetyStockWeightByKey(java.lang.String, java.lang.String)
     */
    @Override
    public SaftyStockWeightVO selectSafetyStockWeightByKey(String dlrCd, String pltCd) throws Exception {
        return safetyStockWeightDAO.selectSafetyStockWeightByKey(dlrCd, pltCd);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.SafetyStockWeightService#selectSafetyStockWeightsByCondition(chn.bhmc.dms.par.pmm.vo.SaftyStockSearchVO)
     */
    @Override
    public List<SaftyStockWeightVO> selectSafetyStockWeightsByCondition(SaftyStockSearchVO searchVO) throws Exception {
        return safetyStockWeightDAO.selectSafetyStockWeightsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.SafetyStockWeightService#selectSafetyStockWeightsByConditionCnt(chn.bhmc.dms.par.pmm.vo.SaftyStockSearchVO)
     */
    @Override
    public int selectSafetyStockWeightsByConditionCnt(SaftyStockSearchVO searchVO) throws Exception {
        return safetyStockWeightDAO.selectSafetyStockWeightsByConditionCnt(searchVO);
    }
}
