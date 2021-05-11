package chn.bhmc.dms.bat.ser.wac.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.ser.cmm.service.BatServiceCmmEaiService;
import chn.bhmc.dms.bat.ser.wac.service.QvocInfoService;
import chn.bhmc.dms.bat.ser.wac.service.dao.QvocInfoDAO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : QvocInfoServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 9. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 10.     Kwon ki hyun     최초 생성
 * </pre>
 */
@Service("qvocInfoService")
public class QvocInfoServiceImpl extends HService implements QvocInfoService {

    @Resource(name="qvocInfoDAO")
    QvocInfoDAO qvocInfoDAO;

    @Autowired
    BatServiceCmmEaiService batServiceCmmEaiService;

    /*
     * @see chn.bhmc.dms.bat.ser.wac.service.QvocInfoService#insertQvocInfo()
     */
    @Override
    public void insertQvocInfo() throws Exception {
        qvocInfoDAO.insertQvocInfo();

        batServiceCmmEaiService.executeEaiService("SER021");
        batServiceCmmEaiService.executeEaiService("SER022");
        batServiceCmmEaiService.executeEaiService("SER023");
    }
}
