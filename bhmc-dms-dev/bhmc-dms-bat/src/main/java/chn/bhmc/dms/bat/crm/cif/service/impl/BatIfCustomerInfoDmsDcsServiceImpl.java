package chn.bhmc.dms.bat.crm.cif.service.impl;

import java.util.HashMap;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.crm.cif.service.BatIfCustomerInfoDmsDcsService;
import chn.bhmc.dms.bat.crm.cif.service.dao.BatCustomerInfoDAO;

/**
 * BatIfCustomerInfoDmsDcsServiceImpl.java
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
@Service("batIfCustomerInfoDmsDcsService")
public class BatIfCustomerInfoDmsDcsServiceImpl extends HService implements BatIfCustomerInfoDmsDcsService {

    /**
     * 고객 정보 관리 DAO
     */
    @Resource(name="batCustomerInfoDAO")
    BatCustomerInfoDAO batCustomerInfoDAO;

    /*
     * @see chn.bhmc.dms.bat.crm.cif.service.BatIfCustomerInfoDmsDcsService#insertCustomerInfoDmsDcs()
     */
    @Override
    public int selectCustomerInfoDmsDcs() throws Exception {
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("regUsrId", "SYSTEM");
        map.put("updtUsrId", "SYSTEM");

        batCustomerInfoDAO.selectCustomerInfoDmsDcs(map);

        return 0;
    }

    /*
     * @see chn.bhmc.dms.bat.crm.cif.service.BatIfCustomerInfoDmsDcsService#insertCustomerInfoAddrDmsDcs()
     */
    @Override
    public int selectCustomerInfoAddrDmsDcs() throws Exception {
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("regUsrId", "SYSTEM");
        map.put("updtUsrId", "SYSTEM");

        batCustomerInfoDAO.selectCustomerInfoAddrDmsDcs(map);

        return 0;
    }

    /*
     * @see chn.bhmc.dms.bat.crm.cif.service.BatIfCustomerInfoDmsDcsService#insertCustomerInfoRelCustDmsDcs()
     */
    @Override
    public int selectCustomerInfoRelCustDmsDcs() throws Exception {
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("regUsrId", "SYSTEM");
        map.put("updtUsrId", "SYSTEM");

        batCustomerInfoDAO.selectCustomerInfoRelCustDmsDcs(map);
        return 0;
    }


}
