package chn.bhmc.dms.bat.par.pmm.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.par.pmm.service.BatchGwmsPartsPriceService;
import chn.bhmc.dms.bat.par.pmm.service.dao.BatchGwmsPartsPriceDAO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchGwmsPartsMarkupServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In Bo Shim
 * @since 2016. 10. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 10. 10.     In Bo Shim     최초 생성
 * </pre>
 */

@Service("batchGwmsPartsPriceService")
public class BatchGwmsPartsPriceServiceImpl extends HService implements BatchGwmsPartsPriceService {

    /**
     * GWMS 부품가격 DAO 선언
     */
    @Resource(name="batchGwmsPartsPriceDAO")
    BatchGwmsPartsPriceDAO batchGwmsPartsPriceDAO;

    /*
     * @see chn.bhmc.dms.bat.par.pmm.service.BatchGwmsPartsPriceService#executeGwmsPartsPriceProcedure()
     */
    @Override
    public void executeGwmsPartsPriceProcedure() throws Exception {
        batchGwmsPartsPriceDAO.executeGwmsPartsPriceProcedure();
    }

}
