package chn.bhmc.dms.bat.sal.fim.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.sal.cmm.service.BatchSalesService;

import chn.bhmc.dms.bat.sal.fim.service.FincProductService;
import chn.bhmc.dms.bat.sal.veh.service.dao.BatchVehicleInfoDAO;
import chn.bhmc.dms.core.support.eai.EaiClient;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : FincProductServiceImpl
 * @Description : 금융상품정보 I/F DCS -> DMS
 * @author Kim Jin Suk
 * @since 2017. 4. 17
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 4. 17                            최초 생성
 * </pre>
 */

@Service("fincProductService")
public class FincProductServiceImpl extends HService implements FincProductService {

    @Resource(name="eaiClient")
    EaiClient eaiClient;

    @Resource(name="batchVehicleInfoDAO")
    BatchVehicleInfoDAO batchVehicleInfoDAO;

    @Autowired
    BatchSalesService batchSalesService;



    @Override
    public int batFincProductSearch(String serviceId) throws Exception{

        batchVehicleInfoDAO.updateVehicleInfo();

        batchSalesService.executeEaiService(serviceId);

        //EAI 호출
       /* CommDMSDoc reqCommDMSDoc = new EaiSimpleMessage.Builder()

        .ifId(serviceId)
        .company("H")
        .sender("DCS")
        .receiver("ALL")
        .build()
        .buildCommDMSDoc();
        eaiClient.sendRequest(reqCommDMSDoc);
        */

        return 1;

    }
}
