package chn.bhmc.dms.bat.crm.cif.web;

import java.util.HashMap;
import javax.annotation.Resource;
import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.bat.crm.cif.service.BatIfCustomerInfoDmsService;
import chn.bhmc.dms.bat.crm.cmm.service.BatDmsDataOutService;
import chn.bhmc.dms.bat.crm.crq.service.BatCustomerCareBatchService;
import chn.bhmc.dms.bat.crm.crq.service.BatVocActiveDmsDcsInterfaceService;
import chn.bhmc.dms.bat.crm.crq.service.BatVocDmsDcsInterfaceService;
import chn.bhmc.dms.bat.crm.crq.service.BatVocPushSignAlarmsService;
import chn.bhmc.dms.bat.crm.cso.service.BatIfSalesOpptDmsDcsService;
import chn.bhmc.dms.bat.crm.cso.service.BatIfSalesOpptDmsOriService;
import chn.bhmc.dms.bat.crm.cso.service.BatIfShowRoomDmsDcsService;
import chn.bhmc.dms.bat.crm.cso.service.BatSalesOpptProcessMgmtService;
import chn.bhmc.dms.bat.crm.cso.service.BatSalesOpptProcessSubmitCtrlService;
import chn.bhmc.dms.bat.crm.cso.service.BatSalesOpptStatisticsService;
import chn.bhmc.dms.bat.crm.css.service.BatSatisFactionManageService;
import chn.bhmc.dms.bat.crm.dmm.service.BatMembershipGradeChgService;
import chn.bhmc.dms.bat.crm.dmm.vo.BatMembershipGradeChgVO;
import chn.bhmc.dms.bat.crm.mcm.service.BatMarkingCampaignService;

@Controller
public class CRMBatTestController extends HController {

    @Resource(name="batIfCustomerInfoDmsService")
    BatIfCustomerInfoDmsService batIfCustomerInfoDmsService;


    @Resource(name="batCustomerCareBatchService")
    BatCustomerCareBatchService batCustomerCareBatchService;

    @Resource(name="batSatisFactionManageService")
    BatSatisFactionManageService batSatisFactionManageService;

    @Resource(name="batMarkingCampaignService")
    BatMarkingCampaignService batMarkingCampaignService;

    @Resource(name="batMembershipGradeChgService")
    BatMembershipGradeChgService batMembershipGradeChgService;

    @Resource(name="batIfSalesOpptDmsOriService")
    BatIfSalesOpptDmsOriService batIfSalesOpptDmsOriService;

    @Resource(name="batIfSalesOpptDmsDcsService")
    BatIfSalesOpptDmsDcsService batIfSalesOpptDmsDcsService;

    @Resource(name="batIfShowRoomDmsDcsService")
    BatIfShowRoomDmsDcsService batIfShowRoomDmsDcsService ;

    @Resource(name="batSalesOpptProcessSubmitCtrlService")
    BatSalesOpptProcessSubmitCtrlService batSalesOpptProcessSubmitCtrlService ;

    @Resource(name="batSalesOpptProcessMgmtService")
    BatSalesOpptProcessMgmtService batSalesOpptProcessMgmtService ;

    @Resource(name="batVocDmsDcsInterfaceService")
    BatVocDmsDcsInterfaceService batVocDmsDcsInterfaceService;

    @Resource(name="batVocActiveDmsDcsInterfaceService")
    BatVocActiveDmsDcsInterfaceService batVocActiveDmsDcsInterfaceService;

    @Resource(name="batDmsDataOutService")
    BatDmsDataOutService batDmsDataOutService;

    @Resource(name="batVocPushSignAlarmsService")
    BatVocPushSignAlarmsService batVocPushSignAlarmsService;

    @Resource(name="batSalesOpptStatisticsService")
    BatSalesOpptStatisticsService batSalesOpptStatisticsService;

    /**
     * 판매기회 + 전시장 정보 송신 ( DMS -> DCS )
     * @return chn.bhmc.dms.bat.crm.cso.service
     */
    @RequestMapping(value = "/bat/crm/cso/selectSalesOpptDmsDcs.do", method = RequestMethod.POST)
    @ResponseBody
    public int selectSalesOpptDmsDcs() throws Exception {
        batIfSalesOpptDmsDcsService.selectSalesOpptDmsDcs();
        batIfSalesOpptDmsDcsService.selectSalesOpptProcessCallCamel();
        return 0;

    }

    /**
     * 판매기회 정보 수신
     * @return chn.bhmc.dms.bat.crm.cso.service
     */
    @RequestMapping(value = "/bat/crm/cso/selectSalesOpptDmsOriDup.do", method = RequestMethod.POST)
    @ResponseBody
    public int selectSalesOpptDmsOriDup() throws Exception {
        batIfSalesOpptDmsOriService.selectSalesOpptDmsOriDup();
        return 0;

    }

    /**
     * 고객정보수신 배치
     * @return
     */
    @RequestMapping(value = "/bat/crm/cif/selectCustomerInfoDmsOriginal.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean selectCustomerInfoDmsOriginal() throws Exception {

        batIfCustomerInfoDmsService.selectCustomerInfoDmsOriginal();
        return true;

    }

    /**
     * 고객정보송신 배치
     * @return
     */
    @RequestMapping(value = "/bat/crm/cif/customerInfoDmsDcsInterfaceBatchJobBean.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean customerInfoDmsDcsInterfaceBatchJobBean() throws Exception {

        batIfCustomerInfoDmsService.selectCustomerInfoDmsDcs();
        return true;

    }

    /**
     * 고객정보송신(주소) 배치
     * @return
     */
    @RequestMapping(value = "/bat/crm/cif/selectCustomerInfoAddrDmsDcs.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean selectCustomerInfoAddrDmsDcs() throws Exception {

        batIfCustomerInfoDmsService.selectCustomerInfoAddrDmsDcs();
        return true;

    }
    /**
     * 고객정보송신(연계인) 배치
     * @return
     */
    @RequestMapping(value = "/bat/crm/cif/selectCustomerInfoRelCustDmsDcs.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean selectCustomerInfoRelCustDmsDcs() throws Exception {

        batIfCustomerInfoDmsService.selectCustomerInfoRelCustDmsDcs();
        return true;
    }

    /**
     * 고객케어관리 대상자 추출
     * @return
     */
    @RequestMapping(value = "/bat/crm/cif/customerCareBatchService.do", method = RequestMethod.POST)
    @ResponseBody
    public String customerCareBatchService() throws Exception {

        String result = batCustomerCareBatchService.customerCareTargetExtract();
        return result;

    }

    /**
     * 만족도조사 대상자 추출 배치
     * @return
     */
    @RequestMapping(value = "/bat/crm/css/selectSatisFaction.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean selectSatisFaction() throws Exception {
        batSatisFactionManageService.selectCallRcpeExtrMapping();
        return true;

    }

    /**
     * 캠페인 대상자 추출 배치
     * @return
     */
    @RequestMapping(value = "/bat/crm/mcm/markingCampaignBatchService.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean markingCampaignBatchService() throws Exception {
        //1. 만족도조사에서 배치를 돌 목록부터 조회한다.
        batMarkingCampaignService.multiTargetExtract();
        return true;
    }


    /**
     * 멤버십 등급변경 대상자 추출 배치
     * @return
     */
    @RequestMapping(value = "/bat/crm/dmm/selectCallMembershipGradeChg.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean selectCallMembershipGradeChg() throws Exception {
        //1. 만족도조사에서 배치를 돌 목록부터 조회한다.
        BatMembershipGradeChgVO saveVO = new BatMembershipGradeChgVO();
        saveVO.setDlrCd("A07AA");
        saveVO.setRegUsrId("system");
        saveVO.setUpdtUsrId("system");
        batMembershipGradeChgService.selectCallMembershipGradeChg(saveVO);
        return true;

    }

    /**
     * 전시장 유동량 DMS -> DCS
     * @return
     */
    @RequestMapping(value = "/bat/crm/dmm/selectShowRoomDmsDcs.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean selectShowRoomDmsDcs() throws Exception {

        batIfShowRoomDmsDcsService.selectShowRoomDmsDcs();
        return true;
    }

    /**
     * VOC DMS -> DCS
     * @return c
     */
    @RequestMapping(value = "/bat/crm/cif/sendVocDmsDcs.do", method = RequestMethod.POST)
    @ResponseBody
    public int sendVocDmsDcs() throws Exception {
        batVocDmsDcsInterfaceService.selectVocDmsDcs();
        return 0;
    }

    /**
     * VOC ACTIVE DMS -> DCS
     * @return c
     */
    @RequestMapping(value = "/bat/crm/cif/sendVocActiveDmsDcs.do", method = RequestMethod.POST)
    @ResponseBody
    public int sendVocActiveDmsDcs() throws Exception {
        batVocActiveDmsDcsInterfaceService.selectVocActiveDmsDcs();
        return 0;
    }

    /**
     * 판매기회관리 자동전출
     * @return
     */
    @RequestMapping(value = "/bat/crm/cso/selectSalesOpptProcessSubmitCtrl.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean selectSalesOpptProcessSubmitCtrl() throws Exception {

        batSalesOpptProcessSubmitCtrlService.updateSalesOpptProcessSubmitCtrl();
        return true;
    }

    /**
     * 판매기회관리 다음추적 TO-DO 등록
     * @return
     */
    @RequestMapping(value = "/bat/crm/cso/insertSalesOpptProcessNextTraceAlm.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertSalesOpptProcessNextTraceAlm() throws Exception {

        batSalesOpptProcessMgmtService.insertSalesOpptProcessNextTraceAlm();
        return true;
    }

    @RequestMapping(value = "/bat/crm/cif/sendCrmData.do", method = RequestMethod.POST)
    @ResponseBody
    public String sendCrmData(@RequestBody HashMap<String, String> map) throws Exception{
        String fPath = "D:/data/webapps/BHMC-DMS-WEB/FILE_UPLOAD_PATH";
        String strDay = map.get("day");
        String strTable = map.get("table");

        //배치 업무로직을 구현한 서비스 객체의 메소드를 실행하여 작업을 수행한다.
        batDmsDataOutService.selectDmsData(fPath, strDay, strTable);
        return "";
    }

    @RequestMapping(value = "/bat/crm/crq/selectVocPushSignAlarms.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean selectVocPushSignAlarms() throws Exception{
        batVocPushSignAlarmsService.selectVocPushSignAlarms();
        return true;
    }

    /**
     * 판매기회 추적추진 전달 통계를 위한 정보 수집
     * 전달 '추적추진'신규, 전패 카운터 수집
     * @param null
     * @return Count
     */
    @RequestMapping(value = "/bat/crm/cso/selectSalesOpptTrackingCollectMonth.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean selectSalesOpptTrackingCollectMonth() throws Exception {

        batSalesOpptStatisticsService.selectSalesOpptTrackingCollectMonth();
        return true;
    }
}