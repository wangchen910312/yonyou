package chn.bhmc.dms.bat.par.stm.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.par.stm.service.BatchPartsItemSaftyStockService;
import chn.bhmc.dms.bat.par.stm.service.dao.BatchPartsItemSaftyStockDAO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchPartsItemSaftyStockServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In Bo Shim
 * @since 2016. 12. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 12. 1.     In Bo Shim     최초 생성
 * </pre>
 */
@Service("batchPartsItemSaftyStockService")
public class BatchPartsItemSaftyStockServiceImpl extends HService implements BatchPartsItemSaftyStockService {

    /**
     * 적정재고 DAO 선언
     */
    @Resource(name="batchPartsItemSaftyStockDAO")
    BatchPartsItemSaftyStockDAO batchPartsItemSaftyStockDAO;

    /*
     * @see chn.bhmc.dms.bat.par.stm.service.BatchPartsItemSaftyStockService#executeItemSaftyStockProcedure()
     */
    @Override
    public void executeItemSaftyStockProcedure() throws Exception {
        batchPartsItemSaftyStockDAO.executeItemSaftyStockProcedure();
    }

}
