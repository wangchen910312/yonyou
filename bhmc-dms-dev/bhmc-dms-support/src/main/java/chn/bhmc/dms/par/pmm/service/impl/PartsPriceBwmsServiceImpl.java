package chn.bhmc.dms.par.pmm.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.par.pmm.service.PartsPriceBwmsService;
import chn.bhmc.dms.par.pmm.service.dao.PartsPriceBwmsDAO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.PartsPriceBwmsItemVO;

/**
 * 부품가격 BWMS 구현 클래스
 *
 * @author In Bo Shim
 * @since 2017. 06. 21.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2017. 06. 21.    In Bo Shim      최초 생성
 * </pre>
 */
@Service("partsPriceBwmsService")
public class PartsPriceBwmsServiceImpl extends HService implements PartsPriceBwmsService{

    @Resource(name="partsPriceBwmsDAO")
    private PartsPriceBwmsDAO partsPriceBwmsDAO;

    /*
     * @see chn.bhmc.dms.par.pmm.service.PartsPriceBwmsService#selectBwmsItemCdByKey(chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO)
     */
    @Override
    public PartsPriceBwmsItemVO selectBwmsItemCdByKey(ItemMasterSearchVO searchVO) throws Exception {
        return partsPriceBwmsDAO.selectBwmsItemCdByKey(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.PartsPriceBwmsService#selectItemPriceItemCdByCnt(chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO)
     */
    @Override
    public int selectItemPriceItemCdByCnt(ItemMasterSearchVO searchVO) throws Exception {
        return partsPriceBwmsDAO.selectItemPriceItemCdByCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.PartsPriceBwmsService#updateItemPriceItemCdGrtePrc(chn.bhmc.dms.par.pmm.vo.PartsPriceBwmsItemVO)
     */
    @Override
    public int updateItemPriceItemCdGrtePrc(PartsPriceBwmsItemVO partsPriceBwmsItemVO) throws Exception {
        return partsPriceBwmsDAO.updateItemPriceItemCdGrtePrc(partsPriceBwmsItemVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.PartsPriceBwmsService#selectPartsVenderSalPriceTargetMastersPriceEqualByConditionCnt(chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO)
     */
    @Override
    public int selectPartsVenderSalPriceTargetMastersPriceEqualByConditionCnt(ItemMasterSearchVO searchVO)
            throws Exception {
        return partsPriceBwmsDAO.selectPartsVenderSalPriceTargetMastersPriceEqualByConditionCnt(searchVO);
    }
}
