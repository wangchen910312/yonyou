package chn.bhmc.dms.ser.kanban.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import able.com.web.HController;

import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.kanban.service.ServiceManageService;
import chn.bhmc.dms.ser.kanban.vo.ServiceManageSearchVO;

/**
 * @ClassName   : ServiceManageController.java
 * @Description : 정비관리칸반 컨트롤러
 * @author Kim Yun Seung
 * @since 2017. 4. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 4. 26.   Kim Yun Seung    최초 생성
 * </pre>
 */

@Controller
public class ServiceManageController extends HController {

    @Resource(name="serviceManageService")
    ServiceManageService serviceManageService;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 정비관리칸반 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/ser/kanban/selectServiceManageKanbanMain.do", method = RequestMethod.GET)
    public String selectServiceManageKanbanMain(Model model, HttpServletRequest request) throws Exception {

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);
        String dlrCd = LoginUtil.getDlrCd();

        Device device = DeviceUtils.getCurrentDevice(request);

        model.addAttribute("sysDate", sysDate);
        model.addAttribute("dlrCd", dlrCd);
        model.addAttribute("loginUsrId", LoginUtil.getUserId());
        model.addAttribute("loginUsrNm", LoginUtil.getUserNm());

        //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 start
        // model.addAttribute("isTablet", device.isTablet());//khskhs 문제시삭제
        model.addAttribute("isTablet", (device.isTablet()||device.isMobile()));
        //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 end

        return "/ser/kanban/selectServiceManageKanbanMain";

    }

    /**
     * 정비대기 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ServiceManageSearchVO
     * @return
     */
    @RequestMapping(value = "/ser/kanban/selectServiceWait.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectServiceWaitList(@RequestBody ServiceManageSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        // 정비대기 목록 조회
        if(result.getTotal() != 0){
            result.setData(serviceManageService.selectServiceWaitListByCondition(searchVO));
        }

        return result;
    }

    /**
     * 기전수리 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ServiceManageSearchVO
     * @return
     */
    @RequestMapping(value = "/ser/kanban/selectServiceManage.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectServiceManage(@RequestBody ServiceManageSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        // 기전수리 목록 조회
        result.setTotal(serviceManageService.selectServiceManageByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(serviceManageService.selectServiceManageByCondition(searchVO));
        }

        return result;
    }

}
