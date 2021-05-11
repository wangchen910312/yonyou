package chn.bhmc.dms.bat.ser.ro.web;


import javax.annotation.Resource;
import able.com.web.HController;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.bat.ser.ro.service.RepairOrderHistoryToSibelService;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;

import chn.bhmc.dms.bat.crm.cmm.service.BatDmsDataInService;


@Controller
public class SERBatTestController extends HController {

    @Resource(name="repairOrderHistoryToSibelService")
    RepairOrderHistoryToSibelService repairOrderHistoryToSibelService;

    @Resource(name="batDmsDataInService")
    BatDmsDataInService batDmsDataInService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;


    /**
     * 서비스 배치
     * @return
     */
    @RequestMapping(value = "/bat/ser/ro/repairOrderHistoryToSibelService.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean markingCampaignBatchService() throws Exception {
        repairOrderHistoryToSibelService.insertRoHistoryToSibelSend();
        return true;
    }

}