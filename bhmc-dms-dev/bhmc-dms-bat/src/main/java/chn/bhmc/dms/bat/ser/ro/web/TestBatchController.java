package chn.bhmc.dms.bat.ser.ro.web;

import able.com.web.HController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.bat.ser.ro.service.RepairOrderInfoReqService;
import chn.bhmc.dms.bat.ser.wac.service.CampaignUsedInfoService;
import chn.bhmc.dms.bat.ser.wac.service.SanbaoInfoService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : TestBatchController.java
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
@Controller
public class TestBatchController extends HController {

    @Autowired
    RepairOrderInfoReqService repairOrderInfoReqService ;

    @Autowired
    CampaignUsedInfoService campaignUsedInfoService ;

    @Autowired
    SanbaoInfoService sanbaoInfoService;

    /**
    *
    * RO 이력 전송
    *
    * @throws Exception
    */
   @RequestMapping(value = "/bat/ser/ro/batRoInfoReq.do", method = RequestMethod.GET)
   @ResponseBody
   public void batchRoInfoReq(int day)throws Exception{

       repairOrderInfoReqService.insertRepairOrderReq(day);

   }

   /**
    *
    * 캠페인 이력 전송
    *
    * @throws Exception
    */
   @RequestMapping(value = "/bat/ser/ro/batCampaignUsedInfo.do", method = RequestMethod.GET)
   @ResponseBody
   public void batchCampaignUsedInfo()throws Exception{

       campaignUsedInfoService.insertCampaignUsedReq();

   }

   /**
    *
    * 삼포 대상건 등록
    *
    * @throws Exception
    */
   @RequestMapping(value = "/bat/ser/ro/batchSanbaoInfo.do", method = RequestMethod.GET)
   @ResponseBody
   public void batchSanbaoInfo()throws Exception{

       sanbaoInfoService.insertSanbaoVinInfo();

   }

}
