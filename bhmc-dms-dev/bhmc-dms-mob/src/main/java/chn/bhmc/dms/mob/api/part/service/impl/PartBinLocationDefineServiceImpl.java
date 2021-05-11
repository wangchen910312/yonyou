package chn.bhmc.dms.mob.api.part.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.mob.api.part.dao.PartBinLocationDefineDAO;
import chn.bhmc.dms.mob.api.part.service.PartBinLocationDefineService;
import chn.bhmc.dms.mob.api.part.vo.BinLocationDefineSearchVO;
import chn.bhmc.dms.mob.api.part.vo.BinLocationDefineVO;

/**
 * 로케이션 구조 정의 구현 클래스
 *
 * @author In Bo Shim
 * @since 2016. 1. 6.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 1. 6.     In Bo Shim      최초 생성
 * </pre>
 */
@Service("PartBinLocationDefineService")
public class PartBinLocationDefineServiceImpl extends HService implements PartBinLocationDefineService {

    @Resource(name="PartBinLocationDefineDAO")
    private PartBinLocationDefineDAO PartBinLocationDefineDAO;

 
//
//    /*
//     * @see chn.bhmc.dms.par.pmm.service.BinLocationDefineService#selectBinLocationDefineByKey(java.lang.String, java.lang.String)
//     */
//    @Override
//    public BinLocationDefineVO selectBinLocationDefineByKey(String dlrCd, int lvlId) {
//        return binLocationDefineDAO.selectBinLocationDefineByKey(dlrCd, lvlId);
//    }
//
//   
//    /*
//     * @see chn.bhmc.dms.par.pmm.service.BinLocationDefineService#selectBinLocationDefinesByCondition(chn.bhmc.dms.par.pmm.vo.BinLocationDefineSearchVO)
//     */
//    @Override
//    public List<BinLocationDefineVO> selectBinLocationDefinesByCondition(BinLocationDefineSearchVO searchVO) {
//        return binLocationDefineDAO.selectBinLocationDefineByCondition(searchVO);
//    }
//
//    /*
//     * @see chn.bhmc.dms.par.pmm.service.BinLocationDefineService#selectBinLocationDefinesByConditionCnt(chn.bhmc.dms.par.pmm.vo.BinLocationDefineSearchVO)
//     */
//    @Override
//    public int selectBinLocationDefinesByConditionCnt(BinLocationDefineSearchVO searchVO) {
//        return binLocationDefineDAO.selectBinLocationDefineByConditionCnt(searchVO);
//    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.BinLocationDefineService#selectBinLocationLevelCombo(chn.bhmc.dms.par.pmm.vo.BinLocationDefineSearchVO)
     */
    @Override
    public List<BinLocationDefineVO> selectBinLocationLevelCombo(BinLocationDefineSearchVO searchVO) throws Exception {

        return PartBinLocationDefineDAO.selectBinLocationLevelCombo(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.BinLocationDefineService#selectBinLocationLevelCount(chn.bhmc.dms.par.pmm.vo.BinLocationDefineSearchVO)
     */
    @Override
    public int selectBinLocationLevelCount(BinLocationDefineSearchVO searchVO) throws Exception {

        return PartBinLocationDefineDAO.selectBinLocationLevelCount(searchVO);
    }

}
