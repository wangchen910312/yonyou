package chn.bhmc.dms.bat.sal.veh.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.sal.veh.service.BatchVehRfidResetService;
import chn.bhmc.dms.bat.sal.veh.service.dao.BatchVehRfidResetDAO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchVehRfidResetServiceImpl
 * @Description : VIN RFID Reset
 * @author Lee Seungmin
 * @since 2017. 6. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 6. 7.     Lee Seungmin           최초 생성
 * </pre>
 */

@Service("batchVehRfidResetService")
public class BatchVehRfidResetServiceImpl extends HService implements BatchVehRfidResetService {

    @Resource(name="batchVehRfidResetDAO")
    BatchVehRfidResetDAO batchVehRfidResetDAO;

    @Override
    public void callVehRfidResetProcess() throws Exception{

        batchVehRfidResetDAO.updateVehRfidReset();

    }
}