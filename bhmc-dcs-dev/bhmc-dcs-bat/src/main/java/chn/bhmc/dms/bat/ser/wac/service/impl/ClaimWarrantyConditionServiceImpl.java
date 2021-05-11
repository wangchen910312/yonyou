package chn.bhmc.dms.bat.ser.wac.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.ser.cmm.service.BatServiceCmmEaiService;
import chn.bhmc.dms.bat.ser.wac.service.ClaimWarrantyConditionService;
import chn.bhmc.dms.bat.ser.wac.service.dao.ClaimWarrantyConditionDAO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ClaimWarrantyConditionServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 10. 4.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 10. 4.     Kwon ki hyun     최초 생성
 * </pre>
 */
@Service
public class ClaimWarrantyConditionServiceImpl extends HService implements ClaimWarrantyConditionService {


    @Autowired
    BatServiceCmmEaiService batServiceCmmEaiService;

    @Resource(name="claimWarrantyConditionDAO")
    ClaimWarrantyConditionDAO claimWarrantyConditionDAO;

    /**
    *
    * BWMS 차종별 보증 정보
    *
    * @throws Exception
    */
    @Override
    public void insertBwmsLtsWtyConditionInfo() throws Exception {
        claimWarrantyConditionDAO.insertBwmsLtsWtyConditionInfo();
        batServiceCmmEaiService.executeEaiService("SER067");
    }

    /**
    *
    *  BWMS 빈별 보증 정보
    *
    * @throws Exception
    */
    @Override
    public void insertBwmsVinConditionInfo() throws Exception {
        claimWarrantyConditionDAO.insertBwmsVinConditionInfo();
        batServiceCmmEaiService.executeEaiService("SER068");
    }

    /**
    *
    * BWMS 스페셜빈별 정보
    *
    * @throws Exception
    */
    @Override
    public void insertBwmsSpecialVinInfo() throws Exception {
        claimWarrantyConditionDAO.insertBwmsSpecialVinInfo();
        batServiceCmmEaiService.executeEaiService("SER066");
    }
}
