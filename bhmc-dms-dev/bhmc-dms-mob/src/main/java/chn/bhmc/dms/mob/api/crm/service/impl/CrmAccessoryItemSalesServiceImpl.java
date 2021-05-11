package chn.bhmc.dms.mob.api.crm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.mob.api.crm.dao.CrmAccessoryItemSalesDAO;
import chn.bhmc.dms.mob.api.crm.service.CrmAccessoryItemSalesService;
import chn.bhmc.dms.mob.api.crm.vo.AccessoryItemSalesSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.AccessoryItemSalesVO;

/**
 * <pre>
 * 용품정보관리 서비스
 * </pre>
 *
 * @ClassName   : AccessoryItemSalesServiceImpl
 * @Description : 용품판매관리
 * @author
 * @since 2016. 6. 09.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 30.    Kim Jin Suk            최초 생성
 * </pre>
 */

@Service("CrmaccessoryItemSalesService")
public class CrmAccessoryItemSalesServiceImpl extends HService implements CrmAccessoryItemSalesService {

    /**
     * 용품판매관리 DAO 선언
     */
    @Resource(name="CrmaccessoryItemSalesDAO")
    CrmAccessoryItemSalesDAO CrmaccessoryItemSalesDAO;


    /**
     * {@inheritDoc}
     */
    @Override
    public int selectAccessoryItemSalesByConditionCnt(AccessoryItemSalesSearchVO searchVO) throws Exception {
        return CrmaccessoryItemSalesDAO.selectAccessoryItemSalesByConditionCnt(searchVO);
    }
    /**
     * {@inheritDoc}
     */
    @Override
    public List<AccessoryItemSalesVO> selectAccessoryItemSalesByCondition(AccessoryItemSalesSearchVO searchVO) throws Exception {
        return CrmaccessoryItemSalesDAO.selectAccessoryItemSalesByCondition(searchVO);
    }

}
