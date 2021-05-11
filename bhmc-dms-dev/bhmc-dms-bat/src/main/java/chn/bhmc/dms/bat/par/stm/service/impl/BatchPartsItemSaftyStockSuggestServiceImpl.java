package chn.bhmc.dms.bat.par.stm.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.par.stm.service.BatchPartsItemSaftyStockSuggestService;
import chn.bhmc.dms.bat.par.stm.service.dao.BatchPartsItemSaftyStockSuggestDAO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchPartsItemSaftyStockServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In Bo Shim
 * @since 2016. 12. 5.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 12. 5.     In Bo Shim     최초 생성
 * </pre>
 */
@Service("batchPartsItemSaftyStockSuggestService")
public class BatchPartsItemSaftyStockSuggestServiceImpl extends HService implements BatchPartsItemSaftyStockSuggestService {

    /**
     * 구매제시 DAO 선언
     */
    @Resource(name="batchPartsItemSaftyStockSuggestDAO")
    BatchPartsItemSaftyStockSuggestDAO batchPartsItemSaftyStockSuggestDAO;

    /*
     * @see chn.bhmc.dms.bat.par.stm.service.BatchPartsItemSaftyStockSuggestService#executeItemSaftyStockSuggestProcedure()
     */
    @Override
    public void executeItemSaftyStockSuggestProcedure() throws Exception {
        batchPartsItemSaftyStockSuggestDAO.executeItemSaftyStockSuggestProcedure();
    }


}
