package chn.bhmc.dms.sal.acc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.par.stm.service.impl.StockInOutServiceImpl;
import chn.bhmc.dms.sal.acc.service.AccessoryItemStockService;
import chn.bhmc.dms.sal.acc.service.dao.AccessoryItemPriceDAO;
import chn.bhmc.dms.sal.acc.service.dao.AccessoryItemStockDAO;
import chn.bhmc.dms.sal.acc.vo.AccessoryItemPriceVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryItemStockSearchVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryItemStockVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AccessoryItemStockServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2017. 2. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 1.     Kang Seok Han     최초 생성
 * </pre>
 */
@Service("accessoryItemStockService")
public class AccessoryItemStockServiceImpl extends StockInOutServiceImpl implements AccessoryItemStockService {

    /**
     * 용품재고 관리 DAO
     */
    @Resource(name="accessoryItemStockDAO")
    private AccessoryItemStockDAO accessoryItemStockDAO;

    /**
     * 용품가격 관리 DAO
     */
    @Resource(name="accessoryItemPriceDAO")
    private AccessoryItemPriceDAO accessoryItemPriceDAO;

    /**
     * {@inheritDoc}
     */
    @Override
    public AccessoryItemStockVO selectAccessoryItemStockByKey(String dlrCd, String pltCd, String strgeCd, String itemCd)
            throws Exception {
        return accessoryItemStockDAO.selectAccessoryItemStockByKey(dlrCd, pltCd, strgeCd, itemCd);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<AccessoryItemStockVO> selectAccessoryItemStocksByCondition(AccessoryItemStockSearchVO searchVO)
            throws Exception {
        return accessoryItemStockDAO.selectAccessoryItemStocksByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectAccessoryItemStocksByConditionCnt(AccessoryItemStockSearchVO searchVO) throws Exception {
        return accessoryItemStockDAO.selectAccessoryItemStocksByConditionCnt(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int insertOrupdateAccessoryItemPrice(AccessoryItemPriceVO accessoryItemPriceVO) throws Exception {
        AccessoryItemPriceVO oldAccessoryItemPriceVO = accessoryItemPriceDAO.selectAccessoryItemPriceByKey(accessoryItemPriceVO.getDlrCd(), accessoryItemPriceVO.getPltCd(), accessoryItemPriceVO.getStrgeCd(), accessoryItemPriceVO.getItemCd());

        if(oldAccessoryItemPriceVO == null){
            return accessoryItemPriceDAO.insertAccessoryItemPrice(accessoryItemPriceVO);
        }else{
            return accessoryItemPriceDAO.updateAccessoryItemPrice(accessoryItemPriceVO);
        }
    }

}
