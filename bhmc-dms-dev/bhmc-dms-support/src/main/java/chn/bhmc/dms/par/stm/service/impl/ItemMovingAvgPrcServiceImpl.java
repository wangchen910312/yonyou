package chn.bhmc.dms.par.stm.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.par.stm.service.ItemMovingAvgPrcService;
import chn.bhmc.dms.par.stm.service.dao.ItemMovingAvgPrcDAO;
import chn.bhmc.dms.par.stm.vo.ItemMovingAvgPrcVO;



/**
 * 부품이동평균가격 구현 클래스
 *
 * @author Ju Won Lee
 * @since 2016. 1. 20.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 1. 20.     Ju Won Lee      최초 생성
 * </pre>
 */
@Service("itemMovingAvgPrcService")
public class ItemMovingAvgPrcServiceImpl extends HService implements ItemMovingAvgPrcService {

    @Resource(name="itemMovingAvgPrcDAO")
    private ItemMovingAvgPrcDAO itemMovingAvgPrcDAO;

    /*
     * @see chn.bhmc.dms.par.stm.service.ItemMovingAvgPrcService#insertItemMovingAvgPrc(chn.bhmc.dms.par.stm.vo.ItemMovingAvgPrcVO)
     */
    @Override
    public int insertItemMovingAvgPrc(ItemMovingAvgPrcVO itemMovingAvgPrcVO) throws Exception {

        return itemMovingAvgPrcDAO.insertItemMovingAvgPrc(itemMovingAvgPrcVO);
    }


    /*
     * @see chn.bhmc.dms.par.stm.service.ItemMovingAvgPrcService#updateItemMovingAvgPrc(chn.bhmc.dms.par.stm.vo.ItemMovingAvgPrcVO)
     */
    @Override
    public int updateItemMovingAvgPrc(ItemMovingAvgPrcVO itemMovingAvgPrcVO) throws Exception {

        return itemMovingAvgPrcDAO.updateItemMovingAvgPrc(itemMovingAvgPrcVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.ItemMovingAvgPrcService#selectItemMovingAvgPrcByKey(chn.bhmc.dms.par.stm.vo.ItemMovingAvgPrcVO)
     */
    @Override
    public ItemMovingAvgPrcVO selectItemMovingAvgPrcByKey(ItemMovingAvgPrcVO searchVO) throws Exception {

        return itemMovingAvgPrcDAO.selectItemMovingAvgPrcByKey(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.ItemMovingAvgPrcService#insertItemMovingAvgPrcHistory(chn.bhmc.dms.par.stm.vo.ItemMovingAvgPrcVO)
     */
    @Override
    public int insertItemMovingAvgPrcHistory(ItemMovingAvgPrcVO itemMovingAvgPrcVO) throws Exception {

        return itemMovingAvgPrcDAO.insertItemMovingAvgPrcHistory(itemMovingAvgPrcVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.ItemMovingAvgPrcService#selectItemMovingAvgPrcMaxLineNo(chn.bhmc.dms.par.stm.vo.ItemMovingAvgPrcVO)
     */
    @Override
    public int selectItemMovingAvgPrcHistoryMaxLineNo(ItemMovingAvgPrcVO itemMovingAvgPrcVO) throws Exception {

        return itemMovingAvgPrcDAO.selectItemMovingAvgPrcHistoryMaxLineNo(itemMovingAvgPrcVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.ItemMovingAvgPrcService#insertPartsVenderSalPriceTargetMaster(chn.bhmc.dms.par.stm.vo.ItemMovingAvgPrcVO)
     */
    @Override
    public int insertPartsVenderSalPriceTargetMaster(ItemMovingAvgPrcVO itemMovingAvgPrcVO) throws Exception {

        return itemMovingAvgPrcDAO.insertPartsVenderSalPriceTargetMaster(itemMovingAvgPrcVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.ItemMovingAvgPrcService#selectPartsVenderSalPriceMastersByItemInfoCnt(chn.bhmc.dms.par.stm.vo.ItemMovingAvgPrcVO)
     */
    @Override
    public int selectPartsVenderSalPriceMastersByItemInfoCnt(ItemMovingAvgPrcVO itemMovingAvgPrcVO) throws Exception {

        return itemMovingAvgPrcDAO.selectPartsVenderSalPriceMastersByItemInfoCnt(itemMovingAvgPrcVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.ItemMovingAvgPrcService#selectBmpPurcPrcByItemCd(chn.bhmc.dms.par.stm.vo.ItemMovingAvgPrcVO)
     */
    @Override
    public double selectBmpPurcPrcByItemCd(ItemMovingAvgPrcVO itemMovingAvgPrcVO) throws Exception {

        return itemMovingAvgPrcDAO.selectBmpPurcPrcByItemCd(itemMovingAvgPrcVO);
    }

}
