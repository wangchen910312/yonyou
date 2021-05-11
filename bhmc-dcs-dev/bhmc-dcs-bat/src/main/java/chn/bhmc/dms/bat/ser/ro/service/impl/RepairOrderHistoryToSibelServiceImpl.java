package chn.bhmc.dms.bat.ser.ro.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.ser.ro.service.RepairOrderHistoryToSibelService;
import chn.bhmc.dms.bat.ser.ro.service.dao.RepairOrderHistoryToSibelDAO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RepairOrderHistoryServiceImpl.java
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
@Service("repairOrderHistoryToSibelService")
public class RepairOrderHistoryToSibelServiceImpl extends HService implements RepairOrderHistoryToSibelService {


    @Resource(name="repairOrderHistoryToSibelDAO")
    RepairOrderHistoryToSibelDAO repairOrderHistoryToSibelDAO;
    /*
     * @see chn.bhmc.dms.bat.ser.ro.service.RepairOrderHistoryToSibelService#insertRoHistoryToSibelSend()
     */
    @Override
    public void insertRoHistoryToSibelSend() throws Exception {


        repairOrderHistoryToSibelDAO.insertRoHistoryToSibelSend();

    }

}
