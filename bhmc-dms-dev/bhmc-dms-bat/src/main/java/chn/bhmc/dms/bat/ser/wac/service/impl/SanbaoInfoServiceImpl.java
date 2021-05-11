package chn.bhmc.dms.bat.ser.wac.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.ser.wac.service.SanbaoInfoService;
import chn.bhmc.dms.bat.ser.wac.service.dao.SanbaoVinInfoDAO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SanbaoInfoServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 10. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 10. 7.     Kwon ki hyun     최초 생성
 * </pre>
 */
@Service
public class SanbaoInfoServiceImpl extends HService implements SanbaoInfoService {


    @Resource(name="sanbaoVinInfoDAO")
    SanbaoVinInfoDAO sanbaoVinInfoDAO;

    /**
    *
    * 삼포 대상빈 등록
    *
    * @throws Exception
    */
    @Override
    public void insertSanbaoVinInfo() throws Exception {


        sanbaoVinInfoDAO.insertSanbaoVinInfo();
    }

}
