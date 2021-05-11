package chn.bhmc.dms.bat.ser.wac.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.crm.mcm.service.BatMarkingCampaignService;
import chn.bhmc.dms.bat.crm.mcm.vo.BatMarkingCampaignVO;
import chn.bhmc.dms.bat.ser.cmm.service.BatServiceCmmEaiService;
import chn.bhmc.dms.bat.ser.wac.service.CampaignInfoService;
import chn.bhmc.dms.bat.ser.wac.service.dao.CampaignInfoDAO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CampaignInfoServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 9. 5.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 5.     Kwon ki hyun     최초 생성
 * </pre>
 */
@Service("campaignInfoService")
public class CampaignInfoServiceImpl extends HService implements CampaignInfoService {

    @Autowired
    BatServiceCmmEaiService batServiceCmmEaiService;

    @Autowired
    BatMarkingCampaignService batMarkingCampaignService;

    @Resource(name="campaignInfoDAO")
    CampaignInfoDAO campaignInfoDAO;
    /**
    *
    * BWMS 캠페인정보 등록.
    *
    * @return
    * @throws Exception
    */
   public void insertCampaignInfo()throws Exception{

       campaignInfoDAO.insertCampaignInfo();

       //BatMarkingCampaignService batMarkingCampaignService = getBean(BatMarkingCampaignService.class);
       BatMarkingCampaignVO batMarkingCampaignVO = new BatMarkingCampaignVO();
       //배치 업무로직을 구현한 서비스 객체의 메소드를 실행하여 작업을 수행한다.
       //DCS캠페인 데이터를 인터페이스 테이블에 이관처리 이후에 인터페이스를 호출한다.
       batMarkingCampaignService.multiDcsIfCpoy(batMarkingCampaignVO);
       batMarkingCampaignService.multiDcsIfCpoyEAI();



   }

}
