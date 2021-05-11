package chn.bhmc.dms.ser.svi.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import able.com.web.HController;

import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.ser.svi.service.EtcIssueManageService;
import chn.bhmc.dms.ser.svi.vo.EtcIssueManageSearchVO;
import chn.bhmc.dms.ser.svi.vo.EtcIssueManageVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : EtcIssueManageController.java
 * @Description : 보험관리 마스터
 * @author Kyung Mok Kim
 * @since 2016. 9. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author          description
 *  ===========    =============    ===========================
 *  2016. 9. 14.   Kyung Mok Kim     최초 생성
 * </pre>
 */

@Controller
public class EtcIssueManageController extends HController{


    @Resource(name="etcIssueManageService")
    EtcIssueManageService etcIssueManageService;


    /**
     * 기타사항관리 메인
     * @param
     * @return
     */
    @RequestMapping(value = "/ser/svi/etcIssue/selectEtcIssueManageMain.do", method=RequestMethod.GET)
    public String selectServiceSettingMain(Model model, HttpServletRequest request) throws Exception {

        Device device = DeviceUtils.getCurrentDevice(request);
        //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 start
        //model.addAttribute("isTablet", device.isTablet());
        model.addAttribute("isTablet", device.isTablet()||device.isMobile());
        //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 end

        return "/ser/svi/etcIssue/selectEtcIssueManageMain";

    }

    /**
     *
     * 기타사항관리 목록 데이터 조회
     *
     * @param searchVO : 조회조건 EtcIssueMangageSearchVO
     * @return 보험관리 목록 list
     * @throws Exception
     */
    @RequestMapping(value="/ser/svi/etcIssue/selectEtcIssueManages.do" , method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectEtcIssueManages(@RequestBody EtcIssueManageSearchVO searchVO ) throws Exception{
        SearchResult result = new SearchResult();

        result.setTotal(etcIssueManageService.selectEtcIssueManagesByConditionCnt(searchVO));

        if(result.getTotal() > 0){
            result.setData(etcIssueManageService.selectEtcIssueManagesByCondition(searchVO));
        }
        return result;
    }

    /**
     * 기타사항 정보를 등록한다.
     * Statements
     *
     * @param etcIssueMangeVO - 보험관리 정보 등록/수정 정보를 담고있는 VO
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/ser/svi/etcIssue/multiEtcIssueMangages.do" , method=RequestMethod.POST)
    @ResponseBody
    public boolean multiEtcIssueMangages(@Validated @RequestBody BaseSaveVO<EtcIssueManageVO> saveVO ) throws Exception{

        etcIssueManageService.multiEtcIssueMangages(saveVO);

        return true;

    }

}
