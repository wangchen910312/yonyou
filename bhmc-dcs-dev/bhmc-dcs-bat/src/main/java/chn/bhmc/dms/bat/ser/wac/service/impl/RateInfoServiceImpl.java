package chn.bhmc.dms.bat.ser.wac.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.ser.cmm.service.BatServiceCmmEaiService;
import chn.bhmc.dms.bat.ser.wac.service.RateInfoService;
import chn.bhmc.dms.bat.ser.wac.service.dao.RateInfoDAO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RateInfoServiceImpl.java
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
@Service("rateInfoService")
public class RateInfoServiceImpl extends HService implements RateInfoService {


    @Autowired
    BatServiceCmmEaiService batServiceCmmEaiService;

    @Resource(name="rateInfoDAO")
    RateInfoDAO rateInfoDAO;

    /*
     * BWMS 임률 정보
     */
    @Override
    public void insertBwmsRateInfo() throws Exception {
        rateInfoDAO.insertBwmsRateInfo();
        batServiceCmmEaiService.executeEaiService("SER024");
    }
}
