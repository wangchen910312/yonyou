package chn.bhmc.dms.bat.crm.cso.service.impl;

import java.util.HashMap;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.crm.cso.service.BatIfSalesOpptDmsDcsService;
import chn.bhmc.dms.bat.crm.cso.service.dao.BatSalesOpptDAO;
import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.support.camel.Data;

/**
 * BatIfSalesOpptDmsDcsServiceImpl
 *
 * @author Kyo Jin LEE
 * @since 2016. 5. 17.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 5. 17.     Kyo Jin LEE      최초 생성
 * </pre>
 */
@Service("batIfSalesOpptDmsDcsService")
public class BatIfSalesOpptDmsDcsServiceImpl extends HService implements BatIfSalesOpptDmsDcsService {
    /**
     * SalesOppt DAO
     */
    @Resource(name="batSalesOpptDAO")
    BatSalesOpptDAO batSalesOpptDAO;

    /**
     * SalesOppt DAO
     */
    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;

    /*
     * @see chn.bhmc.dms.bat.crm.slm.service.BatIfSalesOpptDmsDcsServiceImpl#selectSalesOpptDmsDcs
     */
    @Override
    public int selectSalesOpptDmsDcs() throws Exception {
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("regUsrId", "SYSTEM");
        map.put("updtUsrId", "SYSTEM");

        batSalesOpptDAO.selectSalesOpptDmsDcs(map);
        return 0;
    }

    /*
     * @see chn.bhmc.dms.bat.crm.cso.service.BatIfSalesOpptDmsDcsService#selectSalesOpptProcessCallCamel()
     */
    @Override
    public Data selectSalesOpptProcessCallCamel() throws Exception {
        CamelClient camelClient = camelClientFactory.createCamelClient();
        camelClient.setIfId("CRM118");

        return camelClient.sendRequest();
    }

    /*
     * @see chn.bhmc.dms.bat.crm.cso.service.BatIfSalesOpptDmsDcsService#selectSalesOpptDmsOri()
     */
    @Override
    public int selectSalesOpptDmsOri() throws Exception {
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("regUsrId", "SYSTEM");
        map.put("updtUsrId", "SYSTEM");

        batSalesOpptDAO.selectSalesOpptDmsOri(map);
        return 0;
    }

}
