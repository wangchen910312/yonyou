package chn.bhmc.dms.bat.ser.wac.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.ser.cmm.service.BatServiceCmmEaiService;
import chn.bhmc.dms.bat.ser.wac.service.CampaignUsedInfoService;
import chn.bhmc.dms.bat.ser.wac.service.dao.CampaignUsedInfoDAO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CampaignUsedInfoServiceImpl.java
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
@Service("campaignUsedInfoService")
public class CampaignUsedInfoServiceImpl extends HService implements CampaignUsedInfoService {

    @Resource(name="campaignUsedInfoDAO")
    CampaignUsedInfoDAO campaignUsedInfoDAO;

    @Autowired
    BatServiceCmmEaiService batServiceCmmEaiService;

    /*
     * @see chn.bhmc.dms.bat.ser.wac.service.CampaignUsedInfoService#insertUsedCampaign()
     */
    @Override
    public void insertUsedCampaign() throws Exception {
        campaignUsedInfoDAO.insertUsedCampaign();
       // batServiceCmmEaiService.executeEaiService("SER054");  20191022  tianjx
    }
}
