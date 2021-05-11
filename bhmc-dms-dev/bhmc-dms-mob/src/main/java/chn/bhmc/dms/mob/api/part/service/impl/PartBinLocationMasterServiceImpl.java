package chn.bhmc.dms.mob.api.part.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.mob.api.part.dao.PartBinLocationMasterDAO;
import chn.bhmc.dms.mob.api.part.service.PartBinLocationMasterService;
import chn.bhmc.dms.mob.api.part.vo.BinLocationMasterSearchVO;
import chn.bhmc.dms.mob.api.part.vo.BinLocationMasterVO;



/**
 * 로케이션 마스터 구현 클래스
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
@Service("PartBinLocationMasterService")
public class PartBinLocationMasterServiceImpl extends HService implements PartBinLocationMasterService {

    @Resource(name="PartBinLocationMasterDAO")
    private PartBinLocationMasterDAO PartBinLocationMasterDAO;

    /*
     * @see chn.bhmc.dms.par.pmm.service.BinLocationMasterService#selectBinLocationMasterByItemCdCnt(chn.bhmc.dms.par.pmm.vo.BinLocationMasterSearchVO)
     */
    @Override
    public int selectBinLocationMasterByItemCdCnt(BinLocationMasterSearchVO searchVO) throws Exception {

        return PartBinLocationMasterDAO.selectBinLocationMasterByItemCdCnt(searchVO);
    }
    
    /*
     * @see chn.bhmc.dms.par.pmm.service.BinLocationMasterService#selectBinLocationMasterByItemCd(chn.bhmc.dms.par.pmm.vo.BinLocationMasterSearchVO)
     */
    @Override
    public List<BinLocationMasterVO> selectBinLocationMasterByItemCd(BinLocationMasterSearchVO searchVO)
            throws Exception {
        return PartBinLocationMasterDAO.selectBinLocationMasterByItemCd(searchVO);
    }

  
    /*
     * @see chn.bhmc.dms.par.pmm.service.BinLocationMasterService#selectBinLocationMasterByCondition(chn.bhmc.dms.par.pmm.vo.BinLocationMasterSearchVO)
     */
    @Override
    public List<BinLocationMasterVO> selectBinLocationMastersByCondition(BinLocationMasterSearchVO searchVO) {
        return PartBinLocationMasterDAO.selectBinLocationMasterByCondition(searchVO);
    }
    
    /*
     * @see chn.bhmc.dms.par.pmm.service.BinLocationMasterService#selectBinLocationMasterComboByLevel(chn.bhmc.dms.par.pmm.vo.BinLocationMasterSearchVO)
     */
    @Override
    public List<BinLocationMasterVO> selectBinLocationMasterComboByLevel(BinLocationMasterSearchVO searchVO)
            throws Exception {

        return PartBinLocationMasterDAO.selectBinLocationMasterComboByLevel(searchVO);
    }

//    /*
//     * @see chn.bhmc.dms.par.pmm.service.BinLocationMasterService#selectBinLocationMasterByConditionCnt(chn.bhmc.dms.par.pmm.vo.BinLocationMasterSearchVO)
//     */
//    @Override
//    public int selectBinLocationMastersByConditionCnt(BinLocationMasterSearchVO searchVO) {
//        return binLocationMasterDAO.selectBinLocationMasterByConditionCnt(searchVO);
//    }

}
