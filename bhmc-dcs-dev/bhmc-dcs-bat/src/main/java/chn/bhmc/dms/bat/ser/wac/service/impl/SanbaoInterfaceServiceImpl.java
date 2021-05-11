package chn.bhmc.dms.bat.ser.wac.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.ser.cmm.service.BatServiceCmmEaiService;
import chn.bhmc.dms.bat.ser.wac.service.SanbaoInterfaceService;
import chn.bhmc.dms.bat.ser.wac.service.dao.SanbaoInterfaceDAO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SanbaoInterfaceServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 8. 31.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 31.     Kwon ki hyun     최초 생성
 * </pre>
 */
@Service("sanbaoInterfaceService")
public class SanbaoInterfaceServiceImpl extends HService implements SanbaoInterfaceService {



    @Autowired
    BatServiceCmmEaiService batServiceCmmEaiService;


    @Resource(name="sanbaoInterfaceDAO")
    SanbaoInterfaceDAO sanbaoInterfaceDAO;


    @Override
    public void insertSanbaoInfoIf()throws Exception{
        insertSanbaoBaseInfo();

        //batServiceCmmEaiService.executeEaiService("SER042");
        //batServiceCmmEaiService.executeEaiService("SER043");
        //batServiceCmmEaiService.executeEaiService("SER044");

        insertSanbaoVinInfo();
    }

    /**
    *
    * 삼포 기준정책
    *
    * @throws Exception
    */
    public void insertSanbaoBaseInfo() throws Exception {
        sanbaoInterfaceDAO.insertSanbaoBaseInfo();
    }

    /**
    *
    * 삼포 대상빈 정보
    *
    * @throws Exception
    */
    public void insertSanbaoVinInfo() throws Exception {
        sanbaoInterfaceDAO.insertSanbaoVinInfo();
    }
}
