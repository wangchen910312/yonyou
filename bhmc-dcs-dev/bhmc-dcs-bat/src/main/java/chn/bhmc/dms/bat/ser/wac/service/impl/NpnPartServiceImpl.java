package chn.bhmc.dms.bat.ser.wac.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.ser.cmm.service.BatServiceCmmEaiService;
import chn.bhmc.dms.bat.ser.wac.service.NpnPartService;
import chn.bhmc.dms.bat.ser.wac.service.dao.NpnPartDAO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : NpnPartServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2017. 2. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 22.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

@Service("npnPartService")
public class NpnPartServiceImpl extends HService implements NpnPartService {

    @Resource(name="npnPartDAO")
    NpnPartDAO npnPartDAO;

    @Autowired
    BatServiceCmmEaiService batServiceCmmEaiService;

    @Override
    public void insertBwmsNpnPartInfo() throws Exception {
        npnPartDAO.insertBwmsNpnPartInfo();
        batServiceCmmEaiService.executeEaiService("SER081");
    }
}
