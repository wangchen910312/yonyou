package chn.bhmc.dms.bat.ser.wac.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.ser.cmm.service.BatServiceCmmEaiService;
import chn.bhmc.dms.bat.ser.wac.service.LaborInfoService;
import chn.bhmc.dms.bat.ser.wac.service.dao.LaborInfoDAO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LaborInfoServiceImpl.java
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
@Service("laborInfoService")
public class LaborInfoServiceImpl extends HService implements LaborInfoService {

    @Autowired
    BatServiceCmmEaiService batServiceCmmEaiService;

    @Resource(name="laborInfoDAO")
    LaborInfoDAO laborInfoDAO;


    /**
     * BWMS 공임 정보를 가져온다.
     *
     */
    @Override
    public void insertBwmslaborInfo() throws Exception {
        laborInfoDAO.insertBwmsLaborInfo();

        batServiceCmmEaiService.executeEaiService("SER007");
        batServiceCmmEaiService.executeEaiService("SER008");
    }


    /**
     *
     * BWMS 공임 연관 데이터 정보를 가져온다.
     *
     * @throws Exception
    */
    @Override
    public void insertBwmsLaborRelationInfo() throws Exception {
        laborInfoDAO.insertBwmsLaborRelationInfo();
        batServiceCmmEaiService.executeEaiService("SER069");
    }
}
