package chn.bhmc.dms.bat.par.pmm.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.par.pmm.service.dao.BatchInvoiceDAO;

import chn.bhmc.dms.bat.par.pmm.service.BatchInvoiceService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchInvoiceServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Mid Eum Park
 * @since 2018. 2. 13.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2018. 2. 13.     Mid Eum Park     최초 생성
 * </pre>
 */

@Service("batchInvoiceService")
public class BatchInvoiceServiceImpl extends HService implements BatchInvoiceService{

    /**
     * 송장 DAO 선언
     */
    @Resource(name="batchInvoiceDAO")
    BatchInvoiceDAO batchInvoiceDAO;
    /*
     * @see chn.bhmc.dms.bat.par.pmm.service.BatchInvoiceService#executeInvoiceProcedure()
     */
    @Override
    public void executeInvoiceProcedure() throws Exception {
        batchInvoiceDAO.executeInvoiceProcedure();
    }
}
