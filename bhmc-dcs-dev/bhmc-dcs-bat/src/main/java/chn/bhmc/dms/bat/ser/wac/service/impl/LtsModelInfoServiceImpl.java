package chn.bhmc.dms.bat.ser.wac.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.ser.cmm.service.BatServiceCmmEaiService;
import chn.bhmc.dms.bat.ser.wac.service.LtsModelInfoService;
import chn.bhmc.dms.bat.ser.wac.service.dao.LtsModelInfoDAO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LtsModelInfoServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 8. 30.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 30.     Kwon ki hyun     최초 생성
 * </pre>
 */
@Service("ltsModelInfoService")
public class LtsModelInfoServiceImpl extends HService implements LtsModelInfoService {

    @Resource(name="ltsModelInfoDAO")
    LtsModelInfoDAO ltsModelInfoDAO;

    @Autowired
    BatServiceCmmEaiService batServiceCmmEaiService;

    @Override
    public void insertBwmsLtsModelInfo() throws Exception {
        ltsModelInfoDAO.insertBwmsLtsModelInfo();

        batServiceCmmEaiService.executeEaiService("SER009");
        batServiceCmmEaiService.executeEaiService("SER010");
    }
}
