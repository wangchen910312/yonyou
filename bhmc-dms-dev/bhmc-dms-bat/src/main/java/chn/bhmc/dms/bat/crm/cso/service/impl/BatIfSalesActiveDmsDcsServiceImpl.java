package chn.bhmc.dms.bat.crm.cso.service.impl;

import java.util.HashMap;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.crm.cso.service.BatIfSalesActiveDmsDcsService;
import chn.bhmc.dms.bat.crm.cso.service.dao.BatSalesActiveDAO;

/**
 * BatIfSalesActiveDmsDcsServiceImpl
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
@Service("batIfSalesActiveDmsDcsServiceImpl")
public class BatIfSalesActiveDmsDcsServiceImpl extends HService implements BatIfSalesActiveDmsDcsService {
    /**
     * SalesActive DAO
     */
    @Resource(name="batSalesActiveDAO")
    BatSalesActiveDAO batSalesActiveDAO;

    /*
     * @see chn.bhmc.dms.bat.crm.slm.service.BatIfSalesActiveDmsDcsServiceImpl#selectSalesActiveDmsDcs
     */
    @Override
    public int selectSalesActiveDmsDcs() throws Exception {
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("regUsrId", "SYSTEM");
        map.put("updtUsrId", "SYSTEM");

        batSalesActiveDAO.selectSalesActiveDmsDcs(map);
        return 0;
    }
}
