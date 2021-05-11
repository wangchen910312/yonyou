package chn.bhmc.dms.bat.crm.cso.service.impl;

import java.util.HashMap;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.crm.cso.service.BatIfShowRoomDmsDcsService;
import chn.bhmc.dms.bat.crm.cso.service.dao.BatSalesOpptDAO;
import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;

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
@Service("batIfShowRoomDmsDcsService")
public class BatIfShowRoomDmsDcsServiceImpl extends HService implements BatIfShowRoomDmsDcsService {

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
     * @see chn.bhmc.dms.bat.crm.cso.service.BatIfShowRoomDmsDcsService#selectShowRoomDmsDcs()
     */
    @Override
    public int selectShowRoomDmsDcs() throws Exception {
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("regUsrId", "SYSTEM");
        map.put("updtUsrId", "SYSTEM");

        batSalesOpptDAO.selectShowRoomDmsDcs(map);

        CamelClient camelClient = camelClientFactory.createCamelClient();
        camelClient.setIfId("CRM119");
        camelClient.sendRequest();

        return 0;
    }
}
