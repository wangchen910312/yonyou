package chn.bhmc.dms.bat.crm.cmm.service.impl;

import java.util.HashMap;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.crm.cmm.service.BatIfCarLineDmsDcsService;
import chn.bhmc.dms.bat.crm.cmm.service.dao.BatCarLineDAO;

/**
 * BatIfCarLineDmsDcsServiceImpl
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
@Service("batIfCarLineDmsDcsServiceImpl")
public class BatIfCarLineDmsDcsServiceImpl extends HService implements BatIfCarLineDmsDcsService {
    /**
     * 고객 정보 관리 DAO
     */
    @Resource(name="batCarLineDAO")
    BatCarLineDAO batCarLineDAO;

    /*
     * @see chn.bhmc.dms.bat.crm.cmm.service.BatIfCarLineDmsDcsServiceImpl#selectCarLineDmsDcs
     */
    @Override
    public int selectCarLineDmsDcs() throws Exception {
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("regUsrId", "SYSTEM");
        map.put("updtUsrId", "SYSTEM");

        batCarLineDAO.selectCarLineDmsDcs(map);

        return 0;
    }

}
