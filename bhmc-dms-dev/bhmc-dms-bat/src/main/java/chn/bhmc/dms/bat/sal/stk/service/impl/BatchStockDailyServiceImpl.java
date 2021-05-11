package chn.bhmc.dms.bat.sal.stk.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.sal.stk.service.BatchStockDailyService;
import chn.bhmc.dms.bat.sal.stk.service.dao.BatchStockDailyDAO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchSockDailyServiceImpl
 * @Description : 재고일배치
 * @author Lee Seungmin
 * @since 2017. 2. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 23.     Lee Seungmin           최초 생성
 * </pre>
 */

@Service("batchStockDailyService")
public class BatchStockDailyServiceImpl extends HService implements BatchStockDailyService {

    @Resource(name="batchStockDailyDAO")
    BatchStockDailyDAO batchStockDailyDAO;

    @Override
    public void callStockCntProcess() throws Exception{

        batchStockDailyDAO.insertStockCnt();

    }
}
