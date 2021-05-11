package chn.bhmc.dms.mob.api.sales.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.mob.api.sales.dao.SalesBinLocationMasterDAO;
import chn.bhmc.dms.mob.api.sales.service.SalesBinLocationMasterService;
import chn.bhmc.dms.mob.api.sales.vo.BinLocationMasterSearchVO;
import chn.bhmc.dms.mob.api.sales.vo.BinLocationMasterVO;


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
@Service("SalesBinLocationMasterService")
public class SalesBinLocationMasterServiceImpl extends HService implements SalesBinLocationMasterService {

    @Resource(name="SalesBinLocationMasterDAO")
    private SalesBinLocationMasterDAO SalesBinLocationMasterDAO;

 
    /*
     * @see chn.bhmc.dms.par.pmm.service.BinLocationMasterService#selectBinLocationMasterByCondition(chn.bhmc.dms.par.pmm.vo.BinLocationMasterSearchVO)
     */
    @Override
    public List<BinLocationMasterVO> selectBinLocationMastersByCondition(BinLocationMasterSearchVO searchVO) {
        return SalesBinLocationMasterDAO.selectBinLocationMasterByCondition(searchVO);
    }

   
}
