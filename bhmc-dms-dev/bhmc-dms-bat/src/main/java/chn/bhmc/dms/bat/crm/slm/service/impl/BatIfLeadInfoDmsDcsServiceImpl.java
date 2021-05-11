package chn.bhmc.dms.bat.crm.slm.service.impl;

import java.util.HashMap;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.crm.slm.service.BatIfLeadInfoDmsDcsService;
import chn.bhmc.dms.bat.crm.slm.service.dao.BatLeadInfoDAO;

/**
 * BatIfLeadInfoDmsDcsServiceImpl
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
@Service("batIfLeadInfoDmsDcsServiceImpl")
public class BatIfLeadInfoDmsDcsServiceImpl extends HService implements BatIfLeadInfoDmsDcsService {
    /**
     * 고객 정보 관리 DAO
     */
    @Resource(name="batLeadInfoDAO")
    BatLeadInfoDAO batLeadInfoDAO;

    /*
     * @see chn.bhmc.dms.bat.crm.slm.service.BatIfLeadInfoDmsDcsServiceImpl#selectLeadInfoDmsDcs
     */
    @Override
    public int selectLeadInfoDmsDcs() throws Exception {
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("regUsrId", "SYSTEM");
        map.put("updtUsrId", "SYSTEM");

        batLeadInfoDAO.selectLeadInfoDmsDcs(map);
        return 0;
    }
}
