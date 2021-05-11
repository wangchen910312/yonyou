package chn.bhmc.dms.bat.ser.wac.web;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.oxm.Marshaller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.bat.ser.svi.service.PdiChkManageService;
import chn.bhmc.dms.bat.ser.wac.service.CampaignInfoService;
import chn.bhmc.dms.bat.ser.wac.service.CampaignUsedInfoService;
import chn.bhmc.dms.bat.ser.wac.service.ChangeVinInfoService;
import chn.bhmc.dms.bat.ser.wac.service.ClaimApproveService;
import chn.bhmc.dms.bat.ser.wac.service.ClaimInvoiceDeductInfoService;
import chn.bhmc.dms.bat.ser.wac.service.ClaimInvoiceInfoService;
import chn.bhmc.dms.bat.ser.wac.service.ClaimPioPartService;
import chn.bhmc.dms.bat.ser.wac.service.ClaimWarrantyConditionService;
import chn.bhmc.dms.bat.ser.wac.service.LaborInfoService;
import chn.bhmc.dms.bat.ser.wac.service.LtsModelInfoService;
import chn.bhmc.dms.bat.ser.wac.service.QvocInfoService;
import chn.bhmc.dms.bat.ser.wac.service.RateInfoService;
import chn.bhmc.dms.bat.ser.wac.service.SanbaoInterfaceService;
import chn.bhmc.dms.core.support.eai.EaiClient;
import chn.bhmc.dms.core.support.eai.EaiSimpleMessage;
import chn.bhmc.dms.core.support.eai.schema.CommDMSDoc;

@Controller
public class ServiceBatTestController {

    @Resource(name="jaxb2Marshaller")
    Marshaller marshaller;

    @Resource(name="eaiClient")
    EaiClient eaiClient;


    @Autowired
    ClaimApproveService claimApproveService;

    @Autowired
    ClaimInvoiceDeductInfoService claimInvoiceDeductInfoService;

    @Autowired
    ClaimInvoiceInfoService claimInvoiceInfoService;

    @Autowired
    LaborInfoService laborInfoService;

    @Autowired
    LtsModelInfoService ltsModelInfoService;

    @Autowired
    RateInfoService rateInfoService;

    @Autowired
    SanbaoInterfaceService sanbaoInterfaceService;

    @Autowired
    CampaignInfoService campaignInfoService;

    @Autowired
    ClaimPioPartService claimPioPartService;

    @Autowired
    CampaignUsedInfoService campaignUsedInfoService;

    @Autowired
    PdiChkManageService pdiChkManageService;

    @Autowired
    QvocInfoService qvocInfoService;

    @Autowired
    ChangeVinInfoService changeVinInfoService;

    @Autowired
    ClaimWarrantyConditionService claimWarrantyConditionService;




    /**
     *  Claim 배치 테스트
     * @return
     */
    @RequestMapping(value = "/bat/ser/wac/sendClaimTest.do", method = RequestMethod.GET)
    @ResponseBody
    public boolean sendClaimTest() throws Exception {

        CommDMSDoc reqCommDMSDoc = new EaiSimpleMessage.Builder()
                                    .ifId("SER037")
                                    .company("H")
                                    .sender("DCS")
                                    .addAttachment("", "", "")
                                    .build()
                                    .buildCommDMSDoc();

                    eaiClient.sendRequest(reqCommDMSDoc);

                    reqCommDMSDoc = new EaiSimpleMessage.Builder()
                                    .ifId("SER038")
                                    .company("H")
                                    .sender("DCS")
                                    .addAttachment("", "", "")
                                    .build()
                                    .buildCommDMSDoc();

                    eaiClient.sendRequest(reqCommDMSDoc);

                    reqCommDMSDoc = new EaiSimpleMessage.Builder()
                                    .ifId("SER039")
                                    .company("H")
                                    .sender("DCS")
                                    .addAttachment("", "", "")
                                    .build()
                                    .buildCommDMSDoc();

                    eaiClient.sendRequest(reqCommDMSDoc);

                    reqCommDMSDoc = new EaiSimpleMessage.Builder()
                                    .ifId("SER040")
                                    .company("H")
                                    .sender("DCS")
                                    .addAttachment("", "", "")
                                    .build()
                                    .buildCommDMSDoc();

                    eaiClient.sendRequest(reqCommDMSDoc);
        return true;

    }

    /**
     *
     * 클레임 승인
     *
     * @throws Exception
     */
    @RequestMapping(value = "/bat/ser/wac/batClaimApprove.do", method = RequestMethod.GET)
    @ResponseBody
    public void batchClaimApprove(int day)throws Exception{

        claimApproveService.insertClaimApprove(day);

    }
    /**
     *
     * 클레임 인보이스 공제
     *
     * @throws Exception
     */
    @RequestMapping(value = "/bat/ser/wac/batchClaimInvoiceDeduct.do", method = RequestMethod.GET)
    @ResponseBody
    public void batchClaimInvoiceDeduct()throws Exception{

        claimInvoiceDeductInfoService.insertBwmsClaimInvoiceDeductInfo();

    }

    /**
     *
     * 클레임 인보이스
     *
     * @throws Exception
     */
    @RequestMapping(value = "/bat/ser/wac/batClaimInvoice.do", method = RequestMethod.GET)
    @ResponseBody
    public void batchClaimInvoice()throws Exception{

        claimInvoiceInfoService.insertBwmsClaimInvoiceInfo();

    }
    /**
     *
     * 공임정보
     *
     * @throws Exception
     */
    @RequestMapping(value = "/bat/ser/wac/batLabor.do", method = RequestMethod.GET)
    @ResponseBody
    public void batchLabor()throws Exception{

        laborInfoService.insertBwmslaborInfo();

    }

    /**
    *
    * LTS MODEL 정보
    *
    * @throws Exception
    */
   @RequestMapping(value = "/bat/ser/wac/batLtsModel.do", method = RequestMethod.GET)
   @ResponseBody
   public void batchLtsModel()throws Exception{

       ltsModelInfoService.insertBwmsLtsModelInfo();

   }

    /**
     *
     * 임률 정보
     *
     * @throws Exception
     */
    @RequestMapping(value = "/bat/ser/wac/batRate.do", method = RequestMethod.GET)
    @ResponseBody
    public void batchRate()throws Exception{

        rateInfoService.insertBwmsRateInfo();

    }

    /**
     *
     * 삼포 정보
     *
     * @throws Exception
     */
    @RequestMapping(value = "/bat/ser/wac/batSanbao.do", method = RequestMethod.GET)
    @ResponseBody
    public void batchSanbao()throws Exception{

        sanbaoInterfaceService.insertSanbaoInfoIf();

    }

    /**
     *
     * 캠페인 정보
     *
     * @throws Exception
     */
    @RequestMapping(value = "/bat/ser/wac/batchCampaignInfo.do", method = RequestMethod.GET)
    @ResponseBody
    public void batchCampaignInfo()throws Exception{

        campaignInfoService.insertCampaignInfo();

    }

    /**
     *
     * PIO 정보
     *
     * @throws Exception
     */
    @RequestMapping(value = "/bat/ser/wac/batchPioPartInfo.do", method = RequestMethod.GET)
    @ResponseBody
    public void batchPioPartInfo()throws Exception{

        claimPioPartService.insertClaimPioPart();

    }
    /**
     *
     * 캠페인 사용 정보
     *
     * @throws Exception
     */
    @RequestMapping(value = "/bat/ser/wac/batchCampaignUsedInfo.do", method = RequestMethod.GET)
    @ResponseBody
    public void batchCampaignUsedInfo()throws Exception{

        campaignUsedInfoService.insertUsedCampaign();

    }

    /**
     *
     * PDI 점검  정보
     *
     * @throws Exception
     */
    @RequestMapping(value = "/bat/ser/svi/batchPdiChkInfo.do", method = RequestMethod.GET)
    @ResponseBody
    public void batchPdiChkInfo()throws Exception{

        pdiChkManageService.insertPdiChkList();

    }

    /**
     *
     *  원인 현상 코드 정보
     *
     * @throws Exception
     */
    @RequestMapping(value = "/bat/ser/wac/batchQovcInfo.do", method = RequestMethod.GET)
    @ResponseBody
    public void batchQovcInfo()throws Exception{

        qvocInfoService.insertQvocInfo();

    }

    /**
     *
     *  빈정보 수정
     *
     * @throws Exception
     */
    @RequestMapping(value = "/bat/ser/wac/batchChangeVinInfo.do", method = RequestMethod.GET)
    @ResponseBody
    public void batchChangeVinInfo()throws Exception{

        changeVinInfoService.insertChangeVinNoInfo();

    }

    /**
     *
     *  공임연관 정보
     *
     * @throws Exception
     */
    @RequestMapping(value = "/bat/ser/wac/batchLaborRelationInfo.do", method = RequestMethod.GET)
    @ResponseBody
    public void batchLaborRelationInfo()throws Exception{

        laborInfoService.insertBwmsLaborRelationInfo();

    }

    /**
     *
     *  스페셜빈 정보
     *
     * @throws Exception
     */
    @RequestMapping(value = "/bat/ser/wac/batchSpecialVinInfo.do", method = RequestMethod.GET)
    @ResponseBody
    public void batchSpecialVinInfo()throws Exception{

        claimWarrantyConditionService.insertBwmsSpecialVinInfo();

    }

    /**
     *
     *  차종별 보증 정보
     *
     * @throws Exception
     */
    @RequestMapping(value = "/bat/ser/wac/batchLtsWtyInfo.do", method = RequestMethod.GET)
    @ResponseBody
    public void batchLtsWtyInfo()throws Exception{

        claimWarrantyConditionService.insertBwmsLtsWtyConditionInfo();

    }

    /**
     *
     *  빈별 보증 정보
     *
     * @throws Exception
     */
    @RequestMapping(value = "/bat/ser/wac/batchClaimReApprInfo.do", method = RequestMethod.GET)
    @ResponseBody
    public void batchClaimReApprInfo()throws Exception{

        claimWarrantyConditionService.insertBwmsVinConditionInfo();

    }

    /**
     *
     *  빈별 보증 정보
     *
     * @throws Exception
     */
    @RequestMapping(value = "/bat/ser/wac/batchWtyVinInfo.do", method = RequestMethod.GET)
    @ResponseBody
    public void batchWtyVinInfo(int day)throws Exception{
        claimApproveService.insertReClaimApprove(day, "ALL");
    }
}
