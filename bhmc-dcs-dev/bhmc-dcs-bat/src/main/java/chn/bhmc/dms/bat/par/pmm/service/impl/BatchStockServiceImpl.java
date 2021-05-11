package chn.bhmc.dms.bat.par.pmm.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.par.pmm.service.BatchStockService;
import chn.bhmc.dms.bat.par.pmm.service.dao.BatchStockDAO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchStockServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Mid Eum Park
 * @since 2018. 2. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2018. 2. 19.     Mid Eum Park     최초 생성
 * </pre>
 */
@Service("batchStockService")
public class BatchStockServiceImpl extends HService implements BatchStockService{

    /**
     * 송장 DAO 선언
     */
    @Resource(name="batchStockDAO")
    BatchStockDAO batchStockDAO;

    /*
     * @see chn.bhmc.dms.bat.par.pmm.service.BatchStockService#executeStockProcedure()
     */
    @Override
    public void executeStockProcedure() throws Exception {
        batchStockDAO.executeStockProcedure();
    }

}
